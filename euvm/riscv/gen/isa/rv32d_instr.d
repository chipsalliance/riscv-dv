/*
 * Copyright 2020 Google LLC
 * Copyright 2021 Coverify Systems Technology
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

module riscv.gen.isa.rv32d_instr;

import riscv.gen.riscv_defines;

import uvm;

mixin (riscv_fp_instr_mixin(FLD,       I_FORMAT, LOAD, RV32D));
mixin (riscv_fp_instr_mixin(FSD,       S_FORMAT, STORE, RV32D));
mixin (riscv_fp_instr_mixin(FMADD_D,   R4_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FMSUB_D,   R4_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FNMSUB_D,  R4_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FNMADD_D,  R4_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FADD_D,    R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FSUB_D,    R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FMUL_D,    R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FDIV_D,    R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FSQRT_D,   I_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FSGNJ_D,   R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FSGNJN_D,  R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FSGNJX_D,  R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FMIN_D,    R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FMAX_D,    R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FCVT_S_D,  I_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FCVT_D_S,  I_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FEQ_D,     R_FORMAT, COMPARE, RV32D));
mixin (riscv_fp_instr_mixin(FLT_D,     R_FORMAT, COMPARE, RV32D));
mixin (riscv_fp_instr_mixin(FLE_D,     R_FORMAT, COMPARE, RV32D));
mixin (riscv_fp_instr_mixin(FCLASS_D,  R_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FCVT_W_D,  I_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FCVT_WU_D, I_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FCVT_D_W,  I_FORMAT, ARITHMETIC, RV32D));
mixin (riscv_fp_instr_mixin(FCVT_D_WU, I_FORMAT, ARITHMETIC, RV32D));
