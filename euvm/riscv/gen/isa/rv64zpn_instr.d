module riscv.gen.isa.rv64zpn_instr;

import riscv.gen.riscv_defines;
import riscv.gen.isa.riscv_instr: riscv_instr;

import uvm;


class riscv_MULH_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(MULH, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_ADD32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(ADD32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_INSB_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(INSB, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_PKBB16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(PKBB16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_PKTT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(PKTT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_RADD32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(RADD32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_URADD32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(URADD32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KADD32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KADD32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UKADD32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UKADD32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SUB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SUB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_RSUB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(RSUB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_URSUB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(URSUB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSUB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSUB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UKSUB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UKSUB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_CRAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(CRAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_RCRAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(RCRAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_URCRAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(URCRAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KCRAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KCRAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UKCRAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UKCRAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_CRSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(CRSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_RCRSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(RCRSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_URCRSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(URCRSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KCRSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KCRSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UKCRSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UKCRSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_STAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(STAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_RSTAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(RSTAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_URSTAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(URSTAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSTAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSTAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UKSTAS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UKSTAS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_STSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(STSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_URSTSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(URSTSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSTSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSTSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UKSTSA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UKSTSA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMMUL_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMMUL, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRAI_U_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRAI_U, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRAI32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRAI32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRA32_U_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRA32_U, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRAI32_U_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRAI32_U, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRL32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRL32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRLI32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRLI32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRL32_U_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRL32_U, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SLL32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SLL32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SLLI32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SLLI32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSLL32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSLL32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSLLI32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSLLI32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSLRA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSLRA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KSLRA32_U_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KSLRA32_U, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMIN32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMIN32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_UMIN32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(UMIN32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMAX32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMAX32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KHMBB16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KHMBB16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KHMBT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KHMBT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KHMTT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KHMTT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KDMBB16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KDMBB16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KDMBT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KDMBT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KDMTT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KDMTT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KDMABB16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KDMABB16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KDMABT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KDMABT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KDMATT16_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KDMATT16, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMBT32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMBT32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMTT32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMTT32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMABB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMABB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMABT32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMABT32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMATT32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMATT32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMDA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMDA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMXDA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMXDA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMAXDA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMAXDA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMADS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMADS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMADRS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMADRS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMAXDS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMAXDS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMSDA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMSDA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KMSXDA32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KMSXDA32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMDS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMDS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMDRS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMDRS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SMXDS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SMXDS32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_SRAIW_U_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(SRAIW_U, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_PKBT32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(PKBT32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_PKTB32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(PKTB32, I_FORMAT, ARITHMETIC, RV64ZPN); }

class riscv_KABS32_instr: riscv_instr
{mixin RISCV_INSTR_MIXIN!(KABS32, I_FORMAT, ARITHMETIC, RV64ZPN); }
