/*
 * Copyright 2020 Google LLC
 * Copyright 2020 Andes Technology Co., Ltd.
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

import uvm;

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

mixin (riscv_va_instr_mixin(VSLIDEUP,    VA_FORMAT, ARITHMETIC, RVV, [VI,VX]));
mixin (riscv_va_instr_mixin(VSLIDEDOWN,  VA_FORMAT, ARITHMETIC, RVV, [VI,VX]));
mixin (riscv_va_instr_mixin(VSLIDE1UP,   VA_FORMAT, ARITHMETIC, RVV, [VX]));
mixin (riscv_va_instr_mixin(VSLIDE1DOWN, VA_FORMAT, ARITHMETIC, RVV, [VX]));
mixin (riscv_va_instr_mixin(VRGATHER,    VA_FORMAT, ARITHMETIC, RVV, [VV,VX,VI]));
mixin (riscv_va_instr_mixin(VCOMPRESS,   VA_FORMAT, ARITHMETIC, RVV, [VM]));

mixin (riscv_va_instr_mixin(VMV1R_V, VS2_FORMAT, ARITHMETIC, RVV));
mixin (riscv_va_instr_mixin(VMV2R_V, VS2_FORMAT, ARITHMETIC, RVV));
mixin (riscv_va_instr_mixin(VMV4R_V, VS2_FORMAT, ARITHMETIC, RVV));
mixin (riscv_va_instr_mixin(VMV8R_V, VS2_FORMAT, ARITHMETIC, RVV));

// -------------------------------------------------------------------------
//  Section 7. Vector Loads and Stores
// -------------------------------------------------------------------------
// Section 7.4 - Vector Unit-Stride Instructions
mixin (riscv_va_instr_mixin(VLE_V, VL_FORMAT, LOAD, RVV));
mixin (riscv_va_instr_mixin(VSE_V, VS_FORMAT, STORE, RVV));
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
