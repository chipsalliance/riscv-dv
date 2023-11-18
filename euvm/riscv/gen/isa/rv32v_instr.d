/*
 * Copyright 2020 Google LLC
 * Copyright 2020 Andes Technology Co., Ltd.
 * Copyright 2022 Coverify Systems Technology
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

module riscv.gen.isa.rv32v_instr;

import riscv.gen.riscv_defines;
import riscv.gen.isa.riscv_instr: riscv_instr;

import uvm;

version (RISCV_INSTR_STRING_MIXIN) {
  // Vector CSR access instruction
  mixin (riscv_instr_mixin(VSETVLI,    VSET_FORMAT, CSR, RVV));
  mixin (riscv_instr_mixin(VSETVL,     VSET_FORMAT, CSR, RVV));

  // Vector integer arithmetic instruction
  mixin (riscv_va_instr_mixin(VADD,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSUB,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VRSUB,    VA_FORMAT, ARITHMETIC, RVV, [VX, VI]));
  mixin (riscv_va_instr_mixin(VWADDU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX, WV, WX]));
  mixin (riscv_va_instr_mixin(VWSUBU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX, WV, WX]));
  mixin (riscv_va_instr_mixin(VWADD,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX, WV, WX]));
  mixin (riscv_va_instr_mixin(VWSUB,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX, WV, WX]));
  mixin (riscv_va_instr_mixin(VADC,     VA_FORMAT, ARITHMETIC, RVV, [VVM, VXM, VIM]));
  mixin (riscv_va_instr_mixin(VMADC,    VA_FORMAT, ARITHMETIC, RVV, [VVM, VXM, VIM, VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSBC,     VA_FORMAT, ARITHMETIC, RVV, [VVM, VXM]));
  mixin (riscv_va_instr_mixin(VMSBC,    VA_FORMAT, ARITHMETIC, RVV, [VVM, VXM, VV, VX]));
  mixin (riscv_va_instr_mixin(VAND,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VOR,      VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VXOR,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSLL,     VA_FORMAT, SHIFT, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSRL,     VA_FORMAT, SHIFT, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSRA,     VA_FORMAT, SHIFT, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VNSRL,    VA_FORMAT, SHIFT, RVV, [WV, WX, WI]));
  mixin (riscv_va_instr_mixin(VNSRA,    VA_FORMAT, SHIFT, RVV, [WV, WX, WI]));
  mixin (riscv_va_instr_mixin(VMSEQ,    VA_FORMAT, COMPARE, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VMSNE,    VA_FORMAT, COMPARE, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VMSLTU,   VA_FORMAT, COMPARE, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMSLT,    VA_FORMAT, COMPARE, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMSLEU,   VA_FORMAT, COMPARE, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VMSLE,    VA_FORMAT, COMPARE, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VMSGTU,   VA_FORMAT, COMPARE, RVV, [VX, VI]));
  mixin (riscv_va_instr_mixin(VMSGT,    VA_FORMAT, COMPARE, RVV, [VX, VI]));
  mixin (riscv_va_instr_mixin(VMINU,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMIN,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMAXU,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMAX,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMUL,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMULH,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMULHU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMULHSU,  VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VDIVU,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VDIV,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VREMU,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VREM,     VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMUL,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMULU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMULSU,  VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMACC,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VNMSAC,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VMADD,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VNMSUB,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMACCU,  VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMACC,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMACCSU, VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VWMACCUS, VA_FORMAT, ARITHMETIC, RVV, [VX]));
  /* Quad widening is not yet supported
     mixin (riscv_va_instr_mixin(VQMACCU,  VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
     mixin (riscv_va_instr_mixin(VQMACC,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
     mixin (riscv_va_instr_mixin(VQMACCSU, VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
     mixin (riscv_va_instr_mixin(VQMACCUS, VA_FORMAT, ARITHMETIC, RVV, [VX]));
  */
  mixin (riscv_va_instr_mixin(VMERGE,   VA_FORMAT, ARITHMETIC, RVV, [VVM, VXM, VIM]));
  mixin (riscv_va_instr_mixin(VMV,      VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));

  // Vector Fixed-Point Arithmetic Instructions
  mixin (riscv_va_instr_mixin(VSADDU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSADD,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSSUBU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VSSUB,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VAADDU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VAADD,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VASUBU,   VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VASUB,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX]));
  mixin (riscv_va_instr_mixin(VSSRL,    VA_FORMAT, SHIFT, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VSSRA,    VA_FORMAT, SHIFT, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VNCLIPU,  VA_FORMAT, ARITHMETIC, RVV, [WV, WX, WI]));
  mixin (riscv_va_instr_mixin(VNCLIP,   VA_FORMAT, ARITHMETIC, RVV, [WV, WX, WI]));

  // Vector Floating-Point Instructions
  mixin (riscv_va_instr_mixin(VFADD,    VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFSUB,    VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFRSUB,   VA_FORMAT, ARITHMETIC, RVV, [VF]));
  mixin (riscv_va_instr_mixin(VFMUL,    VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFDIV,    VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFRDIV,   VA_FORMAT, ARITHMETIC, RVV, [VF]));
  mixin (riscv_va_instr_mixin(VFWMUL,   VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFMACC,   VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFNMACC,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFMSAC,   VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFNMSAC,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFMADD,   VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFNMADD,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFMSUB,   VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFNMSUB,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFWMACC,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFWNMACC, VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFWMSAC,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFWNMSAC, VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFSQRT_V, VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFMIN,    VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFMAX,    VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFSGNJ,   VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFSGNJN,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VFSGNJX,  VA_FORMAT, ARITHMETIC, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VMFEQ,    VA_FORMAT, COMPARE, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VMFNE,    VA_FORMAT, COMPARE, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VMFLT,    VA_FORMAT, COMPARE, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VMFLE,    VA_FORMAT, COMPARE, RVV, [VV, VF]));
  mixin (riscv_va_instr_mixin(VMFGT,    VA_FORMAT, COMPARE, RVV, [VF]));
  mixin (riscv_va_instr_mixin(VMFGE,    VA_FORMAT, COMPARE, RVV, [VF]));
  mixin (riscv_va_instr_mixin(VFCLASS_V,VS2_FORMAT, COMPARE, RVV));
  mixin (riscv_va_instr_mixin(VFMERGE,  VA_FORMAT, ARITHMETIC, RVV, [VFM]));
  mixin (riscv_va_instr_mixin(VFMV,     VA_FORMAT, ARITHMETIC, RVV, [VF]));

  // Vector conversion instructions
  mixin (riscv_va_instr_mixin(VFCVT_XU_F_V,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFCVT_X_F_V,      VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFCVT_F_XU_V,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFCVT_F_X_V,      VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWCVT_XU_F_V,    VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWCVT_X_F_V,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWCVT_F_XU_V,    VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWCVT_F_X_V,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWCVT_F_F_V,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFNCVT_XU_F_W,    VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFNCVT_X_F_W,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFNCVT_F_XU_W,    VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFNCVT_F_X_W,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFNCVT_F_F_W,     VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFNCVT_ROD_F_F_W, VS2_FORMAT, ARITHMETIC, RVV));

  // Vector reduction instruction
  mixin (riscv_va_instr_mixin(VREDSUM_VS,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDMAXU_VS,   VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDMAX_VS,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDMINU_VS,   VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDMIN_VS,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDAND_VS,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDOR_VS,     VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VREDXOR_VS,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VWREDSUMU_VS,  VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VWREDSUM_VS,   VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFREDOSUM_VS,  VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFREDSUM_VS,   VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFREDMAX_VS,   VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWREDOSUM_VS, VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFWREDSUM_VS,  VA_FORMAT, ARITHMETIC, RVV));

  // Vector mask instruction
  mixin (riscv_va_instr_mixin(VMAND_MM,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMNAND_MM,   VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMANDNOT_MM, VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMXOR_MM,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMOR_MM,     VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMNOR_MM,    VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMORNOT_MM,  VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMXNOR_MM,   VA_FORMAT, ARITHMETIC, RVV));

  mixin (riscv_va_instr_mixin(VPOPC_M,   VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFIRST_M,  VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMSBF_M,   VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMSIF_M,   VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMSOF_M,   VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VIOTA_M,   VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VID_V,     VS2_FORMAT, ARITHMETIC, RVV));

  // Vector permutation instruction
  mixin (riscv_va_instr_mixin(VMV_X_S,  VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMV_S_X,  VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFMV_F_S, VA_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VFMV_S_F, VA_FORMAT, ARITHMETIC, RVV));

  mixin (riscv_va_instr_mixin(VSLIDEUP,    VA_FORMAT, ARITHMETIC, RVV, [VI, VX]));
  mixin (riscv_va_instr_mixin(VSLIDEDOWN,  VA_FORMAT, ARITHMETIC, RVV, [VI, VX]));
  mixin (riscv_va_instr_mixin(VSLIDE1UP,   VA_FORMAT, ARITHMETIC, RVV, [VX]));
  mixin (riscv_va_instr_mixin(VSLIDE1DOWN, VA_FORMAT, ARITHMETIC, RVV, [VX]));
  mixin (riscv_va_instr_mixin(VRGATHER,    VA_FORMAT, ARITHMETIC, RVV, [VV, VX, VI]));
  mixin (riscv_va_instr_mixin(VCOMPRESS,   VA_FORMAT, ARITHMETIC, RVV, [VM]));

  mixin (riscv_va_instr_mixin(VMV1R_V, VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMV2R_V, VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMV4R_V, VS2_FORMAT, ARITHMETIC, RVV));
  mixin (riscv_va_instr_mixin(VMV8R_V, VS2_FORMAT, ARITHMETIC, RVV));

  // -------------------------------------------------------------------------
  //  Section 7. Vector Loads and Stores
  // -------------------------------------------------------------------------
  // Section 7.4 - Vector Unit-Stride Instructions

  //   mixin (riscv_va_instr_mixin(VLE_V, VL_FORMAT, LOAD, RVV));   // mismatch with riscv-opcodes
  //   mixin (riscv_va_instr_mixin(VSE_V, VS_FORMAT, STORE, RVV));  // mismatch with riscv-opcodes

  // Section 7.5 - Vector Strided Instructions
  mixin (riscv_va_instr_mixin(VLSE_V, VLS_FORMAT, LOAD, RVV));
  mixin (riscv_va_instr_mixin(VSSE_V, VSS_FORMAT, STORE, RVV));
  // Section 7.6 - Vector Indexed Instructions
  mixin (riscv_va_instr_mixin(VLXEI_V, VLX_FORMAT, LOAD, RVV));
  mixin (riscv_va_instr_mixin(VSXEI_V, VSX_FORMAT, STORE, RVV));
  mixin (riscv_va_instr_mixin(VSUXEI_V, VSX_FORMAT, STORE, RVV));
  // Section 7.7 - Vector Unit-Stride Fault-Only-First Loads
  mixin (riscv_va_instr_mixin(VLEFF_V, VL_FORMAT, LOAD, RVV));
  // Section 7.8 - Vector Load/Store Segment Instructions (Zvlsseg)
  // 7.8.1. Vector Unit Strided Segment Loads and Stores
  mixin (riscv_va_instr_mixin(VLSEGE_V, VL_FORMAT, LOAD, RVV, [], "zvlsseg"));
  mixin (riscv_va_instr_mixin(VSSEGE_V, VS_FORMAT, STORE, RVV, [], "zvlsseg"));
  mixin (riscv_va_instr_mixin(VLSEGEFF_V, VL_FORMAT, LOAD, RVV, [], "zvlsseg"));
  // 7.8.2. Vector Strided Segment Loads and Stores
  mixin (riscv_va_instr_mixin(VLSSEGE_V, VLS_FORMAT, LOAD, RVV, [], "zvlsseg"));
  mixin (riscv_va_instr_mixin(VSSSEGE_V, VSS_FORMAT, STORE, RVV, [], "zvlsseg"));
  // 7.8.3. Vector Indexed Segment Loads and Stores
  mixin (riscv_va_instr_mixin(VLXSEGEI_V, VLX_FORMAT, LOAD, RVV, [], "zvlsseg"));
  mixin (riscv_va_instr_mixin(VSXSEGEI_V, VSX_FORMAT, STORE, RVV, [], "zvlsseg"));
  mixin (riscv_va_instr_mixin(VSUXSEGEI_V, VSX_FORMAT, STORE, RVV, [], "zvlsseg"));

  // -------------------------------------------------------------------------
  //  Section 8. Vector AMO Operations (Zvamo)
  // -------------------------------------------------------------------------
  // EEW vector AMOs
  mixin (riscv_va_instr_mixin(VAMOSWAPE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOADDE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOXORE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOANDE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOORE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOMINE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOMAXE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOMINUE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
  mixin (riscv_va_instr_mixin(VAMOMAXUE_V, VAMO_FORMAT, AMO, RVV, [], "zvamo"));
 }
 else {
   // Vector CSR access instruction
   class riscv_VSETVLI_instr: riscv_instr
   { mixin RISCV_INSTR_MIXIN!(VSETVLI,    VSET_FORMAT, CSR, RVV); }
   class riscv_VSETVL_instr: riscv_instr
   { mixin RISCV_INSTR_MIXIN!(VSETVL,     VSET_FORMAT, CSR, RVV); }

   // Vector integer arithmetic instruction
   // class riscv_VADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VADD,     VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VADD
   class riscv_VADD_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VADD_VX, VA_FORMAT, ARITHMETIC, RVV); } // VADD
   class riscv_VADD_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VADD_VI, VA_FORMAT, ARITHMETIC, RVV); } // VADD
   // class riscv_VSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSUB,     VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VSUB
   class riscv_VSUB_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSUB_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSUB
   // class riscv_VRSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VRSUB,    VA_FORMAT, ARITHMETIC, RVV, VX, VI); }
   class riscv_VRSUB_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VRSUB_VX, VA_FORMAT, ARITHMETIC, RVV); } // VRSUB
   class riscv_VRSUB_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VRSUB_VI, VA_FORMAT, ARITHMETIC, RVV); } // VRSUB
   // class riscv_VWADDU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWADDU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX, WV, WX); }
   class riscv_VWADDU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADDU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWADDU
   class riscv_VWADDU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADDU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWADDU
   class riscv_VWADDU_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADDU_WV, VA_FORMAT, ARITHMETIC, RVV); } // VWADDU
   class riscv_VWADDU_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADDU_WX, VA_FORMAT, ARITHMETIC, RVV); } // VWADDU
   // class riscv_VWSUBU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWSUBU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX, WV, WX); }
   class riscv_VWSUBU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUBU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWSUBU
   class riscv_VWSUBU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUBU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWSUBU
   class riscv_VWSUBU_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUBU_WV, VA_FORMAT, ARITHMETIC, RVV); } // VWSUBU
   class riscv_VWSUBU_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUBU_WX, VA_FORMAT, ARITHMETIC, RVV); } // VWSUBU
   // class riscv_VWADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWADD,    VA_FORMAT, ARITHMETIC, RVV, VV, VX, WV, WX); }
   class riscv_VWADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWADD
   class riscv_VWADD_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADD_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWADD
   class riscv_VWADD_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADD_WV, VA_FORMAT, ARITHMETIC, RVV); } // VWADD
   class riscv_VWADD_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWADD_WX, VA_FORMAT, ARITHMETIC, RVV); } // VWADD
   // class riscv_VWSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWSUB,    VA_FORMAT, ARITHMETIC, RVV, VV, VX, WV, WX); }
   class riscv_VWSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWSUB
   class riscv_VWSUB_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUB_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWSUB
   class riscv_VWSUB_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUB_WV, VA_FORMAT, ARITHMETIC, RVV); } // VWSUB
   class riscv_VWSUB_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWSUB_WX, VA_FORMAT, ARITHMETIC, RVV); } // VWSUB
   // class riscv_VADC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VADC,     VA_FORMAT, ARITHMETIC, RVV, VVM, VXM, VIM); }
   class riscv_VADC_VVM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VADC_VVM, VA_FORMAT, ARITHMETIC, RVV); } // VADC
   class riscv_VADC_VXM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VADC_VXM, VA_FORMAT, ARITHMETIC, RVV); } // VADC
   class riscv_VADC_VIM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VADC_VIM, VA_FORMAT, ARITHMETIC, RVV); } // VADC
   // class riscv_VMADC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMADC,    VA_FORMAT, ARITHMETIC, RVV, VVM, VXM, VIM, VV, VX, VI); }
   class riscv_VMADC_VVM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADC_VVM, VA_FORMAT, ARITHMETIC, RVV); } // VMADC
   class riscv_VMADC_VXM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADC_VXM, VA_FORMAT, ARITHMETIC, RVV); } // VMADC
   class riscv_VMADC_VIM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADC_VIM, VA_FORMAT, ARITHMETIC, RVV); } // VMADC
   class riscv_VMADC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMADC
   class riscv_VMADC_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADC_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMADC
   class riscv_VMADC_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADC_VI, VA_FORMAT, ARITHMETIC, RVV); } // VMADC
   // class riscv_VSBC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSBC,     VA_FORMAT, ARITHMETIC, RVV, VVM, VXM); }
   class riscv_VSBC_VVM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSBC_VVM, VA_FORMAT, ARITHMETIC, RVV); } // VSBC
   class riscv_VSBC_VXM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSBC_VXM, VA_FORMAT, ARITHMETIC, RVV); } // VSBC
   // class riscv_VMSBC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSBC,    VA_FORMAT, ARITHMETIC, RVV, VVM, VXM, VV, VX); }
   class riscv_VMSBC_VVM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSBC_VVM, VA_FORMAT, ARITHMETIC, RVV); } // VMSBC
   class riscv_VMSBC_VXM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSBC_VXM, VA_FORMAT, ARITHMETIC, RVV); } // VMSBC
   class riscv_VMSBC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSBC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMSBC
   class riscv_VMSBC_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSBC_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMSBC
   // class riscv_VAND_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VAND,     VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VAND_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAND_VV, VA_FORMAT, ARITHMETIC, RVV); } // VAND
   class riscv_VAND_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAND_VX, VA_FORMAT, ARITHMETIC, RVV); } // VAND
   class riscv_VAND_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAND_VI, VA_FORMAT, ARITHMETIC, RVV); } // VAND
   // class riscv_VOR_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VOR,      VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VOR_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VOR_VV, VA_FORMAT, ARITHMETIC, RVV); } // VOR
   class riscv_VOR_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VOR_VX, VA_FORMAT, ARITHMETIC, RVV); } // VOR
   class riscv_VOR_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VOR_VI, VA_FORMAT, ARITHMETIC, RVV); } // VOR
   // class riscv_VXOR_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VXOR,     VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VXOR_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VXOR_VV, VA_FORMAT, ARITHMETIC, RVV); } // VXOR
   class riscv_VXOR_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VXOR_VX, VA_FORMAT, ARITHMETIC, RVV); } // VXOR
   class riscv_VXOR_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VXOR_VI, VA_FORMAT, ARITHMETIC, RVV); } // VXOR
   // class riscv_VSLL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSLL,     VA_FORMAT, SHIFT, RVV, VV, VX, VI); }
   class riscv_VSLL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLL_VV, VA_FORMAT, SHIFT, RVV); } // VSLL
   class riscv_VSLL_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLL_VX, VA_FORMAT, SHIFT, RVV); } // VSLL
   class riscv_VSLL_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLL_VI, VA_FORMAT, SHIFT, RVV); } // VSLL
   // class riscv_VSRL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSRL,     VA_FORMAT, SHIFT, RVV, VV, VX, VI); }
   class riscv_VSRL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSRL_VV, VA_FORMAT, SHIFT, RVV); } // VSRL
   class riscv_VSRL_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSRL_VX, VA_FORMAT, SHIFT, RVV); } // VSRL
   class riscv_VSRL_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSRL_VI, VA_FORMAT, SHIFT, RVV); } // VSRL
   // class riscv_VSRA_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSRA,     VA_FORMAT, SHIFT, RVV, VV, VX, VI); }
   class riscv_VSRA_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSRA_VV, VA_FORMAT, SHIFT, RVV); } // VSRA
   class riscv_VSRA_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSRA_VX, VA_FORMAT, SHIFT, RVV); } // VSRA
   class riscv_VSRA_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSRA_VI, VA_FORMAT, SHIFT, RVV); } // VSRA
   // class riscv_VNSRL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VNSRL,    VA_FORMAT, SHIFT, RVV, WV, WX, WI); }
   class riscv_VNSRL_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNSRL_WV, VA_FORMAT, SHIFT, RVV); } // VNSRL
   class riscv_VNSRL_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNSRL_WX, VA_FORMAT, SHIFT, RVV); } // VNSRL
   class riscv_VNSRL_WI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNSRL_WI, VA_FORMAT, SHIFT, RVV); } // VNSRL
   // class riscv_VNSRA_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VNSRA,    VA_FORMAT, SHIFT, RVV, WV, WX, WI); }
   class riscv_VNSRA_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNSRA_WV, VA_FORMAT, SHIFT, RVV); } // VNSRA
   class riscv_VNSRA_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNSRA_WX, VA_FORMAT, SHIFT, RVV); } // VNSRA
   class riscv_VNSRA_WI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNSRA_WI, VA_FORMAT, SHIFT, RVV); } // VNSRA
   // class riscv_VMSEQ_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSEQ,    VA_FORMAT, COMPARE, RVV, VV, VX, VI); }
   class riscv_VMSEQ_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSEQ_VV, VA_FORMAT, COMPARE, RVV); } // VMSEQ
   class riscv_VMSEQ_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSEQ_VX, VA_FORMAT, COMPARE, RVV); } // VMSEQ
   class riscv_VMSEQ_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSEQ_VI, VA_FORMAT, COMPARE, RVV); } // VMSEQ
   // class riscv_VMSNE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSNE,    VA_FORMAT, COMPARE, RVV, VV, VX, VI); }
   class riscv_VMSNE_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSNE_VV, VA_FORMAT, COMPARE, RVV); } // VMSNE
   class riscv_VMSNE_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSNE_VX, VA_FORMAT, COMPARE, RVV); } // VMSNE
   class riscv_VMSNE_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSNE_VI, VA_FORMAT, COMPARE, RVV); } // VMSNE
   // class riscv_VMSLTU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSLTU,   VA_FORMAT, COMPARE, RVV, VV, VX); }
   class riscv_VMSLTU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLTU_VV, VA_FORMAT, COMPARE, RVV); } // VMSLTU
   class riscv_VMSLTU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLTU_VX, VA_FORMAT, COMPARE, RVV); } // VMSLTU
   // class riscv_VMSLT_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSLT,    VA_FORMAT, COMPARE, RVV, VV, VX); }
   class riscv_VMSLT_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLT_VV, VA_FORMAT, COMPARE, RVV); } // VMSLT
   class riscv_VMSLT_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLT_VX, VA_FORMAT, COMPARE, RVV); } // VMSLT
   // class riscv_VMSLEU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSLEU,   VA_FORMAT, COMPARE, RVV, VV, VX, VI); }
   class riscv_VMSLEU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLEU_VV, VA_FORMAT, COMPARE, RVV); } // VMSLEU
   class riscv_VMSLEU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLEU_VX, VA_FORMAT, COMPARE, RVV); } // VMSLEU
   class riscv_VMSLEU_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLEU_VI, VA_FORMAT, COMPARE, RVV); } // VMSLEU
   // class riscv_VMSLE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSLE,    VA_FORMAT, COMPARE, RVV, VV, VX, VI); }
   class riscv_VMSLE_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLE_VV, VA_FORMAT, COMPARE, RVV); } // VMSLE
   class riscv_VMSLE_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLE_VX, VA_FORMAT, COMPARE, RVV); } // VMSLE
   class riscv_VMSLE_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSLE_VI, VA_FORMAT, COMPARE, RVV); } // VMSLE
   // class riscv_VMSGTU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSGTU,   VA_FORMAT, COMPARE, RVV, VX, VI); }
   class riscv_VMSGTU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSGTU_VX, VA_FORMAT, COMPARE, RVV); } // VMSGTU
   class riscv_VMSGTU_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSGTU_VI, VA_FORMAT, COMPARE, RVV); } // VMSGTU
   // class riscv_VMSGT_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMSGT,    VA_FORMAT, COMPARE, RVV, VX, VI); }
   class riscv_VMSGT_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSGT_VX, VA_FORMAT, COMPARE, RVV); } // VMSGT
   class riscv_VMSGT_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSGT_VI, VA_FORMAT, COMPARE, RVV); } // VMSGT
   // class riscv_VMINU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMINU,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMINU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMINU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMINU
   class riscv_VMINU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMINU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMINU
   // class riscv_VMIN_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMIN,     VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMIN_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMIN_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMIN
   class riscv_VMIN_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMIN_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMIN
   // class riscv_VMAXU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMAXU,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMAXU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMAXU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMAXU
   class riscv_VMAXU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMAXU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMAXU
   // class riscv_VMAX_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMAX,     VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMAX_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMAX_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMAX
   class riscv_VMAX_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMAX_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMAX
   // class riscv_VMUL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMUL,     VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMUL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMUL_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMUL
   class riscv_VMUL_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMUL_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMUL
   // class riscv_VMULH_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMULH,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMULH_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMULH_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMULH
   class riscv_VMULH_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMULH_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMULH
   // class riscv_VMULHU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMULHU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMULHU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMULHU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMULHU
   class riscv_VMULHU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMULHU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMULHU
   // class riscv_VMULHSU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMULHSU,  VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMULHSU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMULHSU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMULHSU
   class riscv_VMULHSU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMULHSU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMULHSU
   // class riscv_VDIVU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VDIVU,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VDIVU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VDIVU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VDIVU
   class riscv_VDIVU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VDIVU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VDIVU
   // class riscv_VDIV_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VDIV,     VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VDIV_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VDIV_VV, VA_FORMAT, ARITHMETIC, RVV); } // VDIV
   class riscv_VDIV_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VDIV_VX, VA_FORMAT, ARITHMETIC, RVV); } // VDIV
   // class riscv_VREMU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VREMU,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VREMU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREMU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VREMU
   class riscv_VREMU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREMU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VREMU
   // class riscv_VREM_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VREM,     VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VREM_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREM_VV, VA_FORMAT, ARITHMETIC, RVV); } // VREM
   class riscv_VREM_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREM_VX, VA_FORMAT, ARITHMETIC, RVV); } // VREM
   // class riscv_VWMUL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMUL,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VWMUL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMUL_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWMUL
   class riscv_VWMUL_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMUL_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMUL
   // class riscv_VWMULU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMULU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VWMULU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMULU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWMULU
   class riscv_VWMULU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMULU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMULU
   // class riscv_VWMULSU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMULSU,  VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VWMULSU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMULSU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWMULSU
   class riscv_VWMULSU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMULSU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMULSU
   // class riscv_VMACC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMACC,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMACC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMACC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMACC
   class riscv_VMACC_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMACC_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMACC
   // class riscv_VNMSAC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VNMSAC,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VNMSAC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNMSAC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VNMSAC
   class riscv_VNMSAC_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNMSAC_VX, VA_FORMAT, ARITHMETIC, RVV); } // VNMSAC
   // class riscv_VMADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMADD,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VMADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VMADD
   class riscv_VMADD_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMADD_VX, VA_FORMAT, ARITHMETIC, RVV); } // VMADD
   // class riscv_VNMSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VNMSUB,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VNMSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNMSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VNMSUB
   class riscv_VNMSUB_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNMSUB_VX, VA_FORMAT, ARITHMETIC, RVV); } // VNMSUB
   // class riscv_VWMACCU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMACCU,  VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VWMACCU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACCU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWMACCU
   class riscv_VWMACCU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACCU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMACCU
   // class riscv_VWMACC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMACC,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VWMACC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWMACC
   class riscv_VWMACC_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACC_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMACC
   // class riscv_VWMACCSU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMACCSU, VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VWMACCSU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACCSU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VWMACCSU
   class riscv_VWMACCSU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACCSU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMACCSU
   // class riscv_VWMACCUS_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VWMACCUS, VA_FORMAT, ARITHMETIC, RVV, VX); }
   class riscv_VWMACCUS_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWMACCUS_VX, VA_FORMAT, ARITHMETIC, RVV); } // VWMACCUS
   // /* Quad widening is not yet supported
   //    class riscv_VQMACCU_instr: riscv_vector_instr   //    { mixin RISCV_VA_INSTR_MIXIN!(VQMACCU,  VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   //    class riscv_VQMACC_instr: riscv_vector_instr   //    { mixin RISCV_VA_INSTR_MIXIN!(VQMACC,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   //    class riscv_VQMACCSU_instr: riscv_vector_instr   //    { mixin RISCV_VA_INSTR_MIXIN!(VQMACCSU, VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   //    class riscv_VQMACCUS_instr: riscv_vector_instr   //    { mixin RISCV_VA_INSTR_MIXIN!(VQMACCUS, VA_FORMAT, ARITHMETIC, RVV, VX); }
   // */
   // class riscv_VMERGE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMERGE,   VA_FORMAT, ARITHMETIC, RVV, VVM, VXM, VIM); }
   // class riscv_VMV_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMV,      VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VMERGE_VVM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMERGE_VVM, VA_FORMAT, ARITHMETIC, RVV); } // VMERGE
   class riscv_VMERGE_VXM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMERGE_VXM, VA_FORMAT, ARITHMETIC, RVV); } // VMERGE
   class riscv_VMERGE_VIM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMERGE_VIM, VA_FORMAT, ARITHMETIC, RVV); } // VMERGE
   class riscv_VMV_V_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV_V_V, VA_FORMAT, ARITHMETIC, RVV); } // VMV
   class riscv_VMV_V_X_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV_V_X, VA_FORMAT, ARITHMETIC, RVV); } // VMV
   class riscv_VMV_V_I_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV_V_I, VA_FORMAT, ARITHMETIC, RVV); } // VMV

   // Vector Fixed-Point Arithmetic Instructions
   // class riscv_VSADDU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSADDU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VSADDU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSADDU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VSADDU
   class riscv_VSADDU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSADDU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSADDU
   class riscv_VSADDU_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSADDU_VI, VA_FORMAT, ARITHMETIC, RVV); } // VSADDU
   // class riscv_VSADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSADD,    VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VSADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VSADD
   class riscv_VSADD_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSADD_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSADD
   class riscv_VSADD_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSADD_VI, VA_FORMAT, ARITHMETIC, RVV); } // VSADD
   // class riscv_VSSUBU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSSUBU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VSSUBU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSUBU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VSSUBU
   class riscv_VSSUBU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSUBU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSSUBU
   // class riscv_VSSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSSUB,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VSSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VSSUB
   class riscv_VSSUB_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSUB_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSSUB
   // class riscv_VAADDU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VAADDU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VAADDU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAADDU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VAADDU
   class riscv_VAADDU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAADDU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VAADDU
   // class riscv_VAADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VAADD,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VAADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VAADD
   class riscv_VAADD_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VAADD_VX, VA_FORMAT, ARITHMETIC, RVV); } // VAADD
   // class riscv_VASUBU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VASUBU,   VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VASUBU_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VASUBU_VV, VA_FORMAT, ARITHMETIC, RVV); } // VASUBU
   class riscv_VASUBU_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VASUBU_VX, VA_FORMAT, ARITHMETIC, RVV); } // VASUBU
   // class riscv_VASUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VASUB,    VA_FORMAT, ARITHMETIC, RVV, VV, VX); }
   class riscv_VASUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VASUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VASUB
   class riscv_VASUB_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VASUB_VX, VA_FORMAT, ARITHMETIC, RVV); } // VASUB
   // class riscv_VSSRL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSSRL,    VA_FORMAT, SHIFT, RVV, VV, VX, VI); }
   class riscv_VSSRL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSRL_VV, VA_FORMAT, SHIFT, RVV); } // VSSRL
   class riscv_VSSRL_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSRL_VX, VA_FORMAT, SHIFT, RVV); } // VSSRL
   class riscv_VSSRL_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSRL_VI, VA_FORMAT, SHIFT, RVV); } // VSSRL
   // class riscv_VSSRA_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSSRA,    VA_FORMAT, SHIFT, RVV, VV, VX, VI); }
   class riscv_VSSRA_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSRA_VV, VA_FORMAT, SHIFT, RVV); } // VSSRA
   class riscv_VSSRA_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSRA_VX, VA_FORMAT, SHIFT, RVV); } // VSSRA
   class riscv_VSSRA_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSRA_VI, VA_FORMAT, SHIFT, RVV); } // VSSRA
   // class riscv_VNCLIPU_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VNCLIPU,  VA_FORMAT, ARITHMETIC, RVV, WV, WX, WI); }
   class riscv_VNCLIPU_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNCLIPU_WV, VA_FORMAT, ARITHMETIC, RVV); } // VNCLIPU
   class riscv_VNCLIPU_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNCLIPU_WX, VA_FORMAT, ARITHMETIC, RVV); } // VNCLIPU
   class riscv_VNCLIPU_WI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNCLIPU_WI, VA_FORMAT, ARITHMETIC, RVV); } // VNCLIPU
   // class riscv_VNCLIP_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VNCLIP,   VA_FORMAT, ARITHMETIC, RVV, WV, WX, WI); }
   class riscv_VNCLIP_WV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNCLIP_WV, VA_FORMAT, ARITHMETIC, RVV); } // VNCLIP
   class riscv_VNCLIP_WX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNCLIP_WX, VA_FORMAT, ARITHMETIC, RVV); } // VNCLIP
   class riscv_VNCLIP_WI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VNCLIP_WI, VA_FORMAT, ARITHMETIC, RVV); } // VNCLIP

   // Vector Floating-Point Instructions
   // class riscv_VFADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFADD,    VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFADD
   class riscv_VFADD_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFADD_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFADD
   // class riscv_VFSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFSUB,    VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFSUB
   class riscv_VFSUB_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSUB_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFSUB
   // class riscv_VFRSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFRSUB,   VA_FORMAT, ARITHMETIC, RVV, VF); }
   class riscv_VFRSUB_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFRSUB_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFRSUB
   // class riscv_VFMUL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMUL,    VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMUL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMUL_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMUL
   class riscv_VFMUL_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMUL_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMUL
   // class riscv_VFDIV_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFDIV,    VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFDIV_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFDIV_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFDIV
   class riscv_VFDIV_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFDIV_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFDIV
   // class riscv_VFRDIV_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFRDIV,   VA_FORMAT, ARITHMETIC, RVV, VF); }
   class riscv_VFRDIV_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFRDIV_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFRDIV
   // class riscv_VFWMUL_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFWMUL,   VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFWMUL_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWMUL_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFWMUL
   class riscv_VFWMUL_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWMUL_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFWMUL
   // class riscv_VFMACC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMACC,   VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMACC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMACC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMACC
   class riscv_VFMACC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMACC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMACC
   // class riscv_VFNMACC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFNMACC,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFNMACC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMACC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFNMACC
   class riscv_VFNMACC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMACC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFNMACC
   // class riscv_VFMSAC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMSAC,   VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMSAC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMSAC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMSAC
   class riscv_VFMSAC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMSAC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMSAC
   // class riscv_VFNMSAC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFNMSAC,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFNMSAC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMSAC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFNMSAC
   class riscv_VFNMSAC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMSAC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFNMSAC
   // class riscv_VFMADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMADD,   VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMADD
   class riscv_VFMADD_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMADD_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMADD
   // class riscv_VFNMADD_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFNMADD,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFNMADD_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMADD_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFNMADD
   class riscv_VFNMADD_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMADD_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFNMADD
   // class riscv_VFMSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMSUB,   VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMSUB
   class riscv_VFMSUB_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMSUB_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMSUB
   // class riscv_VFNMSUB_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFNMSUB,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFNMSUB_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMSUB_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFNMSUB
   class riscv_VFNMSUB_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNMSUB_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFNMSUB
   // class riscv_VFWMACC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFWMACC,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFWMACC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWMACC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFWMACC
   class riscv_VFWMACC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWMACC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFWMACC
   // class riscv_VFWNMACC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFWNMACC, VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFWNMACC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWNMACC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFWNMACC
   class riscv_VFWNMACC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWNMACC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFWNMACC
   // class riscv_VFWMSAC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFWMSAC,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFWMSAC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWMSAC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFWMSAC
   class riscv_VFWMSAC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWMSAC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFWMSAC
   // class riscv_VFWNMSAC_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFWNMSAC, VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFWNMSAC_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWNMSAC_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFWNMSAC
   class riscv_VFWNMSAC_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWNMSAC_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFWNMSAC

   class riscv_VFSQRT_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSQRT_V, VS2_FORMAT, ARITHMETIC, RVV); }

   // class riscv_VFMIN_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMIN,    VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMIN_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMIN_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMIN
   class riscv_VFMIN_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMIN_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMIN
   // class riscv_VFMAX_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMAX,    VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFMAX_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMAX_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFMAX
   class riscv_VFMAX_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMAX_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFMAX
   // class riscv_VFSGNJ_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJ,   VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFSGNJ_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJ_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFSGNJ
   class riscv_VFSGNJ_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJ_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFSGNJ
   // class riscv_VFSGNJN_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJN,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFSGNJN_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJN_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFSGNJN
   class riscv_VFSGNJN_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJN_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFSGNJN
   // class riscv_VFSGNJX_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJX,  VA_FORMAT, ARITHMETIC, RVV, VV, VF); }
   class riscv_VFSGNJX_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJX_VV, VA_FORMAT, ARITHMETIC, RVV); } // VFSGNJX
   class riscv_VFSGNJX_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFSGNJX_VF, VA_FORMAT, ARITHMETIC, RVV); } // VFSGNJX
   // class riscv_VMFEQ_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMFEQ,    VA_FORMAT, COMPARE, RVV, VV, VF); }
   class riscv_VMFEQ_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFEQ_VV, VA_FORMAT, COMPARE, RVV); } // VMFEQ
   class riscv_VMFEQ_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFEQ_VF, VA_FORMAT, COMPARE, RVV); } // VMFEQ
   // class riscv_VMFNE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMFNE,    VA_FORMAT, COMPARE, RVV, VV, VF); }
   class riscv_VMFNE_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFNE_VV, VA_FORMAT, COMPARE, RVV); } // VMFNE
   class riscv_VMFNE_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFNE_VF, VA_FORMAT, COMPARE, RVV); } // VMFNE
   // class riscv_VMFLT_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMFLT,    VA_FORMAT, COMPARE, RVV, VV, VF); }
   class riscv_VMFLT_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFLT_VV, VA_FORMAT, COMPARE, RVV); } // VMFLT
   class riscv_VMFLT_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFLT_VF, VA_FORMAT, COMPARE, RVV); } // VMFLT
   // class riscv_VMFLE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMFLE,    VA_FORMAT, COMPARE, RVV, VV, VF); }
   class riscv_VMFLE_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFLE_VV, VA_FORMAT, COMPARE, RVV); } // VMFLE
   class riscv_VMFLE_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFLE_VF, VA_FORMAT, COMPARE, RVV); } // VMFLE
   // class riscv_VMFGT_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMFGT,    VA_FORMAT, COMPARE, RVV, VF); }
   class riscv_VMFGT_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFGT_VF, VA_FORMAT, COMPARE, RVV); } // VMFGT
   // class riscv_VMFGE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VMFGE,    VA_FORMAT, COMPARE, RVV, VF); }
   class riscv_VMFGE_VF_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMFGE_VF, VA_FORMAT, COMPARE, RVV); } // VMFGE

   class riscv_VFCLASS_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFCLASS_V,VS2_FORMAT, COMPARE, RVV); }

   // class riscv_VFMERGE_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMERGE,  VA_FORMAT, ARITHMETIC, RVV, VFM); }
   class riscv_VFMERGE_VFM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMERGE_VFM, VA_FORMAT, ARITHMETIC, RVV); } // VFMERGE
   // class riscv_VFMV_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VFMV,     VA_FORMAT, ARITHMETIC, RVV, VF); }
   class riscv_VFMV_V_F_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMV_V_F, VA_FORMAT, ARITHMETIC, RVV); } // VFMV

   // Vector conversion instructions
   class riscv_VFCVT_XU_F_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFCVT_XU_F_V,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFCVT_X_F_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFCVT_X_F_V,      VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFCVT_F_XU_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFCVT_F_XU_V,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFCVT_F_X_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFCVT_F_X_V,      VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWCVT_XU_F_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWCVT_XU_F_V,    VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWCVT_X_F_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWCVT_X_F_V,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWCVT_F_XU_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWCVT_F_XU_V,    VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWCVT_F_X_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWCVT_F_X_V,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWCVT_F_F_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWCVT_F_F_V,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFNCVT_XU_F_W_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNCVT_XU_F_W,    VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFNCVT_X_F_W_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNCVT_X_F_W,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFNCVT_F_XU_W_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNCVT_F_XU_W,    VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFNCVT_F_X_W_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNCVT_F_X_W,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFNCVT_F_F_W_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNCVT_F_F_W,     VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFNCVT_ROD_F_F_W_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFNCVT_ROD_F_F_W, VS2_FORMAT, ARITHMETIC, RVV); }

   // Vector reduction instruction
   class riscv_VREDSUM_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDSUM_VS,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDMAXU_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDMAXU_VS,   VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDMAX_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDMAX_VS,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDMINU_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDMINU_VS,   VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDMIN_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDMIN_VS,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDAND_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDAND_VS,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDOR_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDOR_VS,     VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VREDXOR_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VREDXOR_VS,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VWREDSUMU_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWREDSUMU_VS,  VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VWREDSUM_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VWREDSUM_VS,   VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFREDOSUM_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFREDOSUM_VS,  VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFREDSUM_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFREDSUM_VS,   VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFREDMAX_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFREDMAX_VS,   VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWREDOSUM_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWREDOSUM_VS, VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFWREDSUM_VS_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFWREDSUM_VS,  VA_FORMAT, ARITHMETIC, RVV); }

   // Vector mask instruction
   class riscv_VMAND_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMAND_MM,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMNAND_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMNAND_MM,   VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMANDNOT_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMANDNOT_MM, VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMXOR_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMXOR_MM,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMOR_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMOR_MM,     VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMNOR_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMNOR_MM,    VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMORNOT_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMORNOT_MM,  VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMXNOR_MM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMXNOR_MM,   VA_FORMAT, ARITHMETIC, RVV); }

   class riscv_VPOPC_M_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VPOPC_M,   VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFIRST_M_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFIRST_M,  VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMSBF_M_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSBF_M,   VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMSIF_M_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSIF_M,   VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMSOF_M_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMSOF_M,   VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VIOTA_M_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VIOTA_M,   VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VID_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VID_V,     VS2_FORMAT, ARITHMETIC, RVV); }

   // Vector permutation instruction
   class riscv_VMV_X_S_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV_X_S,  VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMV_S_X_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV_S_X,  VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFMV_F_S_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMV_F_S, VA_FORMAT, ARITHMETIC, RVV); }
   class riscv_VFMV_S_F_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VFMV_S_F, VA_FORMAT, ARITHMETIC, RVV); }


   // class riscv_VSLIDEUP_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSLIDEUP,    VA_FORMAT, ARITHMETIC, RVV, VI, VX); }
   class riscv_VSLIDEUP_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLIDEUP_VI, VA_FORMAT, ARITHMETIC, RVV); } // VSLIDEUP
   class riscv_VSLIDEUP_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLIDEUP_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSLIDEUP
   // class riscv_VSLIDEDOWN_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSLIDEDOWN,  VA_FORMAT, ARITHMETIC, RVV, VI, VX); }
   class riscv_VSLIDEDOWN_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLIDEDOWN_VI, VA_FORMAT, ARITHMETIC, RVV); } // VSLIDEDOWN
   class riscv_VSLIDEDOWN_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLIDEDOWN_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSLIDEDOWN
   // class riscv_VSLIDE1UP_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSLIDE1UP,   VA_FORMAT, ARITHMETIC, RVV, VX); }
   class riscv_VSLIDE1UP_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLIDE1UP_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSLIDE1UP
   // class riscv_VSLIDE1DOWN_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VSLIDE1DOWN, VA_FORMAT, ARITHMETIC, RVV, VX); }
   class riscv_VSLIDE1DOWN_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSLIDE1DOWN_VX, VA_FORMAT, ARITHMETIC, RVV); } // VSLIDE1DOWN
   // class riscv_VRGATHER_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VRGATHER,    VA_FORMAT, ARITHMETIC, RVV, VV, VX, VI); }
   class riscv_VRGATHER_VV_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VRGATHER_VV, VA_FORMAT, ARITHMETIC, RVV); } // VRGATHER
   class riscv_VRGATHER_VX_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VRGATHER_VX, VA_FORMAT, ARITHMETIC, RVV); } // VRGATHER
   class riscv_VRGATHER_VI_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VRGATHER_VI, VA_FORMAT, ARITHMETIC, RVV); } // VRGATHER
   // class riscv_VCOMPRESS_instr: riscv_vector_instr   // { mixin RISCV_VA_INSTR_MIXIN!(VCOMPRESS,   VA_FORMAT, ARITHMETIC, RVV, VM); }
   class riscv_VCOMPRESS_VM_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VCOMPRESS_VM, VA_FORMAT, ARITHMETIC, RVV); } // VCOMPRESS

   class riscv_VMV1R_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV1R_V, VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMV2R_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV2R_V, VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMV4R_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV4R_V, VS2_FORMAT, ARITHMETIC, RVV); }
   class riscv_VMV8R_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VMV8R_V, VS2_FORMAT, ARITHMETIC, RVV); }

   // -------------------------------------------------------------------------
   //  Section 7. Vector Loads and Stores
   // -------------------------------------------------------------------------
   // Section 7.4 - Vector Unit-Stride Instructions
   //    class riscv_VLE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VLE_V, VL_FORMAT, LOAD, RVV); }   // mismatch with riscv-opcodes
   // class riscv_VSE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSE_V, VS_FORMAT, STORE, RVV); }   // mismatch with riscv-opcodes

   // // Section 7.5 - Vector Strided Instructions
   // class riscv_VLSE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VLSE_V, VLS_FORMAT, LOAD, RVV); }
   // class riscv_VSSE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSSE_V, VSS_FORMAT, STORE, RVV); }
   // // Section 7.6 - Vector Indexed Instructions
   // class riscv_VLXEI_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VLXEI_V, VLX_FORMAT, LOAD, RVV); }
   // class riscv_VSXEI_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSXEI_V, VSX_FORMAT, STORE, RVV); }
   // class riscv_VSUXEI_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VSUXEI_V, VSX_FORMAT, STORE, RVV); }
   // // Section 7.7 - Vector Unit-Stride Fault-Only-First Loads
   // class riscv_VLEFF_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!(VLEFF_V, VL_FORMAT, LOAD, RVV); }
   // // Section 7.8 - Vector Load/Store Segment Instructions (Zvlsseg)
   // // 7.8.1. Vector Unit Strided Segment Loads and Stores
   // class riscv_VLSEGE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VLSEGE_V, VL_FORMAT, LOAD, RVV); }
   // class riscv_VSSEGE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VSSEGE_V, VS_FORMAT, STORE, RVV); }
   // class riscv_VLSEGEFF_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VLSEGEFF_V, VL_FORMAT, LOAD, RVV); }
   // // 7.8.2. Vector Strided Segment Loads and Stores
   // class riscv_VLSSEGE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VLSSEGE_V, VLS_FORMAT, LOAD, RVV); }
   // class riscv_VSSSEGE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VSSSEGE_V, VSS_FORMAT, STORE, RVV); }
   // // 7.8.3. Vector Indexed Segment Loads and Stores
   // class riscv_VLXSEGEI_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VLXSEGEI_V, VLX_FORMAT, LOAD, RVV); }
   // class riscv_VSXSEGEI_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VSXSEGEI_V, VSX_FORMAT, STORE, RVV); }
   // class riscv_VSUXSEGEI_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvlsseg", VSUXSEGEI_V, VSX_FORMAT, STORE, RVV); }

   // // -------------------------------------------------------------------------
   // //  Section 8. Vector AMO Operations (Zvamo)
   // // -------------------------------------------------------------------------
   // // EEW vector AMOs
   // class riscv_VAMOSWAPE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOSWAPE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOADDE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOADDE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOXORE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOXORE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOANDE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOANDE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOORE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOORE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOMINE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOMINE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOMAXE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOMAXE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOMINUE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOMINUE_V, VAMO_FORMAT, AMO, RVV); }
   // class riscv_VAMOMAXUE_V_instr: riscv_vector_instr   { mixin RISCV_VA_INSTR_MIXIN!("zvamo", VAMOMAXUE_V, VAMO_FORMAT, AMO, RVV); }
 }
