/*
 * Copyright 2018 Google LLC
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

// Base class for all load/store instruction stream

class riscv_load_store_base_instr_stream extends riscv_mem_access_stream;

  typedef enum bit [1:0] {
    NARROW,
    HIGH,
    MEDIUM,
    SPARSE
  } locality_e;

  rand int unsigned  num_load_store;
  rand int unsigned  num_mixed_instr;
  rand int           base;
  int                offset[];
  int                addr[];
  riscv_instr        load_store_instr[$];
  rand int unsigned  data_page_id;
  rand riscv_reg_t   rs1_reg;
  rand locality_e    locality;
  rand int           max_load_store_offset;
  rand bit           use_sp_as_rs1;

  `uvm_object_utils(riscv_load_store_base_instr_stream)

  constraint sp_rnd_order_c {
    solve use_sp_as_rs1 before rs1_reg;
  }

  constraint sp_c {
    use_sp_as_rs1 dist {1 := 1, 0 := 2};
    if (use_sp_as_rs1) {
      rs1_reg == SP;
    }
  }

  constraint rs1_c {
    !(rs1_reg inside {cfg.reserved_regs, reserved_rd, ZERO});
  }

  constraint addr_c {
    solve data_page_id before max_load_store_offset;
    solve max_load_store_offset before base;
    data_page_id < max_data_page_id;
    foreach (data_page[i]) {
      if (i == data_page_id) {
        max_load_store_offset == data_page[i].size_in_bytes;
      }
    }
    base inside {[0 : max_load_store_offset-1]};
  }

  function new(string name = "");
    super.new(name);
  endfunction

  virtual function void randomize_offset();
    int offset_, addr_;
    offset = new[num_load_store];
    addr = new[num_load_store];
    for (int i=0; i<num_load_store; i++) begin
      if (!std::randomize(offset_, addr_) with {
        if (locality == NARROW) {
          soft offset_ inside {[-16:16]};
        } else if (locality == HIGH) {
          soft offset_ inside {[-64:64]};
        } else if (locality == MEDIUM) {
          soft offset_ inside {[-256:256]};
        } else if (locality == SPARSE) {
          soft offset_ inside {[-2048:2047]};
        }
        addr_ == base + offset_;
        addr_ inside {[0 : max_load_store_offset - 1]};
      }) begin
        `uvm_fatal(`gfn, "Cannot randomize load/store offset")
      end
      offset[i] = offset_;
      addr[i] = addr_;
    end
  endfunction

  function void pre_randomize();
    super.pre_randomize();
    if (SP inside {cfg.reserved_regs, reserved_rd}) begin
      use_sp_as_rs1 = 0;
      use_sp_as_rs1.rand_mode(0);
      sp_rnd_order_c.constraint_mode(0);
    end
  endfunction

  function void post_randomize();
    randomize_offset();
    // rs1 cannot be modified by other instructions
    if(!(rs1_reg inside {reserved_rd})) begin
      reserved_rd = {reserved_rd, rs1_reg};
    end
    gen_load_store_instr();
    add_mixed_instr(num_mixed_instr);
    add_rs1_init_la_instr(rs1_reg, data_page_id, base);
    super.post_randomize();
  endfunction

  // Generate each load/store instruction
  virtual function void gen_load_store_instr();
    bit enable_compressed_load_store;
    riscv_instr instr;
    randomize_avail_regs();
    if ((rs1_reg inside {[S0 : A5], SP}) && !cfg.disable_compressed_instr) begin
      enable_compressed_load_store = 1;
    end
    foreach (addr[i]) begin
      // Assign the allowed load/store instructions based on address alignment
      // This is done separately rather than a constraint to improve the randomization performance
      allowed_instr = {LB, LBU, SB};
      if (!cfg.enable_unaligned_load_store) begin
        if (addr[i][0] == 1'b0) begin
          allowed_instr = {LH, LHU, SH, allowed_instr};
        end
        if (addr[i] % 4 == 0) begin
          allowed_instr = {LW, SW, allowed_instr};
          if (cfg.enable_floating_point) begin
            allowed_instr = {FLW, FSW, allowed_instr};
          end
          if((offset[i] inside {[0:127]}) && (offset[i] % 4 == 0) &&
             (RV32C inside {riscv_instr_pkg::supported_isa}) &&
             enable_compressed_load_store) begin
            if (rs1_reg == SP) begin
              `uvm_info(`gfn, "Add LWSP/SWSP to allowed instr", UVM_LOW)
              allowed_instr = {C_LWSP, C_SWSP};
            end else begin
              allowed_instr = {C_LW, C_SW, allowed_instr};
              if (cfg.enable_floating_point && (RV32FC inside {supported_isa})) begin
                allowed_instr = {C_FLW, C_FSW, allowed_instr};
              end
            end
          end
        end
        if ((XLEN >= 64) && (addr[i] % 8 == 0)) begin
          allowed_instr = {LWU, LD, SD, allowed_instr};
          if (cfg.enable_floating_point && (RV32D inside {supported_isa})) begin
            allowed_instr = {FLD, FSD, allowed_instr};
          end
          if((offset[i] inside {[0:255]}) && (offset[i] % 8 == 0) &&
             (RV64C inside {riscv_instr_pkg::supported_isa} &&
             enable_compressed_load_store)) begin
            if (rs1_reg == SP) begin
              allowed_instr = {C_LDSP, C_SDSP};
            end else begin
              allowed_instr = {C_LD, C_SD, allowed_instr};
              if (cfg.enable_floating_point && (RV32DC inside {supported_isa})) begin
                allowed_instr = {C_FLD, C_FSD, allowed_instr};
              end
            end
          end
        end
      end else begin // unaligned load/store
        allowed_instr = {LW, SW, LH, LHU, SH, allowed_instr};
        // Compressed load/store still needs to be aligned
        if ((offset[i] inside {[0:127]}) && (offset[i] % 4 == 0) &&
            (RV32C inside {riscv_instr_pkg::supported_isa}) &&
            enable_compressed_load_store) begin
            if (rs1_reg == SP) begin
              allowed_instr = {C_LWSP, C_SWSP};
            end else begin
              allowed_instr = {C_LW, C_SW, allowed_instr};
            end
        end
        if (XLEN >= 64) begin
          allowed_instr = {LWU, LD, SD, allowed_instr};
          if ((offset[i] inside {[0:255]}) && (offset[i] % 8 == 0) &&
              (RV64C inside {riscv_instr_pkg::supported_isa}) &&
              enable_compressed_load_store) begin
              if (rs1_reg == SP) begin
                allowed_instr = {C_LWSP, C_SWSP};
              end else begin
                allowed_instr = {C_LD, C_SD, allowed_instr};
              end
           end
        end
      end
      instr = riscv_instr::get_load_store_instr(allowed_instr);
      instr.has_rs1 = 0;
      instr.has_imm = 0;
      randomize_gpr(instr);
      instr.rs1 = rs1_reg;
      instr.imm_str = $sformatf("%0d", $signed(offset[i]));
      instr.process_load_store = 0;
      instr_list.push_back(instr);
      load_store_instr.push_back(instr);
    end
  endfunction

endclass

// A single load/store instruction
class riscv_single_load_store_instr_stream extends riscv_load_store_base_instr_stream;

  constraint legal_c {
    num_load_store == 1;
    num_mixed_instr < 5;
  }

  `uvm_object_utils(riscv_single_load_store_instr_stream)
  `uvm_object_new

endclass

// Back to back load/store instructions
class riscv_load_store_stress_instr_stream extends riscv_load_store_base_instr_stream;

  int unsigned max_instr_cnt = 30;
  int unsigned min_instr_cnt = 10;

  constraint legal_c {
    num_load_store inside {[min_instr_cnt:max_instr_cnt]};
    num_mixed_instr == 0;
  }

  `uvm_object_utils(riscv_load_store_stress_instr_stream)
  `uvm_object_new

endclass


// Back to back load/store instructions
class riscv_load_store_shared_mem_stream extends riscv_load_store_stress_instr_stream;

  `uvm_object_utils(riscv_load_store_shared_mem_stream)
  `uvm_object_new

  function void pre_randomize();
    load_store_shared_memory = 1;
    super.pre_randomize();
  endfunction

endclass

// Random load/store sequence
// A random mix of load/store instructions and other instructions
class riscv_load_store_rand_instr_stream extends riscv_load_store_base_instr_stream;

  constraint legal_c {
    num_load_store inside {[10:30]};
    num_mixed_instr inside {[10:30]};
  }

  `uvm_object_utils(riscv_load_store_rand_instr_stream)
  `uvm_object_new

endclass

// Use a small set of GPR to create various WAW, RAW, WAR hazard scenario
class riscv_hazard_instr_stream extends riscv_load_store_base_instr_stream;

  int unsigned num_of_avail_regs = 6;

  constraint legal_c {
    num_load_store inside {[10:30]};
    num_mixed_instr inside {[10:30]};
  }

  `uvm_object_utils(riscv_hazard_instr_stream)
  `uvm_object_new

  function void pre_randomize();
    avail_regs = new[num_of_avail_regs];
    super.pre_randomize();
  endfunction

endclass

// Use a small set of address to create various load/store hazard sequence
// This instruction stream focus more on hazard handling of load store unit.
class riscv_load_store_hazard_instr_stream extends riscv_load_store_base_instr_stream;

  rand int hazard_ratio;

  constraint hazard_ratio_c {
    hazard_ratio inside {[20:100]};
  }

  constraint legal_c {
    num_load_store inside {[10:20]};
    num_mixed_instr inside {[1:7]};
  }

  `uvm_object_utils(riscv_load_store_hazard_instr_stream)
  `uvm_object_new

  virtual function void randomize_offset();
    int offset_, addr_;
    offset = new[num_load_store];
    addr = new[num_load_store];
    for (int i = 0; i < num_load_store; i++) begin
      if ((i > 0) && ($urandom_range(0, 100) < hazard_ratio)) begin
        offset[i] = offset[i-1];
        addr[i] = addr[i-1];
      end else begin
        if (!std::randomize(offset_, addr_) with {
          if (locality == NARROW) {
            soft offset_ inside {[-16:16]};
          } else if (locality == HIGH) {
            soft offset_ inside {[-64:64]};
          } else if (locality == MEDIUM) {
            soft offset_ inside {[-256:256]};
          } else if (locality == SPARSE) {
            soft offset_ inside {[-2048:2047]};
          }
          addr_ == base + offset_;
          addr_ inside {[0 : max_load_store_offset - 1]};
        }) begin
          `uvm_fatal(`gfn, "Cannot randomize load/store offset")
        end
        offset[i] = offset_;
        addr[i] = addr_;
      end
    end
  endfunction : randomize_offset

endclass

// Back to back access to multiple data pages
// This is useful to test data TLB switch and replacement
class riscv_multi_page_load_store_instr_stream extends riscv_mem_access_stream;

  riscv_load_store_stress_instr_stream load_store_instr_stream[];
  rand int unsigned num_of_instr_stream;
  rand int unsigned data_page_id[];
  rand riscv_reg_t  rs1_reg[];

  constraint default_c {
    foreach(data_page_id[i]) {
      data_page_id[i] < max_data_page_id;
    }
    data_page_id.size() == num_of_instr_stream;
    rs1_reg.size() == num_of_instr_stream;
    unique {rs1_reg};
    foreach(rs1_reg[i]) {
      !(rs1_reg[i] inside {cfg.reserved_regs, ZERO});
    }
  }

  constraint page_c {
    solve num_of_instr_stream before data_page_id;
    num_of_instr_stream inside {[1 : max_data_page_id]};
    unique {data_page_id};
  }

  // Avoid accessing a large number of pages because we may run out of registers for rs1
  // Each page access needs a reserved register as the base address of load/store instruction
  constraint reasonable_c {
    num_of_instr_stream inside {[2:8]};
  }

  `uvm_object_utils(riscv_multi_page_load_store_instr_stream)
  `uvm_object_new

  // Generate each load/store seq, and mix them together
  function void post_randomize();
    load_store_instr_stream = new[num_of_instr_stream];
    foreach(load_store_instr_stream[i]) begin
      load_store_instr_stream[i] = riscv_load_store_stress_instr_stream::type_id::
                                   create($sformatf("load_store_instr_stream_%0d", i));
      load_store_instr_stream[i].min_instr_cnt = 5;
      load_store_instr_stream[i].max_instr_cnt = 10;
      load_store_instr_stream[i].cfg = cfg;
      load_store_instr_stream[i].hart = hart;
      load_store_instr_stream[i].sp_c.constraint_mode(0);
      // Make sure each load/store sequence doesn't override the rs1 of other sequences.
      foreach(rs1_reg[j]) begin
        if(i != j) begin
          load_store_instr_stream[i].reserved_rd =
            {load_store_instr_stream[i].reserved_rd, rs1_reg[j]};
        end
      end
      `DV_CHECK_RANDOMIZE_WITH_FATAL(load_store_instr_stream[i],
                                     rs1_reg == local::rs1_reg[i];
                                     data_page_id == local::data_page_id[i];,
                                     "Cannot randomize load/store instruction")
      // Mix the instruction stream of different page access, this could trigger the scenario of
      // frequent data TLB switch
      if(i == 0) begin
        instr_list = load_store_instr_stream[i].instr_list;
      end else begin
        mix_instr_stream(load_store_instr_stream[i].instr_list);
      end
    end
  endfunction

endclass

// Access the different locations of the same memory regions
class riscv_mem_region_stress_test extends riscv_multi_page_load_store_instr_stream;

  `uvm_object_utils(riscv_mem_region_stress_test)
  `uvm_object_new

  constraint page_c {
    num_of_instr_stream inside {[2:5]};
    foreach (data_page_id[i]) {
      if (i > 0) {
        data_page_id[i] == data_page_id[i-1];
      }
    }
  }

endclass

// Random load/store sequence to full address range
// The address range is not preloaded with data pages, use store instruction to initialize first
class riscv_load_store_rand_addr_instr_stream extends riscv_load_store_base_instr_stream;

  rand bit [XLEN-1:0] addr_offset;

  // Find an unused 4K page from address 1M onward
  constraint addr_offset_c {
    |addr_offset[XLEN-1:20] == 1'b1;
    // TODO(taliu) Support larger address range
    addr_offset[XLEN-1:31] == 0;
    addr_offset[11:0] == 0;
  }

  constraint legal_c {
    num_load_store inside {[5:10]};
    num_mixed_instr inside {[5:10]};
  }

  `uvm_object_utils(riscv_load_store_rand_addr_instr_stream)
  `uvm_object_new

   virtual function void randomize_offset();
    int offset_, addr_;
    offset = new[num_load_store];
    addr = new[num_load_store];
    for (int i=0; i<num_load_store; i++) begin
      if (!std::randomize(offset_) with {
          offset_ inside {[-2048:2047]};
        }
      ) begin
        `uvm_fatal(`gfn, "Cannot randomize load/store offset")
      end
      offset[i] = offset_;
      addr[i] = addr_offset + offset_;
    end
  endfunction

  virtual function void add_rs1_init_la_instr(riscv_reg_t gpr, int id, int base = 0);
    riscv_instr instr[$];
    riscv_pseudo_instr li_instr;
    riscv_instr store_instr;
    riscv_instr add_instr;
    int min_offset[$];
    int max_offset[$];
    min_offset = offset.min();
    max_offset = offset.max();
    // Use LI to initialize the address offset
    li_instr = riscv_pseudo_instr::type_id::create("li_instr");
    `DV_CHECK_RANDOMIZE_WITH_FATAL(li_instr,
       pseudo_instr_name == LI;
       rd inside {cfg.gpr};
       rd != gpr;
    )
    li_instr.imm_str = $sformatf("0x%0x", addr_offset);
    // Add offset to the base address
    add_instr = riscv_instr::get_instr(ADD);
    `DV_CHECK_RANDOMIZE_WITH_FATAL(add_instr,
       rs1 == gpr;
       rs2 == li_instr.rd;
       rd  == gpr;
    )
    instr.push_back(li_instr);
    instr.push_back(add_instr);
    // Create SW instruction template
    store_instr = riscv_instr::get_instr(SB);
    `DV_CHECK_RANDOMIZE_WITH_FATAL(store_instr,
       instr_name == SB;
       rs1 == gpr;
    )
    // Initialize the location which used by load instruction later
    foreach (load_store_instr[i]) begin
      if (load_store_instr[i].category == LOAD) begin
        riscv_instr store;
        store = riscv_instr::type_id::create("store");
        store.copy(store_instr);
        store.rs2 = riscv_reg_t'(i % 32);
        store.imm_str = load_store_instr[i].imm_str;
        // TODO: C_FLDSP is in both rv32 and rv64 ISA
        case (load_store_instr[i].instr_name) inside
          LB, LBU : store.instr_name = SB;
          LH, LHU : store.instr_name = SH;
          LW, C_LW, C_LWSP, FLW, C_FLW, C_FLWSP : store.instr_name = SW;
          LD, C_LD, C_LDSP, FLD, C_FLD, LWU     : store.instr_name = SD;
          default : `uvm_fatal(`gfn, $sformatf("Unexpected op: %0s",
                                               load_store_instr[i].convert2asm()))
        endcase
        instr.push_back(store);
      end
    end
    instr_list = {instr, instr_list};
    super.add_rs1_init_la_instr(gpr, id, 0);
  endfunction

endclass

class riscv_vector_load_store_instr_stream extends riscv_mem_access_stream;

  // List of vector load/store instructions (grouped into different address modes)
  localparam riscv_instr_name_t unit_strided[] = {VLE_V, VSE_V, VLEFF_V,
                                                  VLM_V, VSM_V, VLRE_V, VSR_V,
                                                  VLSEGE_V, VSSEGE_V, VLSEGEFF_V};
  localparam riscv_instr_name_t strided[]      = {VLSE_V, VSSE_V, VLSSEGE_V, VSSSEGE_V};
  localparam riscv_instr_name_t indexed[]      = {VLUXEI_V, VLOXEI_V, VSUXEI_V, VSOXEI_V,
                                                  VLUXSEGEI_V, VLOXSEGEI_V, VSUXSEGEI_V, VSOXSEGEI_V};

  // Types of vector load/store address modes
  typedef enum {UNIT_STRIDED, STRIDED, INDEXED} address_mode_e;
  // List of allowed address modes
  address_mode_e allowed_address_modes[];

  rand int unsigned   data_eew;
  rand int unsigned   index_eew;
  rand int unsigned   data_page_id;
  rand int unsigned   data_page_base_offset;
  rand int unsigned   num_mixed_instr;
  rand int            byte_stride;
  rand address_mode_e address_mode;
  // Base address
  rand riscv_reg_t    rs1_reg;
  // Stride
  rand riscv_reg_t    rs2_reg;
  // Indexes - randomized by instructions
  riscv_vreg_t        vs2_reg;
  // Temporary random index calculation registers
  riscv_vreg_t        vseed;
  riscv_vreg_t        vtemp;
  // Generated load/store instruction
  riscv_vector_instr  load_store_instr;
  // Generated index byte offsets
  logic [XLEN-1:0]    indexed_byte_offset [];
  // Emul of index register
  int                 index_emul;

  constraint solve_order_c {
    solve address_mode          before data_page_id;
    solve address_mode          before data_eew;
    solve address_mode          before index_eew;
    solve data_eew              before data_page_id;
    solve index_eew             before data_page_id;
    solve data_eew              before data_page_base_offset;
    solve index_eew             before data_page_base_offset;
    solve data_page_id          before data_page_base_offset;
    solve data_page_base_offset before byte_stride;
  }

  // Find legal address modes
  constraint address_mode_c {
    address_mode inside {allowed_address_modes};
  }

  // Choose from available data pages
  constraint data_page_id_c {
    data_page_id < max_data_page_id;
    // Unit strided address mode requires a big enough data page
    address_mode == UNIT_STRIDED -> data_page[data_page_id].size_in_bytes >= cfg.vector_cfg.vl * (data_eew / 8);
  }

  // Find base address inside data page
  constraint data_page_base_offset_c {
    // Base address needs to be inside page
    data_page_base_offset <= data_page[data_page_id].size_in_bytes - 1;
    // Base address has to be aligned to data width
    data_page_base_offset % (data_eew / 8) == 0;
    // For unit-strided accesses, base address has to be VL element bytes below page end
    address_mode == UNIT_STRIDED -> data_page_base_offset <= data_page[data_page_id].size_in_bytes -
                                                             (cfg.vector_cfg.vl * (data_eew / 8));
  }

  // Choose legal EEW for current config
  constraint eew_c {
    if (address_mode != INDEXED) {
      data_eew inside {cfg.vector_cfg.legal_ls_eew};
    } else {
      data_eew == cfg.vector_cfg.vtype.vsew;
      index_eew inside {cfg.vector_cfg.legal_ls_eew};
    }
  }

  // How many non-l/s instructions should be interleaved
  constraint vec_mixed_instr_c {
    num_mixed_instr inside {[0:10]};
  }

  // Choose a legal byte stride for strided l/s
  constraint byte_stride_c {
    if (address_mode == STRIDED) {
      // Negative strides are allowed
      byte_stride * (data_eew / 8) * cfg.vector_cfg.vl inside {[-data_page_base_offset :
                                                                data_page[data_page_id].size_in_bytes - data_page_base_offset]};
      // Addresses have to be data width aligned
      byte_stride % (data_eew / 8) == 0;
    }
  }

  // Do not use reserved xregs for base address and stride
  constraint xreg_source_c {
    !(rs1_reg inside {cfg.reserved_regs, reserved_rd, ZERO});
    !(rs2_reg inside {cfg.reserved_regs, reserved_rd, ZERO});
    rs1_reg != rs2_reg;
  }

  `uvm_object_utils(riscv_vector_load_store_instr_stream)
  `uvm_object_new

  function void pre_randomize();
    super.pre_randomize();

    // Build list of allowed address modes (according to unsupported_instr list)
    foreach(unit_strided[i]) begin
      if (!(unit_strided[i] inside {unsupported_instr})) begin
        allowed_address_modes = {allowed_address_modes, UNIT_STRIDED};
        break;
      end
    end
    foreach(strided[i]) begin
      if (!(strided[i] inside {unsupported_instr})) begin
        allowed_address_modes = {allowed_address_modes, STRIDED};
        break;
      end
    end
    foreach(indexed[i]) begin
      if (!(indexed[i] inside {unsupported_instr})) begin
        allowed_address_modes = {allowed_address_modes, INDEXED};
        break;
      end
    end
  endfunction

  function void post_randomize();
    // Randomize the available registers
    reserved_rd = {reserved_rd, rs1_reg, rs2_reg};
    randomize_avail_regs();
    // Generate a random load/store instruction
    // Exit and skip directed test if there is no load/store instruction for current config
    if (gen_load_store_instr()) begin
      if (address_mode == INDEXED) begin
        // Unreserve index vector register
        for (int i = 0; i < index_emul; i++) begin
          cfg.vector_cfg.reserved_vregs.pop_back();
        end
      end
      return;
    end
    // Insert a random-mixed instruction stream
    add_mixed_instr(num_mixed_instr);
    // Insert the load/store instruction at a random place in the instruction stream
    insert_instr(load_store_instr);
    // Insert the load base address instruction
    add_rs1_init_la_instr(rs1_reg, data_page_id, data_page_base_offset);
    if (address_mode == STRIDED) begin
      // Initialize rs2 with the stride
      insert_instr(get_init_gpr_instr(rs2_reg, byte_stride), 0);
    end else if (address_mode == INDEXED) begin
      // Unreserve index vector register
      for (int i = 0; i < index_emul; i++) begin
        cfg.vector_cfg.reserved_vregs.pop_back();
      end
      // Initialize vs2 with random/pre-defined indexes
      // randomize_indexed_byte_offset();
      // add_init_vector_gpr(vs2_reg, indexed_byte_offset, index_eew, 0);
      add_init_vector_gpr_random(
        .vreg       ( vs2_reg                                                           ),
        .seed       ( vseed                                                             ),
        .vtemp      ( vtemp                                                             ),
        .reseed     ( 1'b1                                                              ),
        .min_value  ( 0                                                                 ),
        .max_value  ( data_page[data_page_id].size_in_bytes - data_page_base_offset - 1 ),
        .align_by   ( data_eew / 8                                                      ),
        .sew        ( index_eew                                                         ),
        .insert_idx ( 0                                                                 )
      );
    end
    super.post_randomize();
  endfunction

  // Generate a load/store instruction
  virtual function int gen_load_store_instr();
    build_allowed_instr();
    // If there are no allowed instructions, do not try to randomize and return early
    if (allowed_instr.size() == 0) return 1;
    randomize_vector_load_store_instr();
    return 0;
  endfunction

  // Choose allowed load/store instructions for current address mode
  virtual function void build_allowed_instr();
    riscv_instr_name_t possible_instr[];

    // Get instructions for selected address mode
    case (address_mode)
      UNIT_STRIDED : begin
        possible_instr = {unit_strided};
      end
      STRIDED : begin
        possible_instr = {strided};
      end
      INDEXED : begin
        possible_instr = {indexed};
      end
    endcase

    // Filter out illegal instructions for current config
    foreach (possible_instr[i]) begin
      riscv_instr instr_inst;
      if (possible_instr[i] inside {unsupported_instr}) continue;
      instr_inst = instr_inst.create_instr(possible_instr[i]);
      if (instr_inst.is_supported(cfg)) begin
        allowed_instr = {allowed_instr, possible_instr[i]};
      end
    end
  endfunction

  // Randomize the vector load and store instruction
  // Constrain to pre-randomized eew, rs1, rs2
  virtual function void randomize_vector_load_store_instr();
    $cast(load_store_instr, riscv_instr::get_load_store_instr(allowed_instr));
    load_store_instr.m_cfg   = cfg;
    load_store_instr.has_rs1 = 1'b0;
    load_store_instr.rs1     = rs1_reg;
    load_store_instr.has_rs2 = 1'b0;
    load_store_instr.rs2     = rs2_reg;
    load_store_instr.ls_eew.rand_mode(0);
    load_store_instr.ls_eew  = address_mode == INDEXED ? index_eew : data_eew;
    randomize_gpr(load_store_instr);
    if (address_mode == INDEXED) begin
      vs2_reg = load_store_instr.vs2;
      // Make sure that indexes are not overwritten
      index_emul = load_store_instr.emul_non_frac(index_eew);
      for (int i = 0; i < index_emul; i++) begin
        cfg.vector_cfg.reserved_vregs.push_back(riscv_vreg_t'(vs2_reg + i));
      end
      // Find seed and temporary vector registers
      vseed = get_random_vreg(index_emul, 1);
      vtemp = get_random_vreg(index_emul, 0);
      // Unreserve vseed register
      for (int i = 0; i < index_emul; i++) begin
        cfg.vector_cfg.reserved_vregs.pop_back();
      end
    end
    load_store_instr.process_load_store = 0;
  endfunction

  // Randomize the index byte offsets for index load and stores
  function void randomize_indexed_byte_offset();
    logic [XLEN-1:0] element;
    indexed_byte_offset = new [cfg.vector_cfg.vl];
    for (int i = 0; i < cfg.vector_cfg.vl; i++) begin
      // Get a random offset which fits into page
      element = $urandom_range(0, ((2**index_eew - 1) < data_page[data_page_id].size_in_bytes - data_page_base_offset - 1 ?
                                   (2**index_eew - 1) : data_page[data_page_id].size_in_bytes - data_page_base_offset - 1));
      // Align offset to data width
      indexed_byte_offset[i] = (element & ('1 << $clog2(data_eew / 8)));
    end
  endfunction

endclass
