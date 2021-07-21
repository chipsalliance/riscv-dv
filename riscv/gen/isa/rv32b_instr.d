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

module riscv.gen.isa.rv32b_instr;

import riscv.gen.riscv_defines;

import uvm;

// LOGICAL instructions
mixin (riscv_b_instr_mixin(SEXT_B,  R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(SEXT_H,  R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(ANDN,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(ORN ,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(XNOR,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(GORC,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(GORCI,   I_FORMAT, LOGICAL, RV32B, UIMM));
mixin (riscv_b_instr_mixin(CMIX,   R4_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(CMOV,   R4_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(PACK,    R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(PACKU,   R_FORMAT, LOGICAL, RV32B));
mixin (riscv_b_instr_mixin(PACKH,   R_FORMAT, LOGICAL, RV32B));
// SHIFT intructions
mixin (riscv_b_instr_mixin(SLO,     R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SRO,     R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(ROL,     R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(ROR,     R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SBCLR,   R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SBSET,   R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SBINV,   R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(SBEXT,   R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(GREV,    R_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(GREVI,   I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SLOI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SROI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(RORI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SBCLRI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SBSETI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SBINVI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(SBEXTI,    I_FORMAT, SHIFT, RV32B, UIMM));
mixin (riscv_b_instr_mixin(FSL,   R4_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(FSR,   R4_FORMAT, SHIFT, RV32B));
mixin (riscv_b_instr_mixin(FSRI,   I_FORMAT, SHIFT, RV32B, UIMM));
// ARITHMETIC intructions
mixin (riscv_b_instr_mixin(CLZ,    R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CTZ,    R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(PCNT,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32_B,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32_H,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32_W,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32C_B,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32C_H,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CRC32C_W,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CLMUL,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CLMULR,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(CLMULH,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(MIN,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(MAX,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(MINU,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(MAXU,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(SHFL,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(UNSHFL,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(BDEP,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(BEXT,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(BFP,   R_FORMAT, ARITHMETIC, RV32B));
mixin (riscv_b_instr_mixin(SHFLI,   I_FORMAT, ARITHMETIC, RV32B, UIMM));
mixin (riscv_b_instr_mixin(UNSHFLI,   I_FORMAT, ARITHMETIC, RV32B, UIMM));

