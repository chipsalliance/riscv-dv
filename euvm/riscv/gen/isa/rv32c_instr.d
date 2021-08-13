/*
 * Copyright 2020 Google LLC
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

module riscv.gen.isa.rv32c_instr;

import riscv.gen.riscv_defines;

import uvm;

mixin (riscv_c_instr_mixin(C_LW,       CL_FORMAT, LOAD, RV32C, UIMM));
mixin (riscv_c_instr_mixin(C_SW,       CS_FORMAT, STORE, RV32C, UIMM));
mixin (riscv_c_instr_mixin(C_LWSP,     CI_FORMAT, LOAD, RV32C, UIMM));
mixin (riscv_c_instr_mixin(C_SWSP,     CSS_FORMAT, STORE, RV32C, UIMM));
mixin (riscv_c_instr_mixin(C_ADDI4SPN, CIW_FORMAT, ARITHMETIC, RV32C, NZUIMM));
mixin (riscv_c_instr_mixin(C_ADDI,     CI_FORMAT, ARITHMETIC, RV32C, NZIMM));
mixin (riscv_c_instr_mixin(C_ADDI16SP, CI_FORMAT, ARITHMETIC, RV32C, NZIMM));
mixin (riscv_c_instr_mixin(C_LI,       CI_FORMAT, ARITHMETIC, RV32C));
mixin (riscv_c_instr_mixin(C_LUI,      CI_FORMAT, ARITHMETIC, RV32C, NZIMM));
mixin (riscv_c_instr_mixin(C_SUB,      CA_FORMAT, ARITHMETIC, RV32C));
mixin (riscv_c_instr_mixin(C_ADD,      CR_FORMAT, ARITHMETIC, RV32C));
mixin (riscv_c_instr_mixin(C_NOP,      CI_FORMAT, ARITHMETIC, RV32C));
mixin (riscv_c_instr_mixin(C_MV,       CR_FORMAT, ARITHMETIC, RV32C));
mixin (riscv_c_instr_mixin(C_ANDI,     CB_FORMAT, LOGICAL, RV32C));
mixin (riscv_c_instr_mixin(C_XOR,      CA_FORMAT, LOGICAL, RV32C));
mixin (riscv_c_instr_mixin(C_OR,       CA_FORMAT, LOGICAL, RV32C));
mixin (riscv_c_instr_mixin(C_AND,      CA_FORMAT, LOGICAL, RV32C));
mixin (riscv_c_instr_mixin(C_BEQZ,     CB_FORMAT, BRANCH, RV32C));
mixin (riscv_c_instr_mixin(C_BNEZ,     CB_FORMAT, BRANCH, RV32C));
mixin (riscv_c_instr_mixin(C_SRLI,     CB_FORMAT, SHIFT, RV32C, NZUIMM));
mixin (riscv_c_instr_mixin(C_SRAI,     CB_FORMAT, SHIFT, RV32C, NZUIMM));
mixin (riscv_c_instr_mixin(C_SLLI,     CI_FORMAT, SHIFT, RV32C, NZUIMM));
mixin (riscv_c_instr_mixin(C_J,        CJ_FORMAT, JUMP, RV32C));
mixin (riscv_c_instr_mixin(C_JAL,      CJ_FORMAT, JUMP, RV32C));
mixin (riscv_c_instr_mixin(C_JR,       CR_FORMAT, JUMP, RV32C));
mixin (riscv_c_instr_mixin(C_JALR,     CR_FORMAT, JUMP, RV32C));
mixin (riscv_c_instr_mixin(C_EBREAK,   CI_FORMAT, SYSTEM, RV32C));
