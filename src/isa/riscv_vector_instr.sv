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


// Base class for RISC-V vector extension ISA, implementation based on spec v1.0
class riscv_vector_instr extends riscv_floating_point_instr;

  rand riscv_vreg_t vs1;
  rand riscv_vreg_t vs2;
  rand riscv_vreg_t vs3;
  rand riscv_vreg_t vd;
  rand va_variant_t va_variant;
  rand bit          vm;
  rand int          ls_eew;
  rand int          nfields;
  bit               has_vd = 1'b1;
  bit               has_vs1 = 1'b1;
  bit               has_vs2 = 1'b1;
  bit               has_vs3 = 1'b0;
  bit               has_va_variant = 1'b0;
  bit               is_widening_instr = 1'b0;
  bit               is_narrowing_instr = 1'b0;
  bit               is_convert_instr = 1'b0;
  bit               is_reduction_instr = 1'b0;
  bit               is_mask_producing_instr = 1'b0;
  bit               is_fp_instr = 1'b0;
  bit               is_segmented_ls_instr = 1'b0;
  bit               is_whole_register_ls_instr = 1'b0;
  int               ext_widening_factor = 1;
  int               whole_register_move_cnt = 1;
  va_variant_t      allowed_va_variants[$];
  rand int          ls_emul_non_frac;

  `uvm_object_utils(riscv_vector_instr)
  `uvm_object_new

  // Make sure that reserved vregs are not overwritten
  constraint avoid_reserved_vregs_c {
    if (m_cfg.vector_cfg.reserved_vregs.size() > 0) {
      foreach (m_cfg.vector_cfg.reserved_vregs[i]) {
        if (is_widening_instr && !m_cfg.vector_cfg.vtype.fractional_lmul) {
          !(m_cfg.vector_cfg.reserved_vregs[i] inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul * 2 - 1]});
        } else if (instr_name inside {VMV1R_V, VMV2R_V, VMV4R_V, VMV8R_V}) {
          !(m_cfg.vector_cfg.reserved_vregs[i] inside {[vd : vd + whole_register_move_cnt - 1]});
        } else if (category inside {LOAD, STORE}) {
          if (format inside {VLX_FORMAT, VSX_FORMAT}) {
            !(m_cfg.vector_cfg.reserved_vregs[i] inside {[vd : vd + emul_non_frac(m_cfg.vector_cfg.vtype.vlmul) * nfields - 1]});
          } else {
            !(m_cfg.vector_cfg.reserved_vregs[i] inside {[vd : vd + emul_non_frac(ls_eew) * nfields - 1]});
          }
        } else {
          !(m_cfg.vector_cfg.reserved_vregs[i] inside {[vd : vd + emul_non_frac(m_cfg.vector_cfg.vtype.vlmul) - 1]});
        }
      }
    }
  }

  // Select a vector arithmetic variant
  constraint va_variant_c {
    if (has_va_variant) {
      va_variant inside {allowed_va_variants};
    }
  }

  // Section 3.3.2: Vector Register Grouping (vlmul)
  // Instructions specifying a vector operand with an odd-numbered vector register will raisean
  // illegal instruction exception.
  constraint vector_operand_group_c {
    if (!m_cfg.vector_cfg.vtype.fractional_lmul &&
        !(instr_name inside {VMV_X_S, VMV_S_X, VFMV_F_S, VFMV_S_F}) &&
        !(instr_name inside {VRGATHEREI16}) &&
        !(category inside {LOAD, STORE})) {
      vd  % m_cfg.vector_cfg.vtype.vlmul == 0;
      vs1 % m_cfg.vector_cfg.vtype.vlmul == 0;
      vs2 % m_cfg.vector_cfg.vtype.vlmul == 0;
      vs3 % m_cfg.vector_cfg.vtype.vlmul == 0;
    }
  }

  // Section 5.2 and 10.2: Widening Vector Arithmetic Instructions
  constraint vector_widening_instr_c {
    if (is_widening_instr) {
      if (!m_cfg.vector_cfg.vtype.fractional_lmul) {
        // The destination vector register group results are arranged as if both
        // SEW and LMUL were at twice their current settings.
        vd % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
        // The destination vector register group cannot overlap a source vector
        // register group of a different element width
        // For reduction instructions, vs1 is double width
        if (!is_reduction_instr) {
          !(vs1 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - 1]});
        }
        // Double-width vd, vs2 double-width, vs1 single-width
        if (va_variant inside {WV, WX, WF}) {
          vs2 % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
        } else {
          !(vs2 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - 1]});
        }
      } else {
        // Double-width vs2 is allowed to overlap double-width vd
        if (!(va_variant inside {WV, WX, WF})) {
          vs2 != vd;
        }
        vs1 != vd;
      }
    }
  }

  // Section 5.2 and 10.3: Narrowing Vector Arithmetic Instructions
  constraint vector_narrowing_instr_c {
    if (is_narrowing_instr) {
      if (!m_cfg.vector_cfg.vtype.fractional_lmul) {
        // The source and destination vector register numbers must be aligned
        // appropriately for the vector registergroup size
        vs2 % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
        // The destination vector register group cannot overlap the vs2 source
        // vector register group
        !(vd inside {[vs2 + m_cfg.vector_cfg.vtype.vlmul : vs2 + m_cfg.vector_cfg.vtype.vlmul*2 - 1]});
      } else {
        vs2 != vd;
      }
    }
  }

  // Section 5.3: Vector Masking
  // The destination vector register group for a masked vector instruction cannot overlap
  // the source mask register (v0), unless the destination vector register is being written
  // with a mask value (e.g., compares) or the scalar result of a reduction. These
  // instruction encodings are reserved.
  constraint vector_mask_v0_overlap_c {
    if (!vm) {
      !(category == COMPARE || is_mask_producing_instr || is_reduction_instr) -> (vd != 0);
      category == STORE -> vs3 != 0;
    }
  }

  // VM-bit required to be zero
  constraint vector_mask_enable_c {
    // Instructions that require vm=0
    if (instr_name inside {VMERGE, VFMERGE, VADC, VSBC}) {
      vm == 1'b0;
    }
    if (instr_name inside {VMADC, VMSBC} && va_variant inside {VVM, VXM, VIM}) {
      vm == 1'b0;
    }
  }

  // VM-bit required to be one
  constraint vector_mask_disable_c {
    // Instructions that require vm=1
    if (instr_name inside {VMV_V_V, VMV_V_X, VMV_V_I, VFMV_V_F,
                           VFMV_F_S, VFMV_S_F, VMV_X_S, VMV_S_X,
                           VMV1R_V, VMV2R_V, VMV4R_V, VMV8R_V,
                           VCOMPRESS}) {
      vm == 1'b1;
    }
    if (instr_name inside {VMADC, VMSBC} && va_variant inside {VV, VX, VI}) {
      vm == 1'b1;
    }
    if (instr_name inside {[VMAND_MM : VMXNOR_MM]}) {
      vm == 1'b1;
    }
    if (is_whole_register_ls_instr) {
      vm == 1'b1;
    }
    if (instr_name inside {VLM_V, VSM_V}) {
      vm == 1'b1;
    }
    if (format == VSET_FORMAT) {
      vm == 1'b1;
    }
  }

  // Oder to solve load and store constraints in
  constraint load_store_solve_order_c {
    solve ls_eew           before ls_emul_non_frac;
    solve ls_emul_non_frac before vd;
    solve ls_emul_non_frac before vs2;
    solve ls_emul_non_frac before vs3;
    solve ls_emul_non_frac before nfields;
  }

  // Section 7.3: Vector Load/Store Width Encoding
  // Vector loads and stores have an EEW encoded directly in the instruction
  constraint load_store_eew_c {
    ls_eew inside {m_cfg.vector_cfg.legal_ls_eew};
  }

  // Section 7.3: Vector Load/Store Width Encoding
  // The corresponding EMUL is calculated as EMUL = (EEW/SEW)*LMUL. If the
  // EMUL would be out of range (EMUL>8 or EMUL<1/8), the instruction encoding
  // is reserved.
  constraint load_store_emul_c {
    ls_emul_non_frac == emul_non_frac(ls_eew);
  }

  // Section 7.3: Vector Load/Store Width Encoding
  // The vector register groups must have legal register specifiers for the
  // selected EMUL, otherwise the instruction encoding is reserved
  constraint load_store_register_alignment_c {
    if (category inside {LOAD, STORE}) {
      vs2 % ls_emul_non_frac == 0;
      if (format inside {VLX_FORMAT, VSX_FORMAT} && !m_cfg.vector_cfg.vtype.fractional_lmul) {
        vd  % m_cfg.vector_cfg.vtype.vlmul == 0;
        vs3 % m_cfg.vector_cfg.vtype.vlmul == 0;
      } else {
        vd  % ls_emul_non_frac == 0;
        vs3 % ls_emul_non_frac == 0;
      }
    }
  }

  // Section 7.8.3: Vector Indexed Segment Loads and Stores
  // For vector indexed segment loads, the destination vector register groups cannot
  // overlap the source vector register group (specified by vs2), else the instruction
  // encoding is reserved
  constraint load_store_group_overlap_c {
    if (format == VLX_FORMAT) {
      if (is_segmented_ls_instr) {
        // No overlap at all for segmented loads
        !(vd inside {[vs2 : vs2 + ls_emul_non_frac - 1]});
        vd < vs2 -> vd + nfields * emul_non_frac(m_cfg.vector_cfg.vtype.vsew) - 1 < vs2;
      } else {
        // Partial overlap allowed
        if (ls_eew < m_cfg.vector_cfg.vtype.vsew && !m_cfg.vector_cfg.vtype.fractional_lmul &&
            (m_cfg.vector_cfg.vtype.vlmul * ls_eew / m_cfg.vector_cfg.vtype.vsew >= 1)) {
          // If src_eew < dst_eew and src_emul is not fractional, overlap in highest part of dst
          !(vs2 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - ls_emul_non_frac - 1]});
        } else if (ls_eew < m_cfg.vector_cfg.vtype.vsew) {
          // If src_eew < dst_eew and src_emul is fractional, no overlap allowed
          !(vs2 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - 1]});
        } else if (ls_eew > m_cfg.vector_cfg.vtype.vsew && !m_cfg.vector_cfg.vtype.fractional_lmul) {
          // If src_eew > dst_eew, overlap in lowest part of src
          !(vd inside {[vs2 + 1 : vs2 + ls_emul_non_frac - 1]});
        } else if (ls_eew != m_cfg.vector_cfg.vtype.vsew) {
          // No overlap if fractional
          vs2 != vd;
        }
      }
    }
  }

  // Section 7.8: Vector Load/Store Segment Instructions
  // The EMUL setting must be such that EMUL * NFIELDS ≤ 8, otherwise the
  // instruction encoding is reserved.
  // If the vector register numbers accessed by the segment load or store would
  // increment past 31, then the instruction encoding is reserved.
  constraint load_store_nfields_c {
    if (is_segmented_ls_instr) {
      nfields inside {[2 : 8]};
      if (format inside {VLX_FORMAT, VSX_FORMAT}) {
        nfields * (m_cfg.vector_cfg.vtype.fractional_lmul ? 1 : m_cfg.vector_cfg.vtype.vlmul) <= 8;
        vd  + nfields * (m_cfg.vector_cfg.vtype.fractional_lmul ? 1 : m_cfg.vector_cfg.vtype.vlmul) <= 32;
        vs3 + nfields * (m_cfg.vector_cfg.vtype.fractional_lmul ? 1 : m_cfg.vector_cfg.vtype.vlmul) <= 32;
      } else {
        nfields * ls_emul_non_frac       <= 8;
        nfields * ls_emul_non_frac + vd  <= 32;
        nfields * ls_emul_non_frac + vs3 <= 32;
      }
    } else if (is_whole_register_ls_instr) {
      nfields inside {1, 2, 4, 8};
      vd  % nfields == 0;
      vs3 % nfields == 0;
    } else {
      nfields == 1;
    }
  }

  // Section 11.3: Vector Integer Extension
  constraint vector_integer_extension_c {
    if (instr_name inside {VZEXT_VF2, VZEXT_VF4, VZEXT_VF8,
                           VSEXT_VF2, VSEXT_VF4, VSEXT_VF8}) {
      // VD needs to be LMUL aligned
      vd % m_cfg.vector_cfg.vtype.vlmul == 0;
      if (!m_cfg.vector_cfg.vtype.fractional_lmul && (m_cfg.vector_cfg.vtype.vlmul / ext_widening_factor) >= 1) {
        // VS2 needs to be LMUL/ext_widening_factor aligned
        vs2 % (m_cfg.vector_cfg.vtype.vlmul / ext_widening_factor) == 0;
        // VS2 can only overlap last ext_widening_factor'th of VD
        !(vs2 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - (m_cfg.vector_cfg.vtype.vlmul / ext_widening_factor) - 1]});
      } else {
        // If source has fractional LMUL, VD and VS2 cannot overlap
        if (!m_cfg.vector_cfg.vtype.fractional_lmul) {
          !(vs2 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - 1]});
        } else {
          vs2 != vd;
        }
      }
    }
  }

  // Section 11.16: Vector Integer Move Instructions
  constraint vector_int_vmv_c {
    // VS2 needs to be zero
    if (instr_name inside {VMV_V_V, VMV_V_I, VMV_V_X}) {
      vs2 == 0;
    }
  }

  // Section 15.5, 15.6, 15.7: The destination register cannot overlap the
  // source register and, if masked, cannot overlap the mask register ('v0')
  constraint vector_set_first_c {
    if (instr_name inside {VMSBF_M, VMSIF_M, VMSOF_M}) {
      vd != vs2;
      (vm == 0) -> vd != 0;
    }
  }

  // Section 15.8: Vector Iota Instruction
  // The destination register group cannot overlap the source register
  // and, if masked, cannot overlap the mask register (v0)
  constraint vector_iota_c {
    if (instr_name == VIOTA_M) {
      vd != vs2;
    }
  }

  // Section 15.9: Vector Element Index Instruction
  // The vs2 field of the instruction must be set to v0, otherwise the encoding is reserved
  constraint vector_element_index_c {
    if (instr_name == VID_V) {
      vs2 == 0;
    }
  }

  // Section 16.3: Vector Slide Instructions
  // The destination vector register group for vslideup cannot overlap the vector register
  // group of the source vector register group or the mask register
  constraint vector_slideup_c {
    if (instr_name inside {VSLIDEUP, VSLIDE1UP, VFSLIDE1UP}) {
      vd != vs2;
      vd != vs1;
    }
  }

  // Section 16.4: Vector Register Gather Instruction
  // For any vrgather instruction, the destination vector register group cannot overlap
  // with the source vector register groups, otherwise the instruction encoding is reserved
  // The vrgatherei16.vv form uses SEW/LMUL for the data in vs2 but EEW=16 and
  // EMUL = (16/SEW)*LMUL for the indices in vs1.
  constraint vector_gather_c {
    if (instr_name inside {VRGATHER, VRGATHEREI16}) {
      vd != vs2;
      vd != vs1;
      if (!m_cfg.vector_cfg.vtype.fractional_lmul) {
        vd  % m_cfg.vector_cfg.vtype.vlmul == 0;
        vs2 % m_cfg.vector_cfg.vtype.vlmul == 0;
      }
    }
    if (instr_name == VRGATHEREI16) {
      if (!m_cfg.vector_cfg.vtype.fractional_lmul && m_cfg.vector_cfg.vtype.vsew == 8) {
        vs1 % (m_cfg.vector_cfg.vtype.vlmul * 2) == 0;
        !(vd inside {[vs1 : vs1 + m_cfg.vector_cfg.vtype.vlmul * 2 - 1]});
      }
      if (!m_cfg.vector_cfg.vtype.fractional_lmul && m_cfg.vector_cfg.vtype.vsew >= 16) {
        if (m_cfg.vector_cfg.vtype.vlmul >= m_cfg.vector_cfg.vtype.vsew / 16) {
          vs1 % (m_cfg.vector_cfg.vtype.vlmul / (m_cfg.vector_cfg.vtype.vsew / 16)) == 0;
        }
        !(vs1 inside {[vd : vd + m_cfg.vector_cfg.vtype.vlmul - 1]});
      }
    }
  }

  // Section 16.5: Vector compress instruction
  // The destination vector register group cannot overlap the source vector register
  // group or the source mask register, otherwise the instruction encoding is reserved
  constraint vector_compress_c {
    if (instr_name == VCOMPRESS) {
      vd != vs2;
      vd != vs1;
    }
  }

  // Section 16.6: Whole Vector Register Move
  // The source and destination vector register numbers must be aligned appropriately for
  // the vector register group size, and encodings with other vector register numbers are reserved
  constraint vector_vmvxr_c {
    if (instr_name inside {VMV1R_V, VMV2R_V, VMV4R_V, VMV8R_V}) {
      vs2 % whole_register_move_cnt == 0;
      vd  % whole_register_move_cnt == 0;
    }
  }

  // Do not use float variants if FP is disabled
  constraint disable_fp_variant_c {
    !m_cfg.vector_cfg.enable_fp_support -> !(va_variant inside {VF, WF, VFM});
  }

  // Filter unsupported instructions based on configuration
  virtual function bit is_supported(riscv_instr_gen_config cfg);
    // Check that current LMUL and SEW are valid for narrowing and widening instruction
    if (is_widening_instr || is_narrowing_instr) begin
      if (cfg.vector_cfg.vtype.vsew == cfg.vector_cfg.max_int_sew ||
          (!cfg.vector_cfg.vtype.fractional_lmul && cfg.vector_cfg.vtype.vlmul == 8)) begin
        return 1'b0;
      end
    end
    // Check FP instructions
    if (is_fp_instr) begin
      // FP instructions are not supported
      if (!cfg.vector_cfg.enable_fp_support) begin
        return 1'b0;
      end
        if (instr_name inside {VFWCVT_F_XU_V, VFWCVT_F_X_V, VFNCVT_XU_F_W,
                               VFNCVT_X_F_W, VFNCVT_RTZ_XU_F_W, VFNCVT_RTZ_X_F_W} ||
            (instr_name inside {VFWCVT_F_F_V, VFNCVT_F_F_W} &&
             cfg.vector_cfg.enable_zvfhmin_extension &&
             !cfg.vector_cfg.enable_zvfh_extension)) begin
        // Single-width (unsigned) integer, double-width float
        if (!((2*cfg.vector_cfg.vtype.vsew) inside {[cfg.vector_cfg.min_fp_sew :
                                                     cfg.vector_cfg.max_fp_sew]})) begin
          return 1'b0;
        end
      end else begin
        // FP instruction is unsupported if outside of valid EEW range
        if (!(cfg.vector_cfg.vtype.vsew inside {[cfg.vector_cfg.min_fp_sew :
                                                 cfg.vector_cfg.max_fp_sew]})) begin
          return 1'b0;
        end
        if (!instr_name inside {VFWCVT_XU_F_V, VFWCVT_X_F_V, VFWCVT_RTZ_XU_F_V,
                                VFWCVT_RTZ_X_F_V, VFNCVT_F_XU_W, VFNCVT_X_F_W}) begin
          // Additional check not required for single-width float, double-width (unsigned) integer
          // Widening/narrowing is unsupported if only one fp size is valid and
          // requires 2*SEW to be of legal size
          if ((is_widening_instr || is_narrowing_instr) &&
              cfg.vector_cfg.max_fp_sew inside {cfg.vector_cfg.min_fp_sew, cfg.vector_cfg.vtype.vsew}) begin
            return 1'b0;
          end
      end
      end
      // Narrowing requires SEW = 2*SEW op SEW
      if (is_narrowing_instr && cfg.vector_cfg.vtype.vsew == cfg.vector_cfg.max_fp_sew) begin
        return 1'b0;
      end
      // Narrowing requires SEW = 2*SEW op SEW
      if (is_narrowing_instr && cfg.vector_cfg.vtype.vsew == cfg.vector_cfg.max_fp_sew) begin
        return 1'b0;
      end
    end
    if (instr_name inside {VZEXT_VF8, VSEXT_VF8}) begin
      if (cfg.vector_cfg.vtype.vsew < 64 || cfg.vector_cfg.vtype.fractional_lmul) begin
        return 1'b0;
      end
    end
    if (instr_name inside {VZEXT_VF4, VSEXT_VF4}) begin
      if (cfg.vector_cfg.vtype.vsew < 32 ||
          (cfg.vector_cfg.vtype.fractional_lmul && cfg.vector_cfg.vtype.vlmul > 2)) begin
        return 1'b0;
      end
    end
    if (instr_name inside {VZEXT_VF2, VSEXT_VF2}) begin
      if (cfg.vector_cfg.vtype.vsew < 16 ||
          (cfg.vector_cfg.vtype.fractional_lmul && cfg.vector_cfg.vtype.vlmul > 4)) begin
        return 1'b0;
      end
    end
    // Check for valid LMUL for vrgatherei16
    if (instr_name == VRGATHEREI16) begin
      if (16/cfg.vector_cfg.vtype.vsew > 1) begin
        if (!cfg.vector_cfg.vtype.fractional_lmul && cfg.vector_cfg.vtype.vlmul == 8) begin
          return 1'b0;
        end
      end else begin
        if (cfg.vector_cfg.vtype.fractional_lmul &&
            (cfg.vector_cfg.vtype.vsew/16)*cfg.vector_cfg.vtype.vlmul > cfg.vector_cfg.max_int_sew/8) begin
          return 1'b0;
        end
      end
    end
    // Check load and stores
    if (category inside {LOAD, STORE}) begin
      // Requires a legal EEW
      if (cfg.vector_cfg.legal_ls_eew.size() == 0 && !is_whole_register_ls_instr &&
          !(instr_name inside {VLM_V, VSM_V})) begin
        return 0;
      end
      // Segmented l/s need at least two segments
      if (is_segmented_ls_instr) begin
        if (format inside {VLX_FORMAT, VSX_FORMAT}) begin
          if (!cfg.vector_cfg.vtype.fractional_lmul && cfg.vector_cfg.vtype.vlmul == 8) begin
            return 0;
          end
        end else begin
          int unsigned max_eew [$] = cfg.vector_cfg.legal_ls_eew.max();
          if (int'(real'(max_eew.pop_front()) / real'(cfg.vector_cfg.vtype.vsew) *
                   (cfg.vector_cfg.vtype.fractional_lmul ? 1.0 / real'(cfg.vector_cfg.vtype.vlmul) :
                                                           real'(cfg.vector_cfg.vtype.vlmul))) == 8) begin
            return 0;
          end
        end
      end
    end
    // Check vector configuration-setting
    if (instr_name == VSETIVLI) begin
      // Immediate vsetivli can only be used if VL fits into space of immediate value
      if (cfg.vector_cfg.vl >= 2**5) begin
        return 0;
      end
    end
    return 1'b1;
  endfunction

  virtual function string get_instr_name();
    string name = super.get_instr_name();
    if (category inside {LOAD, STORE}) begin
      name = add_nfields(name);
      // Add eew before ".v" or "ff.v" suffix
      if (instr_name inside {VLEFF_V, VLSEGEFF_V}) begin
        name = name.substr(0, name.len() - 5);
        name = $sformatf("%0s%0dFF.V", name, ls_eew);
      end else if (!(instr_name inside {VLM_V, VSM_V, VSR_V})) begin
        name = name.substr(0, name.len() - 3);
        name = $sformatf("%0s%0d.V", name, ls_eew);
      end
    end
    if (has_va_variant) begin
      name = $sformatf("%0s.%0s", name, va_variant.name());
    end
    return name;
  endfunction

  // Convert the instruction to assembly code
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
    case (format)
      VSET_FORMAT: begin
        if (instr_name == VSETVL) begin
          asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), rs1.name(), rs2.name());
        end else begin
          asm_str = $sformatf("%0s%0s, %0s, e%0d, m%0s%0d, t%0s, m%0s",
                              asm_str,
                              rd.name(),
                              instr_name == VSETIVLI ? get_imm() : rs1.name(),
                              m_cfg.vector_cfg.vtype.vsew,
                              m_cfg.vector_cfg.vtype.fractional_lmul ? "f" : "",
                              m_cfg.vector_cfg.vtype.vlmul,
                              m_cfg.vector_cfg.vtype.vta ? "a" : "u",
                              m_cfg.vector_cfg.vtype.vma ? "a" : "u");
        end
      end
      VS2_FORMAT: begin
        if (instr_name == VID_V) begin
          asm_str = $sformatf("%0s%0s", asm_str, vd.name());
        end else if (instr_name inside {VCPOP_M, VFIRST_M}) begin
          asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), vs2.name());
        end else begin
          asm_str = $sformatf("%0s%0s, %0s", asm_str, vd.name(), vs2.name());
        end
      end
      VA_FORMAT: begin
        case (instr_name)
          VMV_V_V:  asm_str = $sformatf("%0s%0s, %0s", asm_str, vd.name(), vs1.name());
          VMV_V_X,
          VMV_S_X:  asm_str = $sformatf("%0s%0s, %0s", asm_str, vd.name(), rs1.name());
          VMV_V_I:  asm_str = $sformatf("%0s%0s, %0s", asm_str, vd.name(), get_imm());
          VFMV_V_F,
          VFMV_S_F: asm_str = $sformatf("%0s%0s, %0s", asm_str, vd.name(), fs1.name());
          VMV_X_S:  asm_str = $sformatf("%0s%0s, %0s", asm_str, rd.name(), vs2.name());
          VFMV_F_S: asm_str = $sformatf("%0s%0s, %0s", asm_str, fd.name(), vs2.name());
          default: begin
            if (!has_va_variant) begin
              asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), vs2.name(), vs1.name());
            end else begin
              case (va_variant) inside
                WV, VV, VVM, VM: begin
                  asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), vs2.name(), vs1.name());
                end
                WI, VI, VIM: begin
                  asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), vs2.name(), get_imm());
                end
                WF, VF, VFM: begin
                  if (instr_name inside {VFMADD, VFNMADD, VFMACC, VFNMACC, VFNMSUB, VFWNMSAC,
                                         VFWMACC, VFMSUB, VFMSAC, VFNMSAC, VFWNMACC, VFWMSAC}) begin
                    asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), fs1.name(), vs2.name());
                  end else begin
                    asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), vs2.name(), fs1.name());
                  end
                end
                WX, VX, VXM: begin
                  if (instr_name inside {VMADD, VNMSUB, VMACC, VNMSAC, VWMACCSU, VWMACCU,
                                         VWMACCUS, VWMACC}) begin
                    asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), rs1.name(), vs2.name());
                  end else begin
                    asm_str = $sformatf("%0s%0s, %0s, %0s", asm_str, vd.name(), vs2.name(), rs1.name());
                  end
                end
              endcase
            end
          end
        endcase
      end
      VL_FORMAT,
      VS_FORMAT,
      VLR_FORMAT,
      VSR_FORMAT: begin
        asm_str = $sformatf("%0s%0s, (%0s)", asm_str, category == LOAD ? vd.name() : vs3.name(), rs1.name());
      end
      VLS_FORMAT,
      VSS_FORMAT: begin
        asm_str = $sformatf("%0s%0s, (%0s), %0s", asm_str, category == LOAD ? vd.name() : vs3.name(),
                                                  rs1.name(), rs2.name());
      end
      VLX_FORMAT,
      VSX_FORMAT: begin
          asm_str = $sformatf("%0s%0s, (%0s), %0s", asm_str, category == LOAD ? vd.name() : vs3.name(),
                                                    rs1.name(), vs2.name());
      end
      default: begin
        `uvm_fatal(`gfn, $sformatf("Unsupported format %0s", format.name()))
      end
    endcase
    // Add vector mask
    asm_str = {asm_str, vec_vm_str()};
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
    va_variant.rand_mode(has_va_variant);
  endfunction : pre_randomize

  virtual function void set_rand_mode();
    string name = instr_name.name();
    has_rs1 = 1'b0;
    has_rs2 = 1'b0;
    has_rd  = 1'b0;
    has_fs1 = 1'b0;
    has_fs2 = 1'b0;
    has_fs3 = 1'b0;
    has_fd  = 1'b0;
    has_imm = 1'b0;
    if ((name.substr(0, 1) == "VW") || (name.substr(0, 2) == "VFW")) begin
      is_widening_instr = 1'b1;
    end
    if (uvm_is_match("V?EXT_VF?", name)) begin
      ext_widening_factor = name.substr(name.len()-1, name.len()-1).atoi();
    end
    if ((name.substr(0, 1) == "VN") || uvm_is_match("VFN*_W", name)) begin
      is_narrowing_instr = 1'b1;
    end
    if (uvm_is_match("VF*CVT_*", name)) begin
      is_convert_instr = 1'b1;
    end
    if (uvm_is_match("*RED*", name)) begin
      is_reduction_instr = 1'b1;
    end
    if (uvm_is_match("VM*_M*", name)) begin
      is_mask_producing_instr = 1'b1;
    end
    if ((name.substr(0, 1) == "VF" && name != "VFIRST_M") || (name.substr(0, 2) == "VMF")) begin
      is_fp_instr = 1'b1;
    end
    if (instr_name inside {VMV2R_V, VMV4R_V, VMV8R_V}) begin
      whole_register_move_cnt = instr_name.name().substr(3, 3).atoi();
    end
    if (uvm_is_match("V*SEGE*_V", name)) begin
      is_segmented_ls_instr = 1'b1;
    end
    if (name inside {"VLRE_V", "VSR_V"}) begin
      is_whole_register_ls_instr = 1'b1;
    end
    if (allowed_va_variants.size() > 0) begin
      has_va_variant = 1'b1;
    end
    if (format == VSET_FORMAT) begin
      has_vs1 = 1'b0;
      has_vs2 = 1'b0;
      has_vd  = 1'b0;
      has_rs1 = name != "VSETIVLI";
      has_rs2 = name == "VSETVL";
      has_rd  = 1'b1;
      has_imm = name == "VSETIVLI";
    end
    if (format == VA_FORMAT) begin
      has_imm = 1'b1;
      has_rs1 = 1'b1;
      has_fs1 = 1'b1;
    end
    if (format == VS2_FORMAT) begin
      has_vs1 = 1'b0;
    end
    if (category inside {LOAD, STORE}) begin
      has_vs1 = 1'b0;
      has_vs2 = 1'b0;
      has_vs3 = category == STORE;
      has_rs1 = 1'b1;
    end
    if (format inside {VLS_FORMAT, VSS_FORMAT}) begin
      has_rs2 = 1'b1;
    end
    if (format inside {VLX_FORMAT, VSX_FORMAT}) begin
      has_vs2 = 1'b1;
    end
    if (name inside {"VCPOP_M", "VFIRST_M", "VMV_X_S"}) begin
      has_rd = 1'b1;
    end
    if (name == "VFMV_F_S") begin
      has_fd = 1'b1;
    end
  endfunction : set_rand_mode

  virtual function void set_imm_len();
    imm_len = 5;
  endfunction: set_imm_len

  virtual function string vec_vm_str();
    if (vm) begin
      return "";
    end else begin
      if (instr_name inside {VMERGE, VFMERGE, VADC, VSBC, VMADC, VMSBC} &&
          va_variant inside {VVM, VXM, VIM, VFM}) begin
        return ", v0";
      end else begin
        return ", v0.t";
      end
    end
  endfunction

  // Add nfields to the name of segmented l/s instructions
  function string add_nfields(string instr_name);
    string name;
    string prefix;
    string suffix;
    if (is_segmented_ls_instr || is_whole_register_ls_instr) begin
      case (format)
        VL_FORMAT,
        VS_FORMAT: prefix = instr_name.substr(0, 4);
        VLS_FORMAT,
        VSS_FORMAT: prefix = instr_name.substr(0, 5);
        VLX_FORMAT,
        VSX_FORMAT: prefix = instr_name.substr(0, 6);
        VLR_FORMAT,
        VSR_FORMAT: prefix = instr_name.substr(0, 1);
        default: ;
      endcase
      suffix = instr_name.substr(prefix.len(), instr_name.len() - 1);
      name = $sformatf("%0s%0d%0s", prefix, nfields, suffix);
    end else begin
      name = instr_name;
    end
    return name;
  endfunction

  // Effective multiplier used by load and store instructions
  // If emul is fractional -> EMUL=1
  // For mask l/s -> EMUL=1
  function int emul_non_frac(int eew);
    real emul = real'(eew) / real'(m_cfg.vector_cfg.vtype.vsew) *
                (m_cfg.vector_cfg.vtype.fractional_lmul ? 1.0 / real'(m_cfg.vector_cfg.vtype.vlmul) :
                                                          real'(m_cfg.vector_cfg.vtype.vlmul));
    return emul <= 1.0 || instr_name inside {VLM_V, VSM_V} ? 1 : int'(emul);
  endfunction

  virtual function void do_copy(uvm_object rhs);
    riscv_vector_instr rhs_;
    super.copy(rhs);
    assert($cast(rhs_, rhs));
    this.vs1                        = rhs_.vs1;
    this.vs2                        = rhs_.vs2;
    this.vs3                        = rhs_.vs3;
    this.vd                         = rhs_.vd;
    this.va_variant                 = rhs_.va_variant;
    this.vm                         = rhs_.vm;
    this.ls_eew                     = rhs_.ls_eew;
    this.nfields                    = rhs_.nfields;
    this.has_vs1                    = rhs_.has_vs1;
    this.has_vs2                    = rhs_.has_vs2;
    this.has_vs3                    = rhs_.has_vs3;
    this.has_vd                     = rhs_.has_vd;
    this.has_va_variant             = rhs_.has_va_variant;
    this.is_widening_instr          = rhs_.is_widening_instr;
    this.is_narrowing_instr         = rhs_.is_narrowing_instr;
    this.is_convert_instr           = rhs_.is_convert_instr;
    this.is_reduction_instr         = rhs_.is_reduction_instr;
    this.is_mask_producing_instr    = rhs_.is_mask_producing_instr;
    this.is_fp_instr                = rhs_.is_fp_instr;
    this.is_segmented_ls_instr      = rhs_.is_segmented_ls_instr;
    this.is_whole_register_ls_instr = rhs_.is_whole_register_ls_instr;
    this.ext_widening_factor        = rhs_.ext_widening_factor;
    this.whole_register_move_cnt    = rhs_.whole_register_move_cnt;
    this.allowed_va_variants        = rhs_.allowed_va_variants;
    this.ls_emul_non_frac           = rhs_.ls_emul_non_frac;
  endfunction : do_copy

endclass : riscv_vector_instr
