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

class riscv_vector_cfg extends uvm_object;

  rand vtype_t           vtype;
  rand bit [XLEN-1:0]    vl;
  rand bit [XLEN-1:0]    vstart;
  rand vxrm_t            vxrm;
  rand bit               vxsat;
  riscv_vreg_t           reserved_vregs[$];

  // Zve* extension
  string       zve_extension     = "";
  bit          enable_fp_support = 1'b1;
  int unsigned max_int_sew       = 64;
  int unsigned max_fp_sew        = 64;

  // Zvfh extension
  bit          enable_zvfh_extension = 1'b0;
  int unsigned min_fp_sew            = 32;

  // Allowed effective element width based on the LMUL setting
  int unsigned           legal_eew[$];

  // Allow only vector instructions from the random sequences
  rand bit only_vec_instr;
  constraint only_vec_instr_c {soft only_vec_instr == 0;}

  // Allow vector narrowing or widening instructions.
  rand bit vec_narrowing_widening;

  rand bit allow_illegal_vec_instr;
  constraint allow_illegal_vec_instr_c {soft allow_illegal_vec_instr == 0;}

  // Enable segmented load/store extension ops
  rand bit enable_zvlsseg = 1'b1;

  // Enable fault only first load ops
  rand bit enable_fault_only_first_load;

  constraint legal_c {
    solve vtype before vl;
    solve vl before vstart;
    vstart inside {[0:vl]};
    vl inside {[1:VLEN/vtype.vsew]};
  }

  // Basic constraint for initial bringup
  constraint bringup_c {
    vstart == 0;
  }

  constraint vlmul_c {
    vtype.vlmul inside {1, 2, 4, 8};
    vtype.fractional_lmul -> vtype.vlmul != 1;
    // Fractional LMUL only allowed iff at least one SEW element fits into vector
    (8 >> $clog2(vtype.vsew/8)) < vtype.vlmul -> !vtype.fractional_lmul;
    // Fractional LMUL 1/8th only supported iff EEW 64 is supported
    vtype.fractional_lmul -> vtype.vlmul <= max_int_sew / 8;
  }

  constraint vsew_c {
    vtype.vsew inside {8, 16, 32, 64};
    vtype.vsew <= max_int_sew;
  }

  constraint vseg_c {
    enable_zvlsseg -> (vtype.vlmul < 8);
  }

  `uvm_object_utils_begin(riscv_vector_cfg)
    `uvm_field_int(vtype.ill, UVM_DEFAULT)
    `uvm_field_int(vtype.vma, UVM_DEFAULT)
    `uvm_field_int(vtype.vta, UVM_DEFAULT)
    `uvm_field_int(vtype.vsew, UVM_DEFAULT)
    `uvm_field_int(vtype.vlmul, UVM_DEFAULT)
    `uvm_field_int(vtype.fractional_lmul, UVM_DEFAULT)
    `uvm_field_queue_int(legal_eew, UVM_DEFAULT)
    `uvm_field_int(vl, UVM_DEFAULT)
    `uvm_field_int(vstart, UVM_DEFAULT)
    `uvm_field_enum(vxrm_t,vxrm, UVM_DEFAULT)
    `uvm_field_int(vxsat, UVM_DEFAULT)
    `uvm_field_string(zve_extension, UVM_DEFAULT)
    `uvm_field_int(enable_fp_support, UVM_DEFAULT)
    `uvm_field_int(max_int_sew, UVM_DEFAULT)
    `uvm_field_int(max_fp_sew, UVM_DEFAULT)
    `uvm_field_int(enable_zvfh_extension, UVM_DEFAULT)
    `uvm_field_int(min_fp_sew, UVM_DEFAULT)
    `uvm_field_int(enable_zvlsseg, UVM_DEFAULT)
    `uvm_field_int(enable_fault_only_first_load, UVM_DEFAULT)
  `uvm_object_utils_end

  function new (string name = "");
    super.new(name);
    if ($value$plusargs("enable_zvlsseg=%0d", enable_zvlsseg)) begin
      enable_zvlsseg.rand_mode(0);
    end
    if ($value$plusargs("enable_fault_only_first_load=%0d", enable_fault_only_first_load)) begin
      enable_fault_only_first_load.rand_mode(0);
    end
    // Check for Zve* extension
    if ($value$plusargs("zve_extension=%0s", zve_extension)) begin
      int minimum_vlen;
      string supported_type;
      zve_extension = zve_extension.tolower();
      minimum_vlen = zve_extension.substr(3,4).atoi();
      supported_type = zve_extension.substr(5,5);

      // Is the extension valid
      if (zve_extension.substr(0,2) != "zve" || !(minimum_vlen inside {32, 64}) ||
          !(supported_type inside {"x", "f", "d"}) || (minimum_vlen == 32 && supported_type == "d")) begin
        `uvm_fatal(`gfn, $sformatf("Unsupported Zve* extension %0s. Supported are Zve32{x,f} and Zve64{x,f,d}.",
                                   zve_extension))
      end
      `uvm_info(`gfn, $sformatf("Enabling vector spec %0s extension", zve_extension), UVM_LOW)
      // Check VLEN to be of correct minimum size
      if (VLEN < minimum_vlen) begin
        `uvm_fatal(`gfn, $sformatf("%0s extension requires a VLEN of at least %0d bits",
                                   zve_extension, minimum_vlen))
      end
      // Set configuration
      enable_fp_support = supported_type inside {"f", "d"};
      max_int_sew       = minimum_vlen;
      max_fp_sew        = supported_type == "f" ? 32 :
                          supported_type == "d" ? 64 : 0;
    end
    if ($value$plusargs("enable_zvfh_extension=%0b", enable_zvfh_extension)) begin
      if (enable_zvfh_extension) begin
        min_fp_sew = 16;
      end
    end
  endfunction : new

  function void post_randomize();
    real temp_eew;
    legal_eew = {};
    // Section 7.3 Vector loads and stores have the EEW encoded directly in the instruction.
    // EMUL is calculated as EMUL =(EEW/SEW)*LMUL. If the EMUL would be out of range
    // (EMUL>8 or EMUL<1/8), an illegal instruction exceptionis raised.
    // EEW = SEW * EMUL / LMUL
    for (real emul = 0.125; emul <= 8; emul = emul * 2) begin
      if (vtype.fractional_lmul == 0) begin
        temp_eew = real'(vtype.vsew) * emul / real'(vtype.vlmul);
      end else begin
        temp_eew = real'(vtype.vsew) * emul * real'(vtype.vlmul);
      end
      if (temp_eew inside {[8:1024]}) begin
        legal_eew.push_back(int'(temp_eew));
      end
      `uvm_info(`gfn, $sformatf("Checking emul: %.2f", emul), UVM_LOW)
    end
  endfunction : post_randomize

endclass : riscv_vector_cfg
