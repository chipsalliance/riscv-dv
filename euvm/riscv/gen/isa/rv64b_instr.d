/*
 * Copyright 2019 Google LLC
 * Copyright 2019 Mellanox Technologies Ltd
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

module riscv.gen.isa.rv64b_instr;

import riscv.gen.riscv_defines;

import uvm;

// ARITHMETIC intructions
mixin (riscv_b_instr_mixin(BMATOR,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(BMATXOR,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(BMATFLIP,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CRC32_D,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CRC32C_D,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(ADDIWU,   I_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(ADDWU,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(SUBWU,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(ADDU_W,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(SUBU_W,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CLZW,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CTZW,    R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(PCNTW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CLMULW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CLMULRW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(CLMULHW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(SHFLW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(UNSHFLW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(BDEPW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(BEXTW,   R_FORMAT, ARITHMETIC, RV64B));
mixin (riscv_b_instr_mixin(BFPW,   R_FORMAT, ARITHMETIC, RV64B));

// SHIFT intructions
mixin (riscv_b_instr_mixin(SLLIU_W,    I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(SLOW,    R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(SROW,    R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(ROLW,    R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(RORW,    R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(SBCLRW,   R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(SBSETW,   R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(SBINVW,   R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(SBEXTW,   R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(GREVW,    R_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(SLOIW ,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(SROIW ,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(RORIW ,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(SBCLRIW ,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(SBSETIW ,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(SBINVIW ,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(GREVIW,   I_FORMAT, SHIFT, RV64B, UIMM));
mixin (riscv_b_instr_mixin(FSLW,   R4_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(FSRW,   R4_FORMAT, SHIFT, RV64B));
mixin (riscv_b_instr_mixin(FSRIW,   I_FORMAT, SHIFT, RV64B, UIMM));

// LOGICAL instructions
mixin (riscv_b_instr_mixin(GORCW,    R_FORMAT, LOGICAL, RV64B));
mixin (riscv_b_instr_mixin(GORCIW,   I_FORMAT, LOGICAL, RV64B, UIMM));
mixin (riscv_b_instr_mixin(PACKW,    R_FORMAT, LOGICAL, RV64B));
mixin (riscv_b_instr_mixin(PACKUW,   R_FORMAT, LOGICAL, RV64B));

