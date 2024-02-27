module riscv.gen.isa.rv32zpn_instr;

import riscv.gen.riscv_defines;
import riscv.gen.isa.riscv_instr: riscv_instr;

import uvm;


class riscv_MULH_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(MULH, I_FORMAT, ARITHMETIC, RV32ZPN); }
