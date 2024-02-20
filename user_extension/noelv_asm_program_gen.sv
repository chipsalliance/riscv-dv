class noelv_asm_program_gen extends riscv_asm_program_gen;
    
  `uvm_object_utils(noelv_asm_program_gen)

  function new (string name = "");
    super.new(name);
  endfunction

  // Overwriting custom extension interrupt handler section
  virtual function void gen_custom_section(ref string interrupt_handler_instr[$], privileged_mode_t mode);
    gen_timer_section(interrupt_handler_instr,mode);
    gen_plic_section(interrupt_handler_instr, mode);
  endfunction;

  // Only extend this function if the core utilizes a PLIC for handling interrupts
  // In this case, the core will write to a specific location as the response to the interrupt, and
  // external PLIC unit can detect this response and process the interrupt clean up accordingly.
  virtual function void gen_plic_section(ref string interrupt_handler_instr[$], privileged_mode_t mode);

    if ( mode == MACHINE_MODE ) 
      interrupt_handler_instr.push_back($sformatf("csrr x%0d, %0s # %0s", cfg.gpr[0], "mcause", "mcause"));
    else 
      interrupt_handler_instr.push_back($sformatf("csrr x%0d, %0s # %0s", cfg.gpr[0], "scause", "scause"));
    interrupt_handler_instr.push_back($sformatf("slli x%0d, x%0d, 1", cfg.gpr[0], cfg.gpr[0])); // shift out the interrupt bit
    interrupt_handler_instr.push_back($sformatf("srli x%0d, x%0d, 1", cfg.gpr[0], cfg.gpr[0])); // shift back
    // GPR[0] holds the interrupt value, check if 9 or 11, then perform the
    // plic claim. Keep GPR[0] to select what to claim, since this is also
    // known.
    //PLIC_BASE and PLIC_CLAIM_0 are defined in init.s in riscv-dv
    interrupt_handler_instr.push_back($sformatf("li x%0d, 11 #M ext irq", cfg.gpr[1])); //11 = M external interrupt 
    interrupt_handler_instr.push_back($sformatf("beq x%0d, x%0d, %0s", cfg.gpr[0], cfg.gpr[1], "1f")); 
    interrupt_handler_instr.push_back($sformatf("li x%0d, 9 #S ext irq", cfg.gpr[1])); //9 = S external interrupt 
    interrupt_handler_instr.push_back($sformatf("beq x%0d, x%0d, %0s", cfg.gpr[0], cfg.gpr[1], "2f")); 
    //plic base address
    //CLEAR S EXTERNAL INTERRUPT
    interrupt_handler_instr.push_back($sformatf("1: #M ext irq"));
    interrupt_handler_instr.push_back($sformatf("li x%0d, PLIC_BASE", cfg.gpr[0]));
    interrupt_handler_instr.push_back($sformatf("li x%0d, PLIC_CLAIM_0", cfg.gpr[1]));
    // claim register
    interrupt_handler_instr.push_back($sformatf("add x%0d, x%0d, x%0d", cfg.gpr[2], cfg.gpr[1], cfg.gpr[0]));
    // Should we do something with the read value?
    interrupt_handler_instr.push_back($sformatf("lw x%0d, 0(x%0d)", cfg.gpr[1], cfg.gpr[2]));
    interrupt_handler_instr.push_back($sformatf("sw x%0d, 0(x%0d)", cfg.gpr[1], cfg.gpr[2]));
    // Don't run the next section
    interrupt_handler_instr.push_back($sformatf("j 3f"));

    //CLEAR S EXTERNAL INTERRUPT
    interrupt_handler_instr.push_back($sformatf("2: #S ext irq"));
    interrupt_handler_instr.push_back($sformatf("li x%0d, PLIC_BASE", cfg.gpr[0]));
    interrupt_handler_instr.push_back($sformatf("li x%0d, PLIC_CLAIM_1", cfg.gpr[1]));
    interrupt_handler_instr.push_back($sformatf("li x%0d, START_PA #START_PHYSICAL_ADDRESS", cfg.gpr[2]));
    interrupt_handler_instr.push_back($sformatf("add x%0d, x%0d, x%0d", cfg.gpr[1], cfg.gpr[1], cfg.gpr[0]));
    // Compensate for memory translation, PA: f820_0000 -> VA: b820_0000
    interrupt_handler_instr.push_back($sformatf("sub x%0d, x%0d, x%0d", cfg.gpr[1], cfg.gpr[1], cfg.gpr[2]));
    interrupt_handler_instr.push_back($sformatf("lw x%0d, 0(x%0d)", cfg.gpr[0], cfg.gpr[1]));
    // write back the id to the complete the plic clean up
    interrupt_handler_instr.push_back($sformatf("sw x%0d, 0(x%0d)", cfg.gpr[0], cfg.gpr[1]));

    // END
    interrupt_handler_instr.push_back($sformatf("3:"));

    // Utilize the memory mapped handshake scheme to signal the testbench that the interrupt
    // handling has been completed and we are about to xRET out of the handler
    gen_signature_handshake(.instr(interrupt_handler_instr), .signature_type(CORE_STATUS),
                            .core_status(FINISHED_IRQ));
  endfunction

  // This function adds support for timer interrupts by confirming the
  // interrupt type and mode and then reseting the mtimer_cmp register
  virtual function void gen_timer_section(ref string interrupt_handler_instr[$], privileged_mode_t mode);
    if ( mode == MACHINE_MODE ) 
      interrupt_handler_instr.push_back($sformatf("csrr x%0d, %0s # %0s", cfg.gpr[0], "mcause", "mcause"));
    else 
      interrupt_handler_instr.push_back($sformatf("csrr x%0d, %0s # %0s", cfg.gpr[0], "scause", "scause"));
    interrupt_handler_instr.push_back($sformatf("slli x%0d, x%0d, 1", cfg.gpr[0], cfg.gpr[0])); // shift out the interrupt bit
    interrupt_handler_instr.push_back($sformatf("srli x%0d, x%0d, 1", cfg.gpr[0], cfg.gpr[0])); // shift back
    interrupt_handler_instr.push_back($sformatf("li x%0d, 7", cfg.gpr[1])); //7 = mtimer interrupt 
    interrupt_handler_instr.push_back($sformatf("bne x%0d, x%0d, %0s", cfg.gpr[0], cfg.gpr[1], "1f")); 
    interrupt_handler_instr.push_back($sformatf("li x%0d, MTIMER_CMP_0", cfg.gpr[1]));
    interrupt_handler_instr.push_back($sformatf("li x%0d, 0xffffffffff", cfg.gpr[0]));
    interrupt_handler_instr.push_back($sformatf("sw x%0d, 0(x%0d) # %0s", cfg.gpr[0], cfg.gpr[1], "set mtimecmp(31 dt 0) to max value")); 
    interrupt_handler_instr.push_back($sformatf("sw x%0d, 4(x%0d) # %0s", cfg.gpr[0], cfg.gpr[1], "set mtimecmp(63 dt 32) to max value")); 
    interrupt_handler_instr.push_back($sformatf("1:"));
  endfunction;

endclass


