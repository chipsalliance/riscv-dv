"""
Copyright 2020 Google LLC
Copyright 2020 PerfectVIPs Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

"""

from pygen_src.riscv_defines import DEFINE_B_INSTR
from pygen_src.riscv_instr_pkg import (riscv_instr_name_t, riscv_instr_format_t,
                                       riscv_instr_category_t, riscv_instr_group_t, imm_t)

# LOGICAL instructions
DEFINE_B_INSTR(riscv_instr_name_t.GORC, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.GORCI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CMIX, riscv_instr_format_t.R4_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CMOV, riscv_instr_format_t.R4_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.PACK, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.PACKU, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.PACKH, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.XPERM_N, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.XPERM_B, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.XPERM_H, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32B, g=globals())

# SHIFH instructions
DEFINE_B_INSTR(riscv_instr_name_t.SLO, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SRO, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.GREV, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.GREVI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SLOI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SROI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, imm_t.UIMM, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.FSL, riscv_instr_format_t.R4_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.FSR, riscv_instr_format_t.R4_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.FSRI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32B, imm_t.UIMM, g=globals())

# ARITMETIC instructions
DEFINE_B_INSTR(riscv_instr_name_t.CRC32_B, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32_H, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32_W, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32C_B, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32C_H, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.CRC32C_W, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SHFL, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.UNSHFL, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BFP, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BCOMPRESS, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.BDECOMPRESS, riscv_instr_format_t.R_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.SHFLI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, imm_t.UIMM,
               g=globals())
DEFINE_B_INSTR(riscv_instr_name_t.UNSHFLI, riscv_instr_format_t.I_FORMAT,
               riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32B, imm_t.UIMM,
               g=globals())


