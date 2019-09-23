`define INSTR_CG_BEGIN(INSTR_NAME) \
  covergroup ``INSTR_NAME``_cg with function sample(riscv_instr_cov_item instr);

`define R_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rs1      : coverpoint instr.rs1; \
    cp_rs2      : coverpoint instr.rs2; \
    cp_rd       : coverpoint instr.rd;  \
    cp_rs1_sign : coverpoint instr.rs1_sign; \
    cp_rs2_sign : coverpoint instr.rs2_sign; \
    cp_rd_sign  : coverpoint instr.rd_sign;

`define CMP_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rs1      : coverpoint instr.rs1; \
    cp_rd       : coverpoint instr.rd;  \
    cp_rs1_sign : coverpoint instr.rs1_sign; \
    cp_result   : coverpoint instr.rd_value[0];

`define SB_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rs1        : coverpoint instr.rs1; \
    cp_rs2        : coverpoint instr.rs2; \
    cp_rs1_sign   : coverpoint instr.rs1_sign; \
    cp_rs2_sign   : coverpoint instr.rs2_sign; \
    cp_imm_sign   : coverpoint instr.imm_sign; \
    cp_branch_hit : coverpoint instr.branch_hit; \
    cp_sign_cross : cross cp_rs1_sign, cp_rs2_sign, cp_imm_sign;

`define STORE_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rs1      : coverpoint instr.rs1; \
    cp_rs2      : coverpoint instr.rs2; \
    cp_imm_sign : coverpoint instr.imm_sign; \

`define LOAD_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rs1      : coverpoint instr.rs1; \
    cp_rd       : coverpoint instr.rd; \
    cp_imm_sign : coverpoint instr.imm_sign; \

`define I_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rs1      : coverpoint instr.rs1; \
    cp_rd       : coverpoint instr.rd; \
    cp_rs1_sign : coverpoint instr.rs1_sign; \
    cp_rd_sign  : coverpoint instr.rd_sign; \
    cp_imm_sign : coverpoint instr.imm_sign;

`define U_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_rd       : coverpoint instr.rd; \
    cp_rd_sign  : coverpoint instr.rd_sign; \
    cp_imm_sign : coverpoint instr.imm_sign;

`define CSR_INSTR_CG_BEGIN(INSTR_NAME) \
  `INSTR_CG_BEGIN(INSTR_NAME) \
    cp_csr      : coverpoint instr.csr { \
      bins csr[] = cp_csr with (is_implemented_csr(item)); \
    } \
    cp_rs1      : coverpoint instr.rs1; \
    cp_rd       : coverpoint instr.rd;

`define CG_END endgroup

class riscv_instr_cover_group;

  riscv_instr_gen_config  cfg;
  riscv_instr_name_t      instr_name;
  riscv_instr_name_t      pre_instr_name;
  riscv_instr_name_t      instr_list[$];
  int unsigned            instr_cnt;
  int unsigned            branch_instr_cnt;
  bit [4:0]               branch_hit_history; // The last 5 branch result

  ///////////// RV32I instruction functional coverage //////////////

  // Arithmetic instructions
  `R_INSTR_CG_BEGIN(add)
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign, cp_rd_sign;
  `CG_END

  `R_INSTR_CG_BEGIN(sub)
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign, cp_rd_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(addi)
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign, cp_rd_sign;
  `CG_END

  `U_INSTR_CG_BEGIN(lui)
    cp_sign_cross: cross cp_imm_sign, cp_rd_sign;
  `CG_END

  `U_INSTR_CG_BEGIN(auipc)
    cp_sign_cross: cross cp_imm_sign, cp_rd_sign;
  `CG_END

  // Shift instructions
  `R_INSTR_CG_BEGIN(sra)
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `R_INSTR_CG_BEGIN(sll)
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `R_INSTR_CG_BEGIN(srl)
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(srai)
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(slli)
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(srli)
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  // Logical instructions
  `R_INSTR_CG_BEGIN(xor)
    cp_logical   : coverpoint instr.logical_similarity;
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `R_INSTR_CG_BEGIN(or)
    cp_logical   : coverpoint instr.logical_similarity;
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `R_INSTR_CG_BEGIN(and)
    cp_logical   : coverpoint instr.logical_similarity;
    cp_sign_cross: cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(xori)
    cp_logical   : coverpoint instr.logical_similarity;
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(ori)
    cp_logical   : coverpoint instr.logical_similarity;
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  `I_INSTR_CG_BEGIN(andi)
    cp_logical   : coverpoint instr.logical_similarity;
    cp_sign_cross: cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  // Compare instructions
  `CMP_INSTR_CG_BEGIN(slt)
    cp_rs2        : coverpoint instr.rs2;
    cp_rs2_sign   : coverpoint instr.rs2_sign;
    cp_sign_cross : cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `CMP_INSTR_CG_BEGIN(sltu)
    cp_rs2        : coverpoint instr.rs2;
    cp_rs2_sign   : coverpoint instr.rs2_sign;
    cp_sign_cross : cross cp_rs1_sign, cp_rs2_sign;
  `CG_END

  `CMP_INSTR_CG_BEGIN(slti)
    cp_imm_sign   : coverpoint instr.imm_sign;
    cp_sign_cross : cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  `CMP_INSTR_CG_BEGIN(sltiu)
    cp_imm_sign   : coverpoint instr.imm_sign;
    cp_sign_cross : cross cp_rs1_sign, cp_imm_sign;
  `CG_END

  // Branch instruction
  `SB_INSTR_CG_BEGIN(beq)
  `CG_END

  `SB_INSTR_CG_BEGIN(bne)
  `CG_END

  `SB_INSTR_CG_BEGIN(blt)
  `CG_END

  `SB_INSTR_CG_BEGIN(bge)
  `CG_END

  `SB_INSTR_CG_BEGIN(bltu)
  `CG_END

  `SB_INSTR_CG_BEGIN(bgeu)
  `CG_END

  // Load instructions
  `LOAD_INSTR_CG_BEGIN(lb)
  `CG_END

  `LOAD_INSTR_CG_BEGIN(lh)
    cp_align: coverpoint instr.unaligned_mem_access;
  `CG_END

  `LOAD_INSTR_CG_BEGIN(lw)
    cp_align: coverpoint instr.unaligned_mem_access;
  `CG_END

  `LOAD_INSTR_CG_BEGIN(lbu)
  `CG_END

  `LOAD_INSTR_CG_BEGIN(lhu)
    cp_align: coverpoint instr.unaligned_mem_access;
  `CG_END

  // Store instruction
  `STORE_INSTR_CG_BEGIN(sb)
  `CG_END

  `STORE_INSTR_CG_BEGIN(sh)
    cp_misalign: coverpoint instr.unaligned_mem_access;
  `CG_END

  `STORE_INSTR_CG_BEGIN(sw)
    cp_misalign: coverpoint instr.unaligned_mem_access;
  `CG_END

  // CSR instructions
  `CSR_INSTR_CG_BEGIN(csrrw)
    cp_rs2 : coverpoint instr.rs1;
  `CG_END

  `CSR_INSTR_CG_BEGIN(csrrs)
    cp_rs2 : coverpoint instr.rs1;
  `CG_END

  `CSR_INSTR_CG_BEGIN(csrrc)
    cp_rs2 : coverpoint instr.rs1;
  `CG_END

  `CSR_INSTR_CG_BEGIN(csrrwi)
    cp_imm_sign : coverpoint instr.imm_sign;
  `CG_END

  `CSR_INSTR_CG_BEGIN(csrrsi)
    cp_imm_sign : coverpoint instr.imm_sign;
  `CG_END

  `CSR_INSTR_CG_BEGIN(csrrci)
    cp_imm_sign : coverpoint instr.imm_sign;
  `CG_END

  // Branch hit history
  covergroup branch_hit_history_cg;
    coverpoint branch_hit_history;
  endgroup

  // Instruction transition for all supported instructions
  covergroup instr_trans_cg with function sample();
    cp_instr: coverpoint instr_name {
      bins instr[] = cp_instr with (is_supported_instr(riscv_instr_name_t'(item)));
    }
    cp_pre_instr: coverpoint pre_instr_name {
      // This is a helper coverpoint for cross coverpoint below, it should not be counted when
      // calculate the coverage score
      type_option.weight = 0;
      bins instr[] = cp_pre_instr with (is_supported_instr(riscv_instr_name_t'(item)));
    }
    cp_trans: cross cp_pre_instr, cp_instr {
      // Cover all instruction transitions, except for below system instructions
      ignore_bins ignore = binsof(cp_instr) intersect {ECALL, URET, SRET, SRET, DRET} ||
                           binsof(cp_pre_instr) intersect {ECALL, URET, SRET, SRET, DRET};
    }
  endgroup

  // TODO: Add covergroup for various hazard conditions

  function new(riscv_instr_gen_config cfg);
    this.cfg = cfg;
    build_instr_list();
    // RV32I instruction functional coverage instantiation
    add_cg = new();
    sub_cg = new();
    addi_cg = new();
    lui_cg = new();
    auipc_cg = new();
    sll_cg = new();
    srl_cg = new();
    sra_cg = new();
    slli_cg = new();
    srli_cg = new();
    srai_cg = new();
    and_cg = new();
    or_cg = new();
    xor_cg = new();
    andi_cg = new();
    ori_cg = new();
    xori_cg = new();
    slt_cg = new();
    sltu_cg = new();
    slti_cg = new();
    sltiu_cg = new();
    beq_cg = new();
    bne_cg = new();
    blt_cg = new();
    bge_cg = new();
    bgeu_cg = new();
    bltu_cg = new();
    lb_cg = new();
    lh_cg = new();
    lw_cg = new();
    lbu_cg = new();
    lhu_cg = new();
    sb_cg = new();
    sh_cg = new();
    sw_cg = new();
    csrrw_cg = new();
    csrrs_cg = new();
    csrrc_cg = new();
    csrrwi_cg = new();
    csrrsi_cg = new();
    csrrci_cg = new();
    instr_trans_cg = new();
    branch_hit_history_cg = new();
  endfunction

  function void sample(riscv_instr_cov_item instr);
    pre_instr_name = instr_name;
    instr_name = instr.instr_name;
    instr_cnt += 1;
    case (instr.instr_name)
      ADD    : add_cg.sample(instr);
      SUB    : sub_cg.sample(instr);
      ADDI   : addi_cg.sample(instr);
      LUI    : lui_cg.sample(instr);
      AUIPC  : auipc_cg.sample(instr);
      SLL    : sll_cg.sample(instr);
      SRL    : srl_cg.sample(instr);
      SRA    : sra_cg.sample(instr);
      SLLI   : slli_cg.sample(instr);
      SRLI   : srli_cg.sample(instr);
      SRAI   : srai_cg.sample(instr);
      AND    : and_cg.sample(instr);
      OR     : or_cg.sample(instr);
      XOR    : xor_cg.sample(instr);
      ANDI   : andi_cg.sample(instr);
      ORI    : ori_cg.sample(instr);
      XORI   : xori_cg.sample(instr);
      SLT    : slt_cg.sample(instr);
      SLTU   : sltu_cg.sample(instr);
      SLTI   : slti_cg.sample(instr);
      SLTIU  : sltiu_cg.sample(instr);
      BEQ    : beq_cg.sample(instr);
      BNE    : bne_cg.sample(instr);
      BLT    : blt_cg.sample(instr);
      BGE    : bge_cg.sample(instr);
      BLTU   : bltu_cg.sample(instr);
      BGEU   : bgeu_cg.sample(instr);
      LW     : lw_cg.sample(instr);
      LH     : lh_cg.sample(instr);
      LB     : lb_cg.sample(instr);
      LBU    : lbu_cg.sample(instr);
      LHU    : lhu_cg.sample(instr);
      SW     : sw_cg.sample(instr);
      SH     : sh_cg.sample(instr);
      SB     : sb_cg.sample(instr);
      CSRRW  : csrrw_cg.sample(instr);
      CSRRS  : csrrs_cg.sample(instr);
      CSRRC  : csrrc_cg.sample(instr);
      CSRRWI : csrrwi_cg.sample(instr);
      CSRRSI : csrrsi_cg.sample(instr);
      CSRRCI : csrrci_cg.sample(instr);
    endcase
    if (instr.category == BRANCH) begin
      branch_hit_history = (branch_hit_history << 1) | instr.branch_hit;
      branch_instr_cnt += 1;
      if (branch_instr_cnt >= $bits(branch_hit_history)) begin
        branch_hit_history_cg.sample();
      end
    end
    if (instr_cnt > 1) begin
      instr_trans_cg.sample();
    end
  endfunction

  // Check if the privileged CSR is implemented
  virtual function bit is_implemented_csr(bit [11:0] csr);
    foreach (riscv_instr_pkg::implemented_csr[i]) begin
      if (int'(riscv_instr_pkg::implemented_csr[i]) == csr) begin
        return 1'b1;
      end
    end
    return 1'b0;
  endfunction

  // Check if the instruction is supported
  virtual function bit is_supported_instr(riscv_instr_name_t name);
    if (name inside {instr_list}) begin
      return 1'b1;
    end else begin
      return 1'b0;
    end
  endfunction

  // Build the supported instruction list based on the core setting
  virtual function void build_instr_list();
    riscv_instr_name_t instr_name;
    instr_name = instr_name.first;
    do begin
      riscv_instr_base instr;
      if (!(instr_name inside {unsupported_instr}) && (instr_name != INVALID_INSTR)) begin
        instr = riscv_instr_base::type_id::create("instr");
        if (!instr.randomize() with {instr_name == local::instr_name;}) begin
          `uvm_fatal("riscv_instr_cover_group",
                     $sformatf("Instruction %0s randomization failure", instr_name.name()))
        end
        // TODO: Expand beyond RV32I instructions
        if ((instr.group inside {supported_isa}) && (instr.group == RV32I)) begin
          if (((instr_name inside {URET}) && !support_umode_trap) ||
              ((instr_name inside {SRET, SFENCE_VMA}) &&
              !(SUPERVISOR_MODE inside {supported_privileged_mode})) ||
              ((instr_name inside {DRET}) && !support_debug_mode)) begin
            instr_name = instr_name.next;
            continue;
          end
          `uvm_info("riscv_instr_cover_group", $sformatf("Adding [%s] %s to the list",
                    instr.group.name(), instr.instr_name.name()), UVM_HIGH)
          instr_list.push_back(instr_name);
        end
      end
      instr_name = instr_name.next;
    end
    while (instr_name != instr_name.first);
  endfunction

  function void reset();
    instr_cnt = 0;
    branch_instr_cnt = 0;
    branch_hit_history = '0;
  endfunction

endclass
