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
module riscv.gen.isa.rv32m_instr;

import riscv.gen.riscv_defines;

import uvm;


////////////  RV32M instructions  //////////////
mixin (riscv_instr_mixin(MUL,    R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(MULH,   R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(MULHSU, R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(MULHU,  R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(DIV,    R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(DIVU,   R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(REM,    R_FORMAT, ARITHMETIC, RV32M));
mixin (riscv_instr_mixin(REMU,   R_FORMAT, ARITHMETIC, RV32M));
