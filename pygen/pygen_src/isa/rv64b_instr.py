"""
Copyright 2019 Google LLC
Copyright 2020 PerfectVIPs Inc.

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


from pygen_src.riscv_defines import DEFINE_B_INSTR
from pygen_src.riscv_instr_pkg import (riscv_instr_name_t, riscv_instr_format_t,
                                       riscv_instr_category_t, riscv_instr_group_t, imm_t)


# ARITHMETIC intructions
DEFINE_B_INSTR(riscv_instr_name_t.BMATOR,       riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BMATXOR,      riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BMATFLIP,     riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32_D,      riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32C_D,     riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SHFLW,        riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.UNSHFLW,      riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BCOMPRESSW,   riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BDECOMPRESSW, riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BFPW,         riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64B, g=globals())
# SHIFT intructiriscv_instr_name_t.ons
DEFINE_B_INSTR(riscv_instr_name_t.SLOW,    riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SROW,    riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SLOIW,   riscv_instr_format_t.I_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SROIW,   riscv_instr_format_t.I_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.GREVW,   riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.GREVIW,  riscv_instr_format_t.I_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.FSLW,   riscv_instr_format_t.R4_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.FSRW,   riscv_instr_format_t.R4_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.FSRIW,   riscv_instr_format_t.I_FORMAT,
                riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV64B, imm_t.UIMM, g=globals())
# LOGICAL instruriscv_instr_name_t.ctions
DEFINE_B_INSTR(riscv_instr_name_t.GORCW,   riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.GORCIW,  riscv_instr_format_t.I_FORMAT,
                riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV64B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.PACKW,   riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.PACKUW,  riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV64B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.XPERM_W, riscv_instr_format_t.R_FORMAT,
                riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV64B, g=globals())
