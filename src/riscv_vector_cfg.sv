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

  // Zvl* extension
  int unsigned vlen = VLEN;

  // Zve* extension
  string       zve_extension     = "";
  bit          enable_fp_support = 1'b1;
  int unsigned max_int_sew       = 64;
  int unsigned max_fp_sew        = 64;

  // Zvfhmin extension
  bit enable_zvfhmin_extension = 1'b0;

  // Zvfh extension
  bit          enable_zvfh_extension = 1'b0;
  int unsigned min_fp_sew            = 32;

  // Legal EEW encoded in load/store instructions based
  // on current SEW and LMUL setting
  int unsigned legal_ls_eew[$];

  constraint solve_order_c {
    solve vtype before vl;
    solve vl before vstart;
  }

  // vl has to be within VLMAX
  constraint vl_c {
    vl inside {[0 : vlmax(vtype)]};
  }

  // vstart has to be within vl
  constraint vstart_c {
    vstart inside {[0 : vl]};
  }

  // Select valid vlmul
  constraint vlmul_c {
    vtype.vlmul inside {1, 2, 4, 8};
    vtype.fractional_lmul -> vtype.vlmul != 1;
    // Fractional LMUL only allowed iff at least one SEW element fits into vector
    ((max_int_sew / 8) >> $clog2(vtype.vsew/8)) < vtype.vlmul -> !vtype.fractional_lmul;
    // Fractional LMUL 1/8th only supported iff EEW 64 is supported
    vtype.fractional_lmul -> vtype.vlmul <= max_int_sew / 8;
  }

  // Set current element width
  constraint vsew_c {
    vtype.vsew inside {8, 16, 32, 64};
    vtype.vsew <= max_int_sew;
  }

  `uvm_object_utils_begin(riscv_vector_cfg)
    `uvm_field_int(vtype.ill, UVM_DEFAULT)
    `uvm_field_int(vtype.vma, UVM_DEFAULT)
    `uvm_field_int(vtype.vta, UVM_DEFAULT)
    `uvm_field_int(vtype.vsew, UVM_DEFAULT)
    `uvm_field_int(vtype.vlmul, UVM_DEFAULT)
    `uvm_field_int(vtype.fractional_lmul, UVM_DEFAULT)
    `uvm_field_int(vl, UVM_DEFAULT)
    `uvm_field_int(vstart, UVM_DEFAULT)
    `uvm_field_enum(vxrm_t,vxrm, UVM_DEFAULT)
    `uvm_field_int(vxsat, UVM_DEFAULT)
    `uvm_field_queue_enum(riscv_vreg_t, reserved_vregs, UVM_DEFAULT)
    `uvm_field_string(zve_extension, UVM_DEFAULT)
    `uvm_field_int(enable_fp_support, UVM_DEFAULT)
    `uvm_field_int(max_int_sew, UVM_DEFAULT)
    `uvm_field_int(max_fp_sew, UVM_DEFAULT)
    `uvm_field_int(enable_zvfhmin_extension, UVM_DEFAULT)
    `uvm_field_int(enable_zvfh_extension, UVM_DEFAULT)
    `uvm_field_int(min_fp_sew, UVM_DEFAULT)
    `uvm_field_queue_int(legal_ls_eew, UVM_DEFAULT)
  `uvm_object_utils_end

  function new (string name = "");
    super.new(name);
    // Check for Zvl* extension
    if ($value$plusargs("zvl_extension=%0d", vlen)) begin
      if (vlen < 32 || vlen > 2**16 || 2**$clog2(vlen) != vlen) begin
        `uvm_fatal(`gfn, $sformatf({"Unsupported Zvl* extension Zvl%0db. VLEN needs to be within 32 and 2**16",
                                    " and be of power of two"}, vlen))
      end
      `uvm_info(`gfn, $sformatf("Enabling Zvl%0db extension. Setting VLEN to %0d (overwriting old VLEN of %0d)",
                                vlen, vlen, VLEN), UVM_LOW)
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
      if (vlen < minimum_vlen) begin
        `uvm_fatal(`gfn, $sformatf("%0s extension requires a VLEN of at least %0d bits",
                                   zve_extension, minimum_vlen))
      end
      // Set configuration
      enable_fp_support = supported_type inside {"f", "d"};
      max_int_sew       = minimum_vlen;
      max_fp_sew        = supported_type == "f" ? 32 :
                          supported_type == "d" ? 64 : 0;
    end
    if ($value$plusargs("enable_zvfhmin_extension=%0b", enable_zvfhmin_extension)) begin
      if (enable_zvfhmin_extension && !enable_fp_support) begin
        `uvm_fatal(`gfn, $sformatf("Zvfhmin extension requires floating point support (Zve32x is invalid)"))
      end
    end
    if ($value$plusargs("enable_zvfh_extension=%0b", enable_zvfh_extension)) begin
      if (enable_zvfh_extension && !enable_zvfhmin_extension) begin
        `uvm_fatal(`gfn, $sformatf("Zvfh extension requires the Zvfhmin extension"))
      end
      if (enable_zvfh_extension) begin
        min_fp_sew = 16;
      end
    end
  endfunction : new

  function void post_randomize();
    set_legal_ls_eew();
  endfunction : post_randomize

  // Section 7.3: Vector Load/Store Width Encoding
  // Vector loads and stores have an EEW encoded directly in the instruction. The
  // corresponding EMUL is calculated as EMUL = (EEW/SEW)*LMUL. If the EMUL would
  // be out of range (EMUL>8 or EMUL<1/8), the instruction encoding is reserved.
  function void set_legal_ls_eew();
    real eew;
    legal_ls_eew = {};
    for (real emul = 1.0 / real'(max_int_sew/8); emul <= 8.0; emul = emul * 2) begin
      // Calculate EEW
      if (vtype.fractional_lmul) begin
        eew = real'(vtype.vsew) * emul * real'(vtype.vlmul);
      end else begin
        eew = real'(vtype.vsew) * emul / real'(vtype.vlmul);
      end
      // Check EEW and append iff legal
      if (eew inside {[8:max_int_sew]}) begin
        legal_ls_eew.push_back(int'(eew));
      end
    end
  endfunction

  // Updates the current vtype with a new desired SEW. VL will stay the same, so
  // LMUL will be scaled accordingly.
  function void update_vsew_keep_vl(int vsew);
    real lmul_o, lmul_n;
    lmul_o = vtype.fractional_lmul ? 1.0 / real'(vtype.vlmul) : real'(vtype.vlmul);
    lmul_n = lmul_o * real'(vsew) / real'(vtype.vsew);
    if (lmul_n < 1.0) begin
      vtype.fractional_lmul = 1'b1;
      vtype.vlmul = int'(1.0 / lmul_n);
    end else begin
      vtype.fractional_lmul = 1'b0;
      vtype.vlmul = int'(lmul_n);
    end
    vtype.vsew = vsew;
  endfunction

  // Get the vlmax for the current vtype
  function int vlmax(vtype_t _vtype = vtype);
    if (_vtype.fractional_lmul) begin
      vlmax = vlen / _vtype.vsew / _vtype.vlmul;
    end else begin
      vlmax = vlen / _vtype.vsew * _vtype.vlmul;
    end
    return vlmax;
  endfunction

endclass : riscv_vector_cfg
