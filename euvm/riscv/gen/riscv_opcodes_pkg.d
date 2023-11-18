module riscv.gen.riscv_opcodes_pkg;
import riscv.gen.riscv_instr_pkg;


  enum riscv_opcodes_imm_t: byte {
    imm20,
    jimm20,
    imm12,
    imm12hi,
    bimm12hi,
    imm12lo,
    bimm12lo,
    imm2,
    imm3,
    imm4,
    imm5,
    imm6,
    zimm
  }

  enum riscv_opcodes_v_imm_t: byte {
    simm5,
    zimm5,
    zimm10,
    zimm11,
    zimm6hi,
    zimm6lo
  }

  enum riscv_opcodes_c_imm_t: byte {
    c_nzuimm10,
    c_uimm7lo,
    c_uimm7hi,
    c_uimm8lo,
    c_uimm8hi,
    c_uimm9lo,
    c_uimm9hi,
    c_nzimm6lo,
    c_nzimm6hi,
    c_imm6lo,
    c_imm6hi,
    c_nzimm10hi,
    c_nzimm10lo,
    c_nzimm18hi,
    c_nzimm18lo,
    c_imm12,
    c_bimm9lo,
    c_bimm9hi,
    c_nzuimm5,
    c_nzuimm6lo,
    c_nzuimm6hi,
    c_uimm8splo,
    c_uimm8sphi,
    c_uimm8sp_s,
    c_uimm10splo,
    c_uimm10sphi,
    c_uimm9splo,
    c_uimm9sphi,
    c_uimm10sp_s,
    c_uimm9sp_s,
    c_uimm2,
    c_uimm1,
    c_spimm
  }

  enum riscv_opcodes_var_t: byte {
    rd,
    rt,
    rs1,
    rs2,
    rs3,
    aqrl,
    aq,
    rl,
    fm,
    pred,
    succ,
    rm,
    funct3,
    funct2,
    csr,
    shamtq,
    shamtw,
    shamtw4,
    shamtd,
    bs,
    rnum,
    rc,
    opcode,
    funct7
  }

  enum riscv_opcodes_v_var_t: byte {
    vd,
    vs3,
    vs1,
    vs2,
    vm,
    wd,
    amoop,
    nf
  }
 
  enum riscv_opcodes_c_var_t: byte {
    c_rlist,
    c_index,
    rs1_p,
    rs2_p,
    rd_p,
    rd_rs1_n0,
    rd_rs1_p,
    rd_rs1,
    rd_n2,
    rd_n0,
    rs1_n0,
    c_rs2_n0,
    c_rs1_n0,
    c_rs2,
    c_sreg1,
    c_sreg2
  }


enum riscv_extention_t: short {
  rv_i,
  rv64_i,
  rv_zifencei,
  rv_zicsr,
  rv_zba,
  rv_zbb,
  rv_zbp,
  rv_zks,
  rv_zkn,
  rv_zk,
  rv_zbkb,
  rv32_zbpbo,
  rv_zbpbo,
  rv64_zks,
  rv64_zbb,
  rv64_zbp,
  rv64_zkn,
  rv64_zk,
  rv64_zbkb,
  rv_zbc,
  rv_zbkc,
  rv_zbs,
  rv64_zbs,
  rv_zbt,
  rv_zbe,
  rv_zbf,
  rv64_zbm,
  rv_zbkx,
  rv_b,
  rv64_zbt,
  rv_zbr,
  rv64_zba,
  rv64_zbr,
  rv64_zbe,
  rv64_zbf,
  rv64_b,
  rv64_zbpbo,
  rv_m,
  rv32_zpn,
  rv64_m,
  rv_f,
  rv64_f,
  rv_d,
  rv64_d,
  rv_c,
  rv64_c,
  rv32_c,
  rv128_c,
  rv32_c_f,
  rv_c_d,
  rv_a,
  rv64_a,
  rv_v,
  rv_v_aliases,
  rv_system,
  rv_s
};

	struct riscv_instr_param_s {
	  riscv_instr_name_t _name;
	  uint _mask;
	  uint _match;
	  riscv_opcodes_args_t[] _args;
	  riscv_extention_t[] _exts;
	  ulong _imms;
	  ulong _c_imms;
	  ulong _v_imms;
	  ulong _vars;
	  ulong _c_vars;
	  ulong _v_vars;
	}

	// look up table of position of various arguments that are used by the
	// instructions in the encoding files.
	enum riscv_opcodes_args_t: short {
	  rd,
	  rt,
	  rs1,
	  rs2,
	  rs3,
	  aqrl,
	  aq,
	  rl,
	  fm,
	  pred,
	  succ,
	  rm,
	  funct3,
	  funct2,
	  imm20,
	  jimm20,
	  imm12,
	  csr,
	  imm12hi,
	  bimm12hi,
	  imm12lo,
	  bimm12lo,
	  zimm,
	  shamtq,
	  shamtw,
	  shamtw4,
	  shamtd,
	  bs,
	  rnum,
	  rc,
	  imm2,
	  imm3,
	  imm4,
	  imm5,
	  imm6,
	  opcode,
	  funct7,

	  //  for vectors
	  vd,
	  vs3,
	  vs1,
	  vs2,
	  vm,
	  wd,
	  amoop,
	  nf,
	  simm5,
	  zimm5,
	  zimm10,
	  zimm11,
	  zimm6hi,
	  zimm6lo,


	  // compressed immediates and fields
	  c_nzuimm10,
	  c_uimm7lo,
	  c_uimm7hi,
	  c_uimm8lo,
	  c_uimm8hi,
	  c_uimm9lo,
	  c_uimm9hi,
	  c_nzimm6lo,
	  c_nzimm6hi,
	  c_imm6lo,
	  c_imm6hi,
	  c_nzimm10hi,
	  c_nzimm10lo,
	  c_nzimm18hi,
	  c_nzimm18lo,
	  c_imm12,
	  c_bimm9lo,
	  c_bimm9hi,
	  c_nzuimm5,
	  c_nzuimm6lo,
	  c_nzuimm6hi,
	  c_uimm8splo,
	  c_uimm8sphi,
	  c_uimm8sp_s,
	  c_uimm10splo,
	  c_uimm10sphi,
	  c_uimm9splo,
	  c_uimm9sphi,
	  c_uimm10sp_s,
	  c_uimm9sp_s,
	  c_uimm2,
	  c_uimm1,
	  c_rlist,
	  c_spimm,
	  c_index,

	  rs1_p,
	  rs2_p,
	  rd_p,
	  rd_rs1_n0,
	  rd_rs1_p,
	  rd_rs1,
	  rd_n2,
	  rd_n0,
	  rs1_n0,
	  c_rs2_n0,
	  c_rs1_n0,
	  c_rs2,
	  c_sreg1,
	  c_sreg2
	}
      
enum riscv_instr_opcodes = 
  [riscv_instr_name_t.LUI, 
   riscv_instr_name_t.AUIPC, 
   riscv_instr_name_t.JAL, 
   riscv_instr_name_t.JALR, 
   riscv_instr_name_t.BEQ, 
   riscv_instr_name_t.BNE, 
   riscv_instr_name_t.BLT, 
   riscv_instr_name_t.BGE, 
   riscv_instr_name_t.BLTU, 
   riscv_instr_name_t.BGEU, 
   riscv_instr_name_t.LB, 
   riscv_instr_name_t.LH, 
   riscv_instr_name_t.LW, 
   riscv_instr_name_t.LBU, 
   riscv_instr_name_t.LHU, 
   riscv_instr_name_t.SB, 
   riscv_instr_name_t.SH, 
   riscv_instr_name_t.SW, 
   riscv_instr_name_t.ADDI, 
   riscv_instr_name_t.SLTI, 
   riscv_instr_name_t.SLTIU, 
   riscv_instr_name_t.XORI, 
   riscv_instr_name_t.ORI, 
   riscv_instr_name_t.ANDI, 
   riscv_instr_name_t.SLLI, 
   riscv_instr_name_t.SRLI, 
   riscv_instr_name_t.SRAI, 
   riscv_instr_name_t.ADD, 
   riscv_instr_name_t.SUB, 
   riscv_instr_name_t.SLL, 
   riscv_instr_name_t.SLT, 
   riscv_instr_name_t.SLTU, 
   riscv_instr_name_t.XOR, 
   riscv_instr_name_t.SRL, 
   riscv_instr_name_t.SRA, 
   riscv_instr_name_t.OR, 
   riscv_instr_name_t.AND, 
   riscv_instr_name_t.NOP, 
   riscv_instr_name_t.FENCE, 
   riscv_instr_name_t.FENCE_I, 
   riscv_instr_name_t.ECALL, 
   riscv_instr_name_t.EBREAK, 
   riscv_instr_name_t.CSRRW, 
   riscv_instr_name_t.CSRRS, 
   riscv_instr_name_t.CSRRC, 
   riscv_instr_name_t.CSRRWI, 
   riscv_instr_name_t.CSRRSI, 
   riscv_instr_name_t.CSRRCI, 
   riscv_instr_name_t.SH1ADD, 
   riscv_instr_name_t.SH2ADD, 
   riscv_instr_name_t.SH3ADD, 
   riscv_instr_name_t.ANDN, 
   riscv_instr_name_t.CLZ, 
   riscv_instr_name_t.CPOP, 
   riscv_instr_name_t.CTZ, 
   riscv_instr_name_t.MAX, 
   riscv_instr_name_t.MAXU, 
   riscv_instr_name_t.MIN, 
   riscv_instr_name_t.MINU, 
   riscv_instr_name_t.ORC_B, 
   riscv_instr_name_t.ORN, 
   riscv_instr_name_t.REV8, 
   riscv_instr_name_t.ROL, 
   riscv_instr_name_t.ROR, 
   riscv_instr_name_t.RORI, 
   riscv_instr_name_t.SEXT_B, 
   riscv_instr_name_t.SEXT_H, 
   riscv_instr_name_t.XNOR, 
   riscv_instr_name_t.ZEXT_H, 
   riscv_instr_name_t.CLMUL, 
   riscv_instr_name_t.CLMULH, 
   riscv_instr_name_t.CLMULR, 
   riscv_instr_name_t.BCLR, 
   riscv_instr_name_t.BCLRI, 
   riscv_instr_name_t.BEXT, 
   riscv_instr_name_t.BEXTI, 
   riscv_instr_name_t.BINV, 
   riscv_instr_name_t.BINVI, 
   riscv_instr_name_t.BSET, 
   riscv_instr_name_t.BSETI, 
   riscv_instr_name_t.GORC, 
   riscv_instr_name_t.GORCI, 
   riscv_instr_name_t.CMIX, 
   riscv_instr_name_t.CMOV, 
   riscv_instr_name_t.PACK, 
   riscv_instr_name_t.PACKU, 
   riscv_instr_name_t.PACKH, 
   riscv_instr_name_t.XPERM4, 
   riscv_instr_name_t.XPERM8, 
   riscv_instr_name_t.XPERM16, 
   riscv_instr_name_t.SLO, 
   riscv_instr_name_t.SRO, 
   riscv_instr_name_t.SLOI, 
   riscv_instr_name_t.SROI, 
   riscv_instr_name_t.GREV, 
   riscv_instr_name_t.GREVI, 
   riscv_instr_name_t.FSL, 
   riscv_instr_name_t.FSR, 
   riscv_instr_name_t.FSRI, 
   riscv_instr_name_t.CRC32_B, 
   riscv_instr_name_t.CRC32_H, 
   riscv_instr_name_t.CRC32_W, 
   riscv_instr_name_t.CRC32C_B, 
   riscv_instr_name_t.CRC32C_H, 
   riscv_instr_name_t.CRC32C_W, 
   riscv_instr_name_t.SHFL, 
   riscv_instr_name_t.UNSHFL, 
   riscv_instr_name_t.SHFLI, 
   riscv_instr_name_t.UNSHFLI, 
   riscv_instr_name_t.BCOMPRESS, 
   riscv_instr_name_t.BDECOMPRESS, 
   riscv_instr_name_t.BFP, 
   riscv_instr_name_t.ADD_UW, 
   riscv_instr_name_t.SH1ADD_UW, 
   riscv_instr_name_t.SH2ADD_UW, 
   riscv_instr_name_t.SH3ADD_UW, 
   riscv_instr_name_t.SLLI_UW, 
   riscv_instr_name_t.CLZW, 
   riscv_instr_name_t.CPOPW, 
   riscv_instr_name_t.CTZW, 
   riscv_instr_name_t.ROLW, 
   riscv_instr_name_t.RORW, 
   riscv_instr_name_t.RORIW, 
   riscv_instr_name_t.BMATOR, 
   riscv_instr_name_t.BMATXOR, 
   riscv_instr_name_t.BMATFLIP, 
   riscv_instr_name_t.CRC32_D, 
   riscv_instr_name_t.CRC32C_D, 
   riscv_instr_name_t.SHFLW, 
   riscv_instr_name_t.UNSHFLW, 
   riscv_instr_name_t.BCOMPRESSW, 
   riscv_instr_name_t.BDECOMPRESSW, 
   riscv_instr_name_t.BFPW, 
   riscv_instr_name_t.SLOW, 
   riscv_instr_name_t.SROW, 
   riscv_instr_name_t.SLOIW, 
   riscv_instr_name_t.SROIW, 
   riscv_instr_name_t.GREVW, 
   riscv_instr_name_t.GREVIW, 
   riscv_instr_name_t.FSLW, 
   riscv_instr_name_t.FSRW, 
   riscv_instr_name_t.FSRIW, 
   riscv_instr_name_t.GORCW, 
   riscv_instr_name_t.GORCIW, 
   riscv_instr_name_t.PACKW, 
   riscv_instr_name_t.PACKUW, 
   riscv_instr_name_t.XPERM32, 
   riscv_instr_name_t.MUL, 
   riscv_instr_name_t.MULH, 
   riscv_instr_name_t.MULHSU, 
   riscv_instr_name_t.MULHU, 
   riscv_instr_name_t.DIV, 
   riscv_instr_name_t.DIVU, 
   riscv_instr_name_t.REM, 
   riscv_instr_name_t.REMU, 
   riscv_instr_name_t.MULW, 
   riscv_instr_name_t.DIVW, 
   riscv_instr_name_t.DIVUW, 
   riscv_instr_name_t.REMW, 
   riscv_instr_name_t.REMUW, 
   riscv_instr_name_t.FLW, 
   riscv_instr_name_t.FSW, 
   riscv_instr_name_t.FMADD_S, 
   riscv_instr_name_t.FMSUB_S, 
   riscv_instr_name_t.FNMSUB_S, 
   riscv_instr_name_t.FNMADD_S, 
   riscv_instr_name_t.FADD_S, 
   riscv_instr_name_t.FSUB_S, 
   riscv_instr_name_t.FMUL_S, 
   riscv_instr_name_t.FDIV_S, 
   riscv_instr_name_t.FSQRT_S, 
   riscv_instr_name_t.FSGNJ_S, 
   riscv_instr_name_t.FSGNJN_S, 
   riscv_instr_name_t.FSGNJX_S, 
   riscv_instr_name_t.FMIN_S, 
   riscv_instr_name_t.FMAX_S, 
   riscv_instr_name_t.FCVT_W_S, 
   riscv_instr_name_t.FCVT_WU_S, 
   riscv_instr_name_t.FMV_X_W, 
   riscv_instr_name_t.FEQ_S, 
   riscv_instr_name_t.FLT_S, 
   riscv_instr_name_t.FLE_S, 
   riscv_instr_name_t.FCLASS_S, 
   riscv_instr_name_t.FCVT_S_W, 
   riscv_instr_name_t.FCVT_S_WU, 
   riscv_instr_name_t.FMV_W_X, 
   riscv_instr_name_t.FCVT_L_S, 
   riscv_instr_name_t.FCVT_LU_S, 
   riscv_instr_name_t.FCVT_S_L, 
   riscv_instr_name_t.FCVT_S_LU, 
   riscv_instr_name_t.FLD, 
   riscv_instr_name_t.FSD, 
   riscv_instr_name_t.FMADD_D, 
   riscv_instr_name_t.FMSUB_D, 
   riscv_instr_name_t.FNMSUB_D, 
   riscv_instr_name_t.FNMADD_D, 
   riscv_instr_name_t.FADD_D, 
   riscv_instr_name_t.FSUB_D, 
   riscv_instr_name_t.FMUL_D, 
   riscv_instr_name_t.FDIV_D, 
   riscv_instr_name_t.FSQRT_D, 
   riscv_instr_name_t.FSGNJ_D, 
   riscv_instr_name_t.FSGNJN_D, 
   riscv_instr_name_t.FSGNJX_D, 
   riscv_instr_name_t.FMIN_D, 
   riscv_instr_name_t.FMAX_D, 
   riscv_instr_name_t.FCVT_S_D, 
   riscv_instr_name_t.FCVT_D_S, 
   riscv_instr_name_t.FEQ_D, 
   riscv_instr_name_t.FLT_D, 
   riscv_instr_name_t.FLE_D, 
   riscv_instr_name_t.FCLASS_D, 
   riscv_instr_name_t.FCVT_W_D, 
   riscv_instr_name_t.FCVT_WU_D, 
   riscv_instr_name_t.FCVT_D_W, 
   riscv_instr_name_t.FCVT_D_WU, 
   riscv_instr_name_t.FCVT_L_D, 
   riscv_instr_name_t.FCVT_LU_D, 
   riscv_instr_name_t.FMV_X_D, 
   riscv_instr_name_t.FCVT_D_L, 
   riscv_instr_name_t.FCVT_D_LU, 
   riscv_instr_name_t.FMV_D_X, 
   riscv_instr_name_t.LWU, 
   riscv_instr_name_t.LD, 
   riscv_instr_name_t.SD, 
   riscv_instr_name_t.ADDIW, 
   riscv_instr_name_t.SLLIW, 
   riscv_instr_name_t.SRLIW, 
   riscv_instr_name_t.SRAIW, 
   riscv_instr_name_t.ADDW, 
   riscv_instr_name_t.SUBW, 
   riscv_instr_name_t.SLLW, 
   riscv_instr_name_t.SRLW, 
   riscv_instr_name_t.SRAW, 
   riscv_instr_name_t.C_LW, 
   riscv_instr_name_t.C_SW, 
   riscv_instr_name_t.C_LWSP, 
   riscv_instr_name_t.C_SWSP, 
   riscv_instr_name_t.C_ADDI4SPN, 
   riscv_instr_name_t.C_ADDI, 
   riscv_instr_name_t.C_LI, 
   riscv_instr_name_t.C_ADDI16SP, 
   riscv_instr_name_t.C_LUI, 
   riscv_instr_name_t.C_SRLI, 
   riscv_instr_name_t.C_SRAI, 
   riscv_instr_name_t.C_ANDI, 
   riscv_instr_name_t.C_SUB, 
   riscv_instr_name_t.C_XOR, 
   riscv_instr_name_t.C_OR, 
   riscv_instr_name_t.C_AND, 
   riscv_instr_name_t.C_BEQZ, 
   riscv_instr_name_t.C_BNEZ, 
   riscv_instr_name_t.C_SLLI, 
   riscv_instr_name_t.C_MV, 
   riscv_instr_name_t.C_EBREAK, 
   riscv_instr_name_t.C_ADD, 
   riscv_instr_name_t.C_NOP, 
   riscv_instr_name_t.C_J, 
   riscv_instr_name_t.C_JAL, 
   riscv_instr_name_t.C_JR, 
   riscv_instr_name_t.C_JALR, 
   riscv_instr_name_t.C_ADDIW, 
   riscv_instr_name_t.C_SUBW, 
   riscv_instr_name_t.C_ADDW, 
   riscv_instr_name_t.C_LD, 
   riscv_instr_name_t.C_SD, 
   riscv_instr_name_t.C_LDSP, 
   riscv_instr_name_t.C_SDSP, 
   riscv_instr_name_t.C_SRLI64, 
   riscv_instr_name_t.C_SRAI64, 
   riscv_instr_name_t.C_SLLI64, 
   riscv_instr_name_t.C_LQ, 
   riscv_instr_name_t.C_SQ, 
   riscv_instr_name_t.C_LQSP, 
   riscv_instr_name_t.C_SQSP, 
   riscv_instr_name_t.C_FLW, 
   riscv_instr_name_t.C_FSW, 
   riscv_instr_name_t.C_FLWSP, 
   riscv_instr_name_t.C_FSWSP, 
   riscv_instr_name_t.C_FLD, 
   riscv_instr_name_t.C_FSD, 
   riscv_instr_name_t.C_FLDSP, 
   riscv_instr_name_t.C_FSDSP, 
   riscv_instr_name_t.LR_W, 
   riscv_instr_name_t.SC_W, 
   riscv_instr_name_t.AMOSWAP_W, 
   riscv_instr_name_t.AMOADD_W, 
   riscv_instr_name_t.AMOAND_W, 
   riscv_instr_name_t.AMOOR_W, 
   riscv_instr_name_t.AMOXOR_W, 
   riscv_instr_name_t.AMOMIN_W, 
   riscv_instr_name_t.AMOMAX_W, 
   riscv_instr_name_t.AMOMINU_W, 
   riscv_instr_name_t.AMOMAXU_W, 
   riscv_instr_name_t.LR_D, 
   riscv_instr_name_t.SC_D, 
   riscv_instr_name_t.AMOSWAP_D, 
   riscv_instr_name_t.AMOADD_D, 
   riscv_instr_name_t.AMOAND_D, 
   riscv_instr_name_t.AMOOR_D, 
   riscv_instr_name_t.AMOXOR_D, 
   riscv_instr_name_t.AMOMIN_D, 
   riscv_instr_name_t.AMOMAX_D, 
   riscv_instr_name_t.AMOMINU_D, 
   riscv_instr_name_t.AMOMAXU_D, 
   riscv_instr_name_t.VSETVL, 
   riscv_instr_name_t.VSETVLI, 
   riscv_instr_name_t.VADD_VV, 
   riscv_instr_name_t.VADD_VX, 
   riscv_instr_name_t.VADD_VI, 
   riscv_instr_name_t.VSUB_VV, 
   riscv_instr_name_t.VSUB_VX, 
   riscv_instr_name_t.VRSUB_VX, 
   riscv_instr_name_t.VRSUB_VI, 
   riscv_instr_name_t.VWADDU_VV, 
   riscv_instr_name_t.VWADDU_VX, 
   riscv_instr_name_t.VWADDU_WV, 
   riscv_instr_name_t.VWADDU_WX, 
   riscv_instr_name_t.VWSUBU_VV, 
   riscv_instr_name_t.VWSUBU_VX, 
   riscv_instr_name_t.VWSUBU_WV, 
   riscv_instr_name_t.VWSUBU_WX, 
   riscv_instr_name_t.VWADD_VV, 
   riscv_instr_name_t.VWADD_VX, 
   riscv_instr_name_t.VWADD_WV, 
   riscv_instr_name_t.VWADD_WX, 
   riscv_instr_name_t.VWSUB_VV, 
   riscv_instr_name_t.VWSUB_VX, 
   riscv_instr_name_t.VWSUB_WV, 
   riscv_instr_name_t.VWSUB_WX, 
   riscv_instr_name_t.VADC_VVM, 
   riscv_instr_name_t.VADC_VXM, 
   riscv_instr_name_t.VADC_VIM, 
   riscv_instr_name_t.VMADC_VVM, 
   riscv_instr_name_t.VMADC_VXM, 
   riscv_instr_name_t.VMADC_VIM, 
   riscv_instr_name_t.VMADC_VV, 
   riscv_instr_name_t.VMADC_VX, 
   riscv_instr_name_t.VMADC_VI, 
   riscv_instr_name_t.VSBC_VVM, 
   riscv_instr_name_t.VSBC_VXM, 
   riscv_instr_name_t.VMSBC_VVM, 
   riscv_instr_name_t.VMSBC_VXM, 
   riscv_instr_name_t.VMSBC_VV, 
   riscv_instr_name_t.VMSBC_VX, 
   riscv_instr_name_t.VAND_VV, 
   riscv_instr_name_t.VAND_VX, 
   riscv_instr_name_t.VAND_VI, 
   riscv_instr_name_t.VOR_VV, 
   riscv_instr_name_t.VOR_VX, 
   riscv_instr_name_t.VOR_VI, 
   riscv_instr_name_t.VXOR_VV, 
   riscv_instr_name_t.VXOR_VX, 
   riscv_instr_name_t.VXOR_VI, 
   riscv_instr_name_t.VSLL_VV, 
   riscv_instr_name_t.VSLL_VX, 
   riscv_instr_name_t.VSLL_VI, 
   riscv_instr_name_t.VSRL_VV, 
   riscv_instr_name_t.VSRL_VX, 
   riscv_instr_name_t.VSRL_VI, 
   riscv_instr_name_t.VSRA_VV, 
   riscv_instr_name_t.VSRA_VX, 
   riscv_instr_name_t.VSRA_VI, 
   riscv_instr_name_t.VNSRL_WV, 
   riscv_instr_name_t.VNSRL_WX, 
   riscv_instr_name_t.VNSRL_WI, 
   riscv_instr_name_t.VNSRA_WV, 
   riscv_instr_name_t.VNSRA_WX, 
   riscv_instr_name_t.VNSRA_WI, 
   riscv_instr_name_t.VMSEQ_VV, 
   riscv_instr_name_t.VMSEQ_VX, 
   riscv_instr_name_t.VMSEQ_VI, 
   riscv_instr_name_t.VMSNE_VV, 
   riscv_instr_name_t.VMSNE_VX, 
   riscv_instr_name_t.VMSNE_VI, 
   riscv_instr_name_t.VMSLTU_VV, 
   riscv_instr_name_t.VMSLTU_VX, 
   riscv_instr_name_t.VMSLT_VV, 
   riscv_instr_name_t.VMSLT_VX, 
   riscv_instr_name_t.VMSLEU_VV, 
   riscv_instr_name_t.VMSLEU_VX, 
   riscv_instr_name_t.VMSLEU_VI, 
   riscv_instr_name_t.VMSLE_VV, 
   riscv_instr_name_t.VMSLE_VX, 
   riscv_instr_name_t.VMSLE_VI, 
   riscv_instr_name_t.VMSGTU_VX, 
   riscv_instr_name_t.VMSGTU_VI, 
   riscv_instr_name_t.VMSGT_VX, 
   riscv_instr_name_t.VMSGT_VI, 
   riscv_instr_name_t.VMINU_VV, 
   riscv_instr_name_t.VMINU_VX, 
   riscv_instr_name_t.VMIN_VV, 
   riscv_instr_name_t.VMIN_VX, 
   riscv_instr_name_t.VMAXU_VV, 
   riscv_instr_name_t.VMAXU_VX, 
   riscv_instr_name_t.VMAX_VV, 
   riscv_instr_name_t.VMAX_VX, 
   riscv_instr_name_t.VMUL_VV, 
   riscv_instr_name_t.VMUL_VX, 
   riscv_instr_name_t.VMULH_VV, 
   riscv_instr_name_t.VMULH_VX, 
   riscv_instr_name_t.VMULHU_VV, 
   riscv_instr_name_t.VMULHU_VX, 
   riscv_instr_name_t.VMULHSU_VV, 
   riscv_instr_name_t.VMULHSU_VX, 
   riscv_instr_name_t.VDIVU_VV, 
   riscv_instr_name_t.VDIVU_VX, 
   riscv_instr_name_t.VDIV_VV, 
   riscv_instr_name_t.VDIV_VX, 
   riscv_instr_name_t.VREMU_VV, 
   riscv_instr_name_t.VREMU_VX, 
   riscv_instr_name_t.VREM_VV, 
   riscv_instr_name_t.VREM_VX, 
   riscv_instr_name_t.VWMUL_VV, 
   riscv_instr_name_t.VWMUL_VX, 
   riscv_instr_name_t.VWMULU_VV, 
   riscv_instr_name_t.VWMULU_VX, 
   riscv_instr_name_t.VWMULSU_VV, 
   riscv_instr_name_t.VWMULSU_VX, 
   riscv_instr_name_t.VMACC_VV, 
   riscv_instr_name_t.VMACC_VX, 
   riscv_instr_name_t.VNMSAC_VV, 
   riscv_instr_name_t.VNMSAC_VX, 
   riscv_instr_name_t.VMADD_VV, 
   riscv_instr_name_t.VMADD_VX, 
   riscv_instr_name_t.VNMSUB_VV, 
   riscv_instr_name_t.VNMSUB_VX, 
   riscv_instr_name_t.VWMACCU_VV, 
   riscv_instr_name_t.VWMACCU_VX, 
   riscv_instr_name_t.VWMACC_VV, 
   riscv_instr_name_t.VWMACC_VX, 
   riscv_instr_name_t.VWMACCSU_VV, 
   riscv_instr_name_t.VWMACCSU_VX, 
   riscv_instr_name_t.VWMACCUS_VX, 
   riscv_instr_name_t.VMERGE_VVM, 
   riscv_instr_name_t.VMERGE_VXM, 
   riscv_instr_name_t.VMERGE_VIM, 
   riscv_instr_name_t.VMV_V_V, 
   riscv_instr_name_t.VMV_V_X, 
   riscv_instr_name_t.VMV_V_I, 
   riscv_instr_name_t.VSADDU_VV, 
   riscv_instr_name_t.VSADDU_VX, 
   riscv_instr_name_t.VSADDU_VI, 
   riscv_instr_name_t.VSADD_VV, 
   riscv_instr_name_t.VSADD_VX, 
   riscv_instr_name_t.VSADD_VI, 
   riscv_instr_name_t.VSSUBU_VV, 
   riscv_instr_name_t.VSSUBU_VX, 
   riscv_instr_name_t.VSSUB_VV, 
   riscv_instr_name_t.VSSUB_VX, 
   riscv_instr_name_t.VAADDU_VV, 
   riscv_instr_name_t.VAADDU_VX, 
   riscv_instr_name_t.VAADD_VV, 
   riscv_instr_name_t.VAADD_VX, 
   riscv_instr_name_t.VASUBU_VV, 
   riscv_instr_name_t.VASUBU_VX, 
   riscv_instr_name_t.VASUB_VV, 
   riscv_instr_name_t.VASUB_VX, 
   riscv_instr_name_t.VSSRL_VV, 
   riscv_instr_name_t.VSSRL_VX, 
   riscv_instr_name_t.VSSRL_VI, 
   riscv_instr_name_t.VSSRA_VV, 
   riscv_instr_name_t.VSSRA_VX, 
   riscv_instr_name_t.VSSRA_VI, 
   riscv_instr_name_t.VNCLIPU_WV, 
   riscv_instr_name_t.VNCLIPU_WX, 
   riscv_instr_name_t.VNCLIPU_WI, 
   riscv_instr_name_t.VNCLIP_WV, 
   riscv_instr_name_t.VNCLIP_WX, 
   riscv_instr_name_t.VNCLIP_WI, 
   riscv_instr_name_t.VFADD_VV, 
   riscv_instr_name_t.VFADD_VF, 
   riscv_instr_name_t.VFSUB_VV, 
   riscv_instr_name_t.VFSUB_VF, 
   riscv_instr_name_t.VFRSUB_VF, 
   riscv_instr_name_t.VFMUL_VV, 
   riscv_instr_name_t.VFMUL_VF, 
   riscv_instr_name_t.VFDIV_VV, 
   riscv_instr_name_t.VFDIV_VF, 
   riscv_instr_name_t.VFRDIV_VF, 
   riscv_instr_name_t.VFWMUL_VV, 
   riscv_instr_name_t.VFWMUL_VF, 
   riscv_instr_name_t.VFMACC_VV, 
   riscv_instr_name_t.VFMACC_VF, 
   riscv_instr_name_t.VFNMACC_VV, 
   riscv_instr_name_t.VFNMACC_VF, 
   riscv_instr_name_t.VFMSAC_VV, 
   riscv_instr_name_t.VFMSAC_VF, 
   riscv_instr_name_t.VFNMSAC_VV, 
   riscv_instr_name_t.VFNMSAC_VF, 
   riscv_instr_name_t.VFMADD_VV, 
   riscv_instr_name_t.VFMADD_VF, 
   riscv_instr_name_t.VFNMADD_VV, 
   riscv_instr_name_t.VFNMADD_VF, 
   riscv_instr_name_t.VFMSUB_VV, 
   riscv_instr_name_t.VFMSUB_VF, 
   riscv_instr_name_t.VFNMSUB_VV, 
   riscv_instr_name_t.VFNMSUB_VF, 
   riscv_instr_name_t.VFWMACC_VV, 
   riscv_instr_name_t.VFWMACC_VF, 
   riscv_instr_name_t.VFWNMACC_VV, 
   riscv_instr_name_t.VFWNMACC_VF, 
   riscv_instr_name_t.VFWMSAC_VV, 
   riscv_instr_name_t.VFWMSAC_VF, 
   riscv_instr_name_t.VFWNMSAC_VV, 
   riscv_instr_name_t.VFWNMSAC_VF, 
   riscv_instr_name_t.VFSQRT_V, 
   riscv_instr_name_t.VFMIN_VV, 
   riscv_instr_name_t.VFMIN_VF, 
   riscv_instr_name_t.VFMAX_VV, 
   riscv_instr_name_t.VFMAX_VF, 
   riscv_instr_name_t.VFSGNJ_VV, 
   riscv_instr_name_t.VFSGNJ_VF, 
   riscv_instr_name_t.VFSGNJN_VV, 
   riscv_instr_name_t.VFSGNJN_VF, 
   riscv_instr_name_t.VFSGNJX_VV, 
   riscv_instr_name_t.VFSGNJX_VF, 
   riscv_instr_name_t.VMFEQ_VV, 
   riscv_instr_name_t.VMFEQ_VF, 
   riscv_instr_name_t.VMFNE_VV, 
   riscv_instr_name_t.VMFNE_VF, 
   riscv_instr_name_t.VMFLT_VV, 
   riscv_instr_name_t.VMFLT_VF, 
   riscv_instr_name_t.VMFLE_VV, 
   riscv_instr_name_t.VMFLE_VF, 
   riscv_instr_name_t.VMFGT_VF, 
   riscv_instr_name_t.VMFGE_VF, 
   riscv_instr_name_t.VFCLASS_V, 
   riscv_instr_name_t.VFMERGE_VFM, 
   riscv_instr_name_t.VFMV_V_F, 
   riscv_instr_name_t.VFCVT_XU_F_V, 
   riscv_instr_name_t.VFCVT_X_F_V, 
   riscv_instr_name_t.VFCVT_F_XU_V, 
   riscv_instr_name_t.VFCVT_F_X_V, 
   riscv_instr_name_t.VFWCVT_XU_F_V, 
   riscv_instr_name_t.VFWCVT_X_F_V, 
   riscv_instr_name_t.VFWCVT_F_XU_V, 
   riscv_instr_name_t.VFWCVT_F_X_V, 
   riscv_instr_name_t.VFWCVT_F_F_V, 
   riscv_instr_name_t.VFNCVT_XU_F_W, 
   riscv_instr_name_t.VFNCVT_X_F_W, 
   riscv_instr_name_t.VFNCVT_F_XU_W, 
   riscv_instr_name_t.VFNCVT_F_X_W, 
   riscv_instr_name_t.VFNCVT_F_F_W, 
   riscv_instr_name_t.VFNCVT_ROD_F_F_W, 
   riscv_instr_name_t.VREDSUM_VS, 
   riscv_instr_name_t.VREDMAXU_VS, 
   riscv_instr_name_t.VREDMAX_VS, 
   riscv_instr_name_t.VREDMINU_VS, 
   riscv_instr_name_t.VREDMIN_VS, 
   riscv_instr_name_t.VREDAND_VS, 
   riscv_instr_name_t.VREDOR_VS, 
   riscv_instr_name_t.VREDXOR_VS, 
   riscv_instr_name_t.VWREDSUMU_VS, 
   riscv_instr_name_t.VWREDSUM_VS, 
   riscv_instr_name_t.VFREDOSUM_VS, 
   riscv_instr_name_t.VFREDSUM_VS, 
   riscv_instr_name_t.VFREDMAX_VS, 
   riscv_instr_name_t.VFWREDOSUM_VS, 
   riscv_instr_name_t.VFWREDSUM_VS, 
   riscv_instr_name_t.VMAND_MM, 
   riscv_instr_name_t.VMNAND_MM, 
   riscv_instr_name_t.VMANDNOT_MM, 
   riscv_instr_name_t.VMXOR_MM, 
   riscv_instr_name_t.VMOR_MM, 
   riscv_instr_name_t.VMNOR_MM, 
   riscv_instr_name_t.VMORNOT_MM, 
   riscv_instr_name_t.VMXNOR_MM, 
   riscv_instr_name_t.VPOPC_M, 
   riscv_instr_name_t.VFIRST_M, 
   riscv_instr_name_t.VMSBF_M, 
   riscv_instr_name_t.VMSIF_M, 
   riscv_instr_name_t.VMSOF_M, 
   riscv_instr_name_t.VIOTA_M, 
   riscv_instr_name_t.VID_V, 
   riscv_instr_name_t.VMV_X_S, 
   riscv_instr_name_t.VMV_S_X, 
   riscv_instr_name_t.VFMV_F_S, 
   riscv_instr_name_t.VFMV_S_F, 
   riscv_instr_name_t.VSLIDEUP_VI, 
   riscv_instr_name_t.VSLIDEUP_VX, 
   riscv_instr_name_t.VSLIDEDOWN_VI, 
   riscv_instr_name_t.VSLIDEDOWN_VX, 
   riscv_instr_name_t.VSLIDE1UP_VX, 
   riscv_instr_name_t.VSLIDE1DOWN_VX, 
   riscv_instr_name_t.VRGATHER_VV, 
   riscv_instr_name_t.VRGATHER_VX, 
   riscv_instr_name_t.VRGATHER_VI, 
   riscv_instr_name_t.VCOMPRESS_VM, 
   riscv_instr_name_t.VMV1R_V, 
   riscv_instr_name_t.VMV2R_V, 
   riscv_instr_name_t.VMV4R_V, 
   riscv_instr_name_t.VMV8R_V, 
   riscv_instr_name_t.DRET, 
   riscv_instr_name_t.MRET, 
   riscv_instr_name_t.SRET, 
   riscv_instr_name_t.WFI, 
   riscv_instr_name_t.SFENCE_VMA, 
   riscv_instr_name_t.INVALID_INSTR
];

enum riscv_instr_params = 
  [riscv_instr_param_s(
     riscv_instr_name_t.LUI, // instr_name
     0x7f, // mask
     0x37, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.imm20], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lui
   riscv_instr_param_s(
     riscv_instr_name_t.AUIPC, // instr_name
     0x7f, // mask
     0x17, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.imm20], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // auipc
   riscv_instr_param_s(
     riscv_instr_name_t.JAL, // instr_name
     0x7f, // mask
     0x6f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.jimm20], // variables
     [riscv_extention_t.rv_i], // extensions
     0b10, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // jal
   riscv_instr_param_s(
     riscv_instr_name_t.JALR, // instr_name
     0x707f, // mask
     0x67, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // jalr
   riscv_instr_param_s(
     riscv_instr_name_t.BEQ, // instr_name
     0x707f, // mask
     0x63, // match
     [riscv_opcodes_args_t.bimm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // beq
   riscv_instr_param_s(
     riscv_instr_name_t.BNE, // instr_name
     0x707f, // mask
     0x1063, // match
     [riscv_opcodes_args_t.bimm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bne
   riscv_instr_param_s(
     riscv_instr_name_t.BLT, // instr_name
     0x707f, // mask
     0x4063, // match
     [riscv_opcodes_args_t.bimm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // blt
   riscv_instr_param_s(
     riscv_instr_name_t.BGE, // instr_name
     0x707f, // mask
     0x5063, // match
     [riscv_opcodes_args_t.bimm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bge
   riscv_instr_param_s(
     riscv_instr_name_t.BLTU, // instr_name
     0x707f, // mask
     0x6063, // match
     [riscv_opcodes_args_t.bimm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bltu
   riscv_instr_param_s(
     riscv_instr_name_t.BGEU, // instr_name
     0x707f, // mask
     0x7063, // match
     [riscv_opcodes_args_t.bimm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bgeu
   riscv_instr_param_s(
     riscv_instr_name_t.LB, // instr_name
     0x707f, // mask
     0x3, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lb
   riscv_instr_param_s(
     riscv_instr_name_t.LH, // instr_name
     0x707f, // mask
     0x1003, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lh
   riscv_instr_param_s(
     riscv_instr_name_t.LW, // instr_name
     0x707f, // mask
     0x2003, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lw
   riscv_instr_param_s(
     riscv_instr_name_t.LBU, // instr_name
     0x707f, // mask
     0x4003, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lbu
   riscv_instr_param_s(
     riscv_instr_name_t.LHU, // instr_name
     0x707f, // mask
     0x5003, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lhu
   riscv_instr_param_s(
     riscv_instr_name_t.SB, // instr_name
     0x707f, // mask
     0x23, // match
     [riscv_opcodes_args_t.imm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.imm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sb
   riscv_instr_param_s(
     riscv_instr_name_t.SH, // instr_name
     0x707f, // mask
     0x1023, // match
     [riscv_opcodes_args_t.imm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.imm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh
   riscv_instr_param_s(
     riscv_instr_name_t.SW, // instr_name
     0x707f, // mask
     0x2023, // match
     [riscv_opcodes_args_t.imm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.imm12lo], // variables
     [riscv_extention_t.rv_i], // extensions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sw
   riscv_instr_param_s(
     riscv_instr_name_t.ADDI, // instr_name
     0x707f, // mask
     0x13, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // addi
   riscv_instr_param_s(
     riscv_instr_name_t.SLTI, // instr_name
     0x707f, // mask
     0x2013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slti
   riscv_instr_param_s(
     riscv_instr_name_t.SLTIU, // instr_name
     0x707f, // mask
     0x3013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sltiu
   riscv_instr_param_s(
     riscv_instr_name_t.XORI, // instr_name
     0x707f, // mask
     0x4013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xori
   riscv_instr_param_s(
     riscv_instr_name_t.ORI, // instr_name
     0x707f, // mask
     0x6013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ori
   riscv_instr_param_s(
     riscv_instr_name_t.ANDI, // instr_name
     0x707f, // mask
     0x7013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // andi
   riscv_instr_param_s(
     riscv_instr_name_t.SLLI, // instr_name
     0xfc00707f, // mask
     0x1013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slli
   riscv_instr_param_s(
     riscv_instr_name_t.SRLI, // instr_name
     0xfc00707f, // mask
     0x5013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // srli
   riscv_instr_param_s(
     riscv_instr_name_t.SRAI, // instr_name
     0xfc00707f, // mask
     0x40005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // srai
   riscv_instr_param_s(
     riscv_instr_name_t.ADD, // instr_name
     0xfe00707f, // mask
     0x33, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // add
   riscv_instr_param_s(
     riscv_instr_name_t.SUB, // instr_name
     0xfe00707f, // mask
     0x40000033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sub
   riscv_instr_param_s(
     riscv_instr_name_t.SLL, // instr_name
     0xfe00707f, // mask
     0x1033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sll
   riscv_instr_param_s(
     riscv_instr_name_t.SLT, // instr_name
     0xfe00707f, // mask
     0x2033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slt
   riscv_instr_param_s(
     riscv_instr_name_t.SLTU, // instr_name
     0xfe00707f, // mask
     0x3033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sltu
   riscv_instr_param_s(
     riscv_instr_name_t.XOR, // instr_name
     0xfe00707f, // mask
     0x4033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xor
   riscv_instr_param_s(
     riscv_instr_name_t.SRL, // instr_name
     0xfe00707f, // mask
     0x5033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // srl
   riscv_instr_param_s(
     riscv_instr_name_t.SRA, // instr_name
     0xfe00707f, // mask
     0x40005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sra
   riscv_instr_param_s(
     riscv_instr_name_t.OR, // instr_name
     0xfe00707f, // mask
     0x6033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // or
   riscv_instr_param_s(
     riscv_instr_name_t.AND, // instr_name
     0xfe00707f, // mask
     0x7033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // and
   riscv_instr_param_s(
     riscv_instr_name_t.NOP, // instr_name
     0xFFFFFFFF, // mask
     0x00000013, // match
     [], // variables
     [], // extensions
     0x0, // _imms
     0x0, // _c_imms
     0x0, // _v_imms
     0x0, // _vars
     0x0, // _c_vars
     0x0, // _v_vars
   ), // nop
   riscv_instr_param_s(
     riscv_instr_name_t.FENCE, // instr_name
     0x707f, // mask
     0xf, // match
     [riscv_opcodes_args_t.fm, riscv_opcodes_args_t.pred, riscv_opcodes_args_t.succ, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11100000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fence
   riscv_instr_param_s(
     riscv_instr_name_t.FENCE_I, // instr_name
     0x707f, // mask
     0x100f, // match
     [riscv_opcodes_args_t.imm12, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_zifencei], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fence_i
   riscv_instr_param_s(
     riscv_instr_name_t.ECALL, // instr_name
     0xffffffff, // mask
     0x73, // match
     [], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ecall
   riscv_instr_param_s(
     riscv_instr_name_t.EBREAK, // instr_name
     0xffffffff, // mask
     0x100073, // match
     [], // variables
     [riscv_extention_t.rv_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ebreak
   riscv_instr_param_s(
     riscv_instr_name_t.CSRRW, // instr_name
     0x707f, // mask
     0x1073, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.csr], // variables
     [riscv_extention_t.rv_zicsr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // csrrw
   riscv_instr_param_s(
     riscv_instr_name_t.CSRRS, // instr_name
     0x707f, // mask
     0x2073, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.csr], // variables
     [riscv_extention_t.rv_zicsr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // csrrs
   riscv_instr_param_s(
     riscv_instr_name_t.CSRRC, // instr_name
     0x707f, // mask
     0x3073, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.csr], // variables
     [riscv_extention_t.rv_zicsr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // csrrc
   riscv_instr_param_s(
     riscv_instr_name_t.CSRRWI, // instr_name
     0x707f, // mask
     0x5073, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.csr, riscv_opcodes_args_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extensions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000001, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // csrrwi
   riscv_instr_param_s(
     riscv_instr_name_t.CSRRSI, // instr_name
     0x707f, // mask
     0x6073, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.csr, riscv_opcodes_args_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extensions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000001, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // csrrsi
   riscv_instr_param_s(
     riscv_instr_name_t.CSRRCI, // instr_name
     0x707f, // mask
     0x7073, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.csr, riscv_opcodes_args_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extensions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000001, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // csrrci
   riscv_instr_param_s(
     riscv_instr_name_t.SH1ADD, // instr_name
     0xfe00707f, // mask
     0x20002033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh1add
   riscv_instr_param_s(
     riscv_instr_name_t.SH2ADD, // instr_name
     0xfe00707f, // mask
     0x20004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh2add
   riscv_instr_param_s(
     riscv_instr_name_t.SH3ADD, // instr_name
     0xfe00707f, // mask
     0x20006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh3add
   riscv_instr_param_s(
     riscv_instr_name_t.ANDN, // instr_name
     0xfe00707f, // mask
     0x40007033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // andn
   riscv_instr_param_s(
     riscv_instr_name_t.CLZ, // instr_name
     0xfff0707f, // mask
     0x60001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv32_zbpbo], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // clz
   riscv_instr_param_s(
     riscv_instr_name_t.CPOP, // instr_name
     0xfff0707f, // mask
     0x60201013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // cpop
   riscv_instr_param_s(
     riscv_instr_name_t.CTZ, // instr_name
     0xfff0707f, // mask
     0x60101013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ctz
   riscv_instr_param_s(
     riscv_instr_name_t.MAX, // instr_name
     0xfe00707f, // mask
     0xa006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbpbo], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // max
   riscv_instr_param_s(
     riscv_instr_name_t.MAXU, // instr_name
     0xfe00707f, // mask
     0xa007033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // maxu
   riscv_instr_param_s(
     riscv_instr_name_t.MIN, // instr_name
     0xfe00707f, // mask
     0xa004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbpbo], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // min
   riscv_instr_param_s(
     riscv_instr_name_t.MINU, // instr_name
     0xfe00707f, // mask
     0xa005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // minu
   riscv_instr_param_s(
     riscv_instr_name_t.ORC_B, // instr_name
     0xfff0707f, // mask
     0x28705013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // orc_b
   riscv_instr_param_s(
     riscv_instr_name_t.ORN, // instr_name
     0xfe00707f, // mask
     0x40006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // orn
   riscv_instr_param_s(
     riscv_instr_name_t.REV8, // instr_name
     0xfff0707f, // mask
     0x6b805013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zks], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // rev8
   riscv_instr_param_s(
     riscv_instr_name_t.ROL, // instr_name
     0xfe00707f, // mask
     0x60001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // rol
   riscv_instr_param_s(
     riscv_instr_name_t.ROR, // instr_name
     0xfe00707f, // mask
     0x60005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ror
   riscv_instr_param_s(
     riscv_instr_name_t.RORI, // instr_name
     0xfc00707f, // mask
     0x60005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, riscv_extention_t.rv64_zkn, riscv_extention_t.rv64_zk, riscv_extention_t.rv64_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // rori
   riscv_instr_param_s(
     riscv_instr_name_t.SEXT_B, // instr_name
     0xfff0707f, // mask
     0x60401013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sext_b
   riscv_instr_param_s(
     riscv_instr_name_t.SEXT_H, // instr_name
     0xfff0707f, // mask
     0x60501013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sext_h
   riscv_instr_param_s(
     riscv_instr_name_t.XNOR, // instr_name
     0xfe00707f, // mask
     0x40004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xnor
   riscv_instr_param_s(
     riscv_instr_name_t.ZEXT_H, // instr_name
     0xfff0707f, // mask
     0x800403b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // zext_h
   riscv_instr_param_s(
     riscv_instr_name_t.CLMUL, // instr_name
     0xfe00707f, // mask
     0xa001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbc, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkc], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // clmul
   riscv_instr_param_s(
     riscv_instr_name_t.CLMULH, // instr_name
     0xfe00707f, // mask
     0xa003033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbc, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkc], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // clmulh
   riscv_instr_param_s(
     riscv_instr_name_t.CLMULR, // instr_name
     0xfe00707f, // mask
     0xa002033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbc], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // clmulr
   riscv_instr_param_s(
     riscv_instr_name_t.BCLR, // instr_name
     0xfe00707f, // mask
     0x48001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bclr
   riscv_instr_param_s(
     riscv_instr_name_t.BCLRI, // instr_name
     0xfc00707f, // mask
     0x48001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bclri
   riscv_instr_param_s(
     riscv_instr_name_t.BEXT, // instr_name
     0xfe00707f, // mask
     0x48005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bext
   riscv_instr_param_s(
     riscv_instr_name_t.BEXTI, // instr_name
     0xfc00707f, // mask
     0x48005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bexti
   riscv_instr_param_s(
     riscv_instr_name_t.BINV, // instr_name
     0xfe00707f, // mask
     0x68001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // binv
   riscv_instr_param_s(
     riscv_instr_name_t.BINVI, // instr_name
     0xfc00707f, // mask
     0x68001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // binvi
   riscv_instr_param_s(
     riscv_instr_name_t.BSET, // instr_name
     0xfe00707f, // mask
     0x28001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bset
   riscv_instr_param_s(
     riscv_instr_name_t.BSETI, // instr_name
     0xfc00707f, // mask
     0x28001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bseti
   riscv_instr_param_s(
     riscv_instr_name_t.GORC, // instr_name
     0xfe00707f, // mask
     0x28005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // gorc
   riscv_instr_param_s(
     riscv_instr_name_t.GORCI, // instr_name
     0xfc00707f, // mask
     0x28005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // gorci
   riscv_instr_param_s(
     riscv_instr_name_t.CMIX, // instr_name
     0x600707f, // mask
     0x6001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3], // variables
     [riscv_extention_t.rv_zbt, riscv_extention_t.rv_zbpbo], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // cmix
   riscv_instr_param_s(
     riscv_instr_name_t.CMOV, // instr_name
     0x600707f, // mask
     0x6005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3], // variables
     [riscv_extention_t.rv_zbt], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // cmov
   riscv_instr_param_s(
     riscv_instr_name_t.PACK, // instr_name
     0xfe00707f, // mask
     0x8004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbe, riscv_extention_t.rv_zbpbo, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zbf, riscv_extention_t.rv64_zbm, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // pack
   riscv_instr_param_s(
     riscv_instr_name_t.PACKU, // instr_name
     0xfe00707f, // mask
     0x48004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp, riscv_extention_t.rv_zbpbo, riscv_extention_t.rv64_zbm], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // packu
   riscv_instr_param_s(
     riscv_instr_name_t.PACKH, // instr_name
     0xfe00707f, // mask
     0x8007033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbe, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zbf, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // packh
   riscv_instr_param_s(
     riscv_instr_name_t.XPERM4, // instr_name
     0xfe00707f, // mask
     0x28002033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkx], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xperm4
   riscv_instr_param_s(
     riscv_instr_name_t.XPERM8, // instr_name
     0xfe00707f, // mask
     0x28004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp, riscv_extention_t.rv_zks, riscv_extention_t.rv_zkn, riscv_extention_t.rv_zk, riscv_extention_t.rv_zbkx], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xperm8
   riscv_instr_param_s(
     riscv_instr_name_t.XPERM16, // instr_name
     0xfe00707f, // mask
     0x28006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xperm16
   riscv_instr_param_s(
     riscv_instr_name_t.SLO, // instr_name
     0xfe00707f, // mask
     0x20001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slo
   riscv_instr_param_s(
     riscv_instr_name_t.SRO, // instr_name
     0xfe00707f, // mask
     0x20005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sro
   riscv_instr_param_s(
     riscv_instr_name_t.SLOI, // instr_name
     0xfc00707f, // mask
     0x20001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sloi
   riscv_instr_param_s(
     riscv_instr_name_t.SROI, // instr_name
     0xfc00707f, // mask
     0x20005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sroi
   riscv_instr_param_s(
     riscv_instr_name_t.GREV, // instr_name
     0xfe00707f, // mask
     0x68005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // grev
   riscv_instr_param_s(
     riscv_instr_name_t.GREVI, // instr_name
     0xfc00707f, // mask
     0x68005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // grevi
   riscv_instr_param_s(
     riscv_instr_name_t.FSL, // instr_name
     0x600707f, // mask
     0x4001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3], // variables
     [riscv_extention_t.rv_zbt], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsl
   riscv_instr_param_s(
     riscv_instr_name_t.FSR, // instr_name
     0x600707f, // mask
     0x4005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3], // variables
     [riscv_extention_t.rv_zbt, riscv_extention_t.rv32_zbpbo], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsr
   riscv_instr_param_s(
     riscv_instr_name_t.FSRI, // instr_name
     0x400707f, // mask
     0x4005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zbt], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000010101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsri
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32_B, // instr_name
     0xfff0707f, // mask
     0x61001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32_b
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32_H, // instr_name
     0xfff0707f, // mask
     0x61101013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32_h
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32_W, // instr_name
     0xfff0707f, // mask
     0x61201013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32_w
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_B, // instr_name
     0xfff0707f, // mask
     0x61801013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32c_b
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_H, // instr_name
     0xfff0707f, // mask
     0x61901013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32c_h
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_W, // instr_name
     0xfff0707f, // mask
     0x61a01013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32c_w
   riscv_instr_param_s(
     riscv_instr_name_t.SHFL, // instr_name
     0xfe00707f, // mask
     0x8001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // shfl
   riscv_instr_param_s(
     riscv_instr_name_t.UNSHFL, // instr_name
     0xfe00707f, // mask
     0x8005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // unshfl
   riscv_instr_param_s(
     riscv_instr_name_t.SHFLI, // instr_name
     0xfe00707f, // mask
     0x8001013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // shfli
   riscv_instr_param_s(
     riscv_instr_name_t.UNSHFLI, // instr_name
     0xfe00707f, // mask
     0x8005013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // unshfli
   riscv_instr_param_s(
     riscv_instr_name_t.BCOMPRESS, // instr_name
     0xfe00707f, // mask
     0x8006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbe], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bcompress
   riscv_instr_param_s(
     riscv_instr_name_t.BDECOMPRESS, // instr_name
     0xfe00707f, // mask
     0x48006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbe], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bdecompress
   riscv_instr_param_s(
     riscv_instr_name_t.BFP, // instr_name
     0xfe00707f, // mask
     0x48007033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_zbf], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bfp
   riscv_instr_param_s(
     riscv_instr_name_t.ADD_UW, // instr_name
     0xfe00707f, // mask
     0x800003b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // add_uw
   riscv_instr_param_s(
     riscv_instr_name_t.SH1ADD_UW, // instr_name
     0xfe00707f, // mask
     0x2000203b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh1add_uw
   riscv_instr_param_s(
     riscv_instr_name_t.SH2ADD_UW, // instr_name
     0xfe00707f, // mask
     0x2000403b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh2add_uw
   riscv_instr_param_s(
     riscv_instr_name_t.SH3ADD_UW, // instr_name
     0xfe00707f, // mask
     0x2000603b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sh3add_uw
   riscv_instr_param_s(
     riscv_instr_name_t.SLLI_UW, // instr_name
     0xfc00707f, // mask
     0x800101b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtd], // variables
     [riscv_extention_t.rv64_zba], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slli_uw
   riscv_instr_param_s(
     riscv_instr_name_t.CLZW, // instr_name
     0xfff0707f, // mask
     0x6000101b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // clzw
   riscv_instr_param_s(
     riscv_instr_name_t.CPOPW, // instr_name
     0xfff0707f, // mask
     0x6020101b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // cpopw
   riscv_instr_param_s(
     riscv_instr_name_t.CTZW, // instr_name
     0xfff0707f, // mask
     0x6010101b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ctzw
   riscv_instr_param_s(
     riscv_instr_name_t.ROLW, // instr_name
     0xfe00707f, // mask
     0x6000103b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, riscv_extention_t.rv64_zkn, riscv_extention_t.rv64_zk, riscv_extention_t.rv64_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // rolw
   riscv_instr_param_s(
     riscv_instr_name_t.RORW, // instr_name
     0xfe00707f, // mask
     0x6000503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, riscv_extention_t.rv64_zkn, riscv_extention_t.rv64_zk, riscv_extention_t.rv64_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // rorw
   riscv_instr_param_s(
     riscv_instr_name_t.RORIW, // instr_name
     0xfe00707f, // mask
     0x6000501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, riscv_extention_t.rv64_zkn, riscv_extention_t.rv64_zk, riscv_extention_t.rv64_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // roriw
   riscv_instr_param_s(
     riscv_instr_name_t.BMATOR, // instr_name
     0xfe00707f, // mask
     0x8003033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbm], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bmator
   riscv_instr_param_s(
     riscv_instr_name_t.BMATXOR, // instr_name
     0xfe00707f, // mask
     0x48003033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbm], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bmatxor
   riscv_instr_param_s(
     riscv_instr_name_t.BMATFLIP, // instr_name
     0xfff0707f, // mask
     0x60301013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbm], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bmatflip
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32_D, // instr_name
     0xfff0707f, // mask
     0x61301013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32_d
   riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_D, // instr_name
     0xfff0707f, // mask
     0x61b01013, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_zbr], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // crc32c_d
   riscv_instr_param_s(
     riscv_instr_name_t.SHFLW, // instr_name
     0xfe00707f, // mask
     0x800103b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // shflw
   riscv_instr_param_s(
     riscv_instr_name_t.UNSHFLW, // instr_name
     0xfe00707f, // mask
     0x800503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // unshflw
   riscv_instr_param_s(
     riscv_instr_name_t.BCOMPRESSW, // instr_name
     0xfe00707f, // mask
     0x800603b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbe], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bcompressw
   riscv_instr_param_s(
     riscv_instr_name_t.BDECOMPRESSW, // instr_name
     0xfe00707f, // mask
     0x4800603b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbe], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bdecompressw
   riscv_instr_param_s(
     riscv_instr_name_t.BFPW, // instr_name
     0xfe00707f, // mask
     0x4800703b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbf], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // bfpw
   riscv_instr_param_s(
     riscv_instr_name_t.SLOW, // instr_name
     0xfe00707f, // mask
     0x2000103b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slow
   riscv_instr_param_s(
     riscv_instr_name_t.SROW, // instr_name
     0xfe00707f, // mask
     0x2000503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // srow
   riscv_instr_param_s(
     riscv_instr_name_t.SLOIW, // instr_name
     0xfe00707f, // mask
     0x2000101b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sloiw
   riscv_instr_param_s(
     riscv_instr_name_t.SROIW, // instr_name
     0xfe00707f, // mask
     0x2000501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_b], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sroiw
   riscv_instr_param_s(
     riscv_instr_name_t.GREVW, // instr_name
     0xfe00707f, // mask
     0x6800503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // grevw
   riscv_instr_param_s(
     riscv_instr_name_t.GREVIW, // instr_name
     0xfe00707f, // mask
     0x6800501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // greviw
   riscv_instr_param_s(
     riscv_instr_name_t.FSLW, // instr_name
     0x600707f, // mask
     0x400103b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3], // variables
     [riscv_extention_t.rv64_zbt], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fslw
   riscv_instr_param_s(
     riscv_instr_name_t.FSRW, // instr_name
     0x600707f, // mask
     0x400503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3], // variables
     [riscv_extention_t.rv64_zbt, riscv_extention_t.rv64_zbpbo], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsrw
   riscv_instr_param_s(
     riscv_instr_name_t.FSRIW, // instr_name
     0x600707f, // mask
     0x400501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_zbt], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000010101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsriw
   riscv_instr_param_s(
     riscv_instr_name_t.GORCW, // instr_name
     0xfe00707f, // mask
     0x2800503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // gorcw
   riscv_instr_param_s(
     riscv_instr_name_t.GORCIW, // instr_name
     0xfe00707f, // mask
     0x2800501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // gorciw
   riscv_instr_param_s(
     riscv_instr_name_t.PACKW, // instr_name
     0xfe00707f, // mask
     0x800403b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbe, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zbf, riscv_extention_t.rv64_zks, riscv_extention_t.rv64_zkn, riscv_extention_t.rv64_zk, riscv_extention_t.rv64_zbkb], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // packw
   riscv_instr_param_s(
     riscv_instr_name_t.PACKUW, // instr_name
     0xfe00707f, // mask
     0x4800403b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // packuw
   riscv_instr_param_s(
     riscv_instr_name_t.XPERM32, // instr_name
     0xfe00707f, // mask
     0x28000033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // xperm32
   riscv_instr_param_s(
     riscv_instr_name_t.MUL, // instr_name
     0xfe00707f, // mask
     0x2000033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // mul
   riscv_instr_param_s(
     riscv_instr_name_t.MULH, // instr_name
     0xfe00707f, // mask
     0x2001033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m, riscv_extention_t.rv32_zpn], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // mulh
   riscv_instr_param_s(
     riscv_instr_name_t.MULHSU, // instr_name
     0xfe00707f, // mask
     0x2002033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // mulhsu
   riscv_instr_param_s(
     riscv_instr_name_t.MULHU, // instr_name
     0xfe00707f, // mask
     0x2003033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // mulhu
   riscv_instr_param_s(
     riscv_instr_name_t.DIV, // instr_name
     0xfe00707f, // mask
     0x2004033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // div
   riscv_instr_param_s(
     riscv_instr_name_t.DIVU, // instr_name
     0xfe00707f, // mask
     0x2005033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // divu
   riscv_instr_param_s(
     riscv_instr_name_t.REM, // instr_name
     0xfe00707f, // mask
     0x2006033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // rem
   riscv_instr_param_s(
     riscv_instr_name_t.REMU, // instr_name
     0xfe00707f, // mask
     0x2007033, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // remu
   riscv_instr_param_s(
     riscv_instr_name_t.MULW, // instr_name
     0xfe00707f, // mask
     0x200003b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // mulw
   riscv_instr_param_s(
     riscv_instr_name_t.DIVW, // instr_name
     0xfe00707f, // mask
     0x200403b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // divw
   riscv_instr_param_s(
     riscv_instr_name_t.DIVUW, // instr_name
     0xfe00707f, // mask
     0x200503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // divuw
   riscv_instr_param_s(
     riscv_instr_name_t.REMW, // instr_name
     0xfe00707f, // mask
     0x200603b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // remw
   riscv_instr_param_s(
     riscv_instr_name_t.REMUW, // instr_name
     0xfe00707f, // mask
     0x200703b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // remuw
   riscv_instr_param_s(
     riscv_instr_name_t.FLW, // instr_name
     0x707f, // mask
     0x2007, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_f], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // flw
   riscv_instr_param_s(
     riscv_instr_name_t.FSW, // instr_name
     0x707f, // mask
     0x2027, // match
     [riscv_opcodes_args_t.imm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.imm12lo], // variables
     [riscv_extention_t.rv_f], // extensions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsw
   riscv_instr_param_s(
     riscv_instr_name_t.FMADD_S, // instr_name
     0x600007f, // mask
     0x43, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmadd_s
   riscv_instr_param_s(
     riscv_instr_name_t.FMSUB_S, // instr_name
     0x600007f, // mask
     0x47, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmsub_s
   riscv_instr_param_s(
     riscv_instr_name_t.FNMSUB_S, // instr_name
     0x600007f, // mask
     0x4b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fnmsub_s
   riscv_instr_param_s(
     riscv_instr_name_t.FNMADD_S, // instr_name
     0x600007f, // mask
     0x4f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fnmadd_s
   riscv_instr_param_s(
     riscv_instr_name_t.FADD_S, // instr_name
     0xfe00007f, // mask
     0x53, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fadd_s
   riscv_instr_param_s(
     riscv_instr_name_t.FSUB_S, // instr_name
     0xfe00007f, // mask
     0x8000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsub_s
   riscv_instr_param_s(
     riscv_instr_name_t.FMUL_S, // instr_name
     0xfe00007f, // mask
     0x10000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmul_s
   riscv_instr_param_s(
     riscv_instr_name_t.FDIV_S, // instr_name
     0xfe00007f, // mask
     0x18000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fdiv_s
   riscv_instr_param_s(
     riscv_instr_name_t.FSQRT_S, // instr_name
     0xfff0007f, // mask
     0x58000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsqrt_s
   riscv_instr_param_s(
     riscv_instr_name_t.FSGNJ_S, // instr_name
     0xfe00707f, // mask
     0x20000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsgnj_s
   riscv_instr_param_s(
     riscv_instr_name_t.FSGNJN_S, // instr_name
     0xfe00707f, // mask
     0x20001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsgnjn_s
   riscv_instr_param_s(
     riscv_instr_name_t.FSGNJX_S, // instr_name
     0xfe00707f, // mask
     0x20002053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsgnjx_s
   riscv_instr_param_s(
     riscv_instr_name_t.FMIN_S, // instr_name
     0xfe00707f, // mask
     0x28000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmin_s
   riscv_instr_param_s(
     riscv_instr_name_t.FMAX_S, // instr_name
     0xfe00707f, // mask
     0x28001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmax_s
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_W_S, // instr_name
     0xfff0007f, // mask
     0xc0000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_w_s
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_WU_S, // instr_name
     0xfff0007f, // mask
     0xc0100053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_wu_s
   riscv_instr_param_s(
     riscv_instr_name_t.FMV_X_W, // instr_name
     0xfff0707f, // mask
     0xe0000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmv_x_w
   riscv_instr_param_s(
     riscv_instr_name_t.FEQ_S, // instr_name
     0xfe00707f, // mask
     0xa0002053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // feq_s
   riscv_instr_param_s(
     riscv_instr_name_t.FLT_S, // instr_name
     0xfe00707f, // mask
     0xa0001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // flt_s
   riscv_instr_param_s(
     riscv_instr_name_t.FLE_S, // instr_name
     0xfe00707f, // mask
     0xa0000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fle_s
   riscv_instr_param_s(
     riscv_instr_name_t.FCLASS_S, // instr_name
     0xfff0707f, // mask
     0xe0001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fclass_s
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_W, // instr_name
     0xfff0007f, // mask
     0xd0000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_s_w
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_WU, // instr_name
     0xfff0007f, // mask
     0xd0100053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_s_wu
   riscv_instr_param_s(
     riscv_instr_name_t.FMV_W_X, // instr_name
     0xfff0707f, // mask
     0xf0000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmv_w_x
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_L_S, // instr_name
     0xfff0007f, // mask
     0xc0200053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_l_s
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_LU_S, // instr_name
     0xfff0007f, // mask
     0xc0300053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_lu_s
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_L, // instr_name
     0xfff0007f, // mask
     0xd0200053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_s_l
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_LU, // instr_name
     0xfff0007f, // mask
     0xd0300053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_f], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_s_lu
   riscv_instr_param_s(
     riscv_instr_name_t.FLD, // instr_name
     0x707f, // mask
     0x3007, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv_d], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fld
   riscv_instr_param_s(
     riscv_instr_name_t.FSD, // instr_name
     0x707f, // mask
     0x3027, // match
     [riscv_opcodes_args_t.imm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.imm12lo], // variables
     [riscv_extention_t.rv_d], // extensions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsd
   riscv_instr_param_s(
     riscv_instr_name_t.FMADD_D, // instr_name
     0x600007f, // mask
     0x2000043, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmadd_d
   riscv_instr_param_s(
     riscv_instr_name_t.FMSUB_D, // instr_name
     0x600007f, // mask
     0x2000047, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmsub_d
   riscv_instr_param_s(
     riscv_instr_name_t.FNMSUB_D, // instr_name
     0x600007f, // mask
     0x200004b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fnmsub_d
   riscv_instr_param_s(
     riscv_instr_name_t.FNMADD_D, // instr_name
     0x600007f, // mask
     0x200004f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs3, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fnmadd_d
   riscv_instr_param_s(
     riscv_instr_name_t.FADD_D, // instr_name
     0xfe00007f, // mask
     0x2000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fadd_d
   riscv_instr_param_s(
     riscv_instr_name_t.FSUB_D, // instr_name
     0xfe00007f, // mask
     0xa000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsub_d
   riscv_instr_param_s(
     riscv_instr_name_t.FMUL_D, // instr_name
     0xfe00007f, // mask
     0x12000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmul_d
   riscv_instr_param_s(
     riscv_instr_name_t.FDIV_D, // instr_name
     0xfe00007f, // mask
     0x1a000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fdiv_d
   riscv_instr_param_s(
     riscv_instr_name_t.FSQRT_D, // instr_name
     0xfff0007f, // mask
     0x5a000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsqrt_d
   riscv_instr_param_s(
     riscv_instr_name_t.FSGNJ_D, // instr_name
     0xfe00707f, // mask
     0x22000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsgnj_d
   riscv_instr_param_s(
     riscv_instr_name_t.FSGNJN_D, // instr_name
     0xfe00707f, // mask
     0x22001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsgnjn_d
   riscv_instr_param_s(
     riscv_instr_name_t.FSGNJX_D, // instr_name
     0xfe00707f, // mask
     0x22002053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fsgnjx_d
   riscv_instr_param_s(
     riscv_instr_name_t.FMIN_D, // instr_name
     0xfe00707f, // mask
     0x2a000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmin_d
   riscv_instr_param_s(
     riscv_instr_name_t.FMAX_D, // instr_name
     0xfe00707f, // mask
     0x2a001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmax_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_D, // instr_name
     0xfff0007f, // mask
     0x40100053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_s_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_S, // instr_name
     0xfff0007f, // mask
     0x42000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_d_s
   riscv_instr_param_s(
     riscv_instr_name_t.FEQ_D, // instr_name
     0xfe00707f, // mask
     0xa2002053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // feq_d
   riscv_instr_param_s(
     riscv_instr_name_t.FLT_D, // instr_name
     0xfe00707f, // mask
     0xa2001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // flt_d
   riscv_instr_param_s(
     riscv_instr_name_t.FLE_D, // instr_name
     0xfe00707f, // mask
     0xa2000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fle_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCLASS_D, // instr_name
     0xfff0707f, // mask
     0xe2001053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fclass_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_W_D, // instr_name
     0xfff0007f, // mask
     0xc2000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_w_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_WU_D, // instr_name
     0xfff0007f, // mask
     0xc2100053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_wu_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_W, // instr_name
     0xfff0007f, // mask
     0xd2000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_d_w
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_WU, // instr_name
     0xfff0007f, // mask
     0xd2100053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_d_wu
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_L_D, // instr_name
     0xfff0007f, // mask
     0xc2200053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_l_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_LU_D, // instr_name
     0xfff0007f, // mask
     0xc2300053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_lu_d
   riscv_instr_param_s(
     riscv_instr_name_t.FMV_X_D, // instr_name
     0xfff0707f, // mask
     0xe2000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmv_x_d
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_L, // instr_name
     0xfff0007f, // mask
     0xd2200053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_d_l
   riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_LU, // instr_name
     0xfff0007f, // mask
     0xd2300053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rm], // variables
     [riscv_extention_t.rv64_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fcvt_d_lu
   riscv_instr_param_s(
     riscv_instr_name_t.FMV_D_X, // instr_name
     0xfff0707f, // mask
     0xf2000053, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1], // variables
     [riscv_extention_t.rv64_d], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // fmv_d_x
   riscv_instr_param_s(
     riscv_instr_name_t.LWU, // instr_name
     0x707f, // mask
     0x6003, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lwu
   riscv_instr_param_s(
     riscv_instr_name_t.LD, // instr_name
     0x707f, // mask
     0x3003, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ld
   riscv_instr_param_s(
     riscv_instr_name_t.SD, // instr_name
     0x707f, // mask
     0x3023, // match
     [riscv_opcodes_args_t.imm12hi, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.imm12lo], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sd
   riscv_instr_param_s(
     riscv_instr_name_t.ADDIW, // instr_name
     0x707f, // mask
     0x1b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.imm12], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // addiw
   riscv_instr_param_s(
     riscv_instr_name_t.SLLIW, // instr_name
     0xfe00707f, // mask
     0x101b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // slliw
   riscv_instr_param_s(
     riscv_instr_name_t.SRLIW, // instr_name
     0xfe00707f, // mask
     0x501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // srliw
   riscv_instr_param_s(
     riscv_instr_name_t.SRAIW, // instr_name
     0xfe00707f, // mask
     0x4000501b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.shamtw], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sraiw
   riscv_instr_param_s(
     riscv_instr_name_t.ADDW, // instr_name
     0xfe00707f, // mask
     0x3b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // addw
   riscv_instr_param_s(
     riscv_instr_name_t.SUBW, // instr_name
     0xfe00707f, // mask
     0x4000003b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // subw
   riscv_instr_param_s(
     riscv_instr_name_t.SLLW, // instr_name
     0xfe00707f, // mask
     0x103b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sllw
   riscv_instr_param_s(
     riscv_instr_name_t.SRLW, // instr_name
     0xfe00707f, // mask
     0x503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // srlw
   riscv_instr_param_s(
     riscv_instr_name_t.SRAW, // instr_name
     0xfe00707f, // mask
     0x4000503b, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sraw
   riscv_instr_param_s(
     riscv_instr_name_t.C_LW, // instr_name
     0xe003, // mask
     0x4000, // match
     [riscv_opcodes_args_t.rd_p, riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_uimm7lo, riscv_opcodes_args_t.c_uimm7hi], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // c_lw
   riscv_instr_param_s(
     riscv_instr_name_t.C_SW, // instr_name
     0xe003, // mask
     0xc000, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.rs2_p, riscv_opcodes_args_t.c_uimm7lo, riscv_opcodes_args_t.c_uimm7hi], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // c_sw
   riscv_instr_param_s(
     riscv_instr_name_t.C_LWSP, // instr_name
     0xe003, // mask
     0x4002, // match
     [riscv_opcodes_args_t.rd_n0, riscv_opcodes_args_t.c_uimm8sphi, riscv_opcodes_args_t.c_uimm8splo], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b11000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000000, // _c_vars
     0b0, // _v_vars
   ), // c_lwsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_SWSP, // instr_name
     0xe003, // mask
     0xc002, // match
     [riscv_opcodes_args_t.c_rs2, riscv_opcodes_args_t.c_uimm8sp_s], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b100000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // c_swsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_ADDI4SPN, // instr_name
     0xe003, // mask
     0x0, // match
     [riscv_opcodes_args_t.rd_p, riscv_opcodes_args_t.c_nzuimm10], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b1, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000, // _c_vars
     0b0, // _v_vars
   ), // c_addi4spn
   riscv_instr_param_s(
     riscv_instr_name_t.C_ADDI, // instr_name
     0xe003, // mask
     0x1, // match
     [riscv_opcodes_args_t.rd_rs1_n0, riscv_opcodes_args_t.c_nzimm6lo, riscv_opcodes_args_t.c_nzimm6hi], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // c_addi
   riscv_instr_param_s(
     riscv_instr_name_t.C_LI, // instr_name
     0xe003, // mask
     0x4001, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.c_imm6lo, riscv_opcodes_args_t.c_imm6hi], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b11000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_li
   riscv_instr_param_s(
     riscv_instr_name_t.C_ADDI16SP, // instr_name
     0xef83, // mask
     0x6101, // match
     [riscv_opcodes_args_t.c_nzimm10hi, riscv_opcodes_args_t.c_nzimm10lo], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b1100000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_addi16sp
   riscv_instr_param_s(
     riscv_instr_name_t.C_LUI, // instr_name
     0xe003, // mask
     0x6001, // match
     [riscv_opcodes_args_t.rd_n2, riscv_opcodes_args_t.c_nzimm18hi, riscv_opcodes_args_t.c_nzimm18lo], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000000, // _c_vars
     0b0, // _v_vars
   ), // c_lui
   riscv_instr_param_s(
     riscv_instr_name_t.C_SRLI, // instr_name
     0xec03, // mask
     0x8001, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.c_nzuimm6lo, riscv_opcodes_args_t.c_nzuimm6hi], // variables
     [riscv_extention_t.rv64_c], // extensions
     0b0, // _imms
     0b110000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // c_srli
   riscv_instr_param_s(
     riscv_instr_name_t.C_SRAI, // instr_name
     0xec03, // mask
     0x8401, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.c_nzuimm6lo, riscv_opcodes_args_t.c_nzuimm6hi], // variables
     [riscv_extention_t.rv64_c], // extensions
     0b0, // _imms
     0b110000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // c_srai
   riscv_instr_param_s(
     riscv_instr_name_t.C_ANDI, // instr_name
     0xec03, // mask
     0x8801, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.c_imm6hi, riscv_opcodes_args_t.c_imm6lo], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b11000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // c_andi
   riscv_instr_param_s(
     riscv_instr_name_t.C_SUB, // instr_name
     0xfc63, // mask
     0x8c01, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // c_sub
   riscv_instr_param_s(
     riscv_instr_name_t.C_XOR, // instr_name
     0xfc63, // mask
     0x8c21, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // c_xor
   riscv_instr_param_s(
     riscv_instr_name_t.C_OR, // instr_name
     0xfc63, // mask
     0x8c41, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // c_or
   riscv_instr_param_s(
     riscv_instr_name_t.C_AND, // instr_name
     0xfc63, // mask
     0x8c61, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // c_and
   riscv_instr_param_s(
     riscv_instr_name_t.C_BEQZ, // instr_name
     0xe003, // mask
     0xc001, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_bimm9lo, riscv_opcodes_args_t.c_bimm9hi], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100, // _c_vars
     0b0, // _v_vars
   ), // c_beqz
   riscv_instr_param_s(
     riscv_instr_name_t.C_BNEZ, // instr_name
     0xe003, // mask
     0xe001, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_bimm9lo, riscv_opcodes_args_t.c_bimm9hi], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100, // _c_vars
     0b0, // _v_vars
   ), // c_bnez
   riscv_instr_param_s(
     riscv_instr_name_t.C_SLLI, // instr_name
     0xe003, // mask
     0x2, // match
     [riscv_opcodes_args_t.rd_rs1_n0, riscv_opcodes_args_t.c_nzuimm6hi, riscv_opcodes_args_t.c_nzuimm6lo], // variables
     [riscv_extention_t.rv64_c], // extensions
     0b0, // _imms
     0b110000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // c_slli
   riscv_instr_param_s(
     riscv_instr_name_t.C_MV, // instr_name
     0xf003, // mask
     0x8002, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.c_rs2_n0], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b100000000000, // _c_vars
     0b0, // _v_vars
   ), // c_mv
   riscv_instr_param_s(
     riscv_instr_name_t.C_EBREAK, // instr_name
     0xffff, // mask
     0x9002, // match
     [], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_ebreak
   riscv_instr_param_s(
     riscv_instr_name_t.C_ADD, // instr_name
     0xf003, // mask
     0x9002, // match
     [riscv_opcodes_args_t.rd_rs1, riscv_opcodes_args_t.c_rs2_n0], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100010000000, // _c_vars
     0b0, // _v_vars
   ), // c_add
   riscv_instr_param_s(
     riscv_instr_name_t.C_NOP, // instr_name
     0xef83, // mask
     0x1, // match
     [riscv_opcodes_args_t.c_nzimm6hi, riscv_opcodes_args_t.c_nzimm6lo], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b110000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_nop
   riscv_instr_param_s(
     riscv_instr_name_t.C_J, // instr_name
     0xe003, // mask
     0xa001, // match
     [riscv_opcodes_args_t.c_imm12], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b1000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_j
   riscv_instr_param_s(
     riscv_instr_name_t.C_JAL, // instr_name
     0xe003, // mask
     0x2001, // match
     [riscv_opcodes_args_t.c_imm12], // variables
     [riscv_extention_t.rv32_c], // extensions
     0b0, // _imms
     0b1000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_jal
   riscv_instr_param_s(
     riscv_instr_name_t.C_JR, // instr_name
     0xf07f, // mask
     0x8002, // match
     [riscv_opcodes_args_t.rs1_n0], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000, // _c_vars
     0b0, // _v_vars
   ), // c_jr
   riscv_instr_param_s(
     riscv_instr_name_t.C_JALR, // instr_name
     0xf07f, // mask
     0x9002, // match
     [riscv_opcodes_args_t.c_rs1_n0], // variables
     [riscv_extention_t.rv_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000000000, // _c_vars
     0b0, // _v_vars
   ), // c_jalr
   riscv_instr_param_s(
     riscv_instr_name_t.C_ADDIW, // instr_name
     0xe003, // mask
     0x2001, // match
     [riscv_opcodes_args_t.rd_rs1_n0, riscv_opcodes_args_t.c_imm6lo, riscv_opcodes_args_t.c_imm6hi], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b11000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // c_addiw
   riscv_instr_param_s(
     riscv_instr_name_t.C_SUBW, // instr_name
     0xfc63, // mask
     0x9c01, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.rs2_p], // variables
     [riscv_extention_t.rv64_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // c_subw
   riscv_instr_param_s(
     riscv_instr_name_t.C_ADDW, // instr_name
     0xfc63, // mask
     0x9c21, // match
     [riscv_opcodes_args_t.rd_rs1_p, riscv_opcodes_args_t.rs2_p], // variables
     [riscv_extention_t.rv64_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // c_addw
   riscv_instr_param_s(
     riscv_instr_name_t.C_LD, // instr_name
     0xe003, // mask
     0x6000, // match
     [riscv_opcodes_args_t.rd_p, riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_uimm8lo, riscv_opcodes_args_t.c_uimm8hi], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // c_ld
   riscv_instr_param_s(
     riscv_instr_name_t.C_SD, // instr_name
     0xe003, // mask
     0xe000, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.rs2_p, riscv_opcodes_args_t.c_uimm8hi, riscv_opcodes_args_t.c_uimm8lo], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // c_sd
   riscv_instr_param_s(
     riscv_instr_name_t.C_LDSP, // instr_name
     0xe003, // mask
     0x6002, // match
     [riscv_opcodes_args_t.rd_n0, riscv_opcodes_args_t.c_uimm9sphi, riscv_opcodes_args_t.c_uimm9splo], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b1100000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000000, // _c_vars
     0b0, // _v_vars
   ), // c_ldsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_SDSP, // instr_name
     0xe003, // mask
     0xe002, // match
     [riscv_opcodes_args_t.c_rs2, riscv_opcodes_args_t.c_uimm9sp_s], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b100000000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // c_sdsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_SRLI64, // instr_name
     0xfc7f, // mask
     0x8001, // match
     [riscv_opcodes_args_t.rd_rs1_p], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // c_srli64
   riscv_instr_param_s(
     riscv_instr_name_t.C_SRAI64, // instr_name
     0xfc7f, // mask
     0x8401, // match
     [riscv_opcodes_args_t.rd_rs1_p], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // c_srai64
   riscv_instr_param_s(
     riscv_instr_name_t.C_SLLI64, // instr_name
     0xf07f, // mask
     0x8002, // match
     [riscv_opcodes_args_t.rd_rs1_n0], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // c_slli64
   riscv_instr_param_s(
     riscv_instr_name_t.C_LQ, // instr_name
     0xe003, // mask
     0x2000, // match
     [riscv_opcodes_args_t.rd_p, riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_uimm9lo, riscv_opcodes_args_t.c_uimm9hi], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b1100000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // c_lq
   riscv_instr_param_s(
     riscv_instr_name_t.C_SQ, // instr_name
     0xe003, // mask
     0xa000, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.rs2_p, riscv_opcodes_args_t.c_uimm9hi, riscv_opcodes_args_t.c_uimm9lo], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b1100000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // c_sq
   riscv_instr_param_s(
     riscv_instr_name_t.C_LQSP, // instr_name
     0xe003, // mask
     0x2002, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.c_uimm10sphi, riscv_opcodes_args_t.c_uimm10splo], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b11000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_lqsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_SQSP, // instr_name
     0xe003, // mask
     0xa002, // match
     [riscv_opcodes_args_t.c_rs2, riscv_opcodes_args_t.c_uimm10sp_s], // variables
     [riscv_extention_t.rv128_c], // extensions
     0b0, // _imms
     0b10000000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // c_sqsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_FLW, // instr_name
     0xe003, // mask
     0x6000, // match
     [riscv_opcodes_args_t.rd_p, riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_uimm7lo, riscv_opcodes_args_t.c_uimm7hi], // variables
     [riscv_extention_t.rv32_c_f], // extensions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // c_flw
   riscv_instr_param_s(
     riscv_instr_name_t.C_FSW, // instr_name
     0xe003, // mask
     0xe000, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.rs2_p, riscv_opcodes_args_t.c_uimm7lo, riscv_opcodes_args_t.c_uimm7hi], // variables
     [riscv_extention_t.rv32_c_f], // extensions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // c_fsw
   riscv_instr_param_s(
     riscv_instr_name_t.C_FLWSP, // instr_name
     0xe003, // mask
     0x6002, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.c_uimm8sphi, riscv_opcodes_args_t.c_uimm8splo], // variables
     [riscv_extention_t.rv32_c_f], // extensions
     0b0, // _imms
     0b11000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_flwsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_FSWSP, // instr_name
     0xe003, // mask
     0xe002, // match
     [riscv_opcodes_args_t.c_rs2, riscv_opcodes_args_t.c_uimm8sp_s], // variables
     [riscv_extention_t.rv32_c_f], // extensions
     0b0, // _imms
     0b100000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // c_fswsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_FLD, // instr_name
     0xe003, // mask
     0x2000, // match
     [riscv_opcodes_args_t.rd_p, riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.c_uimm8lo, riscv_opcodes_args_t.c_uimm8hi], // variables
     [riscv_extention_t.rv_c_d], // extensions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // c_fld
   riscv_instr_param_s(
     riscv_instr_name_t.C_FSD, // instr_name
     0xe003, // mask
     0xa000, // match
     [riscv_opcodes_args_t.rs1_p, riscv_opcodes_args_t.rs2_p, riscv_opcodes_args_t.c_uimm8lo, riscv_opcodes_args_t.c_uimm8hi], // variables
     [riscv_extention_t.rv_c_d], // extensions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // c_fsd
   riscv_instr_param_s(
     riscv_instr_name_t.C_FLDSP, // instr_name
     0xe003, // mask
     0x2002, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.c_uimm9sphi, riscv_opcodes_args_t.c_uimm9splo], // variables
     [riscv_extention_t.rv_c_d], // extensions
     0b0, // _imms
     0b1100000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // c_fldsp
   riscv_instr_param_s(
     riscv_instr_name_t.C_FSDSP, // instr_name
     0xe003, // mask
     0xa002, // match
     [riscv_opcodes_args_t.c_rs2, riscv_opcodes_args_t.c_uimm9sp_s], // variables
     [riscv_extention_t.rv_c_d], // extensions
     0b0, // _imms
     0b100000000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // c_fsdsp
   riscv_instr_param_s(
     riscv_instr_name_t.LR_W, // instr_name
     0xf9f0707f, // mask
     0x1000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lr_w
   riscv_instr_param_s(
     riscv_instr_name_t.SC_W, // instr_name
     0xf800707f, // mask
     0x1800202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sc_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOSWAP_W, // instr_name
     0xf800707f, // mask
     0x800202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoswap_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOADD_W, // instr_name
     0xf800707f, // mask
     0x202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoadd_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOAND_W, // instr_name
     0xf800707f, // mask
     0x6000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoand_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOOR_W, // instr_name
     0xf800707f, // mask
     0x4000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoor_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOXOR_W, // instr_name
     0xf800707f, // mask
     0x2000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoxor_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMIN_W, // instr_name
     0xf800707f, // mask
     0x8000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amomin_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMAX_W, // instr_name
     0xf800707f, // mask
     0xa000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amomax_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMINU_W, // instr_name
     0xf800707f, // mask
     0xc000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amominu_w
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMAXU_W, // instr_name
     0xf800707f, // mask
     0xe000202f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amomaxu_w
   riscv_instr_param_s(
     riscv_instr_name_t.LR_D, // instr_name
     0xf9f0707f, // mask
     0x1000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // lr_d
   riscv_instr_param_s(
     riscv_instr_name_t.SC_D, // instr_name
     0xf800707f, // mask
     0x1800302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sc_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOSWAP_D, // instr_name
     0xf800707f, // mask
     0x800302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoswap_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOADD_D, // instr_name
     0xf800707f, // mask
     0x302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoadd_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOAND_D, // instr_name
     0xf800707f, // mask
     0x6000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoand_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOOR_D, // instr_name
     0xf800707f, // mask
     0x4000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoor_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOXOR_D, // instr_name
     0xf800707f, // mask
     0x2000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amoxor_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMIN_D, // instr_name
     0xf800707f, // mask
     0x8000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amomin_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMAX_D, // instr_name
     0xf800707f, // mask
     0xa000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amomax_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMINU_D, // instr_name
     0xf800707f, // mask
     0xc000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amominu_d
   riscv_instr_param_s(
     riscv_instr_name_t.AMOMAXU_D, // instr_name
     0xf800707f, // mask
     0xe000302f, // match
     [riscv_opcodes_args_t.rd, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.aq, riscv_opcodes_args_t.rl], // variables
     [riscv_extention_t.rv64_a], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // amomaxu_d
   riscv_instr_param_s(
     riscv_instr_name_t.VSETVL, // instr_name
     0xfe00707f, // mask
     0x80007057, // match
     [riscv_opcodes_args_t.rs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // vsetvl
   riscv_instr_param_s(
     riscv_instr_name_t.VSETVLI, // instr_name
     0x8000707f, // mask
     0x7057, // match
     [riscv_opcodes_args_t.zimm11, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1000, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // vsetvli
   riscv_instr_param_s(
     riscv_instr_name_t.VADD_VV, // instr_name
     0xfc00707f, // mask
     0x57, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VADD_VX, // instr_name
     0xfc00707f, // mask
     0x4057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vadd_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VADD_VI, // instr_name
     0xfc00707f, // mask
     0x3057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vadd_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSUB_VV, // instr_name
     0xfc00707f, // mask
     0x8000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vsub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSUB_VX, // instr_name
     0xfc00707f, // mask
     0x8004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsub_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VRSUB_VX, // instr_name
     0xfc00707f, // mask
     0xc004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vrsub_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VRSUB_VI, // instr_name
     0xfc00707f, // mask
     0xc003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vrsub_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_VV, // instr_name
     0xfc00707f, // mask
     0xc0002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwaddu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_VX, // instr_name
     0xfc00707f, // mask
     0xc0006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwaddu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_WV, // instr_name
     0xfc00707f, // mask
     0xd0002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwaddu_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_WX, // instr_name
     0xfc00707f, // mask
     0xd0006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwaddu_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_VV, // instr_name
     0xfc00707f, // mask
     0xc8002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwsubu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_VX, // instr_name
     0xfc00707f, // mask
     0xc8006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwsubu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_WV, // instr_name
     0xfc00707f, // mask
     0xd8002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwsubu_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_WX, // instr_name
     0xfc00707f, // mask
     0xd8006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwsubu_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VWADD_VV, // instr_name
     0xfc00707f, // mask
     0xc4002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWADD_VX, // instr_name
     0xfc00707f, // mask
     0xc4006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwadd_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWADD_WV, // instr_name
     0xfc00707f, // mask
     0xd4002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwadd_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VWADD_WX, // instr_name
     0xfc00707f, // mask
     0xd4006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwadd_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_VV, // instr_name
     0xfc00707f, // mask
     0xcc002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwsub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_VX, // instr_name
     0xfc00707f, // mask
     0xcc006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwsub_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_WV, // instr_name
     0xfc00707f, // mask
     0xdc002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwsub_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_WX, // instr_name
     0xfc00707f, // mask
     0xdc006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwsub_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VADC_VVM, // instr_name
     0xfe00707f, // mask
     0x40000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vadc_vvm
   riscv_instr_param_s(
     riscv_instr_name_t.VADC_VXM, // instr_name
     0xfe00707f, // mask
     0x40004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vadc_vxm
   riscv_instr_param_s(
     riscv_instr_name_t.VADC_VIM, // instr_name
     0xfe00707f, // mask
     0x40003057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vadc_vim
   riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VVM, // instr_name
     0xfe00707f, // mask
     0x44000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmadc_vvm
   riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VXM, // instr_name
     0xfe00707f, // mask
     0x44004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmadc_vxm
   riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VIM, // instr_name
     0xfe00707f, // mask
     0x44003057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmadc_vim
   riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VV, // instr_name
     0xfe00707f, // mask
     0x46000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmadc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VX, // instr_name
     0xfe00707f, // mask
     0x46004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmadc_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VI, // instr_name
     0xfe00707f, // mask
     0x46003057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmadc_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSBC_VVM, // instr_name
     0xfe00707f, // mask
     0x48000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vsbc_vvm
   riscv_instr_param_s(
     riscv_instr_name_t.VSBC_VXM, // instr_name
     0xfe00707f, // mask
     0x48004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vsbc_vxm
   riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VVM, // instr_name
     0xfe00707f, // mask
     0x4c000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmsbc_vvm
   riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VXM, // instr_name
     0xfe00707f, // mask
     0x4c004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmsbc_vxm
   riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VV, // instr_name
     0xfe00707f, // mask
     0x4e000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmsbc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VX, // instr_name
     0xfe00707f, // mask
     0x4e004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmsbc_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VAND_VV, // instr_name
     0xfc00707f, // mask
     0x24000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vand_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VAND_VX, // instr_name
     0xfc00707f, // mask
     0x24004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vand_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VAND_VI, // instr_name
     0xfc00707f, // mask
     0x24003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vand_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VOR_VV, // instr_name
     0xfc00707f, // mask
     0x28000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vor_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VOR_VX, // instr_name
     0xfc00707f, // mask
     0x28004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vor_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VOR_VI, // instr_name
     0xfc00707f, // mask
     0x28003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vor_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VXOR_VV, // instr_name
     0xfc00707f, // mask
     0x2c000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vxor_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VXOR_VX, // instr_name
     0xfc00707f, // mask
     0x2c004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vxor_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VXOR_VI, // instr_name
     0xfc00707f, // mask
     0x2c003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vxor_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSLL_VV, // instr_name
     0xfc00707f, // mask
     0x94000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vsll_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSLL_VX, // instr_name
     0xfc00707f, // mask
     0x94004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsll_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSLL_VI, // instr_name
     0xfc00707f, // mask
     0x94003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsll_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSRL_VV, // instr_name
     0xfc00707f, // mask
     0xa0000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vsrl_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSRL_VX, // instr_name
     0xfc00707f, // mask
     0xa0004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsrl_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSRL_VI, // instr_name
     0xfc00707f, // mask
     0xa0003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsrl_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSRA_VV, // instr_name
     0xfc00707f, // mask
     0xa4000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vsra_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSRA_VX, // instr_name
     0xfc00707f, // mask
     0xa4004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsra_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSRA_VI, // instr_name
     0xfc00707f, // mask
     0xa4003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsra_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VNSRL_WV, // instr_name
     0xfc00707f, // mask
     0xb0000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vnsrl_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VNSRL_WX, // instr_name
     0xfc00707f, // mask
     0xb0004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnsrl_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VNSRL_WI, // instr_name
     0xfc00707f, // mask
     0xb0003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnsrl_wi
   riscv_instr_param_s(
     riscv_instr_name_t.VNSRA_WV, // instr_name
     0xfc00707f, // mask
     0xb4000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vnsra_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VNSRA_WX, // instr_name
     0xfc00707f, // mask
     0xb4004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnsra_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VNSRA_WI, // instr_name
     0xfc00707f, // mask
     0xb4003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnsra_wi
   riscv_instr_param_s(
     riscv_instr_name_t.VMSEQ_VV, // instr_name
     0xfc00707f, // mask
     0x60000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmseq_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSEQ_VX, // instr_name
     0xfc00707f, // mask
     0x60004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmseq_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSEQ_VI, // instr_name
     0xfc00707f, // mask
     0x60003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmseq_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VMSNE_VV, // instr_name
     0xfc00707f, // mask
     0x64000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmsne_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSNE_VX, // instr_name
     0xfc00707f, // mask
     0x64004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsne_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSNE_VI, // instr_name
     0xfc00707f, // mask
     0x64003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsne_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLTU_VV, // instr_name
     0xfc00707f, // mask
     0x68000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmsltu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLTU_VX, // instr_name
     0xfc00707f, // mask
     0x68004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsltu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLT_VV, // instr_name
     0xfc00707f, // mask
     0x6c000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmslt_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLT_VX, // instr_name
     0xfc00707f, // mask
     0x6c004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmslt_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLEU_VV, // instr_name
     0xfc00707f, // mask
     0x70000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmsleu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLEU_VX, // instr_name
     0xfc00707f, // mask
     0x70004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsleu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLEU_VI, // instr_name
     0xfc00707f, // mask
     0x70003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsleu_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLE_VV, // instr_name
     0xfc00707f, // mask
     0x74000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmsle_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLE_VX, // instr_name
     0xfc00707f, // mask
     0x74004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsle_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSLE_VI, // instr_name
     0xfc00707f, // mask
     0x74003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsle_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VMSGTU_VX, // instr_name
     0xfc00707f, // mask
     0x78004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsgtu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSGTU_VI, // instr_name
     0xfc00707f, // mask
     0x78003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsgtu_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VMSGT_VX, // instr_name
     0xfc00707f, // mask
     0x7c004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsgt_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMSGT_VI, // instr_name
     0xfc00707f, // mask
     0x7c003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsgt_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VMINU_VV, // instr_name
     0xfc00707f, // mask
     0x10000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vminu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMINU_VX, // instr_name
     0xfc00707f, // mask
     0x10004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vminu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMIN_VV, // instr_name
     0xfc00707f, // mask
     0x14000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmin_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMIN_VX, // instr_name
     0xfc00707f, // mask
     0x14004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmin_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMAXU_VV, // instr_name
     0xfc00707f, // mask
     0x18000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmaxu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMAXU_VX, // instr_name
     0xfc00707f, // mask
     0x18004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmaxu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMAX_VV, // instr_name
     0xfc00707f, // mask
     0x1c000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmax_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMAX_VX, // instr_name
     0xfc00707f, // mask
     0x1c004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmax_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMUL_VV, // instr_name
     0xfc00707f, // mask
     0x94002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmul_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMUL_VX, // instr_name
     0xfc00707f, // mask
     0x94006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmul_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMULH_VV, // instr_name
     0xfc00707f, // mask
     0x9c002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmulh_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMULH_VX, // instr_name
     0xfc00707f, // mask
     0x9c006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmulh_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMULHU_VV, // instr_name
     0xfc00707f, // mask
     0x90002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmulhu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMULHU_VX, // instr_name
     0xfc00707f, // mask
     0x90006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmulhu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMULHSU_VV, // instr_name
     0xfc00707f, // mask
     0x98002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmulhsu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMULHSU_VX, // instr_name
     0xfc00707f, // mask
     0x98006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmulhsu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VDIVU_VV, // instr_name
     0xfc00707f, // mask
     0x80002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vdivu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VDIVU_VX, // instr_name
     0xfc00707f, // mask
     0x80006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vdivu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VDIV_VV, // instr_name
     0xfc00707f, // mask
     0x84002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vdiv_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VDIV_VX, // instr_name
     0xfc00707f, // mask
     0x84006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vdiv_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VREMU_VV, // instr_name
     0xfc00707f, // mask
     0x88002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vremu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VREMU_VX, // instr_name
     0xfc00707f, // mask
     0x88006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vremu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VREM_VV, // instr_name
     0xfc00707f, // mask
     0x8c002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vrem_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VREM_VX, // instr_name
     0xfc00707f, // mask
     0x8c006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vrem_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMUL_VV, // instr_name
     0xfc00707f, // mask
     0xec002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwmul_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWMUL_VX, // instr_name
     0xfc00707f, // mask
     0xec006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmul_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMULU_VV, // instr_name
     0xfc00707f, // mask
     0xe0002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwmulu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWMULU_VX, // instr_name
     0xfc00707f, // mask
     0xe0006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmulu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMULSU_VV, // instr_name
     0xfc00707f, // mask
     0xe8002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwmulsu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWMULSU_VX, // instr_name
     0xfc00707f, // mask
     0xe8006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmulsu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMACC_VV, // instr_name
     0xfc00707f, // mask
     0xb4002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmacc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMACC_VX, // instr_name
     0xfc00707f, // mask
     0xb4006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmacc_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VNMSAC_VV, // instr_name
     0xfc00707f, // mask
     0xbc002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vnmsac_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VNMSAC_VX, // instr_name
     0xfc00707f, // mask
     0xbc006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnmsac_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMADD_VV, // instr_name
     0xfc00707f, // mask
     0xa4002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMADD_VX, // instr_name
     0xfc00707f, // mask
     0xa4006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmadd_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VNMSUB_VV, // instr_name
     0xfc00707f, // mask
     0xac002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vnmsub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VNMSUB_VX, // instr_name
     0xfc00707f, // mask
     0xac006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnmsub_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACCU_VV, // instr_name
     0xfc00707f, // mask
     0xf0002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwmaccu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACCU_VX, // instr_name
     0xfc00707f, // mask
     0xf0006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmaccu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACC_VV, // instr_name
     0xfc00707f, // mask
     0xf4002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwmacc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACC_VX, // instr_name
     0xfc00707f, // mask
     0xf4006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmacc_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACCSU_VV, // instr_name
     0xfc00707f, // mask
     0xfc002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwmaccsu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACCSU_VX, // instr_name
     0xfc00707f, // mask
     0xfc006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmaccsu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VWMACCUS_VX, // instr_name
     0xfc00707f, // mask
     0xf8006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vwmaccus_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VMERGE_VVM, // instr_name
     0xfe00707f, // mask
     0x5c000057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmerge_vvm
   riscv_instr_param_s(
     riscv_instr_name_t.VMERGE_VXM, // instr_name
     0xfe00707f, // mask
     0x5c004057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmerge_vxm
   riscv_instr_param_s(
     riscv_instr_name_t.VMERGE_VIM, // instr_name
     0xfe00707f, // mask
     0x5c003057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmerge_vim
   riscv_instr_param_s(
     riscv_instr_name_t.VMV_V_V, // instr_name
     0xfff0707f, // mask
     0x5e000057, // match
     [riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b101, // _v_vars
   ), // vmv_v_v
   riscv_instr_param_s(
     riscv_instr_name_t.VMV_V_X, // instr_name
     0xfff0707f, // mask
     0x5e004057, // match
     [riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // vmv_v_x
   riscv_instr_param_s(
     riscv_instr_name_t.VMV_V_I, // instr_name
     0xfff0707f, // mask
     0x5e003057, // match
     [riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // vmv_v_i
   riscv_instr_param_s(
     riscv_instr_name_t.VSADDU_VV, // instr_name
     0xfc00707f, // mask
     0x80000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vsaddu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSADDU_VX, // instr_name
     0xfc00707f, // mask
     0x80004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsaddu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSADDU_VI, // instr_name
     0xfc00707f, // mask
     0x80003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsaddu_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSADD_VV, // instr_name
     0xfc00707f, // mask
     0x84000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vsadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSADD_VX, // instr_name
     0xfc00707f, // mask
     0x84004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsadd_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSADD_VI, // instr_name
     0xfc00707f, // mask
     0x84003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vsadd_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSSUBU_VV, // instr_name
     0xfc00707f, // mask
     0x88000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vssubu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSSUBU_VX, // instr_name
     0xfc00707f, // mask
     0x88004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vssubu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSSUB_VV, // instr_name
     0xfc00707f, // mask
     0x8c000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vssub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSSUB_VX, // instr_name
     0xfc00707f, // mask
     0x8c004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vssub_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VAADDU_VV, // instr_name
     0xfc00707f, // mask
     0x20002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vaaddu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VAADDU_VX, // instr_name
     0xfc00707f, // mask
     0x20006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vaaddu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VAADD_VV, // instr_name
     0xfc00707f, // mask
     0x24002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vaadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VAADD_VX, // instr_name
     0xfc00707f, // mask
     0x24006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vaadd_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VASUBU_VV, // instr_name
     0xfc00707f, // mask
     0x28002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vasubu_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VASUBU_VX, // instr_name
     0xfc00707f, // mask
     0x28006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vasubu_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VASUB_VV, // instr_name
     0xfc00707f, // mask
     0x2c002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vasub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VASUB_VX, // instr_name
     0xfc00707f, // mask
     0x2c006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vasub_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSSRL_VV, // instr_name
     0xfc00707f, // mask
     0xa8000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vssrl_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSSRL_VX, // instr_name
     0xfc00707f, // mask
     0xa8004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vssrl_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSSRL_VI, // instr_name
     0xfc00707f, // mask
     0xa8003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vssrl_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSSRA_VV, // instr_name
     0xfc00707f, // mask
     0xac000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vssra_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VSSRA_VX, // instr_name
     0xfc00707f, // mask
     0xac004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vssra_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSSRA_VI, // instr_name
     0xfc00707f, // mask
     0xac003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vssra_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VNCLIPU_WV, // instr_name
     0xfc00707f, // mask
     0xb8000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vnclipu_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VNCLIPU_WX, // instr_name
     0xfc00707f, // mask
     0xb8004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnclipu_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VNCLIPU_WI, // instr_name
     0xfc00707f, // mask
     0xb8003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnclipu_wi
   riscv_instr_param_s(
     riscv_instr_name_t.VNCLIP_WV, // instr_name
     0xfc00707f, // mask
     0xbc000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vnclip_wv
   riscv_instr_param_s(
     riscv_instr_name_t.VNCLIP_WX, // instr_name
     0xfc00707f, // mask
     0xbc004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnclip_wx
   riscv_instr_param_s(
     riscv_instr_name_t.VNCLIP_WI, // instr_name
     0xfc00707f, // mask
     0xbc003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vnclip_wi
   riscv_instr_param_s(
     riscv_instr_name_t.VFADD_VV, // instr_name
     0xfc00707f, // mask
     0x1057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFADD_VF, // instr_name
     0xfc00707f, // mask
     0x5057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfadd_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFSUB_VV, // instr_name
     0xfc00707f, // mask
     0x8001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfsub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFSUB_VF, // instr_name
     0xfc00707f, // mask
     0x8005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfsub_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFRSUB_VF, // instr_name
     0xfc00707f, // mask
     0x9c005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfrsub_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFMUL_VV, // instr_name
     0xfc00707f, // mask
     0x90001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmul_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMUL_VF, // instr_name
     0xfc00707f, // mask
     0x90005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmul_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFDIV_VV, // instr_name
     0xfc00707f, // mask
     0x80001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfdiv_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFDIV_VF, // instr_name
     0xfc00707f, // mask
     0x80005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfdiv_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFRDIV_VF, // instr_name
     0xfc00707f, // mask
     0x84005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfrdiv_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFWMUL_VV, // instr_name
     0xfc00707f, // mask
     0xe0001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwmul_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFWMUL_VF, // instr_name
     0xfc00707f, // mask
     0xe0005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwmul_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFMACC_VV, // instr_name
     0xfc00707f, // mask
     0xb0001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmacc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMACC_VF, // instr_name
     0xfc00707f, // mask
     0xb0005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmacc_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMACC_VV, // instr_name
     0xfc00707f, // mask
     0xb4001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfnmacc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMACC_VF, // instr_name
     0xfc00707f, // mask
     0xb4005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfnmacc_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFMSAC_VV, // instr_name
     0xfc00707f, // mask
     0xb8001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmsac_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMSAC_VF, // instr_name
     0xfc00707f, // mask
     0xb8005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmsac_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMSAC_VV, // instr_name
     0xfc00707f, // mask
     0xbc001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfnmsac_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMSAC_VF, // instr_name
     0xfc00707f, // mask
     0xbc005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfnmsac_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFMADD_VV, // instr_name
     0xfc00707f, // mask
     0xa0001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMADD_VF, // instr_name
     0xfc00707f, // mask
     0xa0005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmadd_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMADD_VV, // instr_name
     0xfc00707f, // mask
     0xa4001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfnmadd_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMADD_VF, // instr_name
     0xfc00707f, // mask
     0xa4005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfnmadd_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFMSUB_VV, // instr_name
     0xfc00707f, // mask
     0xa8001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmsub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMSUB_VF, // instr_name
     0xfc00707f, // mask
     0xa8005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmsub_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMSUB_VV, // instr_name
     0xfc00707f, // mask
     0xac001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfnmsub_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFNMSUB_VF, // instr_name
     0xfc00707f, // mask
     0xac005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfnmsub_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFWMACC_VV, // instr_name
     0xfc00707f, // mask
     0xf0001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwmacc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFWMACC_VF, // instr_name
     0xfc00707f, // mask
     0xf0005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwmacc_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFWNMACC_VV, // instr_name
     0xfc00707f, // mask
     0xf4001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwnmacc_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFWNMACC_VF, // instr_name
     0xfc00707f, // mask
     0xf4005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwnmacc_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFWMSAC_VV, // instr_name
     0xfc00707f, // mask
     0xf8001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwmsac_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFWMSAC_VF, // instr_name
     0xfc00707f, // mask
     0xf8005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwmsac_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFWNMSAC_VV, // instr_name
     0xfc00707f, // mask
     0xfc001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwnmsac_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFWNMSAC_VF, // instr_name
     0xfc00707f, // mask
     0xfc005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwnmsac_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFSQRT_V, // instr_name
     0xfc0ff07f, // mask
     0x4c001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfsqrt_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFMIN_VV, // instr_name
     0xfc00707f, // mask
     0x10001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmin_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMIN_VF, // instr_name
     0xfc00707f, // mask
     0x10005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmin_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFMAX_VV, // instr_name
     0xfc00707f, // mask
     0x18001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfmax_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFMAX_VF, // instr_name
     0xfc00707f, // mask
     0x18005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfmax_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJ_VV, // instr_name
     0xfc00707f, // mask
     0x20001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfsgnj_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJ_VF, // instr_name
     0xfc00707f, // mask
     0x20005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfsgnj_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJN_VV, // instr_name
     0xfc00707f, // mask
     0x24001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfsgnjn_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJN_VF, // instr_name
     0xfc00707f, // mask
     0x24005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfsgnjn_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJX_VV, // instr_name
     0xfc00707f, // mask
     0x28001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfsgnjx_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJX_VF, // instr_name
     0xfc00707f, // mask
     0x28005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfsgnjx_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VMFEQ_VV, // instr_name
     0xfc00707f, // mask
     0x60001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmfeq_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMFEQ_VF, // instr_name
     0xfc00707f, // mask
     0x60005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmfeq_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VMFNE_VV, // instr_name
     0xfc00707f, // mask
     0x70001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmfne_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMFNE_VF, // instr_name
     0xfc00707f, // mask
     0x70005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmfne_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VMFLT_VV, // instr_name
     0xfc00707f, // mask
     0x6c001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmflt_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMFLT_VF, // instr_name
     0xfc00707f, // mask
     0x6c005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmflt_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VMFLE_VV, // instr_name
     0xfc00707f, // mask
     0x64001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmfle_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VMFLE_VF, // instr_name
     0xfc00707f, // mask
     0x64005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmfle_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VMFGT_VF, // instr_name
     0xfc00707f, // mask
     0x74005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmfgt_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VMFGE_VF, // instr_name
     0xfc00707f, // mask
     0x7c005057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmfge_vf
   riscv_instr_param_s(
     riscv_instr_name_t.VFCLASS_V, // instr_name
     0xfc0ff07f, // mask
     0x4c081057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfclass_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFMERGE_VFM, // instr_name
     0xfe00707f, // mask
     0x5c005057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vfmerge_vfm
   riscv_instr_param_s(
     riscv_instr_name_t.VFMV_V_F, // instr_name
     0xfff0707f, // mask
     0x5e005057, // match
     [riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // vfmv_v_f
   riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_XU_F_V, // instr_name
     0xfc0ff07f, // mask
     0x48001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfcvt_xu_f_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_X_F_V, // instr_name
     0xfc0ff07f, // mask
     0x48009057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfcvt_x_f_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_F_XU_V, // instr_name
     0xfc0ff07f, // mask
     0x48011057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfcvt_f_xu_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_F_X_V, // instr_name
     0xfc0ff07f, // mask
     0x48019057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfcvt_f_x_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_XU_F_V, // instr_name
     0xfc0ff07f, // mask
     0x48041057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwcvt_xu_f_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_X_F_V, // instr_name
     0xfc0ff07f, // mask
     0x48049057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwcvt_x_f_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_F_XU_V, // instr_name
     0xfc0ff07f, // mask
     0x48051057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwcvt_f_xu_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_F_X_V, // instr_name
     0xfc0ff07f, // mask
     0x48059057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwcvt_f_x_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_F_F_V, // instr_name
     0xfc0ff07f, // mask
     0x48061057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfwcvt_f_f_v
   riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_XU_F_W, // instr_name
     0xfc0ff07f, // mask
     0x48081057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfncvt_xu_f_w
   riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_X_F_W, // instr_name
     0xfc0ff07f, // mask
     0x48089057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfncvt_x_f_w
   riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_F_XU_W, // instr_name
     0xfc0ff07f, // mask
     0x48091057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfncvt_f_xu_w
   riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_F_X_W, // instr_name
     0xfc0ff07f, // mask
     0x48099057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfncvt_f_x_w
   riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_F_F_W, // instr_name
     0xfc0ff07f, // mask
     0x480a1057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfncvt_f_f_w
   riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_ROD_F_F_W, // instr_name
     0xfc0ff07f, // mask
     0x480a9057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vfncvt_rod_f_f_w
   riscv_instr_param_s(
     riscv_instr_name_t.VREDSUM_VS, // instr_name
     0xfc00707f, // mask
     0x2057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredsum_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDMAXU_VS, // instr_name
     0xfc00707f, // mask
     0x18002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredmaxu_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDMAX_VS, // instr_name
     0xfc00707f, // mask
     0x1c002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredmax_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDMINU_VS, // instr_name
     0xfc00707f, // mask
     0x10002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredminu_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDMIN_VS, // instr_name
     0xfc00707f, // mask
     0x14002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredmin_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDAND_VS, // instr_name
     0xfc00707f, // mask
     0x4002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredand_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDOR_VS, // instr_name
     0xfc00707f, // mask
     0x8002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredor_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VREDXOR_VS, // instr_name
     0xfc00707f, // mask
     0xc002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vredxor_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VWREDSUMU_VS, // instr_name
     0xfc00707f, // mask
     0xc0000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwredsumu_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VWREDSUM_VS, // instr_name
     0xfc00707f, // mask
     0xc4000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vwredsum_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VFREDOSUM_VS, // instr_name
     0xfc00707f, // mask
     0xc001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfredosum_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VFREDSUM_VS, // instr_name
     0xfc00707f, // mask
     0x4001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfredsum_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VFREDMAX_VS, // instr_name
     0xfc00707f, // mask
     0x1c001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfredmax_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VFWREDOSUM_VS, // instr_name
     0xfc00707f, // mask
     0xcc001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwredosum_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VFWREDSUM_VS, // instr_name
     0xfc00707f, // mask
     0xc4001057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vfwredsum_vs
   riscv_instr_param_s(
     riscv_instr_name_t.VMAND_MM, // instr_name
     0xfe00707f, // mask
     0x66002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmand_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMNAND_MM, // instr_name
     0xfe00707f, // mask
     0x76002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmnand_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMANDNOT_MM, // instr_name
     0xfc00707f, // mask
     0x60002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmandnot_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMXOR_MM, // instr_name
     0xfe00707f, // mask
     0x6e002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmxor_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMOR_MM, // instr_name
     0xfe00707f, // mask
     0x6a002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmor_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMNOR_MM, // instr_name
     0xfe00707f, // mask
     0x7a002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmnor_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMORNOT_MM, // instr_name
     0xfc00707f, // mask
     0x70002057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vmornot_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VMXNOR_MM, // instr_name
     0xfe00707f, // mask
     0x7e002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vmxnor_mm
   riscv_instr_param_s(
     riscv_instr_name_t.VPOPC_M, // instr_name
     0xfc0ff07f, // mask
     0x40082057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_v_aliases], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b11000, // _v_vars
   ), // vpopc_m
   riscv_instr_param_s(
     riscv_instr_name_t.VFIRST_M, // instr_name
     0xfc0ff07f, // mask
     0x4008a057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b11000, // _v_vars
   ), // vfirst_m
   riscv_instr_param_s(
     riscv_instr_name_t.VMSBF_M, // instr_name
     0xfc0ff07f, // mask
     0x5000a057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsbf_m
   riscv_instr_param_s(
     riscv_instr_name_t.VMSIF_M, // instr_name
     0xfc0ff07f, // mask
     0x5001a057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsif_m
   riscv_instr_param_s(
     riscv_instr_name_t.VMSOF_M, // instr_name
     0xfc0ff07f, // mask
     0x50012057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vmsof_m
   riscv_instr_param_s(
     riscv_instr_name_t.VIOTA_M, // instr_name
     0xfc0ff07f, // mask
     0x50082057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // viota_m
   riscv_instr_param_s(
     riscv_instr_name_t.VID_V, // instr_name
     0xfdfff07f, // mask
     0x5008a057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b10001, // _v_vars
   ), // vid_v
   riscv_instr_param_s(
     riscv_instr_name_t.VMV_X_S, // instr_name
     0xfe0ff07f, // mask
     0x42002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b1000, // _v_vars
   ), // vmv_x_s
   riscv_instr_param_s(
     riscv_instr_name_t.VMV_S_X, // instr_name
     0xfff0707f, // mask
     0x42006057, // match
     [riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // vmv_s_x
   riscv_instr_param_s(
     riscv_instr_name_t.VFMV_F_S, // instr_name
     0xfe0ff07f, // mask
     0x42001057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b1000, // _v_vars
   ), // vfmv_f_s
   riscv_instr_param_s(
     riscv_instr_name_t.VFMV_S_F, // instr_name
     0xfff0707f, // mask
     0x42005057, // match
     [riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // vfmv_s_f
   riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEUP_VI, // instr_name
     0xfc00707f, // mask
     0x38003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vslideup_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEUP_VX, // instr_name
     0xfc00707f, // mask
     0x38004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vslideup_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEDOWN_VI, // instr_name
     0xfc00707f, // mask
     0x3c003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vslidedown_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEDOWN_VX, // instr_name
     0xfc00707f, // mask
     0x3c004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vslidedown_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSLIDE1UP_VX, // instr_name
     0xfc00707f, // mask
     0x38006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vslide1up_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VSLIDE1DOWN_VX, // instr_name
     0xfc00707f, // mask
     0x3c006057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vslide1down_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VRGATHER_VV, // instr_name
     0xfc00707f, // mask
     0x30000057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // vrgather_vv
   riscv_instr_param_s(
     riscv_instr_name_t.VRGATHER_VX, // instr_name
     0xfc00707f, // mask
     0x30004057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vrgather_vx
   riscv_instr_param_s(
     riscv_instr_name_t.VRGATHER_VI, // instr_name
     0xfc00707f, // mask
     0x30003057, // match
     [riscv_opcodes_args_t.vm, riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.simm5, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // vrgather_vi
   riscv_instr_param_s(
     riscv_instr_name_t.VCOMPRESS_VM, // instr_name
     0xfe00707f, // mask
     0x5e002057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vs1, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // vcompress_vm
   riscv_instr_param_s(
     riscv_instr_name_t.VMV1R_V, // instr_name
     0xfe0ff07f, // mask
     0x9e003057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmv1r_v
   riscv_instr_param_s(
     riscv_instr_name_t.VMV2R_V, // instr_name
     0xfe0ff07f, // mask
     0x9e00b057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmv2r_v
   riscv_instr_param_s(
     riscv_instr_name_t.VMV4R_V, // instr_name
     0xfe0ff07f, // mask
     0x9e01b057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmv4r_v
   riscv_instr_param_s(
     riscv_instr_name_t.VMV8R_V, // instr_name
     0xfe0ff07f, // mask
     0x9e03b057, // match
     [riscv_opcodes_args_t.vs2, riscv_opcodes_args_t.vd], // variables
     [riscv_extention_t.rv_v], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // vmv8r_v
   riscv_instr_param_s(
     riscv_instr_name_t.DRET, // instr_name
     0xffffffff, // mask
     0x7b200073, // match
     [], // variables
     [riscv_extention_t.rv_system], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // dret
   riscv_instr_param_s(
     riscv_instr_name_t.MRET, // instr_name
     0xffffffff, // mask
     0x30200073, // match
     [], // variables
     [riscv_extention_t.rv_system], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // mret
   riscv_instr_param_s(
     riscv_instr_name_t.SRET, // instr_name
     0xffffffff, // mask
     0x10200073, // match
     [], // variables
     [riscv_extention_t.rv_s], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sret
   riscv_instr_param_s(
     riscv_instr_name_t.WFI, // instr_name
     0xffffffff, // mask
     0x10500073, // match
     [], // variables
     [riscv_extention_t.rv_system], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // wfi
   riscv_instr_param_s(
     riscv_instr_name_t.SFENCE_VMA, // instr_name
     0xfe007fff, // mask
     0x12000073, // match
     [riscv_opcodes_args_t.rs1, riscv_opcodes_args_t.rs2], // variables
     [riscv_extention_t.rv_s], // extensions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // sfence_vma
   riscv_instr_param_s(
     riscv_instr_name_t.INVALID_INSTR, // instr_name
     0xFFFFFFFF, // mask
     0x00000013, // match
     [], // variables
     [], // extensions
     0x0, // _imms
     0x0, // _c_imms
     0x0, // _v_imms
     0x0, // _vars
     0x0, // _c_vars
     0x0, // _v_vars
   ) // invalid_instr
];

