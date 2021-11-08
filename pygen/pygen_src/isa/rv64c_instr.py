from pygen_src.riscv_defines import DEFINE_INSTR
from pygen_src.riscv_instr_pkg import (riscv_instr_name_t, riscv_instr_format_t,
                                       riscv_instr_category_t, riscv_instr_group_t, imm_t)


DEFINE_INSTR(riscv_instr_name_t.C_ADDIW, riscv_instr_format_t.CI_FORMAT,
             riscv_instr_category_t.LOAD, riscv_instr_group_t.RV64C, g=globals())
