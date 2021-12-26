/*
 * Copyright 2019 Google LLC
 * Copyright 2019 Mellanox Technologies Ltd
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

module riscv.gen.isa.rv32b_instr;

import riscv.gen.riscv_defines;

import uvm;

// Remaining bitmanip instructions of draft v.0.93 not ratified in v.1.00 (Zba, Zbb, Zbc, Zbs).

// LOGICAL instructions
mixin (riscv_b_instr_mixin(GORC,     R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(GORCI,    I_FORMAT, LOGICAL, RV32B, UIMM));
mixin (riscv_b_instr_mixin(CMIX,    R4_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(CMOV,    R4_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(PACK,     R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(PACKU,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(PACKH,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(XPERM_N,  R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(XPERM_B,  R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(XPERM_H,  R_FORMAT, LOGICAL, RV32B));
// SHIFT intructions
mixin (riscv_b_instr_mixin(SLO,    R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SRO,    R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SLOI,   I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SROI,   I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(GREV,   R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(GREVI,  I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(FSL,   R4_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(FSR,   R4_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(FSRI,   I_FORMAT, SHIFT, RV32B, UIMM));
// ARITHMETIC intructions
mixin (riscv_b_instr_mixin(CRC32_B,     R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32_H,     R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32_W,     R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32C_B,    R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32C_H,    R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32C_W,    R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(SHFL,        R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(UNSHFL,      R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(SHFLI,       I_FORMAT, ARITHMETIC, RV32B, UIMM));
mixin (riscv_b_instr_mixin(UNSHFLI,     I_FORMAT, ARITHMETIC, RV32B, UIMM));
mixin (riscv_b_instr_mixin(BCOMPRESS,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(BDECOMPRESS, R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(BFP,         R_FORMAT, ARITHMETIC, RV32B));
