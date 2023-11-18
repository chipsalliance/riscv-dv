/*
 * Copyright 2018 Google LLC
 * Copyright 2020 Andes Technology Co., Ltd.
 * Copyright 2022 Coverify Systems Technology
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


module riscv.gen.riscv_instr_pkg;

import riscv.gen.target: XLEN, NUM_HARTS, SATP_MODE, implemented_csr;
import std.traits: EnumMembers;

import esdl.data.bvec: bvec, ubvec, toubvec, UBVEC, isBitVector;
import esdl.rand: rand;
import uvm;

// Data section setting

// use uvm_cmdline_processor.get_inst() directly
// uvm_cmdline_processor  inst;


struct mem_region_t
{
  string     name;
  uint       size_in_bytes;
  ubvec!3    xwr; // Excutable,Writable,Readale
}

enum vreg_init_method_t: ubyte {
  SAME_VALUES_ALL_ELEMS,
  RANDOM_VALUES_VMV,
  RANDOM_VALUES_LOAD
}

enum satp_mode_t: ubvec!4 {
  BARE = UBVEC!(4, 0b0000),
  SV32 = UBVEC!(4, 0b0001),
  SV39 = UBVEC!(4, 0b1000),
  SV48 = UBVEC!(4, 0b1001),
  SV57 = UBVEC!(4, 0b1010),
  SV64 = UBVEC!(4, 0b1011)
}

enum f_rounding_mode_t: ubvec!3 {
  RNE = UBVEC!(3, 0b000),
  RTZ = UBVEC!(3, 0b001),
  RDN = UBVEC!(3, 0b010),
  RUP = UBVEC!(3, 0b011),
  RMM = UBVEC!(3, 0b100)
}

enum mtvec_mode_t: ubvec!2 {
  DIRECT   = UBVEC!(2, 0b00),
  VECTORED = UBVEC!(2, 0b01)
}

enum imm_t: ubvec!3 {
  IMM    = UBVEC!(3, 0b000),    // Signed immediate
  UIMM   = UBVEC!(3, 0b001),   // Unsigned immediate
  NZUIMM = UBVEC!(3, 0b010), // Non-zero unsigned immediate
  NZIMM  = UBVEC!(3, 0b011)   // Non-zero signed immediate
}

// Privileged mode
enum privileged_mode_t: ubvec!2 {
  USER_MODE       = UBVEC!(2, 0b00),
  SUPERVISOR_MODE = UBVEC!(2, 0b01),
  RESERVED_MODE   = UBVEC!(2, 0b10),
  MACHINE_MODE    = UBVEC!(2, 0b11)
}

enum riscv_instr_group_t: ubyte {
  RV32I,
  RV64I,
  RV32M,
  RV64M,
  RV32A,
  RV64A,
  RV32F,
  RV32FC,
  RV64F,
  RV32D,
  RV32DC,
  RV64D,
  RV32C,
  RV64C,
  RV128I,
  RV128C,
  RVV,
  RV32B,
  RV32ZBA,
  RV32ZBB,
  RV32ZBC,
  RV32ZBS,
  RV64B,
  RV64ZBA,
  RV64ZBB,
  RV64ZBC,
  RV64ZBS,
  RV32X,
  RV64X
}


enum riscv_instr_name_t: ushort {
  // RV32I instructions
  LUI,
  AUIPC,
  JAL,
  JALR,
  BEQ,
  BNE,
  BLT,
  BGE,
  BLTU,
  BGEU,
  LB,
  LH,
  LW,
  LBU,
  LHU,
  SB,
  SH,
  SW,
  ADDI,
  SLTI,
  SLTIU,
  XORI,
  ORI,
  ANDI,
  SLLI,
  SRLI,
  SRAI,
  ADD,
  SUB,
  SLL,
  SLT,
  SLTU,
  XOR,
  SRL,
  SRA,
  OR,
  AND,
  NOP,
  FENCE,
  FENCE_I,
  ECALL,
  EBREAK,
  CSRRW,
  CSRRS,
  CSRRC,
  CSRRWI,
  CSRRSI,
  CSRRCI,
  // RV32ZBA instructions
  SH1ADD,
  SH2ADD,
  SH3ADD,
  // RV32ZBB instructions
  ANDN,
  CLZ,
  CPOP,
  CTZ,
  MAX,
  MAXU,
  MIN,
  MINU,
  ORC_B,
  ORN,
  REV8,
  ROL,
  ROR,
  RORI,
  SEXT_B,
  SEXT_H,
  XNOR,
  ZEXT_H,
  // RV32ZBC instructions
  CLMUL,
  CLMULH,
  CLMULR,
  // RV32ZBS instructions
  BCLR,
  BCLRI,
  BEXT,
  BEXTI,
  BINV,
  BINVI,
  BSET,
  BSETI,
  // RV32B instructions
  // Remaining bitmanip instructions of draft v.0.93 not ratified in v.1.00 (Zba, Zbb, Zbc, Zbs).
  GORC,
  GORCI,
  CMIX,
  CMOV,
  PACK,
  PACKU,
  PACKH,
  XPERM4,
  XPERM8,
  XPERM16,
  SLO,
  SRO,
  SLOI,
  SROI,
  GREV,
  GREVI,
  FSL,
  FSR,
  FSRI,
  CRC32_B,
  CRC32_H,
  CRC32_W,
  CRC32C_B,
  CRC32C_H,
  CRC32C_W,
  SHFL,
  UNSHFL,
  SHFLI,
  UNSHFLI,
  BCOMPRESS,
  BDECOMPRESS,
  BFP,
  // RV64ZBA instructions
  ADD_UW,
  SH1ADD_UW,
  SH2ADD_UW,
  SH3ADD_UW,
  SLLI_UW,
  // RV64ZBB instructions
  CLZW,
  CPOPW,
  CTZW,
  ROLW,
  RORW,
  RORIW,
  //RV64B instructions
  // Remaining bitmanip instructions of draft v.0.93 not ratified in v.1.00 (Zba, Zbb, Zbc, Zbs).
  BMATOR,
  BMATXOR,
  BMATFLIP,
  CRC32_D,
  CRC32C_D,
  SHFLW,
  UNSHFLW,
  BCOMPRESSW,
  BDECOMPRESSW,
  BFPW,
  SLOW,
  SROW,
  SLOIW,
  SROIW,
  GREVW,
  GREVIW,
  FSLW,
  FSRW,
  FSRIW,
  GORCW,
  GORCIW,
  PACKW,
  PACKUW,
  XPERM32,
  // RV32M instructions
  MUL,
  MULH,
  MULHSU,
  MULHU,
  DIV,
  DIVU,
  REM,
  REMU,
  // RV64M instructions
  MULW,
  DIVW,
  DIVUW,
  REMW,
  REMUW,
  // RV32F instructions
  FLW,
  FSW,
  FMADD_S,
  FMSUB_S,
  FNMSUB_S,
  FNMADD_S,
  FADD_S,
  FSUB_S,
  FMUL_S,
  FDIV_S,
  FSQRT_S,
  FSGNJ_S,
  FSGNJN_S,
  FSGNJX_S,
  FMIN_S,
  FMAX_S,
  FCVT_W_S,
  FCVT_WU_S,
  FMV_X_W,
  FEQ_S,
  FLT_S,
  FLE_S,
  FCLASS_S,
  FCVT_S_W,
  FCVT_S_WU,
  FMV_W_X,
  // RV64F instruction
  FCVT_L_S,
  FCVT_LU_S,
  FCVT_S_L,
  FCVT_S_LU,
  // RV32D instructions
  FLD,
  FSD,
  FMADD_D,
  FMSUB_D,
  FNMSUB_D,
  FNMADD_D,
  FADD_D,
  FSUB_D,
  FMUL_D,
  FDIV_D,
  FSQRT_D,
  FSGNJ_D,
  FSGNJN_D,
  FSGNJX_D,
  FMIN_D,
  FMAX_D,
  FCVT_S_D,
  FCVT_D_S,
  FEQ_D,
  FLT_D,
  FLE_D,
  FCLASS_D,
  FCVT_W_D,
  FCVT_WU_D,
  FCVT_D_W,
  FCVT_D_WU,
  // RV64D
  FCVT_L_D,
  FCVT_LU_D,
  FMV_X_D,
  FCVT_D_L,
  FCVT_D_LU,
  FMV_D_X,
  // RV64I
  LWU,
  LD,
  SD,
  ADDIW,
  SLLIW,
  SRLIW,
  SRAIW,
  ADDW,
  SUBW,
  SLLW,
  SRLW,
  SRAW,
  // RV32C
  C_LW,
  C_SW,
  C_LWSP,
  C_SWSP,
  C_ADDI4SPN,
  C_ADDI,
  C_LI,
  C_ADDI16SP,
  C_LUI,
  C_SRLI,
  C_SRAI,
  C_ANDI,
  C_SUB,
  C_XOR,
  C_OR,
  C_AND,
  C_BEQZ,
  C_BNEZ,
  C_SLLI,
  C_MV,
  C_EBREAK,
  C_ADD,
  C_NOP,
  C_J,
  C_JAL,
  C_JR,
  C_JALR,
  // RV64C
  C_ADDIW,
  C_SUBW,
  C_ADDW,
  C_LD,
  C_SD,
  C_LDSP,
  C_SDSP,
  // RV128C
  C_SRLI64,
  C_SRAI64,
  C_SLLI64,
  C_LQ,
  C_SQ,
  C_LQSP,
  C_SQSP,
  // RV32FC
  C_FLW,
  C_FSW,
  C_FLWSP,
  C_FSWSP,
  // RV32DC
  C_FLD,
  C_FSD,
  C_FLDSP,
  C_FSDSP,
  // RV32A
  LR_W,
  SC_W,
  AMOSWAP_W,
  AMOADD_W,
  AMOAND_W,
  AMOOR_W,
  AMOXOR_W,
  AMOMIN_W,
  AMOMAX_W,
  AMOMINU_W,
  AMOMAXU_W,
  // RV64A
  LR_D,
  SC_D,
  AMOSWAP_D,
  AMOADD_D,
  AMOAND_D,
  AMOOR_D,
  AMOXOR_D,
  AMOMIN_D,
  AMOMAX_D,
  AMOMINU_D,
  AMOMAXU_D,
  // Vector instructions
  VSETVL,
  VSETVLI,
  VADD_VV,
  VADD_VX,
  VADD_VI,
  // // // VADD,  #  #  #
  VSUB_VV,
  VSUB_VX,
  // // VSUB,  #  #
  VRSUB_VX,
  VRSUB_VI,
  // // VRSUB,  #  #
  VWADDU_VV,
  VWADDU_VX,
  VWADDU_WV,
  VWADDU_WX,
  // // // // VWADDU,  #  #  #  #
  VWSUBU_VV,
  VWSUBU_VX,
  VWSUBU_WV,
  VWSUBU_WX,
  // // // // VWSUBU,  #  #  #  #
  VWADD_VV,
  VWADD_VX,
  VWADD_WV,
  VWADD_WX,
  // // // // VWADD,  #  #  #  #
  VWSUB_VV,
  VWSUB_VX,
  VWSUB_WV,
  VWSUB_WX,
  // // // // VWSUB,  #  #  #  #
  VADC_VVM,
  VADC_VXM,
  VADC_VIM,
  // // // VADC,  #  #  #
  VMADC_VVM,
  VMADC_VXM,
  VMADC_VIM,
  VMADC_VV,
  VMADC_VX,
  VMADC_VI,
  // // // // // // VMADC,  #  #  #  #  #  #
  VSBC_VVM,
  VSBC_VXM,
  // // VSBC,  #  #
  VMSBC_VVM,
  VMSBC_VXM,
  VMSBC_VV,
  VMSBC_VX,
  // // // // VMSBC,  #  #  #  #
  VAND_VV,
  VAND_VX,
  VAND_VI,
  // // // VAND,  #  #  #
  VOR_VV,
  VOR_VX,
  VOR_VI,
  // // // VOR,  #  #  #
  VXOR_VV,
  VXOR_VX,
  VXOR_VI,
  // // // VXOR,  #  #  #
  VSLL_VV,
  VSLL_VX,
  VSLL_VI,
  // // // VSLL,  #  #  #
  VSRL_VV,
  VSRL_VX,
  VSRL_VI,
  // // // VSRL,  #  #  #
  VSRA_VV,
  VSRA_VX,
  VSRA_VI,
  // // // VSRA,  #  #  #
  VNSRL_WV,
  VNSRL_WX,
  VNSRL_WI,
  // // // VNSRL,  #  #  #
  VNSRA_WV,
  VNSRA_WX,
  VNSRA_WI,
  // // // VNSRA,  #  #  #
  VMSEQ_VV,
  VMSEQ_VX,
  VMSEQ_VI,
  // // // VMSEQ,  #  #  #
  VMSNE_VV,
  VMSNE_VX,
  VMSNE_VI,
  // // // VMSNE,  #  #  #
  VMSLTU_VV,
  VMSLTU_VX,
  // // VMSLTU,  #  #
  VMSLT_VV,
  VMSLT_VX,
  // // VMSLT,  #  #
  VMSLEU_VV,
  VMSLEU_VX,
  VMSLEU_VI,
  // // // VMSLEU,  #  #  #
  VMSLE_VV,
  VMSLE_VX,
  VMSLE_VI,
  // // // VMSLE,  #  #  #
  VMSGTU_VX,
  VMSGTU_VI,
  // // VMSGTU,  #  #
  VMSGT_VX,
  VMSGT_VI,
  // // VMSGT,  #  #
  VMINU_VV,
  VMINU_VX,
  // // VMINU,  #  #
  VMIN_VV,
  VMIN_VX,
  // // VMIN,  #  #
  VMAXU_VV,
  VMAXU_VX,
  // // VMAXU,  #  #
  VMAX_VV,
  VMAX_VX,
  // // VMAX,  #  #
  VMUL_VV,
  VMUL_VX,
  // // VMUL,  #  #
  VMULH_VV,
  VMULH_VX,
  // // VMULH,  #  #
  VMULHU_VV,
  VMULHU_VX,
  // // VMULHU,  #  #
  VMULHSU_VV,
  VMULHSU_VX,
  // // VMULHSU,  #  #
  VDIVU_VV,
  VDIVU_VX,
  // // VDIVU,  #  #
  VDIV_VV,
  VDIV_VX,
  // // VDIV,  #  #
  VREMU_VV,
  VREMU_VX,
  // // VREMU,  #  #
  VREM_VV,
  VREM_VX,
  // // VREM,  #  #
  VWMUL_VV,
  VWMUL_VX,
  // // VWMUL,  #  #
  VWMULU_VV,
  VWMULU_VX,
  // // VWMULU,  #  #
  VWMULSU_VV,
  VWMULSU_VX,
  // // VWMULSU,  #  #
  VMACC_VV,
  VMACC_VX,
  // // VMACC,  #  #
  VNMSAC_VV,
  VNMSAC_VX,
  // // VNMSAC,  #  #
  VMADD_VV,
  VMADD_VX,
  // // VMADD,  #  #
  VNMSUB_VV,
  VNMSUB_VX,
  // // VNMSUB,  #  #
  VWMACCU_VV,
  VWMACCU_VX,
  // // VWMACCU,  #  #
  VWMACC_VV,
  VWMACC_VX,
  // // VWMACC,  #  #
  VWMACCSU_VV,
  VWMACCSU_VX,
  // // VWMACCSU,  #  #
  VWMACCUS_VX,
  // VWMACCUS,  #
  //VQMACCU,
  //VQMACC,
  //VQMACCSU,
  //VQMACCUS,
  VMERGE_VVM,
  VMERGE_VXM,
  VMERGE_VIM,
  // // // VMERGE,  #  #  #
  VMV_V_V,
  VMV_V_X,
  VMV_V_I,
  // // // VMV,  #  #  #
  VSADDU_VV,
  VSADDU_VX,
  VSADDU_VI,
  // // // VSADDU,  #  #  #
  VSADD_VV,
  VSADD_VX,
  VSADD_VI,
  // // // VSADD,  #  #  #
  VSSUBU_VV,
  VSSUBU_VX,
  // // VSSUBU,  #  #
  VSSUB_VV,
  VSSUB_VX,
  // // VSSUB,  #  #
  VAADDU_VV,
  VAADDU_VX,
  // // VAADDU,  #  #
  VAADD_VV,
  VAADD_VX,
  // // VAADD,  #  #
  VASUBU_VV,
  VASUBU_VX,
  // // VASUBU,  #  #
  VASUB_VV,
  VASUB_VX,
  // // VASUB,  #  #
  VSSRL_VV,
  VSSRL_VX,
  VSSRL_VI,
  // // // VSSRL,  #  #  #
  VSSRA_VV,
  VSSRA_VX,
  VSSRA_VI,
  // // // VSSRA,  #  #  #
  VNCLIPU_WV,
  VNCLIPU_WX,
  VNCLIPU_WI,
  // // // VNCLIPU,  #  #  #
  VNCLIP_WV,
  VNCLIP_WX,
  VNCLIP_WI,
  // // // VNCLIP,  #  #  #
  // 14. Vector Floating-Point Instructions
  VFADD_VV,
  VFADD_VF,
  // // VFADD,  #  #
  VFSUB_VV,
  VFSUB_VF,
  // // VFSUB,  #  #
  VFRSUB_VF,
  // VFRSUB,  #
  VFMUL_VV,
  VFMUL_VF,
  // // VFMUL,  #  #
  VFDIV_VV,
  VFDIV_VF,
  // // VFDIV,  #  #
  VFRDIV_VF,
  // VFRDIV,  #
  VFWMUL_VV,
  VFWMUL_VF,
  // // VFWMUL,  #  #
  VFMACC_VV,
  VFMACC_VF,
  // // VFMACC,  #  #
  VFNMACC_VV,
  VFNMACC_VF,
  // // VFNMACC,  #  #
  VFMSAC_VV,
  VFMSAC_VF,
  // // VFMSAC,  #  #
  VFNMSAC_VV,
  VFNMSAC_VF,
  // // VFNMSAC,  #  #
  VFMADD_VV,
  VFMADD_VF,
  // // VFMADD,  #  #
  VFNMADD_VV,
  VFNMADD_VF,
  // // VFNMADD,  #  #
  VFMSUB_VV,
  VFMSUB_VF,
  // // VFMSUB,  #  #
  VFNMSUB_VV,
  VFNMSUB_VF,
  // // VFNMSUB,  #  #
  VFWMACC_VV,
  VFWMACC_VF,
  // // VFWMACC,  #  #
  VFWNMACC_VV,
  VFWNMACC_VF,
  // // VFWNMACC,  #  #
  VFWMSAC_VV,
  VFWMSAC_VF,
  // // VFWMSAC,  #  #
  VFWNMSAC_VV,
  VFWNMSAC_VF,
  // // VFWNMSAC,  #  #
  VFSQRT_V,
  VFMIN_VV,
  VFMIN_VF,
  // // VFMIN,  #  #
  VFMAX_VV,
  VFMAX_VF,
  // // VFMAX,  #  #
  VFSGNJ_VV,
  VFSGNJ_VF,
  // // VFSGNJ,  #  #
  VFSGNJN_VV,
  VFSGNJN_VF,
  // // VFSGNJN,  #  #
  VFSGNJX_VV,
  VFSGNJX_VF,
  // // VFSGNJX,  #  #
  VMFEQ_VV,
  VMFEQ_VF,
  // // VMFEQ,  #  #
  VMFNE_VV,
  VMFNE_VF,
  // // VMFNE,  #  #
  VMFLT_VV,
  VMFLT_VF,
  // // VMFLT,  #  #
  VMFLE_VV,
  VMFLE_VF,
  // // VMFLE,  #  #
  VMFGT_VF,
  // VMFGT,  #
  VMFGE_VF,
  // VMFGE,  #
  VFCLASS_V,
  VFMERGE_VFM,
  // VFMERGE,  #
  VFMV_V_F,
  // VFMV,  #
  VFCVT_XU_F_V,
  VFCVT_X_F_V,
  VFCVT_F_XU_V,
  VFCVT_F_X_V,
  VFWCVT_XU_F_V,
  VFWCVT_X_F_V,
  VFWCVT_F_XU_V,
  VFWCVT_F_X_V,
  VFWCVT_F_F_V,
  VFNCVT_XU_F_W,
  VFNCVT_X_F_W,
  VFNCVT_F_XU_W,
  VFNCVT_F_X_W,
  VFNCVT_F_F_W,
  VFNCVT_ROD_F_F_W,
  // 15. Vector reduction instruction
  VREDSUM_VS,
  VREDMAXU_VS,
  VREDMAX_VS,
  VREDMINU_VS,
  VREDMIN_VS,
  VREDAND_VS,
  VREDOR_VS,
  VREDXOR_VS,
  VWREDSUMU_VS,
  VWREDSUM_VS,
  VFREDOSUM_VS,
  VFREDSUM_VS,
  VFREDMAX_VS,
  VFWREDOSUM_VS,
  VFWREDSUM_VS,
  // Vector mask instruction
  VMAND_MM,
  VMNAND_MM,
  VMANDNOT_MM,
  VMXOR_MM,
  VMOR_MM,
  VMNOR_MM,
  VMORNOT_MM,
  VMXNOR_MM,
  VPOPC_M,
  VFIRST_M,
  VMSBF_M,
  VMSIF_M,
  VMSOF_M,
  VIOTA_M,
  VID_V,
  // Vector permutation instruction
  VMV_X_S,
  VMV_S_X,
  VFMV_F_S,
  VFMV_S_F,
  VSLIDEUP_VI,
  VSLIDEUP_VX,
  // // VSLIDEUP,  #  #
  VSLIDEDOWN_VI,
  VSLIDEDOWN_VX,
  // // VSLIDEDOWN,  #  #
  VSLIDE1UP_VX,
  // VSLIDE1UP,  #
  VSLIDE1DOWN_VX,
  // VSLIDE1DOWN,  #
  VRGATHER_VV,
  VRGATHER_VX,
  VRGATHER_VI,
  // // // VRGATHER,  #  #  #
  VCOMPRESS_VM,
  // VCOMPRESS,  #
  VMV1R_V,
  VMV2R_V,
  VMV4R_V,
  VMV8R_V,
  // Vector load/store instruction
  // VLE1_V,
  // VLE8_V,
  // VLE16_V,
  // VLE32_V,
  // VLE64_V,
  // VLE128_V,
  // VLE256_V,
  // VLE512_V,
  // VLE1024_V,
  // VLE8FF_V,
  // VLE16FF_V,
  // VLE32FF_V,
  // VLE64FF_V,
  // VLE128FF_V,
  // VLE256FF_V,
  // VLE512FF_V,
  // VLE1024FF_V,
  // VSE1_V,
  // VSE8_V,
  // VSE16_V,
  // VSE32_V,
  // VSE64_V,
  // VSE128_V,
  // VSE256_V,
  // VSE512_V,
  // VSE1024_V,

  // VLSE8_V,
  // VLSE16_V,
  // VLSE32_V,
  // VLSE64_V,
  // VLSE128_V,
  // VLSE256_V,
  // VLSE512_V,
  // VLSE1024_V,
  // VSSE8_V,
  // VSSE16_V,
  // VSSE32_V,
  // VSSE64_V,
  // VSSE128_V,
  // VSSE256_V,
  // VSSE512_V,
  // VSSE1024_V,

  // VLXEI_V,
  // VSXEI_V,
  // VSUXEI_V,
  // VLEFF_V,
  // Segmented load/store instruction
  // VLSEGE_V,
  // VSSEGE_V,
  // VLSEGEFF_V,
  // VLSSEGE_V,
  // VSSSEGE_V,
  // VLXSEGEI_V,
  // VSXSEGEI_V,
  // VSUXSEGEI_V,
  // Vector AMO instruction
  // EEW vector AMOs
  // VAMOSWAPE_V,
  // VAMOADDE_V,
  // VAMOXORE_V,
  // VAMOANDE_V,
  // VAMOORE_V,
  // VAMOMINE_V,
  // VAMOMAXE_V,
  // VAMOMINUE_V,
  // VAMOMAXUE_V,
  // Supervisor instruction
  DRET,
  MRET,
  // URET,                       // deprecated
  SRET,
  WFI,
  SFENCE_VMA,
  // Custom instructions
  // `include "isa/custom/riscv_custom_instr_enum.sv"
  // You can add other instructions here
  INVALID_INSTR
}


enum va_base_instr: byte {
  VADD,
  VSUB,
  VRSUB,
  VWADDU,
  VWSUBU,
  VWADD,
  VWSUB,
  VADC,
  VMADC,
  VSBC,
  VMSBC,
  VAND,
  VOR,
  VXOR,
  VSLL,
  VSRL,
  VSRA,
  VNSRL,
  VNSRA,
  VMSEQ,
  VMSNE,
  VMSLTU,
  VMSLT,
  VMSLEU,
  VMSLE,
  VMSGTU,
  VMSGT,
  VMINU,
  VMIN,
  VMAXU,
  VMAX,
  VMUL,
  VMULH,
  VMULHU,
  VMULHSU,
  VDIVU,
  VDIV,
  VREMU,
  VREM,
  VWMUL,
  VWMULU,
  VWMULSU,
  VMACC,
  VNMSAC,
  VMADD,
  VNMSUB,
  VWMACCU,
  VWMACC,
  VWMACCSU,
  VWMACCUS,
  VMERGE,
  VMV,
  VSADDU,
  VSADD,
  VSSUBU,
  VSSUB,
  VAADDU,
  VAADD,
  VASUBU,
  VASUB,
  VSSRL,
  VSSRA,
  VNCLIPU,
  VNCLIP,
  VFADD,
  VFSUB,
  VFRSUB,
  VFMUL,
  VFDIV,
  VFRDIV,
  VFWMUL,
  VFMACC,
  VFNMACC,
  VFMSAC,
  VFNMSAC,
  VFMADD,
  VFNMADD,
  VFMSUB,
  VFNMSUB,
  VFWMACC,
  VFWNMACC,
  VFWMSAC,
  VFWNMSAC,
  VFMIN,
  VFMAX,
  VFSGNJ,
  VFSGNJN,
  VFSGNJX,
  VMFEQ,
  VMFNE,
  VMFLT,
  VMFLE,
  VMFGT,
  VMFGE,
  VFMERGE,
  VFMV,
  VSLIDEUP,
  VSLIDEDOWN,
  VSLIDE1UP,
  VSLIDE1DOWN,
  VRGATHER,
  VCOMPRESS,
  // Not every Vector Instruction has a base
  VA_NO_BASE
}

va_base_instr va_get_base(riscv_instr_name_t INSTR) {
  switch (INSTR) {
  case riscv_instr_name_t.VADD_VV: return va_base_instr.VADD;
  case riscv_instr_name_t.VADD_VX: return va_base_instr.VADD;
  case riscv_instr_name_t.VADD_VI: return va_base_instr.VADD;
  case riscv_instr_name_t.VSUB_VV: return va_base_instr.VSUB;
  case riscv_instr_name_t.VSUB_VX: return va_base_instr.VSUB;
  case riscv_instr_name_t.VRSUB_VX: return va_base_instr.VRSUB;
  case riscv_instr_name_t.VRSUB_VI: return va_base_instr.VRSUB;
  case riscv_instr_name_t.VWADDU_VV: return va_base_instr.VWADDU;
  case riscv_instr_name_t.VWADDU_VX: return va_base_instr.VWADDU;
  case riscv_instr_name_t.VWADDU_WV: return va_base_instr.VWADDU;
  case riscv_instr_name_t.VWADDU_WX: return va_base_instr.VWADDU;
  case riscv_instr_name_t.VWSUBU_VV: return va_base_instr.VWSUBU;
  case riscv_instr_name_t.VWSUBU_VX: return va_base_instr.VWSUBU;
  case riscv_instr_name_t.VWSUBU_WV: return va_base_instr.VWSUBU;
  case riscv_instr_name_t.VWSUBU_WX: return va_base_instr.VWSUBU;
  case riscv_instr_name_t.VWADD_VV: return va_base_instr.VWADD;
  case riscv_instr_name_t.VWADD_VX: return va_base_instr.VWADD;
  case riscv_instr_name_t.VWADD_WV: return va_base_instr.VWADD;
  case riscv_instr_name_t.VWADD_WX: return va_base_instr.VWADD;
  case riscv_instr_name_t.VWSUB_VV: return va_base_instr.VWSUB;
  case riscv_instr_name_t.VWSUB_VX: return va_base_instr.VWSUB;
  case riscv_instr_name_t.VWSUB_WV: return va_base_instr.VWSUB;
  case riscv_instr_name_t.VWSUB_WX: return va_base_instr.VWSUB;
  case riscv_instr_name_t.VADC_VVM: return va_base_instr.VADC;
  case riscv_instr_name_t.VADC_VXM: return va_base_instr.VADC;
  case riscv_instr_name_t.VADC_VIM: return va_base_instr.VADC;
  case riscv_instr_name_t.VMADC_VVM: return va_base_instr.VMADC;
  case riscv_instr_name_t.VMADC_VXM: return va_base_instr.VMADC;
  case riscv_instr_name_t.VMADC_VIM: return va_base_instr.VMADC;
  case riscv_instr_name_t.VMADC_VV: return va_base_instr.VMADC;
  case riscv_instr_name_t.VMADC_VX: return va_base_instr.VMADC;
  case riscv_instr_name_t.VMADC_VI: return va_base_instr.VMADC;
  case riscv_instr_name_t.VSBC_VVM: return va_base_instr.VSBC;
  case riscv_instr_name_t.VSBC_VXM: return va_base_instr.VSBC;
  case riscv_instr_name_t.VMSBC_VVM: return va_base_instr.VMSBC;
  case riscv_instr_name_t.VMSBC_VXM: return va_base_instr.VMSBC;
  case riscv_instr_name_t.VMSBC_VV: return va_base_instr.VMSBC;
  case riscv_instr_name_t.VMSBC_VX: return va_base_instr.VMSBC;
  case riscv_instr_name_t.VAND_VV: return va_base_instr.VAND;
  case riscv_instr_name_t.VAND_VX: return va_base_instr.VAND;
  case riscv_instr_name_t.VAND_VI: return va_base_instr.VAND;
  case riscv_instr_name_t.VOR_VV: return va_base_instr.VOR;
  case riscv_instr_name_t.VOR_VX: return va_base_instr.VOR;
  case riscv_instr_name_t.VOR_VI: return va_base_instr.VOR;
  case riscv_instr_name_t.VXOR_VV: return va_base_instr.VXOR;
  case riscv_instr_name_t.VXOR_VX: return va_base_instr.VXOR;
  case riscv_instr_name_t.VXOR_VI: return va_base_instr.VXOR;
  case riscv_instr_name_t.VSLL_VV: return va_base_instr.VSLL;
  case riscv_instr_name_t.VSLL_VX: return va_base_instr.VSLL;
  case riscv_instr_name_t.VSLL_VI: return va_base_instr.VSLL;
  case riscv_instr_name_t.VSRL_VV: return va_base_instr.VSRL;
  case riscv_instr_name_t.VSRL_VX: return va_base_instr.VSRL;
  case riscv_instr_name_t.VSRL_VI: return va_base_instr.VSRL;
  case riscv_instr_name_t.VSRA_VV: return va_base_instr.VSRA;
  case riscv_instr_name_t.VSRA_VX: return va_base_instr.VSRA;
  case riscv_instr_name_t.VSRA_VI: return va_base_instr.VSRA;
  case riscv_instr_name_t.VNSRL_WV: return va_base_instr.VNSRL;
  case riscv_instr_name_t.VNSRL_WX: return va_base_instr.VNSRL;
  case riscv_instr_name_t.VNSRL_WI: return va_base_instr.VNSRL;
  case riscv_instr_name_t.VNSRA_WV: return va_base_instr.VNSRA;
  case riscv_instr_name_t.VNSRA_WX: return va_base_instr.VNSRA;
  case riscv_instr_name_t.VNSRA_WI: return va_base_instr.VNSRA;
  case riscv_instr_name_t.VMSEQ_VV: return va_base_instr.VMSEQ;
  case riscv_instr_name_t.VMSEQ_VX: return va_base_instr.VMSEQ;
  case riscv_instr_name_t.VMSEQ_VI: return va_base_instr.VMSEQ;
  case riscv_instr_name_t.VMSNE_VV: return va_base_instr.VMSNE;
  case riscv_instr_name_t.VMSNE_VX: return va_base_instr.VMSNE;
  case riscv_instr_name_t.VMSNE_VI: return va_base_instr.VMSNE;
  case riscv_instr_name_t.VMSLTU_VV: return va_base_instr.VMSLTU;
  case riscv_instr_name_t.VMSLTU_VX: return va_base_instr.VMSLTU;
  case riscv_instr_name_t.VMSLT_VV: return va_base_instr.VMSLT;
  case riscv_instr_name_t.VMSLT_VX: return va_base_instr.VMSLT;
  case riscv_instr_name_t.VMSLEU_VV: return va_base_instr.VMSLEU;
  case riscv_instr_name_t.VMSLEU_VX: return va_base_instr.VMSLEU;
  case riscv_instr_name_t.VMSLEU_VI: return va_base_instr.VMSLEU;
  case riscv_instr_name_t.VMSLE_VV: return va_base_instr.VMSLE;
  case riscv_instr_name_t.VMSLE_VX: return va_base_instr.VMSLE;
  case riscv_instr_name_t.VMSLE_VI: return va_base_instr.VMSLE;
  case riscv_instr_name_t.VMSGTU_VX: return va_base_instr.VMSGTU;
  case riscv_instr_name_t.VMSGTU_VI: return va_base_instr.VMSGTU;
  case riscv_instr_name_t.VMSGT_VX: return va_base_instr.VMSGT;
  case riscv_instr_name_t.VMSGT_VI: return va_base_instr.VMSGT;
  case riscv_instr_name_t.VMINU_VV: return va_base_instr.VMINU;
  case riscv_instr_name_t.VMINU_VX: return va_base_instr.VMINU;
  case riscv_instr_name_t.VMIN_VV: return va_base_instr.VMIN;
  case riscv_instr_name_t.VMIN_VX: return va_base_instr.VMIN;
  case riscv_instr_name_t.VMAXU_VV: return va_base_instr.VMAXU;
  case riscv_instr_name_t.VMAXU_VX: return va_base_instr.VMAXU;
  case riscv_instr_name_t.VMAX_VV: return va_base_instr.VMAX;
  case riscv_instr_name_t.VMAX_VX: return va_base_instr.VMAX;
  case riscv_instr_name_t.VMUL_VV: return va_base_instr.VMUL;
  case riscv_instr_name_t.VMUL_VX: return va_base_instr.VMUL;
  case riscv_instr_name_t.VMULH_VV: return va_base_instr.VMULH;
  case riscv_instr_name_t.VMULH_VX: return va_base_instr.VMULH;
  case riscv_instr_name_t.VMULHU_VV: return va_base_instr.VMULHU;
  case riscv_instr_name_t.VMULHU_VX: return va_base_instr.VMULHU;
  case riscv_instr_name_t.VMULHSU_VV: return va_base_instr.VMULHSU;
  case riscv_instr_name_t.VMULHSU_VX: return va_base_instr.VMULHSU;
  case riscv_instr_name_t.VDIVU_VV: return va_base_instr.VDIVU;
  case riscv_instr_name_t.VDIVU_VX: return va_base_instr.VDIVU;
  case riscv_instr_name_t.VDIV_VV: return va_base_instr.VDIV;
  case riscv_instr_name_t.VDIV_VX: return va_base_instr.VDIV;
  case riscv_instr_name_t.VREMU_VV: return va_base_instr.VREMU;
  case riscv_instr_name_t.VREMU_VX: return va_base_instr.VREMU;
  case riscv_instr_name_t.VREM_VV: return va_base_instr.VREM;
  case riscv_instr_name_t.VREM_VX: return va_base_instr.VREM;
  case riscv_instr_name_t.VWMUL_VV: return va_base_instr.VWMUL;
  case riscv_instr_name_t.VWMUL_VX: return va_base_instr.VWMUL;
  case riscv_instr_name_t.VWMULU_VV: return va_base_instr.VWMULU;
  case riscv_instr_name_t.VWMULU_VX: return va_base_instr.VWMULU;
  case riscv_instr_name_t.VWMULSU_VV: return va_base_instr.VWMULSU;
  case riscv_instr_name_t.VWMULSU_VX: return va_base_instr.VWMULSU;
  case riscv_instr_name_t.VMACC_VV: return va_base_instr.VMACC;
  case riscv_instr_name_t.VMACC_VX: return va_base_instr.VMACC;
  case riscv_instr_name_t.VNMSAC_VV: return va_base_instr.VNMSAC;
  case riscv_instr_name_t.VNMSAC_VX: return va_base_instr.VNMSAC;
  case riscv_instr_name_t.VMADD_VV: return va_base_instr.VMADD;
  case riscv_instr_name_t.VMADD_VX: return va_base_instr.VMADD;
  case riscv_instr_name_t.VNMSUB_VV: return va_base_instr.VNMSUB;
  case riscv_instr_name_t.VNMSUB_VX: return va_base_instr.VNMSUB;
  case riscv_instr_name_t.VWMACCU_VV: return va_base_instr.VWMACCU;
  case riscv_instr_name_t.VWMACCU_VX: return va_base_instr.VWMACCU;
  case riscv_instr_name_t.VWMACC_VV: return va_base_instr.VWMACC;
  case riscv_instr_name_t.VWMACC_VX: return va_base_instr.VWMACC;
  case riscv_instr_name_t.VWMACCSU_VV: return va_base_instr.VWMACCSU;
  case riscv_instr_name_t.VWMACCSU_VX: return va_base_instr.VWMACCSU;
  case riscv_instr_name_t.VWMACCUS_VX: return va_base_instr.VWMACCUS;
  case riscv_instr_name_t.VMERGE_VVM: return va_base_instr.VMERGE;
  case riscv_instr_name_t.VMERGE_VXM: return va_base_instr.VMERGE;
  case riscv_instr_name_t.VMERGE_VIM: return va_base_instr.VMERGE;
  case riscv_instr_name_t.VMV_V_V: return va_base_instr.VMV;
  case riscv_instr_name_t.VMV_V_X: return va_base_instr.VMV;
  case riscv_instr_name_t.VMV_V_I: return va_base_instr.VMV;
  case riscv_instr_name_t.VSADDU_VV: return va_base_instr.VSADDU;
  case riscv_instr_name_t.VSADDU_VX: return va_base_instr.VSADDU;
  case riscv_instr_name_t.VSADDU_VI: return va_base_instr.VSADDU;
  case riscv_instr_name_t.VSADD_VV: return va_base_instr.VSADD;
  case riscv_instr_name_t.VSADD_VX: return va_base_instr.VSADD;
  case riscv_instr_name_t.VSADD_VI: return va_base_instr.VSADD;
  case riscv_instr_name_t.VSSUBU_VV: return va_base_instr.VSSUBU;
  case riscv_instr_name_t.VSSUBU_VX: return va_base_instr.VSSUBU;
  case riscv_instr_name_t.VSSUB_VV: return va_base_instr.VSSUB;
  case riscv_instr_name_t.VSSUB_VX: return va_base_instr.VSSUB;
  case riscv_instr_name_t.VAADDU_VV: return va_base_instr.VAADDU;
  case riscv_instr_name_t.VAADDU_VX: return va_base_instr.VAADDU;
  case riscv_instr_name_t.VAADD_VV: return va_base_instr.VAADD;
  case riscv_instr_name_t.VAADD_VX: return va_base_instr.VAADD;
  case riscv_instr_name_t.VASUBU_VV: return va_base_instr.VASUBU;
  case riscv_instr_name_t.VASUBU_VX: return va_base_instr.VASUBU;
  case riscv_instr_name_t.VASUB_VV: return va_base_instr.VASUB;
  case riscv_instr_name_t.VASUB_VX: return va_base_instr.VASUB;
  case riscv_instr_name_t.VSSRL_VV: return va_base_instr.VSSRL;
  case riscv_instr_name_t.VSSRL_VX: return va_base_instr.VSSRL;
  case riscv_instr_name_t.VSSRL_VI: return va_base_instr.VSSRL;
  case riscv_instr_name_t.VSSRA_VV: return va_base_instr.VSSRA;
  case riscv_instr_name_t.VSSRA_VX: return va_base_instr.VSSRA;
  case riscv_instr_name_t.VSSRA_VI: return va_base_instr.VSSRA;
  case riscv_instr_name_t.VNCLIPU_WV: return va_base_instr.VNCLIPU;
  case riscv_instr_name_t.VNCLIPU_WX: return va_base_instr.VNCLIPU;
  case riscv_instr_name_t.VNCLIPU_WI: return va_base_instr.VNCLIPU;
  case riscv_instr_name_t.VNCLIP_WV: return va_base_instr.VNCLIP;
  case riscv_instr_name_t.VNCLIP_WX: return va_base_instr.VNCLIP;
  case riscv_instr_name_t.VNCLIP_WI: return va_base_instr.VNCLIP;
  case riscv_instr_name_t.VFADD_VV: return va_base_instr.VFADD;
  case riscv_instr_name_t.VFADD_VF: return va_base_instr.VFADD;
  case riscv_instr_name_t.VFSUB_VV: return va_base_instr.VFSUB;
  case riscv_instr_name_t.VFSUB_VF: return va_base_instr.VFSUB;
  case riscv_instr_name_t.VFRSUB_VF: return va_base_instr.VFRSUB;
  case riscv_instr_name_t.VFMUL_VV: return va_base_instr.VFMUL;
  case riscv_instr_name_t.VFMUL_VF: return va_base_instr.VFMUL;
  case riscv_instr_name_t.VFDIV_VV: return va_base_instr.VFDIV;
  case riscv_instr_name_t.VFDIV_VF: return va_base_instr.VFDIV;
  case riscv_instr_name_t.VFRDIV_VF: return va_base_instr.VFRDIV;
  case riscv_instr_name_t.VFWMUL_VV: return va_base_instr.VFWMUL;
  case riscv_instr_name_t.VFWMUL_VF: return va_base_instr.VFWMUL;
  case riscv_instr_name_t.VFMACC_VV: return va_base_instr.VFMACC;
  case riscv_instr_name_t.VFMACC_VF: return va_base_instr.VFMACC;
  case riscv_instr_name_t.VFNMACC_VV: return va_base_instr.VFNMACC;
  case riscv_instr_name_t.VFNMACC_VF: return va_base_instr.VFNMACC;
  case riscv_instr_name_t.VFMSAC_VV: return va_base_instr.VFMSAC;
  case riscv_instr_name_t.VFMSAC_VF: return va_base_instr.VFMSAC;
  case riscv_instr_name_t.VFNMSAC_VV: return va_base_instr.VFNMSAC;
  case riscv_instr_name_t.VFNMSAC_VF: return va_base_instr.VFNMSAC;
  case riscv_instr_name_t.VFMADD_VV: return va_base_instr.VFMADD;
  case riscv_instr_name_t.VFMADD_VF: return va_base_instr.VFMADD;
  case riscv_instr_name_t.VFNMADD_VV: return va_base_instr.VFNMADD;
  case riscv_instr_name_t.VFNMADD_VF: return va_base_instr.VFNMADD;
  case riscv_instr_name_t.VFMSUB_VV: return va_base_instr.VFMSUB;
  case riscv_instr_name_t.VFMSUB_VF: return va_base_instr.VFMSUB;
  case riscv_instr_name_t.VFNMSUB_VV: return va_base_instr.VFNMSUB;
  case riscv_instr_name_t.VFNMSUB_VF: return va_base_instr.VFNMSUB;
  case riscv_instr_name_t.VFWMACC_VV: return va_base_instr.VFWMACC;
  case riscv_instr_name_t.VFWMACC_VF: return va_base_instr.VFWMACC;
  case riscv_instr_name_t.VFWNMACC_VV: return va_base_instr.VFWNMACC;
  case riscv_instr_name_t.VFWNMACC_VF: return va_base_instr.VFWNMACC;
  case riscv_instr_name_t.VFWMSAC_VV: return va_base_instr.VFWMSAC;
  case riscv_instr_name_t.VFWMSAC_VF: return va_base_instr.VFWMSAC;
  case riscv_instr_name_t.VFWNMSAC_VV: return va_base_instr.VFWNMSAC;
  case riscv_instr_name_t.VFWNMSAC_VF: return va_base_instr.VFWNMSAC;
  case riscv_instr_name_t.VFMIN_VV: return va_base_instr.VFMIN;
  case riscv_instr_name_t.VFMIN_VF: return va_base_instr.VFMIN;
  case riscv_instr_name_t.VFMAX_VV: return va_base_instr.VFMAX;
  case riscv_instr_name_t.VFMAX_VF: return va_base_instr.VFMAX;
  case riscv_instr_name_t.VFSGNJ_VV: return va_base_instr.VFSGNJ;
  case riscv_instr_name_t.VFSGNJ_VF: return va_base_instr.VFSGNJ;
  case riscv_instr_name_t.VFSGNJN_VV: return va_base_instr.VFSGNJN;
  case riscv_instr_name_t.VFSGNJN_VF: return va_base_instr.VFSGNJN;
  case riscv_instr_name_t.VFSGNJX_VV: return va_base_instr.VFSGNJX;
  case riscv_instr_name_t.VFSGNJX_VF: return va_base_instr.VFSGNJX;
  case riscv_instr_name_t.VMFEQ_VV: return va_base_instr.VMFEQ;
  case riscv_instr_name_t.VMFEQ_VF: return va_base_instr.VMFEQ;
  case riscv_instr_name_t.VMFNE_VV: return va_base_instr.VMFNE;
  case riscv_instr_name_t.VMFNE_VF: return va_base_instr.VMFNE;
  case riscv_instr_name_t.VMFLT_VV: return va_base_instr.VMFLT;
  case riscv_instr_name_t.VMFLT_VF: return va_base_instr.VMFLT;
  case riscv_instr_name_t.VMFLE_VV: return va_base_instr.VMFLE;
  case riscv_instr_name_t.VMFLE_VF: return va_base_instr.VMFLE;
  case riscv_instr_name_t.VMFGT_VF: return va_base_instr.VMFGT;
  case riscv_instr_name_t.VMFGE_VF: return va_base_instr.VMFGE;
  case riscv_instr_name_t.VFMERGE_VFM: return va_base_instr.VFMERGE;
  case riscv_instr_name_t.VFMV_V_F: return va_base_instr.VFMV;
  case riscv_instr_name_t.VSLIDEUP_VI: return va_base_instr.VSLIDEUP;
  case riscv_instr_name_t.VSLIDEUP_VX: return va_base_instr.VSLIDEUP;
  case riscv_instr_name_t.VSLIDEDOWN_VI: return va_base_instr.VSLIDEDOWN;
  case riscv_instr_name_t.VSLIDEDOWN_VX: return va_base_instr.VSLIDEDOWN;
  case riscv_instr_name_t.VSLIDE1UP_VX: return va_base_instr.VSLIDE1UP;
  case riscv_instr_name_t.VSLIDE1DOWN_VX: return va_base_instr.VSLIDE1DOWN;
  case riscv_instr_name_t.VRGATHER_VV: return va_base_instr.VRGATHER;
  case riscv_instr_name_t.VRGATHER_VX: return va_base_instr.VRGATHER;
  case riscv_instr_name_t.VRGATHER_VI: return va_base_instr.VRGATHER;
  case riscv_instr_name_t.VCOMPRESS_VM: return va_base_instr.VCOMPRESS;
  default: return va_base_instr.VA_NO_BASE;
  }
}


// Maximum virtual address bits used by the program
enum uint MAX_USED_VADDR_BITS = 30;

enum uint SINGLE_PRECISION_FRACTION_BITS = 23;
enum uint DOUBLE_PRECISION_FRACTION_BITS = 52;


enum riscv_reg_t: ubvec!5 {	// 5'b
  ZERO = UBVEC!(5, 0),
  RA   = UBVEC!(5, 1),  
  SP   = UBVEC!(5, 2),  
  GP   = UBVEC!(5, 3),  
  TP   = UBVEC!(5, 4),  
  T0   = UBVEC!(5, 5),  
  T1   = UBVEC!(5, 6),  
  T2   = UBVEC!(5, 7),  
  S0   = UBVEC!(5, 8),  
  S1   = UBVEC!(5, 9),  
  A0   = UBVEC!(5, 10),  
  A1   = UBVEC!(5, 11),  
  A2   = UBVEC!(5, 12),  
  A3   = UBVEC!(5, 13),  
  A4   = UBVEC!(5, 14),  
  A5   = UBVEC!(5, 15),  
  A6   = UBVEC!(5, 16),  
  A7   = UBVEC!(5, 17),  
  S2   = UBVEC!(5, 18),  
  S3   = UBVEC!(5, 19),  
  S4   = UBVEC!(5, 20),  
  S5   = UBVEC!(5, 21),  
  S6   = UBVEC!(5, 22),  
  S7   = UBVEC!(5, 23),  
  S8   = UBVEC!(5, 24),  
  S9   = UBVEC!(5, 25),  
  S10  = UBVEC!(5, 26),  
  S11  = UBVEC!(5, 27),  
  T3   = UBVEC!(5, 28),  
  T4   = UBVEC!(5, 29),  
  T5   = UBVEC!(5, 30),  
  T6   = UBVEC!(5, 31) 
}
 
enum riscv_fpr_t: ubvec!5 { 	// 5'b
  FT0  = UBVEC!(5, 0), 
  FT1  = UBVEC!(5, 1), 
  FT2  = UBVEC!(5, 2), 
  FT3  = UBVEC!(5, 3), 
  FT4  = UBVEC!(5, 4), 
  FT5  = UBVEC!(5, 5), 
  FT6  = UBVEC!(5, 6), 
  FT7  = UBVEC!(5, 7), 
  FS0  = UBVEC!(5, 8), 
  FS1  = UBVEC!(5, 9), 
  FA0  = UBVEC!(5, 10),
  FA1  = UBVEC!(5, 11),
  FA2  = UBVEC!(5, 12),
  FA3  = UBVEC!(5, 13),
  FA4  = UBVEC!(5, 14),
  FA5  = UBVEC!(5, 15),
  FA6  = UBVEC!(5, 16),
  FA7  = UBVEC!(5, 17),
  FS2  = UBVEC!(5, 18),
  FS3  = UBVEC!(5, 19),
  FS4  = UBVEC!(5, 20),
  FS5  = UBVEC!(5, 21),
  FS6  = UBVEC!(5, 22),
  FS7  = UBVEC!(5, 23),
  FS8  = UBVEC!(5, 24),
  FS9  = UBVEC!(5, 25),
  FS10 = UBVEC!(5, 26), 
  FS11 = UBVEC!(5, 27), 
  FT8  = UBVEC!(5, 28),
  FT9  = UBVEC!(5, 29),
  FT10 = UBVEC!(5, 30), 
  FT11 = UBVEC!(5, 31)
}

enum riscv_vreg_t: ubvec!5 {
  V0  = UBVEC!(5, 0), 
  V1  = UBVEC!(5, 1), 
  V2  = UBVEC!(5, 2), 
  V3  = UBVEC!(5, 3), 
  V4  = UBVEC!(5, 4), 
  V5  = UBVEC!(5, 5), 
  V6  = UBVEC!(5, 6), 
  V7  = UBVEC!(5, 7), 
  V8  = UBVEC!(5, 8), 
  V9  = UBVEC!(5, 9), 
  V10 = UBVEC!(5, 10), 
  V11 = UBVEC!(5, 11), 
  V12 = UBVEC!(5, 12), 
  V13 = UBVEC!(5, 13), 
  V14 = UBVEC!(5, 14), 
  V15 = UBVEC!(5, 15), 
  V16 = UBVEC!(5, 16), 
  V17 = UBVEC!(5, 17), 
  V18 = UBVEC!(5, 18), 
  V19 = UBVEC!(5, 19), 
  V20 = UBVEC!(5, 20), 
  V21 = UBVEC!(5, 21), 
  V22 = UBVEC!(5, 22), 
  V23 = UBVEC!(5, 23), 
  V24 = UBVEC!(5, 24), 
  V25 = UBVEC!(5, 25), 
  V26 = UBVEC!(5, 26), 
  V27 = UBVEC!(5, 27), 
  V28 = UBVEC!(5, 28), 
  V29 = UBVEC!(5, 29), 
  V30 = UBVEC!(5, 30), 
  V31 = UBVEC!(5, 31)
}

enum riscv_instr_format_t: ubyte {	// 6'b
  J_FORMAT = 0,
  U_FORMAT,
  I_FORMAT,
  B_FORMAT,
  R_FORMAT,
  S_FORMAT,
  R4_FORMAT,
  // Compressed instruction format
  CI_FORMAT,
  CB_FORMAT,
  CJ_FORMAT,
  CR_FORMAT,
  CA_FORMAT,
  CL_FORMAT,
  CS_FORMAT,
  CSS_FORMAT,
  CIW_FORMAT,
  // Vector instruction format
  VSET_FORMAT,
  VA_FORMAT,
  VS2_FORMAT, // op vd,vs2
  VL_FORMAT,
  VS_FORMAT,
  VLX_FORMAT,
  VSX_FORMAT,
  VLS_FORMAT,
  VSS_FORMAT,
  VAMO_FORMAT
}


// Vector arithmetic instruction variant
enum va_variant_t: ubvec!4 {
  VV   = UBVEC!(4, 0),  
  VI   = UBVEC!(4, 1),  
  VX   = UBVEC!(4, 2),  
  VF   = UBVEC!(4, 3),  
  WV   = UBVEC!(4, 4),  
  WI   = UBVEC!(4, 5),  
  WX   = UBVEC!(4, 6),  
  VVM  = UBVEC!(4, 7),  
  VIM  = UBVEC!(4, 8),  
  VXM  = UBVEC!(4, 9),  
  VFM  = UBVEC!(4, 10), 
  VS   = UBVEC!(4, 11), 
  VM   = UBVEC!(4, 12),
  NONE = UBVEC!(4, 13)
}

enum riscv_instr_category_t: ubyte {	// 6'b
  LOAD = 0,
  STORE,
  SHIFT,
  ARITHMETIC,
  LOGICAL,
  COMPARE,
  BRANCH,
  JUMP,
  SYNCH,
  SYSTEM,
  COUNTER,
  CSR,
  CHANGELEVEL,
  TRAP,
  INTERRUPT,
  // `VECTOR_INCLUDE("riscv_instr_pkg_inc_riscv_instr_category_t.sv")
  AMO // (last one)
}

alias riscv_csr_t = ubvec!12;

enum privileged_reg_t: ubvec!12 {	// 12'b
    // User mode register
    USTATUS         = UBVEC!(12, 0x000),  // User status
    UIE             = UBVEC!(12, 0x004),  // User interrupt-enable register
    UTVEC           = UBVEC!(12, 0x005),  // User trap-handler base address
    USCRATCH        = UBVEC!(12, 0x040),  // Scratch register for user trap handlers
    UEPC            = UBVEC!(12, 0x041),  // User exception program counter
    UCAUSE          = UBVEC!(12, 0x042),  // User trap cause
    UTVAL           = UBVEC!(12, 0x043),  // User bad address or instruction
    UIP             = UBVEC!(12, 0x044),  // User interrupt pending
    // Unprivileged Floating-Point CSRs
    FFLAGS          = UBVEC!(12, 0x001),  // Floating-Point Accrued Exceptions
    FRM             = UBVEC!(12, 0x002),  // Floating-Point Dynamic Rounding Mode
    FCSR            = UBVEC!(12, 0x003),  // Floating-Point Control/Status Register (FRM + FFLAGS)
    // Unprivileged Counter/Timers
    CYCLE           = UBVEC!(12, 0xC00),  // Cycle counter for RDCYCLE instruction
    TIME            = UBVEC!(12, 0xC01),  // Timer for RDTIME instruction
    INSTRET         = UBVEC!(12, 0xC02),  // Instructions-retired counter for RDINSTRET instruction
    HPMCOUNTER3     = UBVEC!(12, 0xC03),  // Performance-monitoring counter
    HPMCOUNTER4     = UBVEC!(12, 0xC04),  // Performance-monitoring counter
    HPMCOUNTER5     = UBVEC!(12, 0xC05),  // Performance-monitoring counter
    HPMCOUNTER6     = UBVEC!(12, 0xC06),  // Performance-monitoring counter
    HPMCOUNTER7     = UBVEC!(12, 0xC07),  // Performance-monitoring counter
    HPMCOUNTER8     = UBVEC!(12, 0xC08),  // Performance-monitoring counter
    HPMCOUNTER9     = UBVEC!(12, 0xC09),  // Performance-monitoring counter
    HPMCOUNTER10    = UBVEC!(12, 0xC0A),  // Performance-monitoring counter
    HPMCOUNTER11    = UBVEC!(12, 0xC0B),  // Performance-monitoring counter
    HPMCOUNTER12    = UBVEC!(12, 0xC0C),  // Performance-monitoring counter
    HPMCOUNTER13    = UBVEC!(12, 0xC0D),  // Performance-monitoring counter
    HPMCOUNTER14    = UBVEC!(12, 0xC0E),  // Performance-monitoring counter
    HPMCOUNTER15    = UBVEC!(12, 0xC0F),  // Performance-monitoring counter
    HPMCOUNTER16    = UBVEC!(12, 0xC10),  // Performance-monitoring counter
    HPMCOUNTER17    = UBVEC!(12, 0xC11),  // Performance-monitoring counter
    HPMCOUNTER18    = UBVEC!(12, 0xC12),  // Performance-monitoring counter
    HPMCOUNTER19    = UBVEC!(12, 0xC13),  // Performance-monitoring counter
    HPMCOUNTER20    = UBVEC!(12, 0xC14),  // Performance-monitoring counter
    HPMCOUNTER21    = UBVEC!(12, 0xC15),  // Performance-monitoring counter
    HPMCOUNTER22    = UBVEC!(12, 0xC16),  // Performance-monitoring counter
    HPMCOUNTER23    = UBVEC!(12, 0xC17),  // Performance-monitoring counter
    HPMCOUNTER24    = UBVEC!(12, 0xC18),  // Performance-monitoring counter
    HPMCOUNTER25    = UBVEC!(12, 0xC19),  // Performance-monitoring counter
    HPMCOUNTER26    = UBVEC!(12, 0xC1A),  // Performance-monitoring counter
    HPMCOUNTER27    = UBVEC!(12, 0xC1B),  // Performance-monitoring counter
    HPMCOUNTER28    = UBVEC!(12, 0xC1C),  // Performance-monitoring counter
    HPMCOUNTER29    = UBVEC!(12, 0xC1D),  // Performance-monitoring counter
    HPMCOUNTER30    = UBVEC!(12, 0xC1E),  // Performance-monitoring counter
    HPMCOUNTER31    = UBVEC!(12, 0xC1F),  // Performance-monitoring counter
    CYCLEH          = UBVEC!(12, 0xC80),  // Upper 32 bits of CYCLE, RV32I only
    TIMEH           = UBVEC!(12, 0xC81),  // Upper 32 bits of TIME, RV32I only
    INSTRETH        = UBVEC!(12, 0xC82),  // Upper 32 bits of INSTRET, RV32I only
    HPMCOUNTER3H    = UBVEC!(12, 0xC83),  // Upper 32 bits of HPMCOUNTER3, RV32I only
    HPMCOUNTER4H    = UBVEC!(12, 0xC84),  // Upper 32 bits of HPMCOUNTER4, RV32I only
    HPMCOUNTER5H    = UBVEC!(12, 0xC85),  // Upper 32 bits of HPMCOUNTER5, RV32I only
    HPMCOUNTER6H    = UBVEC!(12, 0xC86),  // Upper 32 bits of HPMCOUNTER6, RV32I only
    HPMCOUNTER7H    = UBVEC!(12, 0xC87),  // Upper 32 bits of HPMCOUNTER7, RV32I only
    HPMCOUNTER8H    = UBVEC!(12, 0xC88),  // Upper 32 bits of HPMCOUNTER8, RV32I only
    HPMCOUNTER9H    = UBVEC!(12, 0xC89),  // Upper 32 bits of HPMCOUNTER9, RV32I only
    HPMCOUNTER10H   = UBVEC!(12, 0xC8A),  // Upper 32 bits of HPMCOUNTER10, RV32I only
    HPMCOUNTER11H   = UBVEC!(12, 0xC8B),  // Upper 32 bits of HPMCOUNTER11, RV32I only
    HPMCOUNTER12H   = UBVEC!(12, 0xC8C),  // Upper 32 bits of HPMCOUNTER12, RV32I only
    HPMCOUNTER13H   = UBVEC!(12, 0xC8D),  // Upper 32 bits of HPMCOUNTER13, RV32I only
    HPMCOUNTER14H   = UBVEC!(12, 0xC8E),  // Upper 32 bits of HPMCOUNTER14, RV32I only
    HPMCOUNTER15H   = UBVEC!(12, 0xC8F),  // Upper 32 bits of HPMCOUNTER15, RV32I only
    HPMCOUNTER16H   = UBVEC!(12, 0xC90),  // Upper 32 bits of HPMCOUNTER16, RV32I only
    HPMCOUNTER17H   = UBVEC!(12, 0xC91),  // Upper 32 bits of HPMCOUNTER17, RV32I only
    HPMCOUNTER18H   = UBVEC!(12, 0xC92),  // Upper 32 bits of HPMCOUNTER18, RV32I only
    HPMCOUNTER19H   = UBVEC!(12, 0xC93),  // Upper 32 bits of HPMCOUNTER19, RV32I only
    HPMCOUNTER20H   = UBVEC!(12, 0xC94),  // Upper 32 bits of HPMCOUNTER20, RV32I only
    HPMCOUNTER21H   = UBVEC!(12, 0xC95),  // Upper 32 bits of HPMCOUNTER21, RV32I only
    HPMCOUNTER22H   = UBVEC!(12, 0xC96),  // Upper 32 bits of HPMCOUNTER22, RV32I only
    HPMCOUNTER23H   = UBVEC!(12, 0xC97),  // Upper 32 bits of HPMCOUNTER23, RV32I only
    HPMCOUNTER24H   = UBVEC!(12, 0xC98),  // Upper 32 bits of HPMCOUNTER24, RV32I only
    HPMCOUNTER25H   = UBVEC!(12, 0xC99),  // Upper 32 bits of HPMCOUNTER25, RV32I only
    HPMCOUNTER26H   = UBVEC!(12, 0xC9A),  // Upper 32 bits of HPMCOUNTER26, RV32I only
    HPMCOUNTER27H   = UBVEC!(12, 0xC9B),  // Upper 32 bits of HPMCOUNTER27, RV32I only
    HPMCOUNTER28H   = UBVEC!(12, 0xC9C),  // Upper 32 bits of HPMCOUNTER28, RV32I only
    HPMCOUNTER29H   = UBVEC!(12, 0xC9D),  // Upper 32 bits of HPMCOUNTER29, RV32I only
    HPMCOUNTER30H   = UBVEC!(12, 0xC9E),  // Upper 32 bits of HPMCOUNTER30, RV32I only
    HPMCOUNTER31H   = UBVEC!(12, 0xC9F),  // Upper 32 bits of HPMCOUNTER31, RV32I only
    // Supervisor mode register
    // Supervisor Trap Setup
    SSTATUS         = UBVEC!(12, 0x100),  // Supervisor status
    SEDELEG         = UBVEC!(12, 0x102),  // Supervisor exception delegation register
    SIDELEG         = UBVEC!(12, 0x103),  // Supervisor interrupt delegation register
    SIE             = UBVEC!(12, 0x104),  // Supervisor interrupt-enable register
    STVEC           = UBVEC!(12, 0x105),  // Supervisor trap-handler base address
    SCOUNTEREN      = UBVEC!(12, 0x106),  // Supervisor counter enable
    // Supervisor Configuration
    SENVCFG         = UBVEC!(12, 0x10A),  // Supervisor environment configuration register
    // Supervisor Trap Handling
    SSCRATCH        = UBVEC!(12, 0x140),  // Scratch register for supervisor trap handlers
    SEPC            = UBVEC!(12, 0x141),  // Supervisor exception program counter
    SCAUSE          = UBVEC!(12, 0x142),  // Supervisor trap cause
    STVAL           = UBVEC!(12, 0x143),  // Supervisor bad address or instruction
    SIP             = UBVEC!(12, 0x144),  // Supervisor interrupt pending
    // Supervisor Protection and Translation
    SATP            = UBVEC!(12, 0x180),  // Supervisor address translation and protection
    // Supervisor Debug/Trace Register
    SCONTEXT        = UBVEC!(12, 0x5A8),  // Supervisor environment configuration register.
    // Hypervisor Trap Setup register
    HSTATUS         = UBVEC!(12, 0x600),  // Hypervisor status register
    HEDELEG         = UBVEC!(12, 0x602),  // Hypervisor exception delegation register
    HIDELEG         = UBVEC!(12, 0x603),  // Hypervisor interrupt delegation register
    HIE             = UBVEC!(12, 0x604),  // Hypervisor interrupt-enable register
    HCOUNTEREN      = UBVEC!(12, 0x606),  // Hypervisor counter enable
    HGEIE           = UBVEC!(12, 0x607),  // Hypervisor guest external interrupt-enable register
    // Hypervisor Trap Handling
    HTVAL           = UBVEC!(12, 0x643),  // Hypervisor bad guest physical address
    HIP             = UBVEC!(12, 0x644),  // Hypervisor interrupt pending
    HVIP            = UBVEC!(12, 0x645),  // Hypervisor virtual interrupt pending
    HTINST          = UBVEC!(12, 0x64A),  // Hypervisor trap instruction (transformed)
    HGEIP           = UBVEC!(12, 0xE12),  // Hypervisor guest external interrupt pending
    // Hypervisor configuration
    HENVCFG         = UBVEC!(12, 0x60A),  // Hypervisor environment configuration register
    HENVCFGH        = UBVEC!(12, 0x61A),  // Additional hypervisor env. conf. register, RV32 only
    // Hypervisor guest address translation and protection
    HGATP           = UBVEC!(12, 0x680),  // Hypervisor guest address translation and protection
    // Hypervisor Debug/Trace registers
    HCONTEXT        = UBVEC!(12, 0x6A8),  // Hypervisor-mode context register
    // Hypervisor Counter/Timer Virtualization Registers
    HTIMEDELTA      = UBVEC!(12, 0x605),  // Delta for VS/VU-mode timer
    HTIMEDELTAH     = UBVEC!(12, 0x615),  // Upper 32 bits of htimedelta, HSXLEN=32 only
    // Virtual Supervisor Registers
    VSSTATUS        = UBVEC!(12, 0x200),  // Virtual supervisor status register
    VSIE            = UBVEC!(12, 0x204),  // Virtual supervisor interrupt-enable register
    VSTVEC          = UBVEC!(12, 0x205),  // Virtual supervisor trap handler base address
    VSSCRATCH       = UBVEC!(12, 0x240),  // Virtual supervisor scratch register
    VSEPC           = UBVEC!(12, 0x241),  // Virtual supervisor exception program counter
    VSCAUSE         = UBVEC!(12, 0x242),  // Virtual supervisor trap cause
    VSTVAL          = UBVEC!(12, 0x243),  // Virtual supervisor bad address or instruction
    VSIP            = UBVEC!(12, 0x244),  // Virtual supervisor interrupt pending
    VSATP           = UBVEC!(12, 0x280),  // Virtual supervisor address translation and protection
    // Machine mode registers
    // Machine Information Registers
    MVENDORID       = UBVEC!(12, 0xF11),  // Vendor ID
    MARCHID         = UBVEC!(12, 0xF12),  // Architecture ID
    MIMPID          = UBVEC!(12, 0xF13),  // Implementation ID
    MHARTID         = UBVEC!(12, 0xF14),  // Hardware thread ID
    MCONFIGPTR      = UBVEC!(12, 0xF15),  // Pointer to configuration data structure
    // Machine Trap Setup
    MSTATUS         = UBVEC!(12, 0x300),  // Machine status
    MISA            = UBVEC!(12, 0x301),  // ISA and extensions
    MEDELEG         = UBVEC!(12, 0x302),  // Machine exception delegation register
    MIDELEG         = UBVEC!(12, 0x303),  // Machine interrupt delegation register
    MIE             = UBVEC!(12, 0x304),  // Machine interrupt-enable register
    MTVEC           = UBVEC!(12, 0x305),  // Machine trap-handler base address
    MCOUNTEREN      = UBVEC!(12, 0x306),  // Machine counter enable
    MSTATUSH        = UBVEC!(12, 0x310),  // Additional machine status register, RV32 only
    // Machine Trap Handling
    MSCRATCH        = UBVEC!(12, 0x340),  // Scratch register for machine trap handlers
    MEPC            = UBVEC!(12, 0x341),  // Machine exception program counter
    MCAUSE          = UBVEC!(12, 0x342),  // Machine trap cause
    MTVAL           = UBVEC!(12, 0x343),  // Machine bad address or instruction
    MIP             = UBVEC!(12, 0x344),  // Machine interrupt pending
    // Machine Configuration
    MENVCFG         = UBVEC!(12, 0x30A),  // Machine environment configuration register
    MENVCFGH        = UBVEC!(12, 0x31A),  // Additional machine env. conf. register, RV32 only
    MSECCFG         = UBVEC!(12, 0x747),  // Machine security configuration register
    MSECCFGH        = UBVEC!(12, 0x757),  // Additional machine security conf. register, RV32 only
    // Machine Memory Protection
    PMPCFG0         = UBVEC!(12, 0x3A0),  // Physical memory protection configuration
    PMPCFG1         = UBVEC!(12, 0x3A1),  // Physical memory protection configuration, RV32 only
    PMPCFG2         = UBVEC!(12, 0x3A2),  // Physical memory protection configuration
    PMPCFG3         = UBVEC!(12, 0x3A3),  // Physical memory protection configuration, RV32 only
    PMPCFG4         = UBVEC!(12, 0x3A4),  // Physical memory protection configuration
    PMPCFG5         = UBVEC!(12, 0x3A5),  // Physical memory protection configuration, RV32 only
    PMPCFG6         = UBVEC!(12, 0x3A6),  // Physical memory protection configuration
    PMPCFG7         = UBVEC!(12, 0x3A7),  // Physical memory protection configuration, RV32 only
    PMPCFG8         = UBVEC!(12, 0x3A8),  // Physical memory protection configuration
    PMPCFG9         = UBVEC!(12, 0x3A9),  // Physical memory protection configuration, RV32 only
    PMPCFG10        = UBVEC!(12, 0x3AA),  // Physical memory protection configuration
    PMPCFG11        = UBVEC!(12, 0x3AB),  // Physical memory protection configuration, RV32 only
    PMPCFG12        = UBVEC!(12, 0x3AC),  // Physical memory protection configuration
    PMPCFG13        = UBVEC!(12, 0x3AD),  // Physical memory protection configuration, RV32 only
    PMPCFG14        = UBVEC!(12, 0x3AE),  // Physical memory protection configuration
    PMPCFG15        = UBVEC!(12, 0x3AF),  // Physical memory protection configuration, RV32 only
    PMPADDR0        = UBVEC!(12, 0x3B0),  // Physical memory protection address register
    PMPADDR1        = UBVEC!(12, 0x3B1),  // Physical memory protection address register
    PMPADDR2        = UBVEC!(12, 0x3B2),  // Physical memory protection address register
    PMPADDR3        = UBVEC!(12, 0x3B3),  // Physical memory protection address register
    PMPADDR4        = UBVEC!(12, 0x3B4),  // Physical memory protection address register
    PMPADDR5        = UBVEC!(12, 0x3B5),  // Physical memory protection address register
    PMPADDR6        = UBVEC!(12, 0x3B6),  // Physical memory protection address register
    PMPADDR7        = UBVEC!(12, 0x3B7),  // Physical memory protection address register
    PMPADDR8        = UBVEC!(12, 0x3B8),  // Physical memory protection address register
    PMPADDR9        = UBVEC!(12, 0x3B9),  // Physical memory protection address register
    PMPADDR10       = UBVEC!(12, 0x3BA),  // Physical memory protection address register
    PMPADDR11       = UBVEC!(12, 0x3BB),  // Physical memory protection address register
    PMPADDR12       = UBVEC!(12, 0x3BC),  // Physical memory protection address register
    PMPADDR13       = UBVEC!(12, 0x3BD),  // Physical memory protection address register
    PMPADDR14       = UBVEC!(12, 0x3BE),  // Physical memory protection address register
    PMPADDR15       = UBVEC!(12, 0x3BF),  // Physical memory protection address register
    PMPADDR16       = UBVEC!(12, 0x4C0),  // Physical memory protection address register
    PMPADDR17       = UBVEC!(12, 0x3C1),  // Physical memory protection address register
    PMPADDR18       = UBVEC!(12, 0x3C2),  // Physical memory protection address register
    PMPADDR19       = UBVEC!(12, 0x3C3),  // Physical memory protection address register
    PMPADDR20       = UBVEC!(12, 0x3C4),  // Physical memory protection address register
    PMPADDR21       = UBVEC!(12, 0x3C5),  // Physical memory protection address register
    PMPADDR22       = UBVEC!(12, 0x3C6),  // Physical memory protection address register
    PMPADDR23       = UBVEC!(12, 0x3C7),  // Physical memory protection address register
    PMPADDR24       = UBVEC!(12, 0x3C8),  // Physical memory protection address register
    PMPADDR25       = UBVEC!(12, 0x3C9),  // Physical memory protection address register
    PMPADDR26       = UBVEC!(12, 0x3CA),  // Physical memory protection address register
    PMPADDR27       = UBVEC!(12, 0x3CB),  // Physical memory protection address register
    PMPADDR28       = UBVEC!(12, 0x3CC),  // Physical memory protection address register
    PMPADDR29       = UBVEC!(12, 0x3CD),  // Physical memory protection address register
    PMPADDR30       = UBVEC!(12, 0x3CE),  // Physical memory protection address register
    PMPADDR31       = UBVEC!(12, 0x3CF),  // Physical memory protection address register
    PMPADDR32       = UBVEC!(12, 0x4D0),  // Physical memory protection address register
    PMPADDR33       = UBVEC!(12, 0x3D1),  // Physical memory protection address register
    PMPADDR34       = UBVEC!(12, 0x3D2),  // Physical memory protection address register
    PMPADDR35       = UBVEC!(12, 0x3D3),  // Physical memory protection address register
    PMPADDR36       = UBVEC!(12, 0x3D4),  // Physical memory protection address register
    PMPADDR37       = UBVEC!(12, 0x3D5),  // Physical memory protection address register
    PMPADDR38       = UBVEC!(12, 0x3D6),  // Physical memory protection address register
    PMPADDR39       = UBVEC!(12, 0x3D7),  // Physical memory protection address register
    PMPADDR40       = UBVEC!(12, 0x3D8),  // Physical memory protection address register
    PMPADDR41       = UBVEC!(12, 0x3D9),  // Physical memory protection address register
    PMPADDR42       = UBVEC!(12, 0x3DA),  // Physical memory protection address register
    PMPADDR43       = UBVEC!(12, 0x3DB),  // Physical memory protection address register
    PMPADDR44       = UBVEC!(12, 0x3DC),  // Physical memory protection address register
    PMPADDR45       = UBVEC!(12, 0x3DD),  // Physical memory protection address register
    PMPADDR46       = UBVEC!(12, 0x3DE),  // Physical memory protection address register
    PMPADDR47       = UBVEC!(12, 0x3DF),  // Physical memory protection address register
    PMPADDR48       = UBVEC!(12, 0x4E0),  // Physical memory protection address register
    PMPADDR49       = UBVEC!(12, 0x3E1),  // Physical memory protection address register
    PMPADDR50       = UBVEC!(12, 0x3E2),  // Physical memory protection address register
    PMPADDR51       = UBVEC!(12, 0x3E3),  // Physical memory protection address register
    PMPADDR52       = UBVEC!(12, 0x3E4),  // Physical memory protection address register
    PMPADDR53       = UBVEC!(12, 0x3E5),  // Physical memory protection address register
    PMPADDR54       = UBVEC!(12, 0x3E6),  // Physical memory protection address register
    PMPADDR55       = UBVEC!(12, 0x3E7),  // Physical memory protection address register
    PMPADDR56       = UBVEC!(12, 0x3E8),  // Physical memory protection address register
    PMPADDR57       = UBVEC!(12, 0x3E9),  // Physical memory protection address register
    PMPADDR58       = UBVEC!(12, 0x3EA),  // Physical memory protection address register
    PMPADDR59       = UBVEC!(12, 0x3EB),  // Physical memory protection address register
    PMPADDR60       = UBVEC!(12, 0x3EC),  // Physical memory protection address register
    PMPADDR61       = UBVEC!(12, 0x3ED),  // Physical memory protection address register
    PMPADDR62       = UBVEC!(12, 0x3EE),  // Physical memory protection address register
    PMPADDR63       = UBVEC!(12, 0x3EF),  // Physical memory protection address register
    MCYCLE          = UBVEC!(12, 0xB00),  // Machine cycle counter
    MINSTRET        = UBVEC!(12, 0xB02),  // Machine instructions-retired counter
    MHPMCOUNTER3    = UBVEC!(12, 0xB03),  // Machine performance-monitoring counter
    MHPMCOUNTER4    = UBVEC!(12, 0xB04),  // Machine performance-monitoring counter
    MHPMCOUNTER5    = UBVEC!(12, 0xB05),  // Machine performance-monitoring counter
    MHPMCOUNTER6    = UBVEC!(12, 0xB06),  // Machine performance-monitoring counter
    MHPMCOUNTER7    = UBVEC!(12, 0xB07),  // Machine performance-monitoring counter
    MHPMCOUNTER8    = UBVEC!(12, 0xB08),  // Machine performance-monitoring counter
    MHPMCOUNTER9    = UBVEC!(12, 0xB09),  // Machine performance-monitoring counter
    MHPMCOUNTER10   = UBVEC!(12, 0xB0A),  // Machine performance-monitoring counter
    MHPMCOUNTER11   = UBVEC!(12, 0xB0B),  // Machine performance-monitoring counter
    MHPMCOUNTER12   = UBVEC!(12, 0xB0C),  // Machine performance-monitoring counter
    MHPMCOUNTER13   = UBVEC!(12, 0xB0D),  // Machine performance-monitoring counter
    MHPMCOUNTER14   = UBVEC!(12, 0xB0E),  // Machine performance-monitoring counter
    MHPMCOUNTER15   = UBVEC!(12, 0xB0F),  // Machine performance-monitoring counter
    MHPMCOUNTER16   = UBVEC!(12, 0xB10),  // Machine performance-monitoring counter
    MHPMCOUNTER17   = UBVEC!(12, 0xB11),  // Machine performance-monitoring counter
    MHPMCOUNTER18   = UBVEC!(12, 0xB12),  // Machine performance-monitoring counter
    MHPMCOUNTER19   = UBVEC!(12, 0xB13),  // Machine performance-monitoring counter
    MHPMCOUNTER20   = UBVEC!(12, 0xB14),  // Machine performance-monitoring counter
    MHPMCOUNTER21   = UBVEC!(12, 0xB15),  // Machine performance-monitoring counter
    MHPMCOUNTER22   = UBVEC!(12, 0xB16),  // Machine performance-monitoring counter
    MHPMCOUNTER23   = UBVEC!(12, 0xB17),  // Machine performance-monitoring counter
    MHPMCOUNTER24   = UBVEC!(12, 0xB18),  // Machine performance-monitoring counter
    MHPMCOUNTER25   = UBVEC!(12, 0xB19),  // Machine performance-monitoring counter
    MHPMCOUNTER26   = UBVEC!(12, 0xB1A),  // Machine performance-monitoring counter
    MHPMCOUNTER27   = UBVEC!(12, 0xB1B),  // Machine performance-monitoring counter
    MHPMCOUNTER28   = UBVEC!(12, 0xB1C),  // Machine performance-monitoring counter
    MHPMCOUNTER29   = UBVEC!(12, 0xB1D),  // Machine performance-monitoring counter
    MHPMCOUNTER30   = UBVEC!(12, 0xB1E),  // Machine performance-monitoring counter
    MHPMCOUNTER31   = UBVEC!(12, 0xB1F),  // Machine performance-monitoring counter
    MCYCLEH         = UBVEC!(12, 0xB80),  // Upper 32 bits of MCYCLE, RV32I only
    MINSTRETH       = UBVEC!(12, 0xB82),  // Upper 32 bits of MINSTRET, RV32I only
    MHPMCOUNTER3H   = UBVEC!(12, 0xB83),  // Upper 32 bits of HPMCOUNTER3, RV32I only
    MHPMCOUNTER4H   = UBVEC!(12, 0xB84),  // Upper 32 bits of HPMCOUNTER4, RV32I only
    MHPMCOUNTER5H   = UBVEC!(12, 0xB85),  // Upper 32 bits of HPMCOUNTER5, RV32I only
    MHPMCOUNTER6H   = UBVEC!(12, 0xB86),  // Upper 32 bits of HPMCOUNTER6, RV32I only
    MHPMCOUNTER7H   = UBVEC!(12, 0xB87),  // Upper 32 bits of HPMCOUNTER7, RV32I only
    MHPMCOUNTER8H   = UBVEC!(12, 0xB88),  // Upper 32 bits of HPMCOUNTER8, RV32I only
    MHPMCOUNTER9H   = UBVEC!(12, 0xB89),  // Upper 32 bits of HPMCOUNTER9, RV32I only
    MHPMCOUNTER10H  = UBVEC!(12, 0xB8A),  // Upper 32 bits of HPMCOUNTER10, RV32I only
    MHPMCOUNTER11H  = UBVEC!(12, 0xB8B),  // Upper 32 bits of HPMCOUNTER11, RV32I only
    MHPMCOUNTER12H  = UBVEC!(12, 0xB8C),  // Upper 32 bits of HPMCOUNTER12, RV32I only
    MHPMCOUNTER13H  = UBVEC!(12, 0xB8D),  // Upper 32 bits of HPMCOUNTER13, RV32I only
    MHPMCOUNTER14H  = UBVEC!(12, 0xB8E),  // Upper 32 bits of HPMCOUNTER14, RV32I only
    MHPMCOUNTER15H  = UBVEC!(12, 0xB8F),  // Upper 32 bits of HPMCOUNTER15, RV32I only
    MHPMCOUNTER16H  = UBVEC!(12, 0xB90),  // Upper 32 bits of HPMCOUNTER16, RV32I only
    MHPMCOUNTER17H  = UBVEC!(12, 0xB91),  // Upper 32 bits of HPMCOUNTER17, RV32I only
    MHPMCOUNTER18H  = UBVEC!(12, 0xB92),  // Upper 32 bits of HPMCOUNTER18, RV32I only
    MHPMCOUNTER19H  = UBVEC!(12, 0xB93),  // Upper 32 bits of HPMCOUNTER19, RV32I only
    MHPMCOUNTER20H  = UBVEC!(12, 0xB94),  // Upper 32 bits of HPMCOUNTER20, RV32I only
    MHPMCOUNTER21H  = UBVEC!(12, 0xB95),  // Upper 32 bits of HPMCOUNTER21, RV32I only
    MHPMCOUNTER22H  = UBVEC!(12, 0xB96),  // Upper 32 bits of HPMCOUNTER22, RV32I only
    MHPMCOUNTER23H  = UBVEC!(12, 0xB97),  // Upper 32 bits of HPMCOUNTER23, RV32I only
    MHPMCOUNTER24H  = UBVEC!(12, 0xB98),  // Upper 32 bits of HPMCOUNTER24, RV32I only
    MHPMCOUNTER25H  = UBVEC!(12, 0xB99),  // Upper 32 bits of HPMCOUNTER25, RV32I only
    MHPMCOUNTER26H  = UBVEC!(12, 0xB9A),  // Upper 32 bits of HPMCOUNTER26, RV32I only
    MHPMCOUNTER27H  = UBVEC!(12, 0xB9B),  // Upper 32 bits of HPMCOUNTER27, RV32I only
    MHPMCOUNTER28H  = UBVEC!(12, 0xB9C),  // Upper 32 bits of HPMCOUNTER28, RV32I only
    MHPMCOUNTER29H  = UBVEC!(12, 0xB9D),  // Upper 32 bits of HPMCOUNTER29, RV32I only
    MHPMCOUNTER30H  = UBVEC!(12, 0xB9E),  // Upper 32 bits of HPMCOUNTER30, RV32I only
    MHPMCOUNTER31H  = UBVEC!(12, 0xB9F),  // Upper 32 bits of HPMCOUNTER31, RV32I only
    MCOUNTINHIBIT   = UBVEC!(12, 0x320),  // Machine counter-inhibit register
    MHPMEVENT3      = UBVEC!(12, 0x323),  // Machine performance-monitoring event selector
    MHPMEVENT4      = UBVEC!(12, 0x324),  // Machine performance-monitoring event selector
    MHPMEVENT5      = UBVEC!(12, 0x325),  // Machine performance-monitoring event selector
    MHPMEVENT6      = UBVEC!(12, 0x326),  // Machine performance-monitoring event selector
    MHPMEVENT7      = UBVEC!(12, 0x327),  // Machine performance-monitoring event selector
    MHPMEVENT8      = UBVEC!(12, 0x328),  // Machine performance-monitoring event selector
    MHPMEVENT9      = UBVEC!(12, 0x329),  // Machine performance-monitoring event selector
    MHPMEVENT10     = UBVEC!(12, 0x32A),  // Machine performance-monitoring event selector
    MHPMEVENT11     = UBVEC!(12, 0x32B),  // Machine performance-monitoring event selector
    MHPMEVENT12     = UBVEC!(12, 0x32C),  // Machine performance-monitoring event selector
    MHPMEVENT13     = UBVEC!(12, 0x32D),  // Machine performance-monitoring event selector
    MHPMEVENT14     = UBVEC!(12, 0x32E),  // Machine performance-monitoring event selector
    MHPMEVENT15     = UBVEC!(12, 0x32F),  // Machine performance-monitoring event selector
    MHPMEVENT16     = UBVEC!(12, 0x330),  // Machine performance-monitoring event selector
    MHPMEVENT17     = UBVEC!(12, 0x331),  // Machine performance-monitoring event selector
    MHPMEVENT18     = UBVEC!(12, 0x332),  // Machine performance-monitoring event selector
    MHPMEVENT19     = UBVEC!(12, 0x333),  // Machine performance-monitoring event selector
    MHPMEVENT20     = UBVEC!(12, 0x334),  // Machine performance-monitoring event selector
    MHPMEVENT21     = UBVEC!(12, 0x335),  // Machine performance-monitoring event selector
    MHPMEVENT22     = UBVEC!(12, 0x336),  // Machine performance-monitoring event selector
    MHPMEVENT23     = UBVEC!(12, 0x337),  // Machine performance-monitoring event selector
    MHPMEVENT24     = UBVEC!(12, 0x338),  // Machine performance-monitoring event selector
    MHPMEVENT25     = UBVEC!(12, 0x339),  // Machine performance-monitoring event selector
    MHPMEVENT26     = UBVEC!(12, 0x33A),  // Machine performance-monitoring event selector
    MHPMEVENT27     = UBVEC!(12, 0x33B),  // Machine performance-monitoring event selector
    MHPMEVENT28     = UBVEC!(12, 0x33C),  // Machine performance-monitoring event selector
    MHPMEVENT29     = UBVEC!(12, 0x33D),  // Machine performance-monitoring event selector
    MHPMEVENT30     = UBVEC!(12, 0x33E),  // Machine performance-monitoring event selector
    MHPMEVENT31     = UBVEC!(12, 0x33F),  // Machine performance-monitoring event selector
    // Debug/Trace Registers (shared with Debug Mode)
    TSELECT         = UBVEC!(12, 0x7A0),  // Debug/Trace trigger register select
    TDATA1          = UBVEC!(12, 0x7A1),  // First Debug/Trace trigger data register
    TDATA2          = UBVEC!(12, 0x7A2),  // Second Debug/Trace trigger data register
    TDATA3          = UBVEC!(12, 0x7A3),  // Third Debug/Trace trigger data register
    TINFO           = UBVEC!(12, 0x7A4),  // Debug trigger info register
    TCONTROL        = UBVEC!(12, 0x7A5),  // Debug trigger control register
    MCONTEXT        = UBVEC!(12, 0x7A8),  // Machine mode trigger context register
    MSCONTEXT       = UBVEC!(12, 0x7AA),  // Supervisor mode trigger context register
    // Debug Mode Registers
    DCSR            = UBVEC!(12, 0x7B0),  // Debug control and status register
    DPC             = UBVEC!(12, 0x7B1),  // Debug PC
    DSCRATCH0       = UBVEC!(12, 0x7B2),  // Debug scratch register
    DSCRATCH1       = UBVEC!(12, 0x7B3),  // Debug scratch register (last one)
    VSTART          = UBVEC!(12, 0x008),  // Vector start position
    VXSTAT          = UBVEC!(12, 0x009),  // Fixed point saturate flag
    VXRM            = UBVEC!(12, 0x00A),  // Fixed point rounding mode
    VL              = UBVEC!(12, 0xC20),  // Vector length
    VTYPE           = UBVEC!(12, 0xC21),  // Vector data type register
    VLENB           = UBVEC!(12, 0xC22),   // VLEN/8 (vector register length in bytes)
}

enum privileged_reg_fld_t: ubvec!5 {
  RSVD       = UBVEC!(5, 0),  // Reserved field
  MXL        = UBVEC!(5, 1),  // mis.mxl
  EXTENSION  = UBVEC!(5, 2),  // mis.extension
  MODE       = UBVEC!(5, 3),  // satp.mode
  ASID       = UBVEC!(5, 4),  // satp.asid
  PPN        = UBVEC!(5, 5)   // satp.ppn
}

enum privileged_level_t: ubvec!2 {
  M_LEVEL = UBVEC!(2, 0b11),  // Machine mode
  S_LEVEL = UBVEC!(2, 0b01),  // Supervisor mode
  U_LEVEL = UBVEC!(2, 0b00)   // User mode
}

enum reg_field_access_t: ubvec!2 {
  WPRI = UBVEC!(2, 0b00), // Reserved Writes Preserve Values, Reads Ignore Value
  WLRL = UBVEC!(2, 0b01), // Write/Read Only Legal Values
  WARL = UBVEC!(2, 0b10)  // Write Any Values, Reads Legal Values
}

//Pseudo instructions
enum riscv_pseudo_instr_name_t: ubyte {
  LI = 0,
  LA
}

// Data pattern of the memory model
enum data_pattern_t: ubvec!2 {
  RAND_DATA = UBVEC!(2, 0b00),
  ALL_ZERO  = UBVEC!(2, 0b01),
  INCR_VAL  = UBVEC!(2, 0b10)
}

enum pte_permission_t: ubvec!3 {
  NEXT_LEVEL_PAGE   = UBVEC!(3, 0b000), // Pointer to next level of page table.
  READ_ONLY_PAGE    = UBVEC!(3, 0b001), // Read-only page.
  READ_WRITE_PAGE   = UBVEC!(3, 0b011), // Read-write page.
  EXECUTE_ONLY_PAGE = UBVEC!(3, 0b100), // Execute-only page.
  READ_EXECUTE_PAGE = UBVEC!(3, 0b101), // Read-execute page.
  R_W_EXECUTE_PAGE  = UBVEC!(3, 0b111)  // Read-write-execute page
}

enum interrupt_cause_t: ubyte {
  U_SOFTWARE_INTR  = 0x0,
  S_SOFTWARE_INTR  = 0x1,
  M_SOFTWARE_INTR  = 0x3,
  U_TIMER_INTR     = 0x4,
  S_TIMER_INTR     = 0x5,
  M_TIMER_INTR     = 0x7,
  U_EXTERNAL_INTR  = 0x8,
  S_EXTERNAL_INTR  = 0x9,
  M_EXTERNAL_INTR  = 0xB
}

enum exception_cause_t: ubyte {
  INSTRUCTION_ADDRESS_MISALIGNED = 0x0,
  INSTRUCTION_ACCESS_FAULT       = 0x1,
  ILLEGAL_INSTRUCTION            = 0x2,
  BREAKPOINT                     = 0x3,
  LOAD_ADDRESS_MISALIGNED        = 0x4,
  LOAD_ACCESS_FAULT              = 0x5,
  STORE_AMO_ADDRESS_MISALIGNED   = 0x6,
  STORE_AMO_ACCESS_FAULT         = 0x7,
  ECALL_UMODE                    = 0x8,
  ECALL_SMODE                    = 0x9,
  ECALL_MMODE                    = 0xB,
  INSTRUCTION_PAGE_FAULT         = 0xC,
  LOAD_PAGE_FAULT                = 0xD,
  STORE_AMO_PAGE_FAULT           = 0xF
}

enum  misa_ext_t: int {
  MISA_EXT_A = 0,
  MISA_EXT_B,
  MISA_EXT_C,
  MISA_EXT_D,
  MISA_EXT_E,
  MISA_EXT_F,
  MISA_EXT_G,
  MISA_EXT_H,
  MISA_EXT_I,
  MISA_EXT_J,
  MISA_EXT_K,
  MISA_EXT_L,
  MISA_EXT_M,
  MISA_EXT_N,
  MISA_EXT_O,
  MISA_EXT_P,
  MISA_EXT_Q,
  MISA_EXT_R,
  MISA_EXT_S,
  MISA_EXT_T,
  MISA_EXT_U,
  MISA_EXT_V,
  MISA_EXT_W,
  MISA_EXT_X,
  MISA_EXT_Y,
  MISA_EXT_Z
}

enum hazard_e: ubvec!2 {
  NO_HAZARD   = UBVEC!(2, 0b00),
  RAW_HAZARD  = UBVEC!(2, 0b01),
  WAR_HAZARD  = UBVEC!(2, 0b10),
  WAW_HAZARD  = UBVEC!(2, 0b11)
}

riscv_csr_t[] default_include_csr_write = [privileged_reg_t.MSCRATCH];

// `include "riscv_core_setting.sv"

// ePMP machine security configuration
struct mseccfg_reg_t {
  @UVM_DEFAULT {
    @rand bool rlb;
    @rand bool mmwp;
    @rand bool mml;
  }
}

// PMP address matching mode
enum pmp_addr_mode_t: ubvec!2 {
  OFF   = UBVEC!(2, 0b00),
  TOR   = UBVEC!(2, 0b01),
  NA4   = UBVEC!(2, 0b10),
  NAPOT = UBVEC!(2, 0b11)
}

//   // PMP configuration register layout
//   // This configuration struct includes the pmp address for simplicity
//   // TODO (udinator) allow a full 34 bit address for rv32?
// `ifdef _VCP //GRK958
//   typedef struct packed {
//     bit                   l;
//     bit [1:0]                  zero;
//     pmp_addr_mode_t       a;
//     bit                   x;
//     bit                   w;
//     bit                   r;
//     // RV32: the pmpaddr is the top 32 bits of a 34 bit PMP address
//     // RV64: the pmpaddr is the top 54 bits of a 56 bit PMP address
//     bit [XLEN - 1 : 0]    addr;
//     // The offset from the address of <main> - automatically populated by the
//     // PMP generation routine.
//     bit [XLEN - 1 : 0]    offset;
// `else
struct pmp_cfg_reg_t {
  @rand bool                   l;
  ubvec!2                      zero;
  @rand pmp_addr_mode_t        a;
  @rand bool                   x;
  @rand bool                   w;
  @rand bool                   r;
  // RV32: the pmpaddr is the top 32 bits of a 34 bit PMP address
  // RV64: the pmpaddr is the top 54 bits of a 56 bit PMP address
  @rand ubvec!XLEN    addr;
  // The offset from the address of <main> - automatically populated by the
  // PMP generation routine.
  @rand ubvec!XLEN    offset;
  // The size of the region in case of NAPOT and overlap in case of TOR.
  @rand int addr_mode;
}


string hart_prefix(int hart = 0) {
  if (NUM_HARTS <= 1) {
    return "";
  }
  else {
    import std.string: format;
    return format("h%0d_", hart);
  }
}

string get_label(string label, int hart = 0) {
  return hart_prefix(hart) ~ label;
}

struct vtype_t {
  @UVM_DEFAULT {
    @rand bool ill;
    @rand bool fractional_lmul;
    @rand ubvec!(XLEN-8) reserved;
    @rand uint vediv;
    @rand uint vsew;
    @rand uint vlmul;
  }
}


enum vxrm_t: ubvec!2 {
  RoundToNearestUp    = UBVEC!(2, 0b00),
  RoundToNearestEven  = UBVEC!(2, 0b01),
  RoundDown           = UBVEC!(2, 0b10),
  RoundToOdd          = UBVEC!(2, 0b11)
}

enum  b_ext_group_t: int {
  ZBA,
  ZBB,
  ZBS,
  ZBP,
  ZBE,
  ZBF,
  ZBC,
  ZBR,
  ZBM,
  ZBT,
  ZB_TMP // for uncategorized instructions
}

// `VECTOR_INCLUDE("riscv_instr_pkg_inc_variables.sv")

alias program_id_t = ubvec!16;

// xSTATUS bit mask
enum ubvec!XLEN MPRV_BIT_MASK = 0x1 << 17;
enum ubvec!XLEN SUM_BIT_MASK  = 0x1 << 18;
enum ubvec!XLEN MPP_BIT_MASK  = 0x3 << 11;

enum int IMM25_WIDTH = 25;
enum int IMM12_WIDTH = 12;
enum int INSTR_WIDTH = 32;
enum int DATA_WIDTH  = 32;

// Enum Ints for output assembly program formatting
enum int MAX_INSTR_STR_LEN = 13;
enum int LABEL_STR_LEN     = 18;

// Enum Int for program generation
enum int MAX_CALLSTACK_DEPTH = 20;
enum int MAX_SUB_PROGRAM_CNT = 20;
enum int MAX_CALL_PER_FUNC   = 5;

template SPACES(uint spaces) {
  static if (spaces == 0) enum SPACES = "";
  else enum SPACES = SPACES!(spaces-1) ~ " ";
}

enum string INDENT = SPACES!LABEL_STR_LEN;

string spaces_string(uint len) {
  import std.algorithm: fill;
  char[] str = new char[len];
  fill(str, ' ');
  return cast(string) str;
}


// Format the string to a fixed length
string format_string(string str, int len = 10) {
  if (len < str.length) return str;
  else {
    static string spaces;
    if (spaces.length < len) spaces = spaces_string(len);
    return str ~ spaces[0..len-str.length];
  }
}

// Print the data in the following format
// 0xabcd, 0x1234, 0x3334 ...

string format_data(ubyte[] data, uint byte_per_group=4) {
  import std.string: format;
  string str = "0x";
  foreach (i, d; data) {
    if ((i % byte_per_group == 0) && (i != data.length - 1) && (i != 0)) {
      str ~= ", 0x";
    }
    str ~= format("%02x", d);
  }
  return str;
}

// Get the instr name enum from a string
riscv_instr_name_t get_instr_name(string str) {
  import std.string: toUpper;
  alias enum_wrapper = uvm_enum_wrapper!riscv_instr_name_t;
  riscv_instr_name_t value;
  if (enum_wrapper.from_name(toUpper(str), value)) {
    return value;
  }
  else {
    return riscv_instr_name_t.INVALID_INSTR;
  }
}

// Push general purpose register to stack, this is needed before trap handling4
void push_gpr_to_kernel_stack(privileged_reg_t status,
			      privileged_reg_t scratch,
			      bool mprv,
			      riscv_reg_t sp,
			      riscv_reg_t tp,
			      ref string[] instr) {
  import std.algorithm: canFind;
  import std.string: format;

  string store_instr = (XLEN == 32) ? "sw" : "sd";
  if (canFind(implemented_csr, scratch)) {
    // Push USP from gpr.SP onto the kernel stack
    instr ~= format("addi x%0d, x%0d, -4", tp, tp);
    instr ~= format("%0s  x%0d, (x%0d)", store_instr, sp, tp);
    // Move KSP to gpr.SP
    instr ~= format("add x%0d, x%0d, zero", sp, tp);
  }
  // If MPRV is set and MPP is S/U mode, it means the address translation and memory protection
  // for load/store instruction is the same as the mode indicated by MPP. In this case, we
  // need to use the virtual address to access the kernel stack.
  if ((status == privileged_reg_t.MSTATUS) && (SATP_MODE != satp_mode_t.BARE)) {
    // We temporarily use tp to check mstatus to avoid changing other GPR.
    // (The value of sp has been pushed to the kernel stack, so can be recovered later)
    if (mprv) {
      instr ~= format("csrr x%0d, 0x%0x // MSTATUS", tp, status);
      instr ~= format("srli x%0d, x%0d, 11", tp, tp);  // Move MPP to bit 0
      instr ~= format("andi x%0d, x%0d, 0x3", tp, tp); // keep the MPP bits
      // Check if MPP equals to M-mode('b11)
      instr ~= format("xori x%0d, x%0d, 0x3", tp, tp); // Check if MPP equals to M-mode('b11)
      instr ~= format("bnez x%0d, 1f", tp);      // Use physical address for kernel SP
      // Use virtual address for stack pointer
      instr ~= format("slli x%0d, x%0d, %0d", sp, sp, XLEN - MAX_USED_VADDR_BITS);
      instr ~= format("srli x%0d, x%0d, %0d", sp, sp, XLEN - MAX_USED_VADDR_BITS);
      instr ~= "1: nop";
    }
  }
  // Push all GPRs (except for x0) to kernel stack
  // (gpr.SP currently holds the KSP)
  instr ~= format("addi x%0d, x%0d, -%0d", sp, sp, 32 * (XLEN/8));
  for (int i = 1; i < 32; i++) {
    instr ~= format("%0s  x%0d, %0d(x%0d)", store_instr, i, i * (XLEN/8), sp);
  }
  // Move KSP back to gpr.TP
  // (this is needed if we again take a interrupt (nested) before restoring our USP)
  instr ~= format("add x%0d, x%0d, zero", tp, sp);
}

// Pop general purpose register from stack, this is needed before returning to user program
void pop_gpr_from_kernel_stack(privileged_reg_t status,
			       privileged_reg_t scratch,
			       bool mprv,
			       riscv_reg_t sp,
			       riscv_reg_t tp,
			       ref string[] instr) {
  import std.algorithm: canFind;
  import std.string: format;

  string load_instr = (XLEN == 32) ? "lw" : "ld";
  // Move KSP to gpr.SP
  instr ~= format("add x%0d, x%0d, zero", sp, tp);
  // Pop GPRs from kernel stack
  for (int i = 1; i < 32; i++) {
    instr ~= format("%0s  x%0d, %0d(x%0d)", load_instr, i, i * (XLEN/8), sp);
  }
  instr ~= format("addi x%0d, x%0d, %0d", sp, sp, 32 * (XLEN/8));
  if (canFind(implemented_csr, scratch)) {
    // Move KSP back to gpr.TP
    instr ~= format("add x%0d, x%0d, zero", tp, sp);
    // Pop USP from the kernel stack, move back to gpr.SP
    instr ~= format("%0s  x%0d, (x%0d)", load_instr, sp, tp);
    instr ~= format("addi x%0d, x%0d, 4", tp, tp);
  }
}

void get_int_arg_value(string cmdline_str, ref int val) {
  import std.conv: to;
  string s;
  if (uvm_cmdline_processor.get_inst().get_arg_value(cmdline_str, s)) {
    val = s.to!int;
  }
}

void get_uint_arg_value(string cmdline_str, ref uint val) {
  import std.conv: to;
  string s;
  if (uvm_cmdline_processor.get_inst().get_arg_value(cmdline_str, s)) {
    val = s.to!uint;
  }
}


// Get a bool argument from comand line
void get_bool_arg_value(string cmdline_str, ref bool val) {
  import std.conv: to;
  string s;
  if (uvm_cmdline_processor.get_inst().get_arg_value(cmdline_str, s)) {
    val = s.to!bool;
  }
}

// Get a hex argument from command line
void get_hex_arg_value(string cmdline_str, ref int val) {
  import std.conv: to;
  string s;
  if(uvm_cmdline_processor.get_inst().get_arg_value(cmdline_str, s)) {
    val = s.to!int(16);
  }
}


class cmdline_enum_processor(T)
{
  static void get_array_values(string cmdline_str, bool allow_raw_vals, ref T[] vals) {
    import std.format: format;
    import std.conv: parse;
    import std.traits: OriginalType;
    string s;
    uvm_cmdline_processor.get_inst().get_arg_value(cmdline_str, s);
    if (s != "") {
      string[] cmdline_list;
      T value;
      uvm_string_split(s, ',', cmdline_list);
      vals.length = cmdline_list.length;
      foreach (i, str; cmdline_list) {
	import std.string: toUpper;
	if (allow_raw_vals && str[0..2] == "0x") {
	  // SV version declares a logic vec and then uses atohex
	  // atohex always returns an int though -- so let us use int
	  // enum C = bits!T;
	  // ulvec!C raw_val;
	  string valstr = str[2..$].dup;
	  int raw_val = parse!(int, string)(valstr, 16);
	  static if (isBitVector!T) {
	    ubvec!32 raw_bvec = raw_val.toubvec!32;
	    vals[i] = cast(T) raw_bvec; // cast to enum
	  }
	  else {
	    vals[i] = cast(T) raw_val; // cast to enum
	  }
	}
	else if (uvm_enum_wrapper!T.from_name(toUpper(str), value)) {
	  vals[i] = value;
	}
	else {
	  uvm_fatal("riscv_instr_pkg",
		    format("Invalid value (%0s) specified in command line: %0s",
			   str, cmdline_str));
	}
      }
    }
  }
}

enum riscv_reg_t[] all_gpr = [EnumMembers!riscv_reg_t];

enum riscv_reg_t[] compressed_gpr = [riscv_reg_t.S0, riscv_reg_t.S1,
				     riscv_reg_t.A0, riscv_reg_t.A1,
				     riscv_reg_t.A2, riscv_reg_t.A3,
				     riscv_reg_t.A4, riscv_reg_t.A5];

enum riscv_instr_category_t[] all_categories =
  [EnumMembers!riscv_instr_category_t];

void get_val(string str, out bvec!XLEN val, bool hex = 0) {
  import std.string: format;
  import std.conv: to;
  if (str[0..2] == "0x") {
    str = str[2..$];
    val = str.to!int(16);
    return;
  }

  if (hex) {
    val = str.to!int(16);
  }
  else {
    if (str[0] == '-') {
      str = str[1..$];
      val = -(str.to!int());
    }
    else {
      val = str.to!int();
    }
  }
  uvm_info("riscv_instr_pkg", format("imm:%0s -> 0x%0x/%0d", str, val,
				     cast(bvec!XLEN) val), UVM_FULL);
}

