/*
 * Copyright 2020 Google LLC
 * Copyright 2020 Andes Technology Co., Ltd.
   Copyright 2022 Coverify Systems Technology
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


// Base class for RISC-V vector exenstion ISA, implmented based on spec v0.8
module riscv.gen.isa.riscv_vector_instr;

import riscv.gen.riscv_instr_pkg: riscv_vreg_t, va_variant_t,
  riscv_instr_name_t, riscv_instr_format_t, va_base_instr,
  MAX_INSTR_STR_LEN, riscv_instr_category_t;
import riscv.gen.isa.riscv_instr: riscv_instr;
import riscv.gen.isa.riscv_floating_point_instr: riscv_floating_point_instr;
import riscv.gen.riscv_instr_gen_config: riscv_instr_gen_config;

import std.format: format;

import esdl.rand: rand, constraint;
import esdl.data.bvec: ubvec;
import std.algorithm: canFind;

import uvm;

class riscv_vector_instr: riscv_floating_point_instr
{
  mixin uvm_object_utils;

  @rand riscv_vreg_t vs1;
  @rand riscv_vreg_t vs2;
  @rand riscv_vreg_t vs3;
  @rand riscv_vreg_t vd;
  @rand va_variant_t va_variant;
  @rand bool         vm;
  @rand bool         wd;
  @rand ubvec!11     eew;
  bool               has_vd = true;
  bool               has_vs1 = true;
  bool               has_vs2 = true;
  bool               has_vs3 = true;
  bool               has_vm = false;
  bool               has_va_variant;
  bool               is_widening_instr;
  bool               is_narrowing_instr;
  bool               is_quad_widening_instr;
  bool               is_convert_instr;
  va_variant_t []    allowed_va_variants;
  string             sub_extension;
  @rand ubvec!3      nfields; // Used by segmented load/store
  bool               rand_nfields;
  @rand ubvec!4      emul;

  enum va_base_instr VA_BASE = va_base_instr.VA_NO_BASE;

  constraint!q{
    if (m_cfg.vector_cfg.reserved_vregs.length > 0) {
      !(vd inside [m_cfg.vector_cfg.reserved_vregs]);
    }
  } avoid_reserved_vregs_c;

  constraint!q{
    if (has_va_variant == true) {
      va_variant inside [allowed_va_variants];
    }
  } va_variant_c;

  // Section 3.3.2: Vector Register Grouping (vlmul)
  // Instructions specifying a vector operand with an odd-numbered vector register will raisean
  // illegal instruction exception.
  // TODO: Exclude the instruction that ignore VLMUL
  // TODO: Update this constraint for fractional LMUL
  constraint!q{
    if (m_cfg.vector_cfg.vtype.vlmul > 0) {
      vd  % m_cfg.vector_cfg.vtype.vlmul == 0;
      vs1 % m_cfg.vector_cfg.vtype.vlmul == 0;
      vs2 % m_cfg.vector_cfg.vtype.vlmul == 0;
      vs3 % m_cfg.vector_cfg.vtype.vlmul == 0;
    }
  } operand_group_c;

  // Section 11.2: Widening Vector Arithmetic Instructions
  constraint!q{
    if (is_widening_instr == true) {
      // The destination vector register group results are arranged as if both
      // SEW and LMUL were at twice their current settings.
      vd % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
      // The destination vector register group cannot overlap a source vector
      // register group of a different element width (including the mask register if masked)
      !(vs1 inside [vd..(vd + m_cfg.vector_cfg.vtype.vlmul * 2)]);
      !(vs2 inside [vd..(vd + m_cfg.vector_cfg.vtype.vlmul * 2)]);
      (vm == false) -> (vd != 0);
      // Double-width result, first source double-width, second source single-width
      if (va_variant inside [va_variant_t.WV, va_variant_t.WX]) {
	vs2 % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
      }
    }
  } widening_instr_c;

  // Section 11.3: Narrowing Vector Arithmetic Instructions
  constraint!q{
    if (is_narrowing_instr == true) {
      // The source and destination vector register numbers must be aligned
      // appropriately for the vector registergroup size
      vs2 % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
      // The destination vector register group cannot overlap the rst source
      // vector register group (specied by vs2)
      !(vd inside [vs2..(vs2 + m_cfg.vector_cfg.vtype.vlmul * 2)]);
      // The destination vector register group cannot overlap the mask register
      // if used, unless LMUL=1 (implemented in vmask_overlap_c)
    }
  }  narrowing_instr_c;

  // 12.3. Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions
  constraint!q{
    if (m_cfg.vector_cfg.vtype.vlmul  > 1) {
      // For vadc and vsbc, an illegal instruction exception is raised if the
      // destination vector register is v0 and LMUL> 1
      if (VA_BASE inside [va_base_instr.VADC,
			  va_base_instr.VSBC]) {
	vd != 0;
      }
      // For vmadc and vmsbc, an illegal instruction exception is raised if the
      // destination vector register overlaps asource vector register group and LMUL > 1
      if (VA_BASE inside [va_base_instr.VMADC,
			  va_base_instr.VMSBC]) {
	vd != vs2;
	vd != vs1;
      }
    }
  } add_sub_with_carry_c;

  // 12.7. Vector Integer Comparison Instructions
  // For all comparison instructions, an illegal instruction exception is raised if the
  // destination vector register overlaps a source vector register group and LMUL > 1
  constraint!q{
    if (category == riscv_instr_category_t.COMPARE) {
      vd != vs2;
      vd != vs1;
    }
  } compare_instr_c;

  // 16.8. Vector Iota Instruction
  // An illegal instruction exception is raised if the destination vector register group
  // overlaps the source vector mask register. If the instruction is masked, an illegal
  // instruction exception is issued if the destination vector register group overlaps v0.
  constraint!q{
    if (instr_name == riscv_instr_name_t.VIOTA_M) {
      vd != vs2;
      (vm == false) -> (vd != 0);
    }
  } vector_itoa_c;

  // 16.9. Vector Element Index Instruction
  // The vs2 eld of the instruction must be set to v0, otherwise the encoding is reserved
  constraint!q{
    if (instr_name == riscv_instr_name_t.VID_V) {
      vs2 == 0;
      // TODO; Check if this constraint is needed
      vd != vs2;
    }
  } vector_element_index_c;

  // Section 17.3  Vector Slide Instructions
  // The destination vector register group for vslideup cannot overlap the vector register
  // group of the source vector register group or the mask register
  constraint!q{
    if (VA_BASE inside [va_base_instr.VSLIDEUP,
			va_base_instr.VSLIDE1UP,
			va_base_instr.VSLIDEDOWN,
			va_base_instr.VSLIDE1DOWN]) {
      vd != vs2;
      vd != vs1;
      (vm == false) -> (vd != 0);
    }
  } vector_slide_c;

  // Section 17.4: Vector Register Gather Instruction
  // For any vrgather instruction, the destination vector register group cannot overlap
  // with the source vector register group
  constraint!q{
    if (VA_BASE == va_base_instr.VRGATHER) {
      vd != vs2;
      vd != vs1;
      (vm == false) -> (vd != 0);
    }
  }  vector_gather_c;

  // Section 17.5: Vector compress instruction
  // The destination vector register group cannot overlap the source vector register
  // group or the source vector mask register
  constraint!q{
    if (VA_BASE == va_base_instr.VCOMPRESS) {
      vd != vs2;
      vd != vs1;
      (vm == false) -> (vd != 0);
    }
  } vector_compress_c;

  // Section 7.8. Vector Load/Store Segment Instructions
  // The LMUL setting must be such that LMUL * NFIELDS <= 8
  // Vector register numbers accessed by the segment load or store would increment
  // cannot past 31

  constraint!q{
    if $(check_sub_extension(sub_extension, "zvlsseg")) {
	if (m_cfg.vector_cfg.vtype.vlmul < 8) {
	  (nfields + 1) * m_cfg.vector_cfg.vtype.vlmul <= 8;
	  if (category == riscv_instr_category_t.LOAD) {
	    vd + nfields <= 31;
	  }
	  if (category == riscv_instr_category_t.STORE) {
	    vs3 + nfields <= 31;
	  }
	  // TODO: Check gcc compile issue with nfields == 0
	  nfields > 0;
	}
	else {
	  nfields == 0;
	}
      }
  } nfields_c;

  constraint!q{
    if (instr_name == riscv_instr_name_t.VMV2R_V) {
      vs2 % 2 == 0;
      vd  % 2 == 0;
    }
    if (instr_name == riscv_instr_name_t.VMV4R_V) {
      vs2 % 4 == 0;
      vd  % 4 == 0;
    }
    if (instr_name == riscv_instr_name_t.VMV8R_V) {
      vs2 % 8 == 0;
      vd  % 8 == 0;
    }
  }  vmv_alignment_c;

  /////////////////// Vector mask constraint ///////////////////

  // Section 5.3
  // The destination vector register group for a masked vector instruction can only overlap
  // the source mask register (v0) when LMUL=1
  constraint!q{
    (vm == false) && (m_cfg.vector_cfg.vtype.vlmul > 1) -> (vd != 0);
  } vmask_overlap_c;

  constraint!q{
    // Below instruction is always masked
    if (VA_BASE inside [va_base_instr.VMERGE,
			va_base_instr.VFMERGE,
			va_base_instr.VADC,
			va_base_instr.VSBC]) {
      vm == false;
    }
  } vector_mask_enable_c;

  constraint!q{
    // (vm=0) is reserved for below ops
    if (instr_name inside [riscv_instr_name_t.VMV_VV, riscv_instr_name_t.VMV_VX, riscv_instr_name_t.VMV_VI,
			   riscv_instr_name_t.VFMV_VF, riscv_instr_name_t.VCOMPRESS_VM, riscv_instr_name_t.VFMV_F_S,
			   riscv_instr_name_t.VFMV_S_F, riscv_instr_name_t.VMV_X_S,
			   riscv_instr_name_t.VMV_S_X, riscv_instr_name_t.VMV1R_V,
			   riscv_instr_name_t.VMV2R_V, riscv_instr_name_t.VMV4R_V,
			   riscv_instr_name_t.VMV8R_V]) {
      vm == true;
    }
  } vector_mask_disable_c;

  // 16.1. Vector Mask-Register Logical Instructions
  // No vector mask for these instructions
  constraint!q{
    if (instr_name inside [riscv_instr_name_t.VMAND_MM : riscv_instr_name_t.VMXNOR_MM]) {
      vm == true;
    }
  } vector_mask_instr_c;

  // This is now dealt with in config object
  // constraint!q{
  //   if (! m_cfg.vector_cfg.vec_fp) {
  //     va_variant != va_variant_t.VF;
  //   }
  // } disable_floating_point_varaint_c;

  constraint!q{
    // TODO: Check why this is needed?
    if (category == riscv_instr_category_t.STORE) {
      (vm == false) -> (vs3 != 0);
      vs2 != vs3;
    }
    // 7.8.3 For vector indexed segment loads, the destination vector register groups
    // cannot overlap the source vectorregister group (specied by vs2), nor can they
    // overlap the mask register if masked
    // AMO instruction uses indexed address mode
    if (instr_format inside [riscv_instr_format_t.VLX_FORMAT, riscv_instr_format_t.VAMO_FORMAT]) {
      vd != vs2;
    }
  } vector_load_store_mask_overlap_c;

  // load/store EEW/EMUL and corresponding register grouping constraints
  constraint!q{
    solve eew before emul;
    solve emul before vd;
    solve emul before vs1;
    solve emul before vs2;
    solve emul before vs3;
  }  load_store_solve_order_c;

  constraint!q{
    if (category inside [riscv_instr_category_t.LOAD, riscv_instr_category_t.STORE,
			 riscv_instr_category_t.AMO]) {
      eew inside [m_cfg.vector_cfg.legal_eew];
      if (eew > m_cfg.vector_cfg.vtype.vsew) {
        emul == eew / m_cfg.vector_cfg.vtype.vsew;
      }
      else {
        emul == 1;
      }
      if (emul > 1) {
        vd % emul == 0;
        vs1 % emul == 0;
        vs2 % emul == 0;
        vs3 % emul == 0;
      }
    }
  } load_store_eew_emul_c;

  // Some temporarily constraint to avoid illegal instruction
  // TODO: Review these constraints
  constraint!q{
    (vm == false) -> (vd != 0);
  } temp_c;


  this(string name = "riscv_vector_instr") {
    super(name);
  }

  // Filter unsupported instructions based on configuration
  override bool is_supported(riscv_instr_gen_config cfg) {
    import std.conv: to;
    string name = instr_name.to!string();
    // 19.2.2. Vector Add with Carry/Subtract with Borrow Reserved under EDIV>1
    if ((cfg.vector_cfg.vtype.vediv > 1) &&
	(VA_BASE.inside(va_base_instr.VADC, va_base_instr.VSBC,
			va_base_instr.VMADC, va_base_instr.VMSBC))) {
      return false;
    }
    // Disable widening/narrowing instruction when LMUL == 8
    if ((!cfg.vector_cfg.vec_narrowing_widening) &&
	(is_widening_instr || is_narrowing_instr)) {
      return false;
    }
    if (!cfg.vector_cfg.vec_quad_widening && is_quad_widening_instr) {
      return false;
    }
    // TODO: Clean up this list, it's causing gcc compile error now
    if (VA_BASE.inside(va_base_instr.VWMACCSU,
		       va_base_instr.VMERGE,
		       va_base_instr.VFMERGE,
		       va_base_instr.VMADC,
		       va_base_instr.VMSBC)) {
      return false;
    }
    // The standard vector floating-point instructions treat 16-bit, 32-bit, 64-bit,
    // and 128-bit elements as IEEE-754/2008-compatible values. If the current SEW does
    // not correspond to a supported IEEE floating-pointtype, an illegal instruction
    // exception is raised
    if (!cfg.vector_cfg.vec_fp) {
      if ((name[0..2] == "VF") || (name[0..3] == "VMF")) {
        return false;
      }
    }
    return true;
  }

  override string get_instr_name() {
    string name = super.get_instr_name();
    if (category.inside(riscv_instr_category_t.LOAD, riscv_instr_category_t.STORE)) {
      // Add eew before ".v" or "ff.v" suffix
      if (instr_name.inside(riscv_instr_name_t.VLEFF_V, riscv_instr_name_t.VLSEGEFF_V)) {
	name = name[0..name.length - 4];
        name = format("%0s%0dFF.V", name, eew);
      }
      else {
        name = name[0..name.length - 2];
        name = format("%0s%0d.V", name, eew);
      }
      uvm_info(get_full_name(), format("%0s -> %0s", super.get_instr_name(), name), UVM_LOW);
    }
    return name;
  }

  override char[] get_instr_name(char[] buf) {
    import std.format: sformat;
    char[32] buf_;
    char[] name = super.get_instr_name(buf_);
    if (category.inside(riscv_instr_category_t.LOAD, riscv_instr_category_t.STORE)) {
      // Add eew before ".v" or "ff.v" suffix
      if (instr_name.inside(riscv_instr_name_t.VLEFF_V, riscv_instr_name_t.VLSEGEFF_V)) {
	name = name[0..name.length - 4];
        name = sformat!("%0s%0dFF.V")(buf, name, eew);
      }
      else {
        name = name[0..name.length - 2];
        name = sformat!("%0s%0d.V")(buf, name, eew);
      }
      uvm_info(get_full_name(), format("%0s -> %0s", super.get_instr_name(), name), UVM_LOW);
    }
    return name;
  }

  // Convert the instruction to assembly code
  override string convert2asm(string prefix = "") {
    import std.string: toLower;
    string asm_str;
    switch (instr_format) {
    case riscv_instr_format_t.VS2_FORMAT:
      if (instr_name == riscv_instr_name_t.VID_V) {
	asm_str = format("vid.v %s", vd);
      }
      else if (instr_name.inside(riscv_instr_name_t.VPOPC_M,
				 riscv_instr_name_t.VFIRST_M)) {
	asm_str = format("%0s %0s,%0s", get_instr_name(), rd, vs2);
      }
      else {
	asm_str = format("%0s %0s,%0s", get_instr_name(), vd, vs2);
      }
      break;
    case riscv_instr_format_t.VA_FORMAT:
      if (VA_BASE == va_base_instr.VMV) {
	switch (va_variant) {
	case va_variant_t.VV:
	  asm_str = format("vmv.v.v %s,%s", vd, vs1);
	  break;
	case va_variant_t.VX:
	  asm_str = format("vmv.v.x %s,%s", vd, rs1);
	  break;
	case va_variant_t.VI:
	  asm_str = format("vmv.v.i %s,%s", vd, imm_str);
	  break;
	default: uvm_info(get_full_name(), format("Unsupported va_variant %0s", va_variant), UVM_LOW);
	}
      }
      else if (VA_BASE == va_base_instr.VFMV) {
	asm_str = format("vfmv.v.f %s,%s", vd, fs1);
      }
      else if (instr_name == riscv_instr_name_t.VMV_X_S) {
	asm_str = format("vmv.x.s %s,%s", rd, vs2);
      }
      else if (instr_name == riscv_instr_name_t.VMV_S_X) {
	asm_str = format("vmv.s.x %s,%s", vd, rs1);
      }
      else if (instr_name == riscv_instr_name_t.VFMV_F_S) {
	asm_str = format("vfmv.f.s %s,%s", fd, vs2);
      }
      else if (instr_name == riscv_instr_name_t.VFMV_S_F) {
	asm_str = format("vfmv.s.f %s,%s", vd, fs1);
      }
      else {
	enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
	if (!has_va_variant) {
	  asm_str = format!FMT(get_instr_name());
	  asm_str = asm_str ~ format("%0s,%0s,%0s", vd, vs2, vs1);
	}
	else {
	  asm_str = format("%0s.%0s ", get_instr_name(), va_variant);
	  asm_str = format!FMT(asm_str);
	  switch (va_variant) {
	  case va_variant_t.WV,
	    va_variant_t.VV,
	    va_variant_t.VVM,
	    va_variant_t.VM:
	    asm_str = asm_str ~ format("%0s,%0s,%0s", vd, vs2, vs1);
	    break;
	  case va_variant_t.WI,
	    va_variant_t.VI,
	    va_variant_t.VIM:
	    asm_str = asm_str ~ format("%0s,%0s,%0s", vd, vs2, imm_str);
	    break;
	  case va_variant_t.VF,
	    va_variant_t.VFM:
	    if (VA_BASE.inside(va_base_instr.VFMADD,
			       va_base_instr.VFNMADD,
			       va_base_instr.VFMACC,
			       va_base_instr.VFNMACC,
			       va_base_instr.VFNMSUB,
			       va_base_instr.VFWNMSAC,
			       va_base_instr.VFWMACC,
			       va_base_instr.VFMSUB,
			       va_base_instr.VFMSAC,
			       va_base_instr.VFNMSAC,
			       va_base_instr.VFWNMACC,
			       va_base_instr.VFWMSAC)) {
	      asm_str = asm_str ~ format("%0s,%0s,%0s", vd, fs1, vs2);
	    }
	    else {
	      asm_str = asm_str ~ format("%0s,%0s,%0s", vd, vs2, fs1);
	    }
	    break;
	  case va_variant_t.WX,
	    va_variant_t.VX,
	    va_variant_t.VXM:
	    if (VA_BASE.inside(va_base_instr.VMADD,
			       va_base_instr.VNMSUB,
			       va_base_instr.VMACC,
			       va_base_instr.VNMSAC,
			       va_base_instr.VWMACCSU,
			       va_base_instr.VWMACCU,
			       va_base_instr.VWMACCUS,
			       va_base_instr.VWMACC)) {
	      asm_str ~= format("%0s,%0s,%0s", vd, rs1, vs2);
	    }
	    else {
	      asm_str ~= format("%0s,%0s,%0s", vd, vs2, rs1);
	    }
	    break;
	  default: break;
	  }
	}
      }
      break;
    case riscv_instr_format_t.VL_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_str = format("%0s %s,(%s)", add_nfields(get_instr_name(), "vlseg"),
			 vd, rs1);
      }
      else {
	asm_str = format("%0s %s,(%s)", get_instr_name(), vd, rs1);
      }
      break;
    case riscv_instr_format_t.VS_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_str = format("%0s %s,(%s)", add_nfields(get_instr_name(), "vsseg"),
			 vs3, rs1);
      }
      else {
	asm_str = format("%0s %s,(%s)", get_instr_name(), vs3, rs1);
      }
      break;
    case riscv_instr_format_t.VLS_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_str = format("%0s %0s,(%0s),%0s", add_nfields(get_instr_name(), "vlsseg"),
			 vd, rs1, rs2);
      }
      else {
	asm_str = format("%0s %0s,(%0s),%0s", get_instr_name(),
			 vd, rs1, rs2);
      }
      break;
    case riscv_instr_format_t.VSS_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_str = format("%0s %0s,(%0s),%0s", add_nfields(get_instr_name(), "vssseg"),
			 vs3, rs1, rs2);
      }
      else {
	asm_str = format("%0s %0s,(%0s),%0s", get_instr_name(),
			 vs3, rs1, rs2);
      }
      break;
    case riscv_instr_format_t.VLX_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_str = format("%0s %0s,(%0s),%0s", add_nfields(get_instr_name(), "vlxseg"),
			 vd, rs1, vs2);
      }
      else {
	asm_str = format("%0s %0s,(%0s),%0s", get_instr_name(),
			 vd, rs1, vs2);
      }
      break;
    case riscv_instr_format_t.VSX_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_str = format("%0s %0s,(%0s),%0s", add_nfields(get_instr_name(), "vsxseg"),
			 vs3, rs1, vs2);
      }
      else {
	asm_str = format("%0s %0s,(%0s),%0s", get_instr_name(),
			 vs3, rs1, vs2);
      }
      break;
    case riscv_instr_format_t.VAMO_FORMAT:
      if (wd) {
	asm_str = format("%0s %0s,(%0s),%0s,%0s", get_instr_name(), vd,
			 rs1, vs2, vd);
      }
      else {
	asm_str = format("%0s x0,(%0s),%0s,%0s", get_instr_name(),
			 rs1, vs2, vs3);
      }
      break;
    default:
      uvm_fatal(get_full_name(), format("Unsupported format %0s", instr_format));
    }
    // Add vector mask
    asm_str ~= vec_vm_str();
    if (comment != "") {
      asm_str ~= " #" ~ comment;
    }
    return asm_str.toLower();
  }

  override char[] convert2asm(char[] buf, string prefix = "") {
    import std.string: toLower, toLowerInPlace;
    import std.format: sformat;

    char[64] instr_name_buf;
    char[32] instr_buf;

    char[64] nfields_buf;

    string asm_str;
    char[] asm_buf;

    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";

    switch (instr_format) {
    case riscv_instr_format_t.VS2_FORMAT:
      if (instr_name == riscv_instr_name_t.VID_V) {
	asm_buf = sformat!("vid.v %s")(buf, vd);
      }
      else if (instr_name.inside(riscv_instr_name_t.VPOPC_M,
				 riscv_instr_name_t.VFIRST_M)) {
	asm_buf = sformat!("%0s %0s,%0s")(buf, get_instr_name(instr_buf), rd, vs2);
      }
      else {
	asm_buf = sformat!("%0s %0s,%0s")(buf, get_instr_name(instr_buf), vd, vs2);
      }
      break;
    case riscv_instr_format_t.VA_FORMAT:
      if (VA_BASE == va_base_instr.VMV) {
	switch (va_variant) {
	case va_variant_t.VV:
	  asm_buf = sformat!("vmv.v.v %s,%s")(buf, vd, vs1);
	  break;
	case va_variant_t.VX:
	  asm_buf = sformat!("vmv.v.x %s,%s")(buf, vd, rs1);
	  break;
	case va_variant_t.VI:
	  asm_buf = sformat!("vmv.v.i %s,%s")(buf, vd, imm_str);
	  break;
	default: uvm_info(get_full_name(), format("Unsupported va_variant %0s", va_variant), UVM_LOW);
	}
      }
      else if (VA_BASE == va_base_instr.VFMV) {
	asm_buf = sformat!("vfmv.v.f %s,%s")(buf, vd, fs1);
      }
      else if (instr_name == riscv_instr_name_t.VMV_X_S) {
	asm_buf = sformat!("vmv.x.s %s,%s")(buf, rd, vs2);
      }
      else if (instr_name == riscv_instr_name_t.VMV_S_X) {
	asm_buf = sformat!("vmv.s.x %s,%s")(buf, vd, rs1);
      }
      else if (instr_name == riscv_instr_name_t.VFMV_F_S) {
	asm_buf = sformat!("vfmv.f.s %s,%s")(buf, fd, vs2);
      }
      else if (instr_name == riscv_instr_name_t.VFMV_S_F) {
	asm_buf = sformat!("vfmv.s.f %s,%s")(buf, vd, fs1);
      }
      else {
	if (!has_va_variant) {
	  char[] instr_name_str = sformat!FMT(instr_name_buf, get_instr_name(instr_buf));
	  asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, vs2, vs1);
	}
	else {
	  char[64] instr_name_buf2;
	  char[] instr_name_str2 = sformat!("%0s.%0s ")(instr_name_buf2, get_instr_name(instr_buf), va_variant);
	  char[] instr_name_str = sformat!FMT(instr_name_buf, instr_name_str2);
	  switch (va_variant) {
	  case va_variant_t.WV, 
	    va_variant_t.VV,
	    va_variant_t.VVM,
	    va_variant_t.VM:
	    asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, vs2, vs1);
	    break;
	  case va_variant_t.WI,
	    va_variant_t.VI,
	    va_variant_t.VIM:
	    asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, vs2, imm_str);
	    break;
	  case va_variant_t.VF,
	    va_variant_t.VFM:
	    if (VA_BASE.inside(va_base_instr.VFMADD,
			       va_base_instr.VFNMADD,
			       va_base_instr.VFMACC,
			       va_base_instr.VFNMACC,
			       va_base_instr.VFNMSUB,
			       va_base_instr.VFWNMSAC,
			       va_base_instr.VFWMACC,
			       va_base_instr.VFMSUB,
			       va_base_instr.VFMSAC,
			       va_base_instr.VFNMSAC,
			       va_base_instr.VFWNMACC,
			       va_base_instr.VFWMSAC)) {
	      asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, fs1, vs2);
	    }
	    else {
	      asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, vs2, fs1);
	    }
	    break;
	  case va_variant_t.WX,
	    va_variant_t.VX,
	    va_variant_t.VXM:
	    if (VA_BASE.inside(va_base_instr.VMADD,
			       va_base_instr.VNMSUB,
			       va_base_instr.VMACC,
			       va_base_instr.VNMSAC,
			       va_base_instr.VWMACCSU,
			       va_base_instr.VWMACCU,
			       va_base_instr.VWMACCUS,
			       va_base_instr.VWMACC)) {
	      asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, rs1, vs2);
	    }
	    else {
	      asm_buf = sformat!("%0s%0s,%0s,%0s")(buf, instr_name_str, vd, vs2, rs1);
	    }
	    break;
	  default: break;
	  }
	}
      }
      break;
    case riscv_instr_format_t.VL_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_buf = sformat!("%0s %s,(%s)")(buf, add_nfields(nfields_buf, get_instr_name(instr_buf), "vlseg"),
					  vd, rs1);
      }
      else {
	asm_buf = sformat!("%0s %s,(%s)")(buf, get_instr_name(instr_buf), vd, rs1);
      }
      break;
    case riscv_instr_format_t.VS_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_buf = sformat!("%0s %s,(%s)")(buf, add_nfields(nfields_buf, get_instr_name(instr_buf), "vsseg"),
					  vs3, rs1);
      }
      else {
	asm_buf = sformat!("%0s %s,(%s)")(buf, get_instr_name(instr_buf), vs3, rs1);
      }
      break;
    case riscv_instr_format_t.VLS_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, add_nfields(nfields_buf, get_instr_name(instr_buf), "vlsseg"),
						vd, rs1, rs2);
      }
      else {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, get_instr_name(instr_buf),
						vd, rs1, rs2);
      }
      break;
    case riscv_instr_format_t.VSS_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, add_nfields(nfields_buf, get_instr_name(instr_buf), "vssseg"),
						vs3, rs1, rs2);
      }
      else {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, get_instr_name(instr_buf),
						vs3, rs1, rs2);
      }
      break;
    case riscv_instr_format_t.VLX_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, add_nfields(nfields_buf, get_instr_name(instr_buf), "vlxseg"),
						vd, rs1, vs2);
      }
      else {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, get_instr_name(instr_buf),
						vd, rs1, vs2);
      }
      break;
    case riscv_instr_format_t.VSX_FORMAT:
      if (sub_extension == "zvlsseg") {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, add_nfields(nfields_buf, get_instr_name(instr_buf), "vsxseg"),
						vs3, rs1, vs2);
      }
      else {
	asm_buf = sformat!("%0s %0s,(%0s),%0s")(buf, get_instr_name(instr_buf),
						vs3, rs1, vs2);
      }
      break;
    case riscv_instr_format_t.VAMO_FORMAT:
      if (wd) {
	asm_buf = sformat!("%0s %0s,(%0s),%0s,%0s")(buf, get_instr_name(instr_buf), vd,
						    rs1, vs2, vd);
      }
      else {
	asm_buf = sformat!("%0s x0,(%0s),%0s,%0s")(buf, get_instr_name(instr_buf),
						   rs1, vs2, vs3);
      }
      break;
    default:
      uvm_fatal(get_full_name(), format("Unsupported format %0s", instr_format));
    }

    // Add vector mask
    string vm_str = vec_vm_str();
    if (vm_str != "") {
      buf[asm_buf.length..asm_buf.length+vm_str.length] = vm_str;
      asm_buf = buf[0..asm_buf.length+vm_str.length];
    }


    toLowerInPlace(asm_buf);

    assert(asm_buf.ptr is buf.ptr);
    return asm_buf;
  }


  override void pre_randomize() {
    super.pre_randomize();
    rand_mode!q{vs1}(has_vs1);
    rand_mode!q{vs2}(has_vs2);
    rand_mode!q{vs3}(has_vs3);
    rand_mode!q{vd}(has_vd);
    rand_mode!q{nfields}(rand_nfields);
    if (! (category.inside(riscv_instr_category_t.LOAD,
			   riscv_instr_category_t.STORE,
			   riscv_instr_category_t.AMO))) {
      load_store_solve_order_c.constraint_mode(false);
    }
  }

  override void set_rand_mode() {
    import std.conv: to;
    string name = to!string(instr_name);
    has_rs1 = true;
    has_rs2 = false;
    has_rd  = false;
    has_fs1 = false;
    has_fs2 = false;
    has_fs3 = false;
    has_fd  = false;
    has_imm = false;
    rand_nfields = true;
    if (sub_extension != "zvlsseg") {
      rand_nfields = false;
    }
    if ((name[0..2] == "VW") || (name[0..3] == "VFW")) {
      is_widening_instr = true;
    }
    if (name[0..3] == "VQW") {
      is_quad_widening_instr = true;
      is_widening_instr = true;
    }
    if ((name[0..2] == "VN") || (name[0..3] == "VFN")) {
      is_narrowing_instr = true;
    }
    if (uvm_is_match("*CVT*", name)) {
      is_convert_instr = true;
      has_vs1 = false;
    }
    if (allowed_va_variants.length > 0) {
      has_va_variant = true;
    }
    // Set the rand mode based on the superset of all VA variants
    if (instr_format == riscv_instr_format_t.VA_FORMAT) {
      has_imm = true;
      has_rs1 = true;
      has_fs1 = true;
    }
  }

  string vec_vm_str() {
    if (vm) {
      return "";
    }
    else {
      if (VA_BASE.inside(va_base_instr.VMERGE,
			 va_base_instr.VFMERGE,
			 va_base_instr.VADC,
			 va_base_instr.VSBC,
			 va_base_instr.VMADC,
			 va_base_instr.VMSBC)) {
        return ",v0";
      }
      else {
        return ",v0.t";
      }
    }
  }

  string add_nfields(string instr_name, string prefix) {
    string suffix = instr_name[prefix.length..instr_name.length];
    return format("%0s%0d%0s", prefix, nfields + 1, suffix);
  }

  char[] add_nfields(char[] buf, string instr_name, string prefix) {
    import std.format: sformat;
    string suffix = instr_name[prefix.length..instr_name.length];
    return sformat!("%0s%0d%0s")(buf, prefix, nfields + 1, suffix);
  }

  char[] add_nfields(char[] buf, char[] instr_name, string prefix) {
    import std.format: sformat;
    char[] suffix = instr_name[prefix.length..instr_name.length];
    return sformat!("%0s%0d%0s")(buf, prefix, nfields + 1, suffix);
  }

  string add_eew(string instr_name, string prefix) {
    string suffix = instr_name[prefix.length..instr_name.length];
    return format("%0s%0d%0s", prefix,  eew, suffix);
  }

  bool check_sub_extension(string s, string literal) {
    return s == literal;
  }

}
