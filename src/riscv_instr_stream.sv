/*
 * Copyright 2018 Google LLC
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

// Base class for RISC-V instruction stream
// A instruction stream here is a  queue of RISC-V basic instructions.
// This class also provides some functions to manipulate the instruction stream, like insert a new
// instruction, mix two instruction streams etc.
class riscv_instr_stream extends uvm_object;

  riscv_instr           instr_list[$];
  int unsigned          instr_cnt;
  string                label = "";
  // User can specify a small group of available registers to generate various hazard condition
  rand riscv_reg_t      avail_regs[];
  // Some additional reserved registers that should not be used as rd register
  // by this instruction stream
  riscv_reg_t           reserved_rd[];
  int                   hart;

  `uvm_object_utils(riscv_instr_stream)
  `uvm_object_new

  // Initialize the instruction stream, create each instruction instance
  function void initialize_instr_list(int unsigned instr_cnt);
    instr_list = {};
    this.instr_cnt = instr_cnt;
    create_instr_instance();
  endfunction

  virtual function void create_instr_instance();
    riscv_instr instr;
    for(int i = 0; i < instr_cnt; i++) begin
      instr = riscv_instr::type_id::create($sformatf("instr_%0d", i));
      instr_list.push_back(instr);
    end
  endfunction

  // Insert an instruction to the existing instruction stream at the given index
  // When index is -1, the instruction is injected at a random location
  function void insert_instr(riscv_instr instr, int idx = -1);
    int current_instr_cnt = instr_list.size();
    if (current_instr_cnt == 0) begin
      idx = 0;
    end else if (idx == -1) begin
      idx = $urandom_range(0, current_instr_cnt-1);
      while(instr_list[idx].atomic) begin
       idx += 1;
       if (idx == current_instr_cnt - 1) begin
         instr_list = {instr_list, instr};
         return;
       end
      end
    end else if((idx > current_instr_cnt) || (idx < 0)) begin
      `uvm_error(`gfn, $sformatf("Cannot insert instr:%0s at idx %0d",
                       instr.convert2asm(), idx))
    end
    instr_list.insert(idx, instr);
  endfunction

  // Insert an instruction to the existing instruction stream at the given index
  // When index is -1, the instruction is injected at a random location
  // When replace is 1, the original instruction at the inserted position will be replaced
  function void insert_instr_stream(riscv_instr new_instr[], int idx = -1, bit replace = 1'b0);
    int current_instr_cnt = instr_list.size();
    int new_instr_cnt = new_instr.size();
    if(current_instr_cnt == 0) begin
      instr_list = new_instr;
      return;
    end
    if(idx == -1) begin
      idx = $urandom_range(0, current_instr_cnt-1);
      repeat(10) begin
       if (instr_list[idx].atomic) break;
       idx = $urandom_range(0, current_instr_cnt-1);
      end
      if (instr_list[idx].atomic) begin
        foreach (instr_list[i]) begin
          if (!instr_list[i].atomic) begin
            idx = i;
            break;
          end
        end
        if (instr_list[idx].atomic) begin
          `uvm_fatal(`gfn, $sformatf("Cannot inject the instruction"))
        end
      end
    end else if((idx > current_instr_cnt) || (idx < 0)) begin
      `uvm_error(`gfn, $sformatf("Cannot insert instr stream at idx %0d", idx))
    end
    // When replace is 1, the original instruction at this index will be removed. The label of the
    // original instruction will be copied to the head of inserted instruction stream.
    if(replace) begin
      new_instr[0].label = instr_list[idx].label;
      new_instr[0].has_label = instr_list[idx].has_label;
      if (idx == 0) begin
        instr_list = {new_instr, instr_list[idx+1:current_instr_cnt-1]};
      end else begin
        instr_list = {instr_list[0:idx-1], new_instr, instr_list[idx+1:current_instr_cnt-1]};
      end
    end else begin
      if (idx == 0) begin
        instr_list = {new_instr, instr_list[idx:current_instr_cnt-1]};
      end else begin
        instr_list = {instr_list[0:idx-1], new_instr, instr_list[idx:current_instr_cnt-1]};
      end
    end
  endfunction

  // Mix the input instruction stream with the original instruction, the instruction order is
  // preserved. When 'contained' is set, the original instruction stream will be inside the
  // new instruction stream with the first and last instruction from the input instruction stream.
  function void mix_instr_stream(riscv_instr new_instr[], bit contained = 1'b0);
    int current_instr_cnt = instr_list.size();
    int insert_instr_position[];
    int new_instr_cnt = new_instr.size();
    insert_instr_position = new[new_instr_cnt];
    `DV_CHECK_STD_RANDOMIZE_WITH_FATAL(insert_instr_position,
      foreach(insert_instr_position[i]) {
        insert_instr_position[i] inside {[0:current_instr_cnt-1]};
      })
    if (insert_instr_position.size() > 0) begin
      insert_instr_position.sort();
    end
    if(contained) begin
      insert_instr_position[0] = 0;
      if(new_instr_cnt > 1)
        insert_instr_position[new_instr_cnt-1] = current_instr_cnt-1;
    end
    foreach(new_instr[i]) begin
      insert_instr(new_instr[i], insert_instr_position[i] + i);
    end
  endfunction

  function string convert2string();
    string str;
    foreach(instr_list[i])
      str = {str, instr_list[i].convert2asm(), "\n"};
    return str;
  endfunction

endclass

// Generate a random instruction stream based on the configuration
// There are two ways to use this class to generate instruction stream
// 1. For short instruction stream, you can call randomize() directly.
// 2. For long instruction stream (>1K), randomize() all instructions together might take a long
// time for the constraint solver. In this case, you can call gen_instr to generate instructions
// one by one. The time only grows linearly with the instruction count
class riscv_rand_instr_stream extends riscv_instr_stream;

  riscv_instr_gen_config  cfg;
  bit                     kernel_mode;
  riscv_instr_name_t      allowed_instr[$];
  int unsigned            category_dist[riscv_instr_category_t];

  `uvm_object_utils(riscv_rand_instr_stream)
  `uvm_object_new

  virtual function void create_instr_instance();
    riscv_instr instr;
    for (int i = 0; i < instr_cnt; i++) begin
      instr_list.push_back(null);
    end
  endfunction

  virtual function void setup_allowed_instr(bit no_branch = 1'b0, bit no_load_store = 1'b1);
    allowed_instr = riscv_instr::basic_instr;
    if (no_branch == 0) begin
      allowed_instr = {allowed_instr, riscv_instr::instr_category[BRANCH]};
    end
    if (no_load_store == 0) begin
      allowed_instr = {allowed_instr, riscv_instr::instr_category[LOAD],
                                      riscv_instr::instr_category[STORE]};
    end
    setup_instruction_dist(no_branch, no_load_store);
  endfunction

  virtual function void randomize_avail_regs();
    if(avail_regs.size() > 0) begin
      `DV_CHECK_STD_RANDOMIZE_WITH_FATAL(avail_regs,
                                         unique{avail_regs};
                                         avail_regs[0] inside {[S0 : A5]};
                                         foreach(avail_regs[i]) {
                                           !(avail_regs[i] inside {cfg.reserved_regs, reserved_rd});
                                         },
                                         "Cannot randomize avail_regs")
    end
  endfunction

  function void setup_instruction_dist(bit no_branch = 1'b0, bit no_load_store = 1'b1);
    if (cfg.dist_control_mode) begin
      category_dist = cfg.category_dist;
      if (no_branch) begin
        category_dist[BRANCH] = 0;
      end
      if (no_load_store) begin
        category_dist[LOAD] = 0;
        category_dist[STORE] = 0;
      end
      `uvm_info(`gfn, $sformatf("setup_instruction_dist: %0d", category_dist.size()), UVM_LOW)
    end
  endfunction

  virtual function void gen_instr(bit no_branch = 1'b0, bit no_load_store = 1'b1,
                                  bit is_debug_program = 1'b0);
    setup_allowed_instr(no_branch, no_load_store);
    foreach(instr_list[i]) begin
      if (instr_list[i] != null) continue;
      randomize_instr(instr_list[i], is_debug_program);
      // Handle special instructions
      if (instr_list[i].group == RVV && instr_list[i].category == CSR) begin
        handle_vector_configuration_instr(i);
        // Regenerate list of supported instruction
        riscv_instr::create_instr_list(cfg);
        setup_allowed_instr(no_branch, no_load_store);
      end
    end
    // Do not allow branch instruction as the last instruction because there's no
    // forward branch target
    while (instr_list[$].category == BRANCH) begin
      void'(instr_list.pop_back());
      if (instr_list.size() == 0) break;
    end
  endfunction

  function void randomize_instr(output riscv_instr instr,
                                input  bit is_in_debug = 1'b0,
                                input  bit disable_dist = 1'b0,
                                input  riscv_instr_group_t include_group[$] = {});
    riscv_instr_name_t exclude_instr[];
    if ((SP inside {reserved_rd, cfg.reserved_regs}) ||
        ((avail_regs.size() > 0) && !(SP inside {avail_regs}))) begin
      exclude_instr = {C_ADDI4SPN, C_ADDI16SP, C_LWSP, C_LDSP};
    end
    // Post-process the allowed_instr and exclude_instr lists to handle
    // adding ebreak instructions to the debug rom.
    if (is_in_debug) begin
      if (cfg.no_ebreak && cfg.enable_ebreak_in_debug_rom) begin
        allowed_instr = {allowed_instr, EBREAK, C_EBREAK};
      end else if (!cfg.no_ebreak && !cfg.enable_ebreak_in_debug_rom) begin
        exclude_instr = {exclude_instr, EBREAK, C_EBREAK};
      end
    end
    instr = riscv_instr::get_rand_instr(.include_instr(allowed_instr),
                                        .exclude_instr(exclude_instr),
                                        .include_group(include_group));
    instr.m_cfg = cfg;
    randomize_gpr(instr);
  endfunction

  function void randomize_gpr(riscv_instr instr);
    `DV_CHECK_RANDOMIZE_WITH_FATAL(instr,
      if (avail_regs.size() > 0) {
        if (has_rs1) {
          rs1 inside {avail_regs};
        }
        if (has_rs2) {
          rs2 inside {avail_regs};
        }
        if (has_rd) {
          rd  inside {avail_regs};
        }
      }
      foreach (reserved_rd[i]) {
        if (has_rd) {
          rd != reserved_rd[i];
        }
        if (format == CB_FORMAT) {
          rs1 != reserved_rd[i];
        }
        if (format == VSET_FORMAT) {
          has_rs1 -> rs1 != reserved_rd[i];
          has_rs2 -> rs2 != reserved_rd[i];
        }
      }
      foreach (cfg.reserved_regs[i]) {
        if (has_rd) {
          rd != cfg.reserved_regs[i];
        }
        if (format == CB_FORMAT) {
          rs1 != cfg.reserved_regs[i];
        }
        if (format == VSET_FORMAT) {
          has_rs1 -> rs1 != cfg.reserved_regs[i];
          has_rs2 -> rs2 != cfg.reserved_regs[i];
        }
      }
      // TODO: Add constraint for CSR, floating point register
    )
  endfunction

  // Handle vset{i}vl{i} instructions
  // Regenerate vector configuration and initialize rs1/rs2
  function void handle_vector_configuration_instr(int idx);
    riscv_instr instr;
    instr = instr_list[idx];

    // Create new config instance and deep copy old config
    cfg = new ();
    cfg.copy(instr.m_cfg);
    // Set instruction config to new instance
    instr.m_cfg = cfg;

    // Randomize cfg
    if (instr.rs1 == ZERO && instr.instr_name != VSETIVLI) begin
      if (instr.rd == ZERO) begin
        // Keep existing vl
        cfg.vector_cfg.vl.rand_mode(0);
      end
    end
    `DV_CHECK_RANDOMIZE_WITH_FATAL(cfg.vector_cfg,
      if (instr.instr_name == VSETIVLI) {
        cfg.vector_cfg.vl < 2**5;
      }
    )
    // Special vsetvl{¡} conditions
    if (instr.instr_name != VSETIVLI && instr.rs1 == ZERO && instr.rd != ZERO) begin
      // Set vl to vlmax
      cfg.vector_cfg.vl = cfg.vector_cfg.vlmax();
    end
    cfg.vector_cfg.vl.rand_mode(1);

    // Handle not fully immediate instructions
    if (instr.instr_name != VSETIVLI) begin
      // Copy vsetvl{i} instruction to position further back
      instr_list[idx+(instr.instr_name == VSETVL ? 2 : 1) - (instr.rs1 == ZERO)] = instr;

      // Setup rs1 (avl)
      if (instr.rs1 != ZERO) begin
        instr_list[idx] = get_init_gpr_instr(instr.rs1, cfg.vector_cfg.vl);
      end
      // Setup rs2 (vtype)
      if (instr.instr_name == VSETVL) begin
        instr_list[idx+(instr.rs1 != ZERO)] = get_init_gpr_instr(instr.rs2, cfg.vector_cfg.get_vtype_content());
      end
    end
  endfunction

  // Get a random vreg that is aligned to non fractional emul and is not already reserved
  // Optionally add random vreg to list of reserved vregs
  function riscv_vreg_t get_random_vreg (int emul, int reserve_vreg);
    // Get random start register and align to emul
    int base = $urandom_range(31) / emul * emul;
    for (int i = 0; i < 32; i += emul) begin
      for (int idx = 0; idx < emul; idx++) begin
        if (riscv_vreg_t'(base + idx) inside {cfg.vector_cfg.reserved_vregs}) break;
        if (reserve_vreg) begin
          for (int i = 0; i < emul; i++) begin
            cfg.vector_cfg.reserved_vregs.push_back(riscv_vreg_t'(base + i));
          end
        end
        return riscv_vreg_t'(base);
      end
      base += emul;
      base %= 32;
    end
    `uvm_fatal(`gfn, $sformatf("Cannot find random vector register with emul = %0d that is not already reserved", emul))
  endfunction

  function riscv_instr get_init_gpr_instr(riscv_reg_t gpr, bit [XLEN-1:0] val);
    riscv_pseudo_instr li_instr;
    li_instr = riscv_pseudo_instr::type_id::create("li_instr");
    `DV_CHECK_RANDOMIZE_WITH_FATAL(li_instr,
       pseudo_instr_name == LI;
       rd == gpr;
    )
    li_instr.imm_str = $sformatf("0x%0x", val);
    return li_instr;
  endfunction

  // Initialize a v-register with random values (determined through a linear feedback shift register)
  // vreg: register with randomised elements
  // seed: register that contains initial seed (cannot be equal to vreg)
  // vtemp: temporary vector register used during calculation (cannot be equal to vreg or seed)
  // reseed: reseed the original seed with the vector element index (seed += vid)
  // min_value: lower bound of random value (inclusive)
  // max_value: upper bound of random value (inclusive)
  // align_by: align random value by number of bytes (e.g align_by == 2 would clear the lowest bit)
  // sew: element width
  // insert_idx: position in instruction stream to insert instruction at
  //             (-1: random, 0: front, instr_list.size(): back (default))
  function void add_init_vector_gpr_random(riscv_vreg_t vreg, riscv_vreg_t seed, riscv_vreg_t vtemp,
                                           int reseed, int min_value, int max_value,
                                           int align_by, int sew, int insert_idx = instr_list.size());
    // The LFSR is based on the fibonacci lfsr (https://en.wikipedia.org/wiki/Linear-feedback_shift_register)
    // The polynomial parameters are based on a paper by Xilinx (http://www.xilinx.com/support/documentation/application_notes/xapp052.pdf)
    //
    // LFSR
    // Feedback polynomial
    //   i8:  x^8  + x^6  + x^5  + x^4 + 1
    //   i16: x^16 + x^15 + x^13 + x^4 + 1
    //   i32: x^32 + x^22 + x^2  + x^1 + 1
    //
    // Calculation (example for i16):
    // # taps: 16 15 13 4; feedback polynomial: x^16 + x^15 + x^13 + x^4 + 1
    //   bit = (lfsr ^ (lfsr >> 1) ^ (lfsr >> 3) ^ (lfsr >> 12)) & 1
    //   lfsr = (lfsr >> 1) | (bit << 15)

    riscv_instr init_instr_list [$];
    riscv_vector_instr vinstr;
    riscv_instr_gen_config init_cfg;
    int polynomial[];

    unique case (sew)
      8:  polynomial = {6,   5, 4};
      16: polynomial = {15, 13, 4};
      32: polynomial = {22,  2, 1};
      default: `uvm_fatal("add_init_vector_gpr_random",
                  $sformatf("Error: Unable to initialize vector with randomised values of SEW == %0d", sew))
    endcase

    // Clone current configuration
    init_cfg = new();
    init_cfg.copy(cfg);

    // Set vtype to new vsew and vl to VLMAX
    init_cfg.vector_cfg.update_vsew_keep_vl(sew);
    $cast(vinstr, riscv_instr::get_instr(VSETVLI));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = init_cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      rs1 == 0;
      rd  == cfg.gpr[0];
    )
    init_instr_list.push_back(vinstr);

    // Add vid to seed values
    if (reseed) begin
      // vtemp = vid
      $cast(vinstr, riscv_instr::get_instr(VID_V));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        vm == 1'b1;
        vd == vtemp;
      )
      init_instr_list.push_back(vinstr);

      // seed = seed + vtemp
      $cast(vinstr, riscv_instr::get_instr(VADD));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        va_variant == VV;
        vm  == 1'b1;
        vd  == seed;
        vs1 == vtemp;
        vs2 == seed;
      )
      init_instr_list.push_back(vinstr);
    end

    // vreg = seed
    $cast(vinstr, riscv_instr::get_instr(VMV_V_V));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = init_cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      va_variant == VV;
      vm  == 1'b1;
      vd  == vreg;
      vs1 == seed;
    )
    init_instr_list.push_back(vinstr);

    foreach (polynomial[i]) begin
      // vtemp = seed >> (sew - polynomial[i])
      $cast(vinstr, riscv_instr::get_instr(VSRL));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        va_variant == VI;
        vm  == 1'b1;
        vd  == vtemp;
        vs2 == seed;
        imm == sew - polynomial[i];
      )
      init_instr_list.push_back(vinstr);

      // vreg = vtemp ^ vreg
      $cast(vinstr, riscv_instr::get_instr(VXOR));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        va_variant == VV;
        vm  == 1'b1;
        vd  == vreg;
        vs2 == vtemp;
        vs1 == vreg;
      )
      init_instr_list.push_back(vinstr);
    end

    // vreg = vreg << sew - 1
    $cast(vinstr, riscv_instr::get_instr(VSLL));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = init_cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      va_variant == VI;
      vm  == 1'b1;
      vd  == vreg;
      vs2 == vreg;
      imm == sew - 1;
    )
    init_instr_list.push_back(vinstr);

    // vtemp = seed >> 1
    $cast(vinstr, riscv_instr::get_instr(VSRL));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = init_cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      va_variant == VI;
      vm  == 1'b1;
      vd  == vtemp;
      vs2 == seed;
      imm == 1;
    )
    init_instr_list.push_back(vinstr);

    // vreg = vreg | vtemp
    $cast(vinstr, riscv_instr::get_instr(VOR));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = init_cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      va_variant == VV;
      vm  == 1'b1;
      vd  == vreg;
      vs2 == vtemp;
      vs1 == vreg;
    )
    init_instr_list.push_back(vinstr);

    // Cast to range
    if (min_value > 0) begin
      init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], min_value));
      $cast(vinstr, riscv_instr::get_instr(VMAXU));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        va_variant == VX;
        vm  == 1'b1;
        vd  == vreg;
        vs2 == vreg;
        rs1 == cfg.gpr[0];
      )
      init_instr_list.push_back(vinstr);
    end
    if (max_value > 0) begin
      init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], max_value));
      $cast(vinstr, riscv_instr::get_instr(VMINU));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        va_variant == VX;
        vm  == 1'b1;
        vd  == vreg;
        vs2 == vreg;
        rs1 == cfg.gpr[0];
      )
      init_instr_list.push_back(vinstr);
    end
    if (align_by > 1) begin
      init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], '1 << $clog2(align_by)));
      $cast(vinstr, riscv_instr::get_instr(VAND));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        va_variant == VX;
        vm  == 1'b1;
        vd  == vreg;
        vs2 == vreg;
        rs1 == cfg.gpr[0];
      )
      init_instr_list.push_back(vinstr);
    end

    // Reset vtype
    init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], cfg.vector_cfg.vl));
    $cast(vinstr, riscv_instr::get_instr(VSETVLI));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      rs1 == cfg.gpr[0];
      !(rd inside {cfg.reserved_regs, reserved_rd});
      vd  == 0;
    )
    init_instr_list.push_back(vinstr);

    // Add instructions to instruction stream
    insert_instr_stream(init_instr_list, insert_idx);
  endfunction

  // Initialize a v-register with pre-defined values
  // Instructions will be inserted at defined index (-1: random, 0: front, instr_list.size(): back)
  function void add_init_vector_gpr(riscv_vreg_t vreg, logic [XLEN-1:0] values [], int sew, int idx = instr_list.size());
    riscv_instr init_instr_list [$];
    riscv_vector_instr vinstr;
    riscv_instr_gen_config init_cfg;

    // Clone current configuration
    init_cfg = new();
    init_cfg.copy(cfg);

    // Set vtype to new vsew and vl to VLMAX
    init_cfg.vector_cfg.update_vsew_keep_vl(sew);
    $cast(vinstr, riscv_instr::get_instr(VSETVLI));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = init_cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      rs1 == 0;
      rd  == cfg.gpr[0];
    )
    init_instr_list.push_back(vinstr);

    // Initialize v-register
    if (values.size() == 1) begin
      // Load initialize value to x-register
      init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], values[0]));

      // Splatter value to v-register
      $cast(vinstr, riscv_instr::get_instr(VMV_V_X));
      vinstr.avoid_reserved_vregs_c.constraint_mode(0);
      vinstr.m_cfg = init_cfg;
      `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
        vd  == vreg;
        rs1 == cfg.gpr[0];
        vm  == 1'b1;
      )
      init_instr_list.push_back(vinstr);
    end else begin
      int i;
      // Load all defined values into v-register
      for (i = 0; i < values.size() && i < init_cfg.vector_cfg.vlmax(); i++) begin
        // Load initialize value to x-register
        init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], values[i]));

        // Slide down value in v-register
        $cast(vinstr, riscv_instr::get_instr(VSLIDE1DOWN));
        vinstr.avoid_reserved_vregs_c.constraint_mode(0);
        vinstr.m_cfg = init_cfg;
        `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
          vd  == vreg;
          vs2 == vreg;
          rs1 == cfg.gpr[0];
          vm  == 1'b1;
        )
        init_instr_list.push_back(vinstr);
      end
      // Rotate v-register to get init values to correct place
      for (; i < init_cfg.vector_cfg.vlmax(); i++) begin
        // Get first value of v-register
        $cast(vinstr, riscv_instr::get_instr(VMV_X_S));
        vinstr.avoid_reserved_vregs_c.constraint_mode(0);
        vinstr.m_cfg = init_cfg;
        `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
          vs2 == vreg;
          rd  == cfg.gpr[0];
        )
        init_instr_list.push_back(vinstr);

        // Slide down value in v-register
        $cast(vinstr, riscv_instr::get_instr(VSLIDE1DOWN));
        vinstr.avoid_reserved_vregs_c.constraint_mode(0);
        vinstr.m_cfg = init_cfg;
        `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
          vd  == vreg;
          vs2 == vreg;
          rs1 == cfg.gpr[0];
          vm  == 1'b1;
        )
        init_instr_list.push_back(vinstr);
      end
    end

    // Reset vtype
    init_instr_list.push_back(get_init_gpr_instr(cfg.gpr[0], cfg.vector_cfg.vl));
    $cast(vinstr, riscv_instr::get_instr(VSETVLI));
    vinstr.avoid_reserved_vregs_c.constraint_mode(0);
    vinstr.m_cfg = cfg;
    `DV_CHECK_RANDOMIZE_WITH_FATAL(vinstr,
      rs1 == cfg.gpr[0];
      !(rd inside {cfg.reserved_regs, reserved_rd});
      vd  == 0;
    )
    init_instr_list.push_back(vinstr);

    // Add instructions to instruction stream
    insert_instr_stream(init_instr_list, idx);
  endfunction

endclass
