/*
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//-----------------------------------------------------------------------------
// RISC-V assembly program generator configuration class
//-----------------------------------------------------------------------------

class riscv_instr_gen_config extends uvm_object;

  //-----------------------------------------------------------------------------
  // Processor feature configuration
  //-----------------------------------------------------------------------------

  // Supported Privileged mode
  privileged_mode_t supported_privileged_mode[] = {USER_MODE, SUPERVISOR_MODE, MACHINE_MODE};

  // Unsupported instructions
  riscv_instr_name_t unsupported_instr[];

  // ISA supported by the processor
  riscv_instr_group_t supported_isa[] = {RV32I, RV32M, RV64I, RV64M, RV32C, RV64C};

  // Support delegate trap to user mode
  bit support_umode_trap = 0;

  // Support sfence.vma instruction
  bit support_sfence = 1;

  // Cache line size (in bytes)
  // If processor does not support caches, set to XLEN/8
  int dcache_line_size_in_bytes = 128;

  // Number of data section
  // For processor that doesn't have data TLB, this can be set to 1
  // For processor that supports data TLB, this should be set to be larger than the number
  // of entries of dTLB to cover dTLB hit/miss scenario
  int num_of_data_pages = 40;

  // Data section byte size
  // For processor with no dTLB and data cache, keep the value below 10K
  // For processor with dTLB support, set it to the physical memory size that covers one entry
  // of the dTLB
  int data_page_size = 4096;
  int data_page_alignment = $clog2(data_page_size);

  // The maximum data section byte size actually used by load/store instruction
  // Set to this value to be smaller than data_page_size. If there's data cache in the system,
  // this value should be set large enough to be able to hit cache hit/miss scenario within a data
  // section. Don't set this to too big as it will introduce a very large binary.
  int max_used_data_page_size = 512;

  // Stack section word length
  int stack_len = 5000;

  //-----------------------------------------------------------------------------
  // Kernel section setting, used by supervisor mode programs
  //-----------------------------------------------------------------------------

  // Number of kernel data pages
  int num_of_kernel_data_pages = 5;

  // Byte size of kernel data pages
  int kernel_data_page_size = 4096;

  // Kernel Stack section word length
  int kernel_stack_len = 5000;

  // Number of instructions for each kernel program
  int kernel_program_instr_cnt = 400;

  //-----------------------------------------------------------------------------
  // Random instruction generation settings
  //-----------------------------------------------------------------------------

  // Instruction count of the main program
  rand int               main_program_instr_cnt;

  // Instruction count of each sub-program
  rand int               sub_program_instr_cnt[];

  // Pattern of data section: RAND_DATA, ALL_ZERO, INCR_VAL
  rand data_pattern_t    data_page_pattern;

  // Max depth for the nested loops
  rand bit [1:0]         max_nested_loop;

  // Associate array for delegation configuration for each exception and interrupt
  // When the bit is 1, the corresponding delegation is enabled.
  rand bit               m_mode_exception_delegation[exception_cause_t];
  rand bit               s_mode_exception_delegation[exception_cause_t];
  rand bit               m_mode_interrupt_delegation[interrupt_cause_t];
  rand bit               s_mode_interrupt_delegation[interrupt_cause_t];

  // Priviledged mode after boot
  rand privileged_mode_t init_privileged_mode;

  // Key fields in xSTATUS
  // Memory protection bits
  rand bit               mstatus_mprv;
  rand bit               mstatus_mxr;
  rand bit               mstatus_sum;
  rand bit               mstatus_tvm;

  // Enable sfence.vma instruction
  rand bit               enable_sfence;

  //-----------------------------------------------------------------------------
  // Command line options or control knobs
  //-----------------------------------------------------------------------------
  // Main options for RISC-V assembly program generation
  // Number of sub-programs per test
  int                    num_of_sub_program = 5;
  int                    instr_cnt = 200;
  int                    num_of_tests = 1;
  // For tests doesn't involve load/store, the data section generation could be skipped
  bit                    no_data_page;
  // Options to turn off some specific types of instructions
  bit                    no_branch_jump;   // No branch/jump instruction
  bit                    no_load_store;    // No load/store instruction
  bit                    no_csr_instr = 1; // No csr instruction
  bit                    no_ebreak = 1;    // No ebreak instruction
  bit                    no_fence;         // No fence instruction
  // Directed boot privileged mode, u, m, s
  string                 boot_mode_opts;
  int                    enable_page_table_exception;
  bit                    no_directed_instr;
  riscv_instr_group_t    march_list[$];
  // A name suffix for the generated assembly program
  string                 asm_test_suffix;
  // Enable interrupt bit in MSTATUS (MIE, SIE, UIE)
  int                    enable_interrupt;
  // sfence support
  bit                    allow_sfence_exception = 0;
  // Interrupt/Exception Delegation
  bit                    no_delegation = 1;
  bit                    force_m_delegation = 0;
  bit                    force_s_delegation = 0;
  bit                    support_supervisor_mode;
  // Stack space allocated to each program, need to be enough to store necessary context
  // Example: RA, SP, T0, loop registers
  int                    min_stack_len_per_program = 10 * (XLEN/8);
  int                    max_stack_len_per_program = 16 * (XLEN/8);
  // Maximum branch distance, avoid skipping large portion of the code
  int                    max_branch_step = 20;
  // Reserved registers
  // Default reserved registers, only used by special instructions
  riscv_reg_t            default_reserved_regs[];
  // Reserve some registers for loop counter, make sure the loop can execute
  // in a determinstic way and not affected by other random instructions
  rand riscv_reg_t       loop_regs[];
  // All reserved regs
  riscv_reg_t            reserved_regs[];

  uvm_cmdline_processor  inst;

  constraint default_c {
    sub_program_instr_cnt.size() == num_of_sub_program;
    main_program_instr_cnt + sub_program_instr_cnt.sum() == instr_cnt;
    main_program_instr_cnt inside {[1 : instr_cnt]};
    foreach(sub_program_instr_cnt[i]) {
      sub_program_instr_cnt[i] inside {[1 : instr_cnt]};
    }
    // Disable sfence if the program is not boot to supervisor mode
    // If sfence exception is allowed, we can enable sfence instruction in any priviledged mode.
    // When MSTATUS.TVM is set, executing sfence.vma will be treate as illegal instruction
    if(allow_sfence_exception) {
      enable_sfence == 1'b1;
      (init_privileged_mode != SUPERVISOR_MODE) || (mstatus_tvm == 1'b1);
    } else {
      (init_privileged_mode != SUPERVISOR_MODE || !support_sfence || mstatus_tvm || no_fence)
                                                     -> (enable_sfence == 1'b0);
    }
  }

  // Boot privileged mode distribution
  constraint boot_privileged_mode_dist_c {
    // Boot to higher privileged mode more often
    if(supported_privileged_mode.size() == 2) {
      init_privileged_mode dist {supported_privileged_mode[0] := 9,
                                 supported_privileged_mode[1] := 1};
    } else if (supported_privileged_mode.size() == 3) {
      init_privileged_mode dist {supported_privileged_mode[0] := 6,
                                 supported_privileged_mode[1] := 3,
                                 supported_privileged_mode[2] := 1};
    } else {
      init_privileged_mode == supported_privileged_mode[0];
    }
  }

  constraint mstatus_c {
    // This is default disabled at setup phase. It can be enabled in the exception and interrupt
    // handling routine
    mstatus_mprv == 1'b0;
  }

  // Exception delegation setting
  constraint exception_delegation_c {
    // Do not delegate instructino page fault to supervisor/user mode because this may introduce
    // dead loop. All the subsequent instruction fetches may fail and program cannot recover.
    m_mode_exception_delegation[INSTRUCTION_PAGE_FAULT] == 1'b0;
    if(force_m_delegation) {
      foreach(m_mode_exception_delegation[i]) {
        soft m_mode_exception_delegation[i] == 1'b1;
      }
      foreach(m_mode_interrupt_delegation[i]) {
        soft m_mode_interrupt_delegation[i] == 1'b1;
      }
    }
    if(force_s_delegation) {
      foreach(s_mode_exception_delegation[i]) {
        soft s_mode_exception_delegation[i] == 1'b1;
      }
      foreach(s_mode_interrupt_delegation[i]) {
        soft s_mode_interrupt_delegation[i] == 1'b1;
      }
    }
  }

  // Spike only supports a subset of exception and interrupt delegation
  // You can modify this constraint if your ISS support different set of delegations
  constraint delegation_c {
    foreach(m_mode_exception_delegation[i]) {
      if(!support_supervisor_mode) {
        m_mode_exception_delegation[i] == 0;
      }
      if(!(i inside {INSTRUCTION_ADDRESS_MISALIGNED, BREAKPOINT, ECALL_UMODE,
                     INSTRUCTION_PAGE_FAULT, LOAD_PAGE_FAULT, STORE_AMO_PAGE_FAULT})) {
        m_mode_exception_delegation[i] == 0;
      }
    }
    foreach(m_mode_interrupt_delegation[i]) {
      if(!support_supervisor_mode) {
        m_mode_interrupt_delegation[i] == 0;
      }
      if(!(i inside {S_SOFTWARE_INTR, S_TIMER_INTR, S_EXTERNAL_INTR})) {
        m_mode_interrupt_delegation[i] == 0;
      }
    }
  }

  constraint reserved_reg_c {
    unique {loop_regs};
    foreach(loop_regs[i]) {
      !(loop_regs[i] inside {default_reserved_regs});
    }
  }

  constraint legal_loop_regs_c {
    soft max_nested_loop != 0;
    // One register for loop counter, one for loop limit
    loop_regs.size() == max_nested_loop*2;
    unique {loop_regs};
    foreach(loop_regs[i]) {
      loop_regs[i] != ZERO;
    }
  }

  `uvm_object_utils_begin(riscv_instr_gen_config)
    `uvm_field_int(main_program_instr_cnt,       UVM_DEFAULT)
    `uvm_field_sarray_int(sub_program_instr_cnt, UVM_DEFAULT)
  `uvm_object_utils_end

  function new (string name = "");
    string s;
    super.new(name);
    setup_default_reserved_regs();
    init_delegation();
    inst = uvm_cmdline_processor::get_inst();
    march_list = supported_isa;
    get_int_arg_value("+num_of_tests=", num_of_tests);
    get_int_arg_value("+enable_page_table_exception=", enable_page_table_exception);
    get_int_arg_value("+enable_interrupt=", enable_interrupt);
    get_int_arg_value("+num_of_sub_program=", num_of_sub_program);
    get_int_arg_value("+instr_cnt=", instr_cnt);
    get_bool_arg_value("+no_ebreak=", no_ebreak);
    get_bool_arg_value("+no_branch_jump=", no_branch_jump);
    get_bool_arg_value("+no_load_store=", no_load_store);
    get_bool_arg_value("+no_csr_instr=", no_csr_instr);
    get_bool_arg_value("+allow_sfence_exception=", allow_sfence_exception);
    get_bool_arg_value("+no_data_page=", no_data_page);
    get_bool_arg_value("+no_directed_instr=", no_directed_instr);
    get_bool_arg_value("+no_fence=", no_fence);
    get_bool_arg_value("+no_delegation=", no_delegation);
    get_bool_arg_value("+force_m_delegation=", force_m_delegation);
    get_bool_arg_value("+force_s_delegation=", force_s_delegation);
    if(inst.get_arg_value("+boot_mode=", boot_mode_opts)) begin
      `uvm_info(get_full_name(), $sformatf(
                "Got boot mode option - %0s", boot_mode_opts), UVM_LOW)
      case(boot_mode_opts)
        "m" : init_privileged_mode = MACHINE_MODE;
        "s" : init_privileged_mode = SUPERVISOR_MODE;
        "u" : init_privileged_mode = USER_MODE;
        default: `uvm_fatal(get_full_name(),
                  $sformatf("Illegal boot mode option - %0s", boot_mode_opts))
      endcase
      init_privileged_mode.rand_mode(0);
    end
    `uvm_info(`gfn, $sformatf("supported_privileged_mode = %0d",
                   supported_privileged_mode.size()), UVM_LOW)
    void'(inst.get_arg_value("+asm_test_suffix=", asm_test_suffix));
    // Directed march list from the runtime options, ex. RV32I, RV32M etc.
    void'(inst.get_arg_value("+march=", s));
    if(s != "") begin
      string cmdline_march_list[$];
      riscv_instr_group_t march;
      uvm_split_string(s, ",", cmdline_march_list);
      foreach(cmdline_march_list[i]) begin
        if(uvm_enum_wrapper#(riscv_instr_group_t)::from_name(cmdline_march_list[i], march)) begin
          march_list.push_back(march);
        end else begin
          `uvm_error(get_full_name(), $sformatf(
                     "Invalid march %0s specified in command line", march_list[i]))
        end
      end
    end
  endfunction

  // Initialize the exception/interrupt delegation associate array, set all delegation default to 0
  virtual function void init_delegation();
    exception_cause_t cause;
    interrupt_cause_t intr_cause;
    cause = cause.first;
    // Init exception delegation array
    do begin
      m_mode_exception_delegation[cause] = 1'b0;
      s_mode_exception_delegation[cause] = 1'b0;
      cause = cause.next;
    end
    while(cause != cause.first);
    // Init interrupt delegation array
    intr_cause = intr_cause.first;
    do begin
      m_mode_interrupt_delegation[intr_cause] = 1'b0;
      s_mode_interrupt_delegation[intr_cause] = 1'b0;
      intr_cause = intr_cause.next;
    end
    while(intr_cause != intr_cause.first);
  endfunction

  // Reserve below registers for special purpose instruction
  // The other normal instruction cannot use them as destination register
  virtual function void setup_default_reserved_regs();
    default_reserved_regs = {RA, // x1, return address
                             SP, // x2, stack pointer (user stack)
                             TP, // x4, thread pointer, used as kernel stack pointer
                             T0  // x5, alternative link pointer
                             };
  endfunction

  function void pre_randomize();
    foreach (supported_privileged_mode[i]) begin
      if(supported_privileged_mode[i] == SUPERVISOR_MODE)
        support_supervisor_mode = 1;
    end
  endfunction

  function void post_randomize();
    // Setup the list all reserved registers
    reserved_regs = {default_reserved_regs, loop_regs};
    // Need to save all loop registers, and RA/T0
    min_stack_len_per_program = (max_nested_loop * 2 + 2) * (XLEN/8);
  endfunction

  // Get an integer argument from comand line
  function void get_int_arg_value(string cmdline_str, ref int val);
    string s;
    if(inst.get_arg_value(cmdline_str, s))
      val = s.atoi();
  endfunction

  // Get a bool argument from comand line
  function void get_bool_arg_value(string cmdline_str, ref bit val);
    string s;
    if(inst.get_arg_value(cmdline_str, s))
      val = s.atobin();
  endfunction

endclass
