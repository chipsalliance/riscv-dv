/*
 * Copyright 2020 Google LLC
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

class riscv_vector_instr extends riscv_floating_point_instr;

  rand riscv_vreg_t vs1;
  rand riscv_vreg_t vs2;
  rand riscv_vreg_t vs3;
  rand riscv_vreg_t vd;
  rand va_variant_t va_variant;
  bit               has_vd = 1'b1;
  bit               has_vs1 = 1'b1;
  bit               has_vs2 = 1'b1;
  bit               has_vs3 = 1'b1;
  bit               has_vm = 1'b0;
  bit               is_widen_instr;
  bit               is_narrowing_instr;

  va_variant_t allowed_va_variants[$];

  constraint va_variant_c {
    if (format == VA_FORMAT) {
      va_variant inside {allowed_va_variants};
    }
  }

  // TODO: Handle different LMUL setting
  // The destination vector register group cannot overlap a source vector
  // register group of a different element width
  constraint widen_instr_c {
    int'(vd) % 2 == 0;
    if (has_vs1) {
      vs1 != vd;
      vs1 != vd + 1;
    }
    if (has_vs2) {
      vs2 != vd;
      vs2 != vd + 1;
    }
  }

  // rs2 is double-width source register
  // The destination vector register group cannot overlap the rst source
  // vector register group (specied by vs2)
  constraint narrowing_instr_c {
    if (has_vs2) {
      int'(vs2) % 2 == 0;
      vd != vs2;
      vd != vs2 + 1;
    }
  }

  `uvm_object_utils(riscv_vector_instr)
  `uvm_object_new

  // Convert the instruction to assembly code
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    case (format)
      VA_FORMAT: begin
        if (instr_name == VMV) begin
          case (va_variant)
            VV: asm_str = $sformatf("vmv.v.v %s,%s",vd.name(), vs1.name());
            VX: asm_str = $sformatf("vmv.v.x %s,%s",vd.name(), rs1.name());
            VI: asm_str = $sformatf("vmv.v.i %s,%s",vd.name(), imm_str);
          endcase
        end else begin
          asm_str = $sformatf("%0s.%0s ", get_instr_name(), va_variant.name());
          asm_str = format_string(asm_str, MAX_INSTR_STR_LEN);
          case (va_variant) inside
            WV, VV, VVM: begin
              asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), vs1.name())};
            end
            WI, VI, VIM: begin
              asm_str = {asm_str, $sformatf("%0s,%0s,%0s", vd.name(), vs2.name(), imm_str)};
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
          if (instr_name inside {VMADC, VADC, VSBC, VMSBC, VMERGE}) begin
            if (va_variant inside {VVM, VIM, VXM}) begin
              asm_str = {asm_str, ",v0"};
            end
          end else begin
            //asm_str = {asm_str, ",v0.t"};
          end
        end
      end
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
    if (name.substr(0, 1) == "VW") begin
      is_widen_instr = 1'b1;
    end
    if (name.substr(0, 1) == "VN") begin
      is_narrowing_instr = 1'b1;
    end
    case (format) inside
      VA_FORMAT : begin
        if (va_variant inside {WI, VI, VIM}) begin
          has_imm = 1'b1;
          has_vs1 = 1'b0;
        end else if (va_variant inside {WX, VX, VXM}) begin
          has_rs1 = 1'b1;
          has_vs1 = 1'b0;
        end
      end
    endcase
  endfunction : set_rand_mode

endclass : riscv_vector_instr
