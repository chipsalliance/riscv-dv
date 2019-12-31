class riscv_vector_cfg extends uvm_object;

  rand vtype_t           vtype;
  rand bit [XLEN-1:0]    vl;
  rand bit [XLEN-1:0]    vstart;
  rand vxrm_t            vxrm;
  rand bit               vxsat;

  constraint legal_c {
    solve vtype before vl;
    solve vl before vstart;
    vstart <= vl;
    vtype.vsew <= $clog2(VLEN/8);
    vl <= (1 << ($clog2(VLEN/8) - vtype.vsew));
  }

  // Basic constraint for initial bringup
  constraint bringup_c {
    vstart == 0;
    vl == (1 << ($clog2(VLEN/8) - vtype.vsew));
    vtype.vlmul == 0;
    vtype.vediv == 0;
    vtype.vsew == 0;
  }

  `uvm_object_utils_begin(riscv_vector_cfg)
    `uvm_field_int(vtype.ill, UVM_DEFAULT)
    `uvm_field_int(vtype.vediv, UVM_DEFAULT)
    `uvm_field_int(vtype.vsew, UVM_DEFAULT)
    `uvm_field_int(vtype.vlmul, UVM_DEFAULT)
    `uvm_field_int(vl, UVM_DEFAULT)
    `uvm_field_int(vstart, UVM_DEFAULT)
    `uvm_field_enum(vxrm_t,vxrm, UVM_DEFAULT)
    `uvm_field_int(vxsat, UVM_DEFAULT)
  `uvm_object_utils_end

  `uvm_object_new

endclass : riscv_vector_cfg
