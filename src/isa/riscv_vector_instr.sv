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


// Base class for RISC-V vector exenstion ISA, implmented based on spec v0.8
class riscv_vector_instr extends riscv_floating_point_instr;

  rand riscv_vreg_t vs1;
  rand riscv_vreg_t vs2;
  rand riscv_vreg_t vs3;
  rand riscv_vreg_t vd;
  rand va_variant_t va_variant;
  rand bit          vm;
  rand bit          wd;
  bit               has_vd = 1'b1;
  bit               has_vs1 = 1'b1;
  bit               has_vs2 = 1'b1;
  bit               has_vs3 = 1'b1;
  bit               has_vm = 1'b0;
  bit               has_va_variant;
  bit               is_widening_instr;
  bit               is_narrowing_instr;
  bit               is_convert_instr;
  va_variant_t      allowed_va_variants[$];

  constraint va_variant_c {
    if (has_va_variant) {
      va_variant inside {allowed_va_variants};
    }
  }

  // Section 3.3.2: Vector Register Grouping (vlmul)
  // Instructions specifying a vector operand with an odd-numbered vector register will raisean
  // illegal instruction exception.
  constraint operand_group_c {
    if (cfg.vector_cfg.vtype.vlmul > 0) {
      vd  % cfg.vector_cfg.vtype.vlmul == 0;
      vs1 % cfg.vector_cfg.vtype.vlmul == 0;
      vs2 % cfg.vector_cfg.vtype.vlmul == 0;
      vs3 % cfg.vector_cfg.vtype.vlmul == 0;
    }
  }

  // TODO(taliu): Added this to register selection logic
  // For all widening instructions, the destination element width must be a supported element
  // width and the des-tination LMUL value must also be a supported LMUL value

  // Section 11.2: Widening Vector Arithmetic Instructions
  constraint widening_instr_c {
    if (is_widening_instr) {
     // The destination vector register group results are arranged as if both
     // SEW and LMUL were at twice their currentsettings.
     vd % (cfg.vector_cfg.vtype.vlmul * 2) == 0;
     // The destination vector register group cannot overlap a source vector
     // register group of a different element width
     !(vs1 inside {[vd : vd + cfg.vector_cfg.vtype.vlmul * 2 - 1]});
     !(vs2 inside {[vd : vd + cfg.vector_cfg.vtype.vlmul * 2 - 1]});
     // Double-width result, first source double-width, second source single-width
     if (va_variant inside {WV, WX}) {
       vs2 % (cfg.vector_cfg.vtype.vlmul * 2) == 0;
     }
    }
  }

  // Section 11.3: Narrowing Vector Arithmetic Instructions
  constraint narrowing_instr_c {
    if (is_narrowing_instr) {
      // The source and destination vector register numbers must be aligned
      // appropriately for the vector registergroup size
      vs2 % (cfg.vector_cfg.vtype.vlmul * 2) == 0;
      // The destination vector register group cannot overlap the rst source
      // vector register group (specied by vs2)
      !(vd inside {[vs2 : vs2 + cfg.vector_cfg.vtype.vlmul * 2 - 1]});
      // The destination vector register group cannot overlap the mask register
      // if used, unless LMUL=1
      // TODO(taliu): Implement this constraint
    }
  }

  // 12.3. Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions
  constraint add_sub_with_carry_c {
    if (cfg.vector_cfg.vtype.vlmul > 1) {
      // For vadc and vsbc, an illegal instruction exception is raised if the
      // destination vector register is v0 and LMUL> 1
      if (instr_name inside {VADC, VSBC}) {
        vd != 0;
      }
      // For vmadc and vmsbc, an illegal instruction exception is raised if the
      // destination vector register overlaps asource vector register group and LMUL > 1
      if (instr_name inside {VMADC, VMSBC}) {
        vd != vs2;
        vd != vs1;
      }
    }
  }

  // 12.7. Vector Integer Comparison Instructions
  // For all comparison instructions, an illegal instruction exception is raised if the
  // destination vector register over-laps a source vector register group and LMUL > 1
  constraint compare_instr_c {
    if (category == COMPARE) {
      vd != vs2;
      vd != vs1;
    }
  }

  // 16.8. Vector Iota Instruction
  // An illegal instruction exception is raised if the destination vector register group
  // overlaps the source vectormask register. If the instruction is masked, an illegal
  // instruction exception is issued if the destination vectorregister group overlaps v0.
  constraint vector_itoa_c {
    if (instr_name == VIOTA_M) {
      vd != vs2;
    }
  }

  // Section 17.3  Vector Slide Instructions
  // The destination vector register group for vslideup cannot overlap the vector register
  // group of the sourcevector register group or the mask register
  constraint vector_slide_c {
    if (instr_name inside {VSLIDEUP, VSLIDE1UP, VSLIDEDOWN, VSLIDE1DOWN}) {
      vd != vs2;
      vd != vs1;
    }
  }

  // Section 17.4: Vector Register Gather Instruction
  // For any vrgather instruction, the destination vector register group cannot overlap
  // with the source vector register group
  constraint vector_gather_c {
    if (instr_name == VRGATHER) {
      vd != vs2;
      vd != vs1;
    }
  }

  // Section 17.5: Vector compress instruction
  // The destination vector register group cannot overlap the source vector register
  // group or the source vector mask register
  constraint vector_compress_c {
    if (instr_name == VCOMPRESS) {
      vd != vs2;
      vd != vs1;
    }
  }

  // TODO: 19.2. Instructions Affected by EDIV

  constraint vmv_alignment_c {
    if (instr_name == VMV2R_V) {
      int'(vs2) % 2 == 0;
      int'(vd)  % 2 == 0;
    }
    if (instr_name == VMV4R_V) {
      int'(vs2) % 4 == 0;
      int'(vd)  % 4 == 0;
    }
    if (instr_name == VMV8R_V) {
      int'(vs2) % 8 == 0;
      int'(vd)  % 8 == 0;
    }
  }

  /*
  constraint vm_c {
    if (cfg.vector_cfg.vtype.vlmul > 1 && vd == V0) {vm;} // RVV spec section 5.3
    if (widening_shift && vd == V0) {vm;} // RVV spec section 11.2
        if (no_mask_dst_overlap && vd == V0) {vm;}
  }
  */

  `uvm_object_utils(riscv_vector_instr)
  `uvm_object_new

  // Convert the instruction to assembly code
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    case (format)
      VS2_FORMAT: begin
        if (instr_name == VID_V) begin
          asm_str = $sformatf("vid.v %s", vd.name());
        end else if (instr_name inside {VPOPC_M, VFIRST_M}) begin
          asm_str = $sformatf("%0s %0s,%0s", get_instr_name(), rd.name(), vs2.name());
        end else begin
          asm_str = $sformatf("%0s %0s,%0s", get_instr_name(), vd.name(), vs2.name());
        end
      end
      VA_FORMAT: begin
        if (instr_name == VMV) begin
          case (va_variant)
            VV: asm_str = $sformatf("vmv.v.v %s,%s", vd.name(), vs1.name());
            VX: asm_str = $sformatf("vmv.v.x %s,%s", vd.name(), rs1.name());
            VI: asm_str = $sformatf("vmv.v.i %s,%s", vd.name(), imm_str);
            default: `uvm_info(`gfn, $sformatf("Unsupported va_variant %0s", va_variant), UVM_LOW)
          endcase
        end else if (instr_name == VFMV) begin
          asm_str = $sformatf("vfmv.v.f %s,%s", vd.name(), fs1.name());
        end else if (instr_name == VMV_X_S) begin
          asm_str = $sformatf("vmv.x.s %s,%s", rd.name(), vs2.name());
        end else if (instr_name == VMV_S_X) begin
          asm_str = $sformatf("vmv.s.x %s,%s", vd.name(), rs1.name());
        end else if (instr_name == VFMV_F_S) begin
          asm_str = $sformatf("vfmv.f.s %s,%s", fd.name(), vs2.name());
        end else if (instr_name == VFMV_S_F) begin
          asm_str = $sformatf("vfmv.s.f %s,%s", vd.name(), fs1.name());
        end else begin
          if (!has_va_variant) begin
            asm_str = $sformatf("%0s ", get_instr_name());
            asm_str = format_string(asm_str, MAX_INSTR_STR_LEN);
            asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), vs1.name())};
          end else begin
            asm_str = $sformatf("%0s.%0s ", get_instr_name(), va_variant.name());
            asm_str = format_string(asm_str, MAX_INSTR_STR_LEN);
            case (va_variant) inside
              WV, VV, VVM, VM: begin
                asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), vs1.name())};
              end
              WI, VI, VIM: begin
                asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), imm_str)};
              end
              VF, VFM: begin
                if (instr_name inside {VFMADD, VFNMADD, VFMACC, VFNMACC, VFNMSUB, VFWNMSAC,
                                       VFWMACC, VFMSUB, VFMSAC, VFNMSAC, VFWNMACC, VFWMSAC}) begin
                  asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), fs1.name(), vs2.name())};
                end else begin
                  asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), fs1.name())};
                end
              end
              WX, VX, VXM: begin
                if (instr_name inside {VMADD, VNMSUB, VMACC, VNMSAC, VWMACCSU, VWMACCU,
                                       VWMACCUS, VWMACC}) begin
                  asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), rs1.name(), vs2.name())};
                end else begin
                  asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), rs1.name())};
                end
              end
            endcase
          end
          if (instr_name inside {VMADC, VADC, VSBC, VMSBC, VMERGE, VFMERGE}) begin
            if (va_variant inside {VVM, VIM, VXM, VFM}) begin
              asm_str = {asm_str, ",v0"};
            end
          end else begin
            //asm_str = {asm_str, ",v0.t"};
          end
        end
      end
      VLS_FORMAT: begin
        asm_str = $sformatf("%0s %0s, (%0s), %0s, %0s", get_instr_name(), vd.name(),
                             rs1.name(), rs2.name(), vec_vm_str());
      end
      VSS_FORMAT: begin
        asm_str = $sformatf("%0s %0s, (%0s), %0s, %0s", get_instr_name(), vs3.name(),
                            rs1.name(), rs2.name(), vec_vm_str());
      end
      VLV_FORMAT: begin
        asm_str = $sformatf("%0s, (%0s), %0s, %0s", get_instr_name(), vd.name(),
                            rs1.name(), vs2.name(), vec_vm_str());
      end
      VSV_FORMAT: begin
        asm_str = $sformatf("%0s, (%0s), %0s, %0s", get_instr_name(), vs3.name(),
                            rs1.name(), vs2.name(), vec_vm_str());
      end
      default: `uvm_info(`gfn, $sformatf("Unsupported format %0s", format.name()), UVM_LOW)
    endcase
    if(comment != "") begin
      asm_str = {asm_str, " #",comment};
    end
    return asm_str.tolower();
  endfunction : convert2asm

  function void pre_randomize();
    super.pre_randomize();
    vs1.rand_mode(has_vs1);
    vs2.rand_mode(has_vs2);
    vs3.rand_mode(has_vs3);
    vd.rand_mode(has_vd);
  endfunction : pre_randomize

  virtual function void set_rand_mode();
    string name = instr_name.name();
    has_rs1 = 1;
    has_rs2 = 0;
    has_rd  = 0;
    has_fs1 = 0;
    has_fs2 = 0;
    has_fs3 = 0;
    has_fd  = 0;
    has_imm = 0;
    if ((name.substr(0, 1) == "VW") || (name.substr(0, 2) == "VFW")) begin
      is_widening_instr = 1'b1;
    end
    if ((name.substr(0, 1) == "VN") || (name.substr(0, 2) == "VFN")) begin
      is_narrowing_instr = 1'b1;
    end
    if (uvm_is_match("*CVT*", name)) begin
      is_convert_instr = 1'b1;
      has_vs1 = 1'b0;
    end
    if (allowed_va_variants.size() > 0) begin
      has_va_variant = 1;
    end
    // Set the rand mode based on the superset of all VA variants
    if (format == VA_FORMAT) begin
      has_imm = 1'b1;
      has_rs1 = 1'b1;
      has_fs1 = 1'b1;
    end
  endfunction : set_rand_mode

  /*
  virtual function void calc_vec_reg_groups();
    widening_shift = instr_name inside {vec_widening_instr};
    widening_shift = instr_name inside {vec_quad_widening_instr} ? 2 : widening_shift;
    is_narrowing = instr_name inside {vec_narrowing_instr};
    is_vs2_widening = instr_name inside {vec_widening_vs2};
    vd_cant_be_mask = LMUL > 1 && instr_name inside {vec_forced_mask_instr};
    no_vec_src_dst_overlap = (instr_name inside {vec_illegal_src_dest_overlap_instr})
                             || (LMUL > 1 && instr_name inside {vec_no_src_dst_overlap_with_lmul});
    no_mask_dst_overlap = instr_name inside {vec_illegal_mask_dest_overlap_instr};
    dst_grp_heads = vec_reg_group_heads_lmul[LMUL << widening_shift];
    src_grp_heads = vec_reg_group_heads_lmul[LMUL << is_narrowing];
    vs2_widening_grp_heads = vec_reg_group_heads_lmul[LMUL << is_vs2_widening];
  endfunction

  virtual function int max_shift();
    if (widening_shift > is_narrowing) return widening_shift;
    return is_narrowing;
  endfunction

  virtual function void gen_rand_vm();
    bit success = std::randomize(vm) with {
        if (LMUL > 1 && vd == V0) {vm;} // RVV spec section 5.3
        if (widening_shift && vd == V0) {vm;} // RVV spec section 11.2
        if (no_mask_dst_overlap && vd == V0) {vm;}
      };
    assert (success) else begin
      `uvm_fatal(`gfn, $sformatf({"gen_rand_vm failed:",
        "\ninstr_name:%s\nLMUL:%0d\nvd:%s\widening_shift:%0d\nno_mask_dst_overlap:%0d\n\n"},
        instr_name.name(), LMUL, vd.name(),widening_shift, no_mask_dst_overlap))
    end
  endfunction

  */

  virtual function string vec_vm_str();
    vec_vm_str = vm ? "" : ", v0.t";
  endfunction

endclass : riscv_vector_instr
