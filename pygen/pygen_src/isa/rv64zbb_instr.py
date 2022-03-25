"""
Copyright 2018 Google LLC
Copyright 2021 Silicon Labs, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

from pygen_src.riscv_defines import DEFINE_ZBB_INSTR
from pygen_src.riscv_instr_pkg import (riscv_instr_name_t, riscv_instr_format_t,
                                       riscv_instr_category_t, riscv_instr_group_t, imm_t)


DEFINE_ZBB_INSTR(riscv_instr_name_t.CLZW,  riscv_instr_format_t.I_FORMAT,
                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64ZBB, g=globals())
DEFINE_ZBB_INSTR(riscv_instr_name_t.CPOPW, riscv_instr_format_t.I_FORMAT,
                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64ZBB, g=globals())
DEFINE_ZBB_INSTR(riscv_instr_name_t.CTZW,  riscv_instr_format_t.I_FORMAT,
                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64ZBB, g=globals())
DEFINE_ZBB_INSTR(riscv_instr_name_t.ROLW,  riscv_instr_format_t.R_FORMAT,
                 riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64ZBB, g=globals())
DEFINE_ZBB_INSTR(riscv_instr_name_t.RORW,  riscv_instr_format_t.R_FORMAT,
                 riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64ZBB, g=globals())
DEFINE_ZBB_INSTR(riscv_instr_name_t.RORIW, riscv_instr_format_t.I_FORMAT,
                 riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64ZBB, imm_t.UIMM, g=globals)
