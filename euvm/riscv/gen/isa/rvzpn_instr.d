module riscv.gen.isa.rvzpn_instr;

import riscv.gen.riscv_defines;
import riscv.gen.isa.riscv_instr: riscv_instr;

import uvm;


class riscv_ADD16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ADD16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_ADD8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ADD8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_AVE_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(AVE, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CLRS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CLRS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CLRS32_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CLRS32, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CLRS8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CLRS8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CLZ16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CLZ16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CLZ32_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CLZ32, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CLZ8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CLZ8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CMPEQ16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CMPEQ16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CMPEQ8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CMPEQ8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CRAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CRAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_CRSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(CRSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KABS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KABS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KABS8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KABS8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KABSW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KABSW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KADD16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KADD16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KADD8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KADD8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KADDH_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KADDH, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KADDW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KADDW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KCRAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KCRAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KCRSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KCRSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KDMABB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KDMABB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KDMABT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KDMABT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KDMATT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KDMATT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KDMBB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KDMBB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KDMBT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KDMBT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KDMTT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KDMTT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHM16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHM16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHM8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHM8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHMBB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHMBB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHMBT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHMBT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHMTT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHMTT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHMX16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHMX16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KHMX8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KHMX8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMABB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMABB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMABT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMABT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMADA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMADA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMADRS_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMADRS, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMADS_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMADS, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMATT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMATT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMAXDA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMAXDA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMAXDS_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMAXDS, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMDA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMDA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAC_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAC, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAC_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAC_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWB_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWB_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWB2_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWB2, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWB2_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWB2_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWT_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWT_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWT2_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWT2, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMAWT2_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMAWT2_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMSB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMSB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMSB_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMSB_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMWB2_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMWB2, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMWB2_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMWB2_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMWT2_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMWT2, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMMWT2_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMMWT2_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMSDA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMSDA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMSXDA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMSXDA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KMXDA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KMXDA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLL16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLL16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLL8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLL8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLLI16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLLI16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLLI8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLLI8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLLIW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLLIW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLLW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLLW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLRA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLRA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLRA16_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLRA16_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLRA8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLRA8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLRA8_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLRA8_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLRAW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLRAW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSLRAW_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSLRAW_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSTAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSTAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSTSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSTSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSUB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSUB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSUB8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSUB8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSUBH_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSUBH, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KSUBW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KSUBW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KWMMUL_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KWMMUL, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_KWMMUL_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(KWMMUL_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_MADDR32_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(MADDR32, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_MSUBR32_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(MSUBR32, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_PBSAD_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(PBSAD, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_PBSADA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(PBSADA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_PKBT16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(PKBT16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_PKTB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(PKTB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RADD16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RADD16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RADD8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RADD8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RADDW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RADDW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RCRAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RCRAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RCRSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RCRSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RSTAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RSTAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RSUB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RSUB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RSUB8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RSUB8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_RSUBW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(RSUBW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCLIP16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCLIP16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCLIP32_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCLIP32, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCLIP8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCLIP8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCMPLE16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCMPLE16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCMPLE8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCMPLE8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCMPLT16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCMPLT16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SCMPLT8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SCMPLT8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SLL16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SLL16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SLL8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SLL8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SLLI16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SLLI16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SLLI8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SLLI8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMAQA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMAQA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMAQA_SU_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMAQA_SU, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMAX16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMAX16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMAX8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMAX8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMBB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMBB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMBT16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMBT16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMDRS_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMDRS, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMDS_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMDS, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMIN16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMIN16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMIN8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMIN8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMMUL_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMMUL_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMMWB_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMMWB, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMMWB_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMMWB_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMMWT_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMMWT, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMMWT_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMMWT_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMTT16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMTT16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SMXDS_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SMXDS, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRA_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRA_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRA16_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRA16_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRA8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRA8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRA8_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRA8_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRAI16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRAI16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRAI16_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRAI16_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRAI8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRAI8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRAI8_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRAI8_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRL16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRL16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRL16_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRL16_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRL8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRL8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRL8_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRL8_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRLI16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRLI16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRLI16_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRLI16_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRLI8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRLI8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SRLI8_U_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SRLI8_U, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_STAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(STAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_STSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(STSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUB8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUB8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUNPKD810_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUNPKD810, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUNPKD820_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUNPKD820, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUNPKD830_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUNPKD830, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUNPKD831_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUNPKD831, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_SUNPKD832_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(SUNPKD832, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCLIP16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCLIP16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCLIP32_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCLIP32, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCLIP8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCLIP8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCMPLE16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCMPLE16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCMPLE8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCMPLE8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCMPLT16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCMPLT16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UCMPLT8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UCMPLT8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKADD16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKADD16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKADD8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKADD8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKADDH_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKADDH, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKADDW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKADDW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKCRAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKCRAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKCRSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKCRSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKSTAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKSTAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKSTSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKSTSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKSUB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKSUB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKSUB8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKSUB8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKSUBH_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKSUBH, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UKSUBW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UKSUBW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UMAQA_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UMAQA, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UMAX16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UMAX16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UMAX8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UMAX8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UMIN16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UMIN16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_UMIN8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(UMIN8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URADD16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URADD16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URADD8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URADD8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URADDW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URADDW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URCRAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URCRAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URCRSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URCRSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URSTAS16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URSTAS16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URSTSA16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URSTSA16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URSUB16_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URSUB16, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URSUB8_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URSUB8, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_URSUBW_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(URSUBW, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_ZUNPKD810_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ZUNPKD810, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_ZUNPKD820_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ZUNPKD820, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_ZUNPKD830_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ZUNPKD830, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_ZUNPKD831_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ZUNPKD831, I_FORMAT, ARITHMETIC, RVZPN); }
class riscv_ZUNPKD832_instr: riscv_instr
{ mixin RISCV_INSTR_MIXIN!(ZUNPKD832, I_FORMAT, ARITHMETIC, RVZPN); }
