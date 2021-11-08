from pygen_src.riscv_defines import DEFINE_INSTR
from pygen_src.riscv_instr_pkg import (riscv_instr_name_t, riscv_instr_format_t,
                                       riscv_instr_category_t, riscv_instr_group_t, imm_t)


DEFINE_INSTR(riscv_instr_name_t.MULW, riscv_instr_format_t.R_FORMAT,
             riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV64M, g=globals())

