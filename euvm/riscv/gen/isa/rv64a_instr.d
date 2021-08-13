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

module riscv.gen.isa.rv64a_instr;

import riscv.gen.riscv_defines;

import uvm;

mixin (riscv_amo_instr_mixin(LR_D,      R_FORMAT, LOAD, RV64A));
mixin (riscv_amo_instr_mixin(SC_D,      R_FORMAT, STORE, RV64A));
mixin (riscv_amo_instr_mixin(AMOSWAP_D, R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOADD_D,  R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOAND_D,  R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOOR_D,   R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOXOR_D,  R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOMIN_D,  R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOMAX_D,  R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOMINU_D, R_FORMAT, AMO, RV64A));
mixin (riscv_amo_instr_mixin(AMOMAXU_D, R_FORMAT, AMO, RV64A));
