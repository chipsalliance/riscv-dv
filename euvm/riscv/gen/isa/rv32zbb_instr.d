/*
 * Copyright 2018 Google LLC
 * Copyright 2021 Silicon Labs, Inc.
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

module riscv.gen.isa.rv32zbb_instr;

import riscv.gen.riscv_defines;

import uvm;

mixin (riscv_zbb_instr_mixin(ANDN,   R_FORMAT, LOGICAL,    RV32ZBB));
mixin (riscv_zbb_instr_mixin(CLZ,    I_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(CPOP,   I_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(CTZ,    I_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(MAX,    R_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(MAXU,   R_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(MIN,    R_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(MINU,   R_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(ORC_B,  I_FORMAT, LOGICAL,    RV32ZBB));
mixin (riscv_zbb_instr_mixin(ORN,    R_FORMAT, LOGICAL,    RV32ZBB));
mixin (riscv_zbb_instr_mixin(REV8,   I_FORMAT, SHIFT,      RV32ZBB));
mixin (riscv_zbb_instr_mixin(ROL,    R_FORMAT, SHIFT,      RV32ZBB));
mixin (riscv_zbb_instr_mixin(ROR,    R_FORMAT, SHIFT,      RV32ZBB));
mixin (riscv_zbb_instr_mixin(RORI,   I_FORMAT, SHIFT,      RV32ZBB, UIMM));
mixin (riscv_zbb_instr_mixin(SEXT_B, I_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(SEXT_H, I_FORMAT, ARITHMETIC, RV32ZBB));
mixin (riscv_zbb_instr_mixin(XNOR,   R_FORMAT, LOGICAL,    RV32ZBB));
mixin (riscv_zbb_instr_mixin(ZEXT_H, R_FORMAT, ARITHMETIC, RV32ZBB));
