/*
 * Copyright 2018 Google LLC
 * Copyright 2023 Frontgrade Gaisler
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

`DEFINE_ZBKB_INSTR(PACK, R_FORMAT, LOGICAL, RV32ZBKB);
`DEFINE_ZBKB_INSTR(PACKH, R_FORMAT, LOGICAL, RV32ZBKB);
`DEFINE_ZBKB_INSTR(BREV8, I_FORMAT, SHIFT, RV32ZBKB);
`DEFINE_ZBKB_INSTR(ZIP, I_FORMAT, ARITHMETIC, RV32ZBKB);
`DEFINE_ZBKB_INSTR(UNZIP, I_FORMAT, ARITHMETIC, RV32ZBKB);
// The remaining instructions are part of ZBB and are thus not included here.
