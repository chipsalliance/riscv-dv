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
module riscv.gen.isa.rv32i_instr;

import riscv.gen.riscv_defines;

import uvm;


// LOAD instructions
mixin (riscv_instr_mixin(LB,     I_FORMAT, LOAD, RV32I));
mixin (riscv_instr_mixin(LH,     I_FORMAT, LOAD, RV32I));
mixin (riscv_instr_mixin(LW,     I_FORMAT, LOAD, RV32I));
mixin (riscv_instr_mixin(LBU,    I_FORMAT, LOAD, RV32I));
mixin (riscv_instr_mixin(LHU,    I_FORMAT, LOAD, RV32I));
// STORE instructions
mixin (riscv_instr_mixin(SB,     S_FORMAT, STORE, RV32I));
mixin (riscv_instr_mixin(SH,     S_FORMAT, STORE, RV32I));
mixin (riscv_instr_mixin(SW,     S_FORMAT, STORE, RV32I));
// SHIFT intructions
mixin (riscv_instr_mixin(SLL,    R_FORMAT, SHIFT, RV32I));
mixin (riscv_instr_mixin(SLLI,   I_FORMAT, SHIFT, RV32I));
mixin (riscv_instr_mixin(SRL,    R_FORMAT, SHIFT, RV32I));
mixin (riscv_instr_mixin(SRLI,   I_FORMAT, SHIFT, RV32I));
mixin (riscv_instr_mixin(SRA,    R_FORMAT, SHIFT, RV32I));
mixin (riscv_instr_mixin(SRAI,   I_FORMAT, SHIFT, RV32I));
// ARITHMETIC intructions
mixin (riscv_instr_mixin(ADD,    R_FORMAT, ARITHMETIC, RV32I));
mixin (riscv_instr_mixin(ADDI,   I_FORMAT, ARITHMETIC, RV32I));
mixin (riscv_instr_mixin(NOP,    I_FORMAT, ARITHMETIC, RV32I));
mixin (riscv_instr_mixin(SUB,    R_FORMAT, ARITHMETIC, RV32I));
mixin (riscv_instr_mixin(LUI,    U_FORMAT, ARITHMETIC, RV32I, UIMM));
mixin (riscv_instr_mixin(AUIPC,  U_FORMAT, ARITHMETIC, RV32I, UIMM));
// LOGICAL instructions
mixin (riscv_instr_mixin(XOR,    R_FORMAT, LOGICAL, RV32I));
mixin (riscv_instr_mixin(XORI,   I_FORMAT, LOGICAL, RV32I));
mixin (riscv_instr_mixin(OR,     R_FORMAT, LOGICAL, RV32I));
mixin (riscv_instr_mixin(ORI,    I_FORMAT, LOGICAL, RV32I));
mixin (riscv_instr_mixin(AND,    R_FORMAT, LOGICAL, RV32I));
mixin (riscv_instr_mixin(ANDI,   I_FORMAT, LOGICAL, RV32I));
// COMPARE instructions
mixin (riscv_instr_mixin(SLT,    R_FORMAT, COMPARE, RV32I));
mixin (riscv_instr_mixin(SLTI,   I_FORMAT, COMPARE, RV32I));
mixin (riscv_instr_mixin(SLTU,   R_FORMAT, COMPARE, RV32I));
mixin (riscv_instr_mixin(SLTIU,  I_FORMAT, COMPARE, RV32I));
// BRANCH instructions
mixin (riscv_instr_mixin(BEQ,    B_FORMAT, BRANCH, RV32I));
mixin (riscv_instr_mixin(BNE,    B_FORMAT, BRANCH, RV32I));
mixin (riscv_instr_mixin(BLT,    B_FORMAT, BRANCH, RV32I));
mixin (riscv_instr_mixin(BGE,    B_FORMAT, BRANCH, RV32I));
mixin (riscv_instr_mixin(BLTU,   B_FORMAT, BRANCH, RV32I));
mixin (riscv_instr_mixin(BGEU,   B_FORMAT, BRANCH, RV32I));
// JUMP instructions
mixin (riscv_instr_mixin(JAL,    J_FORMAT, JUMP, RV32I));
mixin (riscv_instr_mixin(JALR,   I_FORMAT, JUMP, RV32I));
// SYNCH instructions
mixin (riscv_instr_mixin(FENCE,  I_FORMAT, SYNCH, RV32I));
mixin (riscv_instr_mixin(FENCE_I, I_FORMAT, SYNCH, RV32I));
mixin (riscv_instr_mixin(SFENCE_VMA, R_FORMAT, SYNCH, RV32I));
// SYSTEM instructions
mixin (riscv_instr_mixin(ECALL,   I_FORMAT, SYSTEM, RV32I));
mixin (riscv_instr_mixin(EBREAK,  I_FORMAT, SYSTEM, RV32I));
mixin (riscv_instr_mixin(URET,    I_FORMAT, SYSTEM, RV32I));
mixin (riscv_instr_mixin(SRET,    I_FORMAT, SYSTEM, RV32I));
mixin (riscv_instr_mixin(MRET,    I_FORMAT, SYSTEM, RV32I));
mixin (riscv_instr_mixin(DRET,    I_FORMAT, SYSTEM, RV32I));
mixin (riscv_instr_mixin(WFI,     I_FORMAT, INTERRUPT, RV32I));
// CSR instructions
mixin (riscv_instr_mixin(CSRRW,  R_FORMAT, CSR, RV32I, UIMM));
mixin (riscv_instr_mixin(CSRRS,  R_FORMAT, CSR, RV32I, UIMM));
mixin (riscv_instr_mixin(CSRRC,  R_FORMAT, CSR, RV32I, UIMM));
mixin (riscv_instr_mixin(CSRRWI, I_FORMAT, CSR, RV32I, UIMM));
mixin (riscv_instr_mixin(CSRRSI, I_FORMAT, CSR, RV32I, UIMM));
mixin (riscv_instr_mixin(CSRRCI, I_FORMAT, CSR, RV32I, UIMM));
