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

class riscv_instr_base extends uvm_object;

  rand riscv_instr_group_t      group;
  rand riscv_instr_format_t     format;
  rand bit [3:0]                latency;
  rand riscv_instr_cateogry_t   category;
  rand riscv_instr_name_t       instr_name;
  rand bit [11:0]               csr;

  rand riscv_reg_t              rs2;
  rand riscv_reg_t              rs1;
  rand riscv_reg_t              rd;
  rand bit [31:0]               imm;
  rand imm_t                    imm_type;
  rand bit [4:0]                imm_len;
  rand bit                      is_pseudo_instr;
  bit                           is_branch_target;
  bit                           has_label = 1'b1;
  bit                           atomic = 0;
  bit                           branch_assigned;
  bit                           process_load_store = 1'b1;
  bit                           is_compressed;

  string                        imm_str;
  string                        comment;
  string                        label;
  bit                           is_local_numeric_label;
  int                           idx = -1;

  `uvm_object_utils_begin(riscv_instr_base)
    `uvm_field_enum(riscv_instr_group_t, group, UVM_DEFAULT)
    `uvm_field_enum(riscv_instr_format_t, format, UVM_DEFAULT)
    `uvm_field_enum(riscv_instr_cateogry_t, category, UVM_DEFAULT)
    `uvm_field_enum(riscv_instr_name_t, instr_name, UVM_DEFAULT)
    `uvm_field_enum(riscv_reg_t, rs2, UVM_DEFAULT)
    `uvm_field_enum(riscv_reg_t, rs1, UVM_DEFAULT)
    `uvm_field_enum(riscv_reg_t, rd, UVM_DEFAULT)
    `uvm_field_int(imm, UVM_DEFAULT)
    `uvm_field_enum(imm_t, imm_type, UVM_DEFAULT)
  `uvm_object_utils_end

  constraint default_c {
    soft latency == 1;
    soft is_pseudo_instr == 0;
    instr_name != INVALID_INSTR;
  }

  // Immediate bit length for different instruction format
  constraint imm_len_c {
    solve imm_type before imm_len;
    if(format inside {U_FORMAT, J_FORMAT}) {
      imm_len == 20;
    }
    if(format inside {I_FORMAT, S_FORMAT, B_FORMAT}) {
      if(imm_type == UIMM) {
        imm_len == 5;
      } else {
        imm_len == 11;
      }
    }
    if(format inside {CI_FORMAT, CSS_FORMAT}) {
      // TODO: gcc compiler seems to not support 6 bits unsigned imm for c.lui,
      // hardcoded to 5 bits for now
      if(instr_name == C_LUI) {
        imm_len == 5;
      } else {
        imm_len == 6;
      }
    }
    if(format inside {CL_FORMAT, CS_FORMAT}) {
      imm_len == 5;
    }
    if(format inside {CJ_FORMAT}) {
      imm_len == 11;
    }
    if(format inside {CB_FORMAT, CIW_FORMAT}) {
      if(instr_name == C_ANDI) {
        imm_len == 6;
      } else {
        imm_len == 8;
      }
    }
  }

  constraint imm_val_c {
    if(imm_type inside {NZIMM, NZUIMM}) {
      imm != 0;
    }
  }

  // TODO: Support HINT instruction
  constraint compressed_instr_legal_rd_c {
    rd != ZERO;
    if(instr_name == C_LUI) {
      rd != SP;
    }
    if(instr_name == C_MV) {
      rs2 != ZERO;
    }
  }

  //  Registers specified by the three-bit rs1’, rs2’, and rd’ fields of the CIW, CL, CS,
  //  and CB formats
  constraint compressed_three_bits_csr_c {
    if(format inside {CIW_FORMAT, CL_FORMAT, CS_FORMAT, CB_FORMAT}) {
      rs1 inside {[S0:A5]};
      rs2 inside {[S0:A5]};
      rd  inside {[S0:A5]};
    }
  }

  constraint fence_c {
    if (instr_name == FENCE) {
      rs1 == ZERO;
      rd  == ZERO;
      imm == 0;
    }
    if (instr_name == FENCEI) {
      rs1 == ZERO;
      rd  == ZERO;
      imm == 0;
    }
  }

  // Cannot shift more than the width of the bus
  constraint shift_imm_val_c {
    if(category == SHIFT) {
      if(group == RV64I) {
        // The new instruction in RV64I only handles 32 bits value
        imm < 32;
      } else {
        imm < XLEN;
      }
    }
  }

  constraint load_store_c {
    if(category inside {LOAD, STORE}) {
      rs1 != ZERO; // x0 cannot be used to save the base address
    }
  }

  ////////////  RV32I instructions  //////////////
  // LOAD instructions
  `add_instr(LB,     I_FORMAT, LOAD, RV32I)
  `add_instr(LH,     I_FORMAT, LOAD, RV32I)
  `add_instr(LW,     I_FORMAT, LOAD, RV32I)
  `add_instr(LBU,    I_FORMAT, LOAD, RV32I)
  `add_instr(LHU,    I_FORMAT, LOAD, RV32I)
  // STORE instructions
  `add_instr(SB,     S_FORMAT, STORE, RV32I)
  `add_instr(SH,     S_FORMAT, STORE, RV32I)
  `add_instr(SW,     S_FORMAT, STORE, RV32I)
  // SHIFT intructions
  `add_instr(SLL,    R_FORMAT, SHIFT, RV32I)
  `add_instr(SLLI,   I_FORMAT, SHIFT, RV32I)
  `add_instr(SRL,    R_FORMAT, SHIFT, RV32I)
  `add_instr(SRLI,   I_FORMAT, SHIFT, RV32I)
  `add_instr(SRA,    R_FORMAT, SHIFT, RV32I)
  `add_instr(SRAI,   I_FORMAT, SHIFT, RV32I)
  // ARITHMETIC intructions
  `add_instr(ADD,    R_FORMAT, ARITHMETIC, RV32I)
  `add_instr(ADDI,   I_FORMAT, ARITHMETIC, RV32I)
  `add_instr(NOP,    I_FORMAT, ARITHMETIC, RV32I)
  `add_instr(SUB,    R_FORMAT, ARITHMETIC, RV32I)
  `add_instr(LUI,    U_FORMAT, ARITHMETIC, RV32I, UIMM)
  `add_instr(AUIPC,  U_FORMAT, ARITHMETIC, RV32I, UIMM)
  // LOGICAL instructions
  `add_instr(XOR,    R_FORMAT, LOGICAL, RV32I)
  `add_instr(XORI,   I_FORMAT, LOGICAL, RV32I)
  `add_instr(OR,     R_FORMAT, LOGICAL, RV32I)
  `add_instr(ORI,    I_FORMAT, LOGICAL, RV32I)
  `add_instr(AND,    R_FORMAT, LOGICAL, RV32I)
  `add_instr(ANDI,   I_FORMAT, LOGICAL, RV32I)
  // COMPARE instructions
  `add_instr(SLT,    R_FORMAT, COMPARE, RV32I)
  `add_instr(SLTI,   I_FORMAT, COMPARE, RV32I)
  `add_instr(SLTU,   R_FORMAT, COMPARE, RV32I)
  `add_instr(SLTIU,  I_FORMAT, COMPARE, RV32I)
  // BRANCH instructions
  `add_instr(BEQ,    B_FORMAT, BRANCH, RV32I)
  `add_instr(BNE,    B_FORMAT, BRANCH, RV32I)
  `add_instr(BLT,    B_FORMAT, BRANCH, RV32I)
  `add_instr(BGE,    B_FORMAT, BRANCH, RV32I)
  `add_instr(BLTU,   B_FORMAT, BRANCH, RV32I)
  `add_instr(BGEU,   B_FORMAT, BRANCH, RV32I)
  // JUMP instructions
  `add_instr(JAL,    J_FORMAT, JUMP, RV32I)
  `add_instr(JALR,   I_FORMAT, JUMP, RV32I)
  // SYNCH instructions
  `add_instr(FENCE,   I_FORMAT, SYNCH, RV32I)
  `add_instr(FENCEI,  I_FORMAT, SYNCH, RV32I)
  // SYSTEM instructions
  `add_instr(ECALL,   I_FORMAT, SYSTEM, RV32I)
  `add_instr(EBREAK,  I_FORMAT, SYSTEM, RV32I)
  // CSR instructions
  `add_instr(CSRRW,  R_FORMAT, CSR, RV32I, UIMM)
  `add_instr(CSRRS,  R_FORMAT, CSR, RV32I, UIMM)
  `add_instr(CSRRC,  R_FORMAT, CSR, RV32I, UIMM)
  `add_instr(CSRRWI, I_FORMAT, CSR, RV32I, UIMM)
  `add_instr(CSRRSI, I_FORMAT, CSR, RV32I, UIMM)
  `add_instr(CSRRCI, I_FORMAT, CSR, RV32I, UIMM)

  ////////////  RV32M instructions  //////////////
  `add_instr(MUL,    R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(MULH,   R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(MULHSU, R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(MULHU,  R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(DIV,    R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(DIVU,   R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(REM,    R_FORMAT, ARITHMETIC, RV32M)
  `add_instr(REMU,   R_FORMAT, ARITHMETIC, RV32M)

  ////////////  RV64M instructions  //////////////
  `add_instr(MULW,   R_FORMAT, ARITHMETIC, RV64M)
  `add_instr(DIVW,   R_FORMAT, ARITHMETIC, RV64M)
  `add_instr(DIVUW,  R_FORMAT, ARITHMETIC, RV64M)
  `add_instr(REMW,   R_FORMAT, ARITHMETIC, RV64M)
  `add_instr(REMUW,  R_FORMAT, ARITHMETIC, RV64M)

  ////////////  RV32F instructions  //////////////
  `add_instr(FLW,       R_FORMAT, LOAD, RV32F)
  `add_instr(FSW,       R_FORMAT, STORE, RV32F)
  `add_instr(FMADD_S,   R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FMSUB_S,   R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FNMSUB_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FNMADD_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FADD_S,    R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FSUB_S,    R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FMUL_S,    R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FDIV_S,    R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FSQRT_S,   R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FSGNJ_S,   R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FSGNJN_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FSGNJX_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FMIN_S,    R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FMAX_S,    R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_W_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_WU_S, R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FMV_X_W,   R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FEQ_S,     R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FLT_S,     R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FLE_S,     R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCLASS_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_S_W,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_S_WU, R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FMV_W_X,   R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_L_S,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_LU_S, R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_S_L,  R_FORMAT, ARITHMETIC, RV32F)
  `add_instr(FCVT_S_LU, R_FORMAT, ARITHMETIC, RV32F)

  // RV64I instructions
  // LOAD/STORE instructions
  `add_instr(LWU,     I_FORMAT, LOAD, RV64I)
  `add_instr(LD,      I_FORMAT, LOAD, RV64I)
  `add_instr(SD,      S_FORMAT, STORE, RV64I)
  // SHIFT intructions
  `add_instr(SLLW,    R_FORMAT, SHIFT, RV64I)
  `add_instr(SLLIW,   I_FORMAT, SHIFT, RV64I)
  `add_instr(SRLW,    R_FORMAT, SHIFT, RV64I)
  `add_instr(SRLIW,   I_FORMAT, SHIFT, RV64I)
  `add_instr(SRAW,    R_FORMAT, SHIFT, RV64I)
  `add_instr(SRAIW,   I_FORMAT, SHIFT, RV64I)
  // ARITHMETIC intructions
  `add_instr(ADDW,    R_FORMAT, ARITHMETIC, RV64I)
  `add_instr(ADDIW,   I_FORMAT, ARITHMETIC, RV64I)
  `add_instr(SUBW,    R_FORMAT, ARITHMETIC, RV64I)

  // RV32IC
  `add_instr(C_LW,       CL_FORMAT, LOAD, RV32C, UIMM)
  `add_instr(C_SW,       CS_FORMAT, STORE, RV32C, UIMM)
  `add_instr(C_LWSP,     CI_FORMAT, LOAD, RV64C, UIMM)
  `add_instr(C_SWSP,     CSS_FORMAT, STORE, RV64C, UIMM)
  `add_instr(C_ADDI4SPN, CIW_FORMAT, ARITHMETIC, RV32C, NZUIMM)
  `add_instr(C_ADDI,     CI_FORMAT, ARITHMETIC, RV32C, NZIMM)
  `add_instr(C_ADDI16SP, CI_FORMAT, ARITHMETIC, RV32C, NZIMM)
  `add_instr(C_LI,       CI_FORMAT, ARITHMETIC, RV32C)
  `add_instr(C_LUI,      CI_FORMAT, ARITHMETIC, RV32C, NZUIMM)
  `add_instr(C_SUB,      CS_FORMAT, ARITHMETIC, RV32C)
  `add_instr(C_ADD,      CS_FORMAT, ARITHMETIC, RV32C)
  `add_instr(C_NOP,      CI_FORMAT, ARITHMETIC, RV32C)
  `add_instr(C_MV,       CR_FORMAT, ARITHMETIC, RV32C)
  `add_instr(C_ANDI,     CB_FORMAT, LOGICAL, RV32C)
  `add_instr(C_XOR,      CS_FORMAT, LOGICAL, RV32C)
  `add_instr(C_OR,       CS_FORMAT, LOGICAL, RV32C)
  `add_instr(C_AND,      CS_FORMAT, LOGICAL, RV32C)
  `add_instr(C_BEQZ,     CB_FORMAT, BRANCH, RV32C)
  `add_instr(C_BNEZ,     CB_FORMAT, BRANCH, RV32C)
  `add_instr(C_SRLI,     CB_FORMAT, SHIFT, RV32C, NZUIMM)
  `add_instr(C_SRAI,     CB_FORMAT, SHIFT, RV32C, NZUIMM)
  `add_instr(C_SLLI,     CI_FORMAT, SHIFT, RV32C, NZUIMM)
  `add_instr(C_J,        CJ_FORMAT, JUMP, RV32C)
  `add_instr(C_JAL,      CJ_FORMAT, JUMP, RV32C)
  `add_instr(C_JR,       CR_FORMAT, JUMP, RV32C)
  `add_instr(C_JALR,     CR_FORMAT, JUMP, RV32C)
  `add_instr(C_EBREAK,   CI_FORMAT, SYSTEM, RV32C)

  // RV64C
  `add_instr(C_ADDIW,  CI_FORMAT, ARITHMETIC, RV64C)
  `add_instr(C_SUBW,   CS_FORMAT, ARITHMETIC, RV64C)
  `add_instr(C_ADDW,   CS_FORMAT, ARITHMETIC, RV64C)
  `add_instr(C_LD,     CL_FORMAT, LOAD, RV64C, UIMM)
  `add_instr(C_SD,     CS_FORMAT, STORE, RV64C, UIMM)
  `add_instr(C_LDSP,   CI_FORMAT, LOAD, RV64C, UIMM)
  `add_instr(C_SDSP,   CSS_FORMAT, STORE, RV64C, UIMM)

  // RV128C
  `add_instr(C_SRLI64, CB_FORMAT, SHIFT, RV128C, NZUIMM)
  `add_instr(C_SRAI64, CB_FORMAT, SHIFT, RV128C, NZUIMM)
  `add_instr(C_SLLI64, CI_FORMAT, SHIFT, RV128C, NZUIMM)
  `add_instr(C_LQ,     CL_FORMAT, LOAD, RV32DC, UIMM)
  `add_instr(C_SQ,     CS_FORMAT, STORE, RV32DC, UIMM)
  `add_instr(C_LQSP,   CI_FORMAT, LOAD, RV32DC, UIMM)
  `add_instr(C_SQSP,   CSS_FORMAT, STORE, RV32DC, UIMM)

  // RV32FC
  `add_instr(C_FLW,   CL_FORMAT, LOAD, RV32FC, UIMM)
  `add_instr(C_FSW,   CS_FORMAT, STORE, RV32FC, UIMM)
  `add_instr(C_FLWSP, CI_FORMAT, LOAD, RV32FC, UIMM)
  `add_instr(C_FSWSP, CSS_FORMAT, STORE, RV32FC, UIMM)

  // RV32DC
  `add_instr(C_FLD,   CL_FORMAT, LOAD, RV32DC, UIMM)
  `add_instr(C_FSD,   CS_FORMAT, STORE, RV32DC, UIMM)
  `add_instr(C_FLDSP, CI_FORMAT, LOAD, RV32DC, UIMM)
  `add_instr(C_FSDSP, CSS_FORMAT, STORE, RV32DC, UIMM)

  // Supervisor Instructions
  `add_instr(SFENCE_VMA, R_FORMAT,SYNCH,RV32I)

  function void post_randomize();
    // Process the immediate value and sign extension
    bit [31:0] imm_mask = '1;
    imm_mask = imm_mask << imm_len;
    if(imm_type inside {UIMM, NZUIMM}) begin
      imm = imm & ~imm_mask;
    end else begin
      if(imm[imm_len-1])
        imm = imm | imm_mask;
      else
        imm = imm & ~imm_mask;
    end
    // Give a random value if imm is zero after masking unexpectedly
    if((imm_type inside {NZIMM, NZUIMM}) && (imm == '0)) begin
      imm = $urandom_range(2 ** (imm_len-1) - 1, 1);
    end
    if(imm_str == "")
      imm_str = $sformatf("%0d", $signed(imm));
  endfunction

  function new(string name = "");
    super.new(name);
  endfunction

  // Convert the instrunction to one-liner print message
  virtual function string convert2string();
    return convert2asm();
  endfunction

  virtual function void do_print (uvm_printer printer);
    `uvm_info(get_type_name(), convert2string(), UVM_LOW)
  endfunction

  // Convert the instruction to assembly code
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
    if(category != SYSTEM) begin
      case(format)
        J_FORMAT, U_FORMAT : // instr rd,imm
          asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), get_imm());
        I_FORMAT: // instr rd,rs1,imm
          if(instr_name == NOP)
            asm_str = "nop";
          else if(instr_name == FENCE)
            asm_str = $sformatf("fence"); // TODO: Support all fence combinations
          else if(instr_name == FENCEI)
            asm_str = "fence.i";
          else if(category == LOAD) // Use psuedo instruction format
            asm_str = $sformatf("%0s%0s, %0s(%0s)", asm_str, rd.name(), get_imm(), rs1.name());
          else if(category == CSR)
            asm_str = $sformatf("%0s%0s, 0x%0x, %0s", asm_str, rd.name(), csr, get_imm());
          else
            asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), rs1.name(), get_imm());
        S_FORMAT, B_FORMAT: // instr rs1,rs2,imm
          if(category == STORE) // Use psuedo instruction format
            asm_str = $sformatf("%0s%0s, %0s(%0s)", asm_str, rs2.name(), get_imm(), rs1.name());
          else
            asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, rs1.name(), rs2.name(), get_imm());
        R_FORMAT: // instr rd,rs1,rs2
          if(category == CSR)
            asm_str = $sformatf("%0s%0s, 0x%0x, %0s", asm_str, rd.name(), csr, rs1.name());
          else if(instr_name == SFENCE_VMA)
            asm_str = "sfence.vma x0, x0"; // TODO: Support all possible sfence
          else
            asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), rs1.name(), rs2.name());
        CI_FORMAT, CIW_FORMAT:
          if(instr_name == C_NOP)
            asm_str = "c.nop";
          else
            asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), get_imm());
        CL_FORMAT:
          asm_str = $sformatf("%0s%0s, %0s(%0s)", asm_str, rd.name(), get_imm(), rs1.name());
        CS_FORMAT:
          if(category == STORE)
            asm_str = $sformatf("%0s%0s, %0s(%0s)", asm_str, rs2.name(), get_imm(), rs1.name());
          else
            asm_str = $sformatf("%0s%0s, %0s", asm_str, rs1.name(), rs2.name());
        CB_FORMAT:
          asm_str = $sformatf("%0s%0s, %0s", asm_str, rs1.name(), get_imm());
        CSS_FORMAT:
          asm_str = $sformatf("%0s%0s, %0s", asm_str, rs2.name(), get_imm());
        CR_FORMAT:
          asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), rs2.name());
        CJ_FORMAT:
          asm_str = $sformatf("%0s%0s", asm_str, get_imm());
      endcase
    end
    if(comment != "")
      asm_str = {asm_str, " #",comment};
    return asm_str.tolower();
  endfunction

  virtual function string get_instr_name();
    get_instr_name = instr_name.name();
    if(get_instr_name.substr(0, 1) == "C_") begin
      get_instr_name = {"c.", get_instr_name.substr(2, get_instr_name.len() - 1)};
    end
    return get_instr_name;
  endfunction

  // Default return imm value directly, can be overriden to use labels and symbols
  // Example: %hi(symbol), %pc_rel(label) ...
  virtual function string get_imm();
    return imm_str;
  endfunction

  virtual function void clear_unused_label();
    if(has_label && !is_branch_target && is_local_numeric_label) begin
      has_label = 1'b0;
    end
  endfunction

endclass

// Psuedo instructions are used to simplify assembly program writing
class riscv_pseudo_instr extends riscv_instr_base;

  rand riscv_pseudo_instr_name_t  pseudo_instr_name;

  constraint default_c {
    is_pseudo_instr == 1'b1;
  }

  `add_pseudo_instr(LI,    I_FORMAT, LOAD, RV32I)
  `add_pseudo_instr(LA,    I_FORMAT, LOAD, RV32I)

  `uvm_object_utils(riscv_pseudo_instr)

  function new(string name = "");
    super.new(name);
    process_load_store = 0;
  endfunction

  // Convert the instruction to assembly code
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
    // instr rd,imm
    asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), get_imm());
    if(comment != "")
      asm_str = {asm_str, " #",comment};
    return asm_str.tolower();
  endfunction

  virtual function string get_instr_name();
    return pseudo_instr_name.name();
  endfunction

endclass
