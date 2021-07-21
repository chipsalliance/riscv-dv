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

module riscv.gen.isa.rv64i_instr;

import riscv.gen.riscv_defines;

import uvm;

mixin (riscv_instr_mixin(LWU,     I_FORMAT, LOAD, RV64I));
mixin (riscv_instr_mixin(LD,      I_FORMAT, LOAD, RV64I));
mixin (riscv_instr_mixin(SD,      S_FORMAT, STORE, RV64I));
// SHIFT intructions
mixin (riscv_instr_mixin(SLLW,    R_FORMAT, SHIFT, RV64I));
mixin (riscv_instr_mixin(SLLIW,   I_FORMAT, SHIFT, RV64I));
mixin (riscv_instr_mixin(SRLW,    R_FORMAT, SHIFT, RV64I));
mixin (riscv_instr_mixin(SRLIW,   I_FORMAT, SHIFT, RV64I));
mixin (riscv_instr_mixin(SRAW,    R_FORMAT, SHIFT, RV64I));
mixin (riscv_instr_mixin(SRAIW,   I_FORMAT, SHIFT, RV64I));
// ARITHMETIC intructions
mixin (riscv_instr_mixin(ADDW,    R_FORMAT, ARITHMETIC, RV64I));
mixin (riscv_instr_mixin(ADDIW,   I_FORMAT, ARITHMETIC, RV64I));
mixin (riscv_instr_mixin(SUBW,    R_FORMAT, ARITHMETIC, RV64I));
