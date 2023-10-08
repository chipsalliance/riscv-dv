/*
 * Copyright 2020 Google LLC
 * Copyright 2022 Coverify Systems Technology
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

module riscv.gen.riscv_pmp_cfg;

import riscv.gen.riscv_instr_pkg: pmp_cfg_reg_t, pmp_addr_mode_t,
  privileged_reg_t, riscv_reg_t, exception_cause_t, get_int_arg_value,
  get_bool_arg_value, get_hex_arg_value, mseccfg_reg_t;

import riscv.gen.target: XLEN, support_epmp;
import std.format: format;

import esdl.data.bvec: ubvec, toubvec, tobvec, clog2;
import esdl.rand: rand, constraint;

import uvm;

class riscv_pmp_cfg: uvm_object {

  mixin uvm_object_utils;

  // default to a single PMP region
  @rand @UVM_DEFAULT int pmp_num_regions = 1;

  // default to granularity of 0 (4 bytes grain)
  @UVM_DEFAULT int pmp_granularity = 0;

  // number of configuration bytes per pmpcfg CSR
  int cfg_per_csr;

  // enable bit for pmp randomization
  bool pmp_randomize = false;

  // allow pmp randomization to cause address range overlap
  bool pmp_allow_illegal_tor = false;

  // By default, after returning from a PMP exception, we return to the exact same instruction that
  // resulted in a PMP exception to begin with, creating an infinite loop of taking an exception.
  // To avoid this situation, this configuration knob will enable the relevant PMP exception
  // handlers to find the pmpcfg CSR that controls the address region resulting in the exception and
  // change the relevant access bit to 1'b1, allowing forward progress in the code, while also
  // allowing all access restrictions to be enforced.
  bool enable_pmp_exception_handler = true;

  // Don't generate the usual PMP setup section, instead generate a setup that provides a single
  // region allowing full access to all of memory from both U mode and M mode.
  bool suppress_pmp_setup = false;

  // Setting this bit to 1'b1 enables generation of the directed stream of instructions to test
  // write accesses to all supported pmpaddr[i] CSRs.
  bool enable_write_pmp_csr;

  // ePMP machine security configuration - RLB, MMWP, MML
  @UVM_DEFAULT
  @rand mseccfg_reg_t mseccfg = mseccfg_reg_t(true, false, false);

  // pmp CSR configurations
  @rand pmp_cfg_reg_t[]  pmp_cfg;

  // Hints used during PMP generation
  bool[] pmp_cfg_addr_valid;
  bool[] pmp_cfg_already_configured;

  // This value is the address offset between the minimum and maximum pmpaddr
  // CSR values.
  // As pmpaddr0 will be set to the address of the <main> label, the address stored
  // in pmpaddr0 added to this pmp_max_offset value will give the upper bound of the
  // address range covered by the PMP address range.
  // Can be manually configured from the command line.
  @UVM_DEFAULT ubvec!(XLEN) pmp_max_offset = ubvec!(XLEN).max();

  // Value to hold the end signature address to that signals the end to the test environment.
  // Currently the design assumes that the end signature is address is equal to the signature
  // address minus 4 Bytes.
  ubvec!XLEN end_signature_addr;

  // used to parse addr_mode configuration from cmdline
  alias addr_mode_wrapper = uvm_enum_wrapper!(pmp_addr_mode_t);
  pmp_addr_mode_t addr_mode;

  // Store the base addresses of pmpaddr0 and pmpcfg0
  privileged_reg_t base_pmp_addr = privileged_reg_t.PMPADDR0;
  privileged_reg_t base_pmpcfg_addr = privileged_reg_t.PMPCFG0;

  /////////////////////////////////////////////////
  // constraints - apply when pmp_randomize is 1 //
  /////////////////////////////////////////////////


  constraint! q{
    pmp_num_regions inside [1 : 16];
    pmp_granularity inside [0 : XLEN + 3];
  } sanity_c;


  constraint! q{
    foreach (cfg; pmp_cfg) {
      !(cfg.w && !cfg.r);
      !(!mseccfg.mml && cfg.w && !cfg.r);
    }
  } xwr_c;

  constraint! q{
    foreach (cfg; pmp_cfg) {
      cfg.addr_mode >= 0;
      cfg.addr_mode <= XLEN;
    }
  } address_modes_c;

  constraint! q{
    foreach (cfg; pmp_cfg) {
      (pmp_granularity >= 1) -> (cfg.a != pmp_addr_mode_t.NA4);
    }
  } grain_addr_mode_c;

  constraint! q{
    foreach (i, cfg; pmp_cfg) {
      // Offset of pmp_cfg[0] is always set to 0 from main.
      if (i != 0) {
        cfg.offset inside [1 : pmp_max_offset];
      }
      else {
        cfg.offset == 0;
      }
    }
  }  addr_range_c;

  constraint! q{
    foreach (cfg; pmp_cfg) {
      solve cfg.a before cfg.addr;
      solve cfg.addr_mode before cfg.addr;
    }
  }  modes_before_addr_c;


  constraint! q{
    foreach (i, cfg; pmp_cfg) {
      // In case illegal TOR regions are disallowed always add the constraint, otherwise make the
      // remove the constraint for 1 in every XLEN entries.
      if (i > 0 && cfg.a == pmp_addr_mode_t.TOR && (!pmp_allow_illegal_tor || cfg.addr_mode > 0)) {
        cfg.addr > pmp_cfg[i-1].addr;
      }
    }
  } addr_legal_tor_c;

  constraint! q{
    foreach (cfg; pmp_cfg) {
      // In case NAPOT is selected make sure that we randomly select a region mode and force the
      // address to match that mode.
      if (cfg.a == pmp_addr_mode_t.NAPOT) {
	// Make sure the bottom addr_mode - 1 bits are set to 1.
	(cfg.addr & ((1 << cfg.addr_mode) - 1)) == ((1 << cfg.addr_mode) - 1);
	if (cfg.addr_mode < XLEN) {
	  // Unless the largest region is selected make sure the bit just before the ones is set to 0.
	  (cfg.addr & (1 << cfg.addr_mode)) == 0;
       }
      }
    }
  } addr_napot_mode_c;

  this(string name = "") {
    string s;
    super(name);
    int pmp_max_offset_int;
    cfg_per_csr = XLEN / 8;
    if (uvm_cmdline_processor.get_inst().get_arg_value("+pmp_num_regions=", s)) {
      import std.conv: to;
      pmp_num_regions = s.to!int;
      rand_mode!q{pmp_num_regions}(false);
    }
    get_int_arg_value("+pmp_granularity=", pmp_granularity);
    get_bool_arg_value("+pmp_randomize=", pmp_randomize);
    get_bool_arg_value("+pmp_allow_illegal_tor=", pmp_allow_illegal_tor);
    get_bool_arg_value("+suppress_pmp_setup=", suppress_pmp_setup);
    get_bool_arg_value("+enable_write_pmp_csr=", enable_write_pmp_csr);
    get_hex_arg_value("+pmp_max_offset=", pmp_max_offset_int);
    pmp_max_offset = toubvec!XLEN(pmp_max_offset_int);
    uvm_info(get_full_name(), format("pmp max offset: 0x%08x", pmp_max_offset), UVM_LOW);
    pmp_cfg.length = pmp_num_regions;
    pmp_cfg_addr_valid.length = pmp_num_regions;
    pmp_cfg_already_configured.length = pmp_num_regions;
  }

  void initialize(ubvec!XLEN signature_addr) {
    end_signature_addr = signature_addr - 0x04;
    if (!pmp_randomize) {
      set_defaults();
      setup_pmp();
    }
  }

  // This will only get called if pmp_randomize is set, in which case we apply command line
  // arguments after randomization
  void post_randomize() {
    // `ifdef _VCP //GRK958
    //     foreach(pmp_cfg[i]) pmp_cfg[i].zero = 2'b00;
    // `endif
    setup_pmp();
  }

  void set_defaults() {
    uvm_info(get_full_name(), format("MAX OFFSET: 0x%08x", pmp_max_offset), UVM_LOW);
    mseccfg.mml  = false;
    mseccfg.mmwp = false;
    mseccfg.rlb  = true;
    foreach (i, cfg; pmp_cfg) {
      cfg.l                         = false;
      cfg.a                         = pmp_addr_mode_t.TOR;
      cfg.x                         = true;
      cfg.w                         = true;
      cfg.r                         = true;
      cfg.offset                    = assign_default_addr_offset(pmp_num_regions, cast(int) i);
      pmp_cfg_addr_valid[i]         = false;
      pmp_cfg_already_configured[i] = false;
    }
  }

  ubvec!XLEN  assign_default_addr_offset(int num_regions, int index) {
    ubvec!XLEN  offset;
    if (num_regions == 1) {
      assert (index == 0);
      offset = 0;
    }
    else {
      offset = pmp_max_offset / (num_regions - 1);
      offset = offset * index;
    }
    return offset;
  }

  struct parse_pmp_config_t { pmp_cfg_reg_t pmp_cfg_reg; bool addr_valid; }

  void setup_pmp() {
    string arg_name;
    string arg_value;
    parse_pmp_config_t tmp_value;
    if (uvm_cmdline_processor.get_inst().get_arg_value("+mseccfg=", arg_value)) {
      mseccfg = parse_mseccfg(arg_value, mseccfg);
    }
    foreach (i, ref cfg; pmp_cfg) {
      arg_name = format("+pmp_region_%0d=", i);
      if (uvm_cmdline_processor.get_inst().get_arg_value(arg_name, arg_value)) {
        tmp_value = parse_pmp_config(arg_value, cfg);
        cfg = tmp_value.pmp_cfg_reg;
        pmp_cfg_addr_valid[i] = tmp_value.addr_valid;
        uvm_info(get_full_name(), format("Configured pmp_cfg[%0d] from command line: %p",
					 i , cfg), UVM_LOW);
      }
    }
  }

  mseccfg_reg_t parse_mseccfg(string mseccfg, mseccfg_reg_t ref_mseccfg) {
    import std.format: format;
    import std.conv: to;

    string field_type;
    string field_val;
    mseccfg_reg_t mseccfg_reg = ref_mseccfg;
    string[] fields = uvm_string_split(mseccfg, ',');
    foreach (field; fields) {
      string[] field_vals = uvm_string_split(field, ':');
      field_type = field_vals[0];
      field_val = field_vals[1];
      switch (field_type) {
      case "MML":
	mseccfg_reg.mml = field_val.to!(bool);
	break;
      case "MMWP":
	mseccfg_reg.mmwp = field_val.to!(bool);
	break;
      case "RLB":
	mseccfg_reg.rlb = field_val.to!(bool);
	break;
      default: {
	uvm_fatal(get_full_name(), format("%s, Invalid MSECCFG field name!", field_val));
      }
      }
    }
    return mseccfg_reg;
  }


parse_pmp_config_t parse_pmp_config(string pmp_region, pmp_cfg_reg_t ref_pmp_cfg) {
    string [] fields;
    string [] field_vals;
    string field_type;
    string field_val;
    parse_pmp_config_t return_value;
    return_value.pmp_cfg_reg = ref_pmp_cfg;
    return_value.addr_valid = false;
    uvm_string_split(pmp_region, ',', fields);
    foreach (i, ref field; fields) {
      import std.conv: to;
      uvm_string_split(field, ':', field_vals);

      field_type = field_vals[0];
      field_val = field_vals[1];
      field_vals.length = 0;

      switch (field_type) {
      case "L" :
	return_value.pmp_cfg_reg.l = field_val.to!bool;
	break;
      case "A":
	bool ch_mode = addr_mode_wrapper.from_name(field_val, addr_mode);
	if(!ch_mode) uvm_error(get_full_name(), format("Check failed : %s", field_val));
	return_value.pmp_cfg_reg.a = addr_mode;
	break;
      case "X":
	return_value.pmp_cfg_reg.x = field_val.to!bool;
	break;
      case "W":
	return_value.pmp_cfg_reg.w = field_val.to!bool;
	break;
      case  "R":
	return_value.pmp_cfg_reg.r = field_val.to!bool;
	break;
      case "ADDR":
	// Don't have to convert address to "PMP format" here,
	// since it must be masked off in hardware
	static if (XLEN == 32) {
	  return_value.addr_valid = true;
	  return_value.pmp_cfg_reg.addr       = format_addr(toubvec!XLEN(field_val.to!uint(16)));
	}
	else static if (XLEN == 64) {
	  return_value.addr_valid = true;
	  return_value.pmp_cfg_reg.addr       = format_addr(toubvec!XLEN(field_val.to!ulong(16)));
	}
	else {
	  uvm_fatal(get_full_name(), format("Unsupported XLEN %0s", XLEN));
	}
	break;
      default:
	uvm_fatal(get_full_name(), format("%s, Invalid PMP configuration field name!", field_val));
      }
    }

    return return_value;
  }

  ubvec!XLEN format_addr(ubvec!XLEN addr) {
    // For all ISAs, pmpaddr CSRs do not include the bottom two bits of the input address
    ubvec!XLEN    shifted_addr;
    shifted_addr = addr >> 2;
    switch (XLEN) {
      // RV32 - pmpaddr is bits [33:2] of the whole 34 bit address
      // Return the input address right-shifted by 2 bits
    case  32:
      return shifted_addr;
      // RV64 - pmpaddr is bits [55:2] of the whole 56 bit address, prepended by 10'b0
      // Return {10'b0, shifted_addr[53:0]}
    case  64:
      shifted_addr[53..64] = 0.toubvec!11;
      return shifted_addr;
    default:
      uvm_fatal(get_full_name(), format("Unsupported XLEN %0s", XLEN));
      assert (false);
    }
  }

  // TODO(udinator) - implement function to return hardware masked pmpaddr "representation"
  ubvec!XLEN  convert_addr2pmp(ubvec!XLEN addr) {
    uvm_info(get_full_name(), "Placeholder function, need to implement", UVM_LOW);
    return addr;
  }

  ubvec!1  booltobit( bool x) {
    if ( x == true)
      return 0b1.toubvec!1;
    else
      return 0b0.toubvec!1;
  }

  // Generates code to setup a single PMP region allowing full access to all memory
  void gen_pmp_enable_all(riscv_reg_t scratch_reg, ref string[] instr) {
    // Setup region 0 to NAPOT covering the whole 32-bit address space, with RWX permissions and no
    // lock.
    instr ~= format("li x%0d, 0x1fffffff", scratch_reg);
    instr ~= format("csrw 0x%0x, x%0d", privileged_reg_t.PMPADDR0, scratch_reg);
    instr ~= format("csrw 0x%0x, 0x1f", privileged_reg_t.PMPCFG0);
  }

  // This function parses the pmp_cfg[] array to generate the actual instructions to set up
  // the PMP CSR registers.
  // Since either 4 (in rv32) or 8 (in rv64) PMP configuration registers fit into one physical
  // CSR, this function waits until it has reached this maximum to write to the physical CSR to
  // save some extraneous instructions from being performed.
  //
  // The general flow of this function:
  // - If randomization, generate code region, otherwise select region 0.
  // - Set address of code region before setting MSECCFG.
  // - If  MML, initially set MSECCFG to MML=0, MMWP=0, RLB=1.
  // - If  MML, set the config of code region to LXWR=1100 and TOR.
  // - If MMWP, set the config of code region to LXWR=0100 and TOR.
  // - If MML or MMWP, set requested MSECCFG with RLB hardcoded to 1.
  // - Don't override code region config if corresponding `+pmp_region_` is passed.
  // - If MML, set default code region config to shared execute.
  // - If MML or MMWP, set stack and signature regions to shared read/write.
  // - Set requested MSECCFG (including RLB).
  // - Set all other addresses and configs.
  void gen_pmp_instr(riscv_reg_t[2] scratch_reg, ref string[] instr) {
    import std.format: format;
    import esdl.base.rand: urandom;
    
    ubvec!XLEN   pmp_word;
    ubvec!XLEN   cfg_bitmask;
    ubvec!8       cfg_byte;
    int pmp_id;
    string arg_value;

    int code_entry, stack_entry, sig_entry;
    pmp_cfg_reg_t tmp_pmp_cfg;

    if (support_epmp) {
      // In case of MML or MMWP we need to set code region to executable before setting MSECCFG.
      if (mseccfg.mml || mseccfg.mmwp) {
        // Writing MSECCFG with RLB set to 1 to stop the config with L enabled from locking
        // everything before configuration is done.
        uvm_info(get_full_name(), format("MSECCFG: MML 0, MMWP 0, RLB 1"), UVM_LOW);
        cfg_byte = 0b00000100; // {1'b1, 1'b0, 1'b0};
        instr ~= format("csrwi 0x%0x, %0d", privileged_reg_t.MSECCFG, cfg_byte);

        if (pmp_randomize) {
          // Randomly select a PMP region to contain the code for permitting execution and two
          // extra regions to contain the stack and the signature address.
	  code_entry = urandom(0, pmp_num_regions - 2);
	  // Randomly select a PMP region to contain the code for permitting execution.
          // In case of full randomization we actually want the code region to cover main as well.
          pmp_cfg[code_entry].offset = pmp_max_offset;
	  stack_entry = code_entry + 1;
	  sig_entry = code_entry + 2;
        }
	else {
          code_entry = 0;
	  stack_entry = pmp_num_regions - 2;
	  sig_entry = pmp_num_regions - 1;
          // This is the default offset.
          pmp_cfg[code_entry].offset = assign_default_addr_offset(pmp_num_regions, code_entry);
	  pmp_cfg[pmp_num_regions - 3].offset = pmp_max_offset;
        }

        if (code_entry > 0) {
          // Load _start into PMP address of previous entry to complete TOR region.
          instr ~= format("la x%0d, _start", scratch_reg[0]);
          instr ~= format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]);
          instr ~= format("csrw 0x%0x, x%0d", base_pmp_addr + code_entry - 1,
			  scratch_reg[0]);
          uvm_info(get_full_name(), format("Address of pmp_addr_%d is _start",
					   code_entry - 1), UVM_LOW);
          pmp_cfg_already_configured[code_entry - 1] = true;
        }

        // Load the address of the kernel_instr_end into PMP code entry.
        instr ~= format("la x%0d, kernel_instr_end", scratch_reg[0]);
        instr ~= format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]);
        instr ~= format("csrw 0x%0x, x%0d", base_pmp_addr + code_entry, scratch_reg[0]);
        uvm_info(get_full_name(), format("Address of pmp_addr_%d is kernel_instr_end", code_entry),
		 UVM_LOW);
        pmp_cfg_already_configured[code_entry] = true;

        if (mseccfg.mml) {
          // This value is different from below (M-mode execute only) because we need code region
          // to be executable in both M-mode and U-mode, since RISCV-DV switches priviledge before
          // <main> but after <pmp_setup>. We choose to allow M-mode reads to allows checking
          // whether instructions are compressed in the trap handler in order to recover from load
          // and store access faults.
          tmp_pmp_cfg.l = true;
          tmp_pmp_cfg.a = pmp_addr_mode_t.TOR;
          tmp_pmp_cfg.x = true;
          tmp_pmp_cfg.w = true;
          tmp_pmp_cfg.r = false;
          // This configuration needs to be executable in M-mode both before and after writing to
          // MSECCFG. It will deny execution for U-Mode, but this is necessary because RWX=111 in
          // MML means read only, and RW=01 is not allowed before MML is enabled.
          // cfg_byte = {tmp_pmp_cfg.l, tmp_pmp_cfg.zero, tmp_pmp_cfg.a, 1'b1,
          //             1'b0, tmp_pmp_cfg.r};
	  cfg_byte[0] = tmp_pmp_cfg.r;
	  cfg_byte[1] = false;
	  cfg_byte[2] = tmp_pmp_cfg.x;
	  cfg_byte[3..5] = tmp_pmp_cfg.a;
	  cfg_byte[5..7] = tmp_pmp_cfg.zero;
	  cfg_byte[7] = tmp_pmp_cfg.l;
	}
	else {
          // We must set pmp code region to executable before enabling MMWP.
          tmp_pmp_cfg.l = false;
          tmp_pmp_cfg.a = pmp_addr_mode_t.TOR;
          tmp_pmp_cfg.x = true;
          tmp_pmp_cfg.w = false;
          tmp_pmp_cfg.r = false;

          // cfg_byte      = {tmp_pmp_cfg.l, tmp_pmp_cfg.zero, tmp_pmp_cfg.a,
          //                  tmp_pmp_cfg.x, tmp_pmp_cfg.w,    tmp_pmp_cfg.r};
	  cfg_byte[0] = tmp_pmp_cfg.r;
	  cfg_byte[1] = tmp_pmp_cfg.w;
	  cfg_byte[2] = tmp_pmp_cfg.x;
	  cfg_byte[3..5] = tmp_pmp_cfg.a;
	  cfg_byte[5..7] = tmp_pmp_cfg.zero;
	  cfg_byte[7] = tmp_pmp_cfg.l;
	}
        // In case the randomly selected code entry is not also configured in the arguments,
        // overwrite it in pmp_cfg.
        // The pmp_config has value LXWR = 1010, which means it is executable in both M and U mode.
        if (! uvm_cmdline_processor.get_inst().get_arg_value(format("+pmp_region_%0d=", code_entry),
				arg_value)) {
          pmp_cfg[code_entry].l      = tmp_pmp_cfg.l;
          pmp_cfg[code_entry].a      = tmp_pmp_cfg.a;
          pmp_cfg[code_entry].x      = tmp_pmp_cfg.x;
          pmp_cfg[code_entry].w      = tmp_pmp_cfg.w;
          pmp_cfg[code_entry].r      = tmp_pmp_cfg.r;
	}

        if (code_entry > 0) {
	  // Disable all configs before the code entry because PMP regions can be initialized with
	  // any value and we need to make sure that the code entry is the first valid entry during
	  // PMP setup.
	  cfg_bitmask = 0;
	  instr ~= format("li x%0d, 0x%0x", scratch_reg[0], cfg_bitmask);
	  for (int i = 0; i < (code_entry / cfg_per_csr); i++) {
	    instr ~= format("csrw 0x%0x, x%0d", base_pmpcfg_addr + i, scratch_reg[0]);
	  }
	}
	  // Enable the selected config on region code_entry.
	cfg_bitmask = cfg_byte << ((code_entry % cfg_per_csr) * 8);
        uvm_info(get_full_name(), format("temporary code config: 0x%08x", cfg_bitmask), UVM_DEBUG);
        instr ~= format("li x%0d, 0x%0x", scratch_reg[0], cfg_bitmask);
        instr ~= format("csrw 0x%0x, x%0d", base_pmpcfg_addr + (code_entry/cfg_per_csr),
			scratch_reg[0]);

        // Load the address of the kernel_stack_end into PMP stack entry.
        instr ~= format("la x%0d, kernel_stack_end", scratch_reg[0]);
	// Add 4 to also include the final address of the kernel stack.
	instr ~= format("addi x%0d, x%0d, 4", scratch_reg[0], scratch_reg[0]);
        instr ~= format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]);
        instr ~= format("csrw 0x%0x, x%0d", base_pmp_addr + stack_entry,
			scratch_reg[0]);
        uvm_info(get_full_name(), format("Address of pmp_addr_%d is kernel_stack_end", stack_entry),
		 UVM_LOW);
        pmp_cfg_already_configured[stack_entry] = true;
        // In case the randomly selected stack_entry is not also specified in the arguments,
        // overwrite it in pmp_cfg. We use this for the stack entry.
        if (! uvm_cmdline_processor.get_inst().get_arg_value(format("+pmp_region_%0d=", stack_entry), arg_value)) {
          if (mseccfg.mml) {
            // Marking the pmp stack region as shared write/read region before starting main.
            pmp_cfg[stack_entry].l = false;
            pmp_cfg[stack_entry].a = pmp_addr_mode_t.TOR;
            pmp_cfg[stack_entry].x = true;
            pmp_cfg[stack_entry].w = true;
            pmp_cfg[stack_entry].r = false;
          }
	  else {
            // We must set PMP stack region to write/read before starting main. X=0 to be consistent
            // with MML mode.
            pmp_cfg[stack_entry].l = false;
            pmp_cfg[stack_entry].a = pmp_addr_mode_t.TOR;
            pmp_cfg[stack_entry].x = false;
            pmp_cfg[stack_entry].w = true;
            pmp_cfg[stack_entry].r = true;
          }
        }
        // Load the signature address into PMP signature entry. This assumes the
        // end_signature_addr = signature_addr - 4. And that both are 4 Bytes.
        instr ~= format("li x%0d, 0x%0x", scratch_reg[0], end_signature_addr);
        instr ~= format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]);
        instr ~= format("csrw 0x%0x, x%0d", base_pmp_addr + sig_entry,
			scratch_reg[0]);
        uvm_info(get_full_name(), format("Address of pmp_addr_%0d is signature_addr", sig_entry),
		 UVM_LOW);
        pmp_cfg_already_configured[sig_entry] = true;
        // In case the randomly selected sig_entry is not also specified in the arguments,
        // overwrite it in pmp_cfg. This is used for the signature address.
        if (! uvm_cmdline_processor.get_inst().get_arg_value(format("+pmp_region_%0d=", sig_entry), arg_value)) {
          if (mseccfg.mml) {
            // Marking the PMP signature region as shared write/read region before starting main.
            pmp_cfg[sig_entry].l = false;
            pmp_cfg[sig_entry].a = pmp_addr_mode_t.NAPOT;
            pmp_cfg[sig_entry].x = true;
            pmp_cfg[sig_entry].w = true;
            pmp_cfg[sig_entry].r = false;
          }
	  else {
            // We must set PMP signature region to write/read before starting main. X=0 to be
            // consistent with MML mode.
            pmp_cfg[sig_entry].l = false;
            pmp_cfg[sig_entry].a = pmp_addr_mode_t.NAPOT;
            pmp_cfg[sig_entry].x = false;
            pmp_cfg[sig_entry].w = true;
            pmp_cfg[sig_entry].r = true;
          }
        }
      }

      // Writing MSECCFG with RLB still set to 1 otherwise we cannot complete configuration.
      uvm_info(get_full_name(), format("MSECCFG: MML %0x, MMWP %0x, RLB 1", mseccfg.mml, mseccfg.mmwp),
	       UVM_LOW);
      cfg_byte = booltobit(true) ~ mseccfg.mmwp ~ mseccfg.mml;
      instr ~= format("csrwi 0x%0x, %0d", privileged_reg_t.MSECCFG, cfg_byte);
    }

    foreach (i, ref cfg; pmp_cfg) {
      pmp_id = cast(int) (i/cfg_per_csr);
      cfg_byte[0] = pmp_cfg[i].r;
      cfg_byte[1] = pmp_cfg[i].w;
      cfg_byte[2] = pmp_cfg[i].x;
      cfg_byte[3..5] = pmp_cfg[i].a;
      cfg_byte[5..7] = pmp_cfg[i].zero;
      cfg_byte[7] = pmp_cfg[i].l;
      uvm_info(get_full_name(), format("cfg_byte: 0x%02x", cfg_byte), UVM_LOW);
      // First write to the appropriate pmpaddr CSR.
      cfg_bitmask = cfg_byte << ((i % cfg_per_csr) * 8);
      uvm_info(get_full_name(), format("cfg_bitmask: 0x%08x", cfg_bitmask), UVM_DEBUG);
      pmp_word = pmp_word | cfg_bitmask;
      uvm_info(get_full_name(), format("pmp_word: 0x%08x", pmp_word), UVM_DEBUG);
      cfg_bitmask = 0;

      // If an actual address has been set from the command line, use this address,
      // otherwise use the default <main> + offset.
      //
      // TODO(udinator) - The practice of passing in a max offset from the command line
      //  is somewhat unintuitive, and is just an initial step. Eventually a max address
      //  should be passed in from the command line and this routine do all of the
      //  calculations to split the address range formed by [<main> : pmp_max_addr].
      //  This will likely require a complex assembly routine - the code below is a very simple
      //  first step towards this goal, allowing users to specify a PMP memory address
      //  from the command line instead of having to calculate an offset themselves.
      //
      // Only set the address if it has not already been configured in the above routine.
      if (pmp_cfg_already_configured[i] == false || pmp_cfg_addr_valid[i]) {
        if (pmp_cfg_addr_valid[i] || pmp_randomize) {
          // In case an address was supplied by the test or full randomize is enabled.
          instr ~= format("li x%0d, 0x%0x", scratch_reg[0], pmp_cfg[i].addr);
          instr ~= format("csrw 0x%0x, x%0d", base_pmp_addr + i, scratch_reg[0]);
          uvm_info(get_full_name(), format("Value 0x%08x loaded into pmpaddr[%d] CSR, corresponding to address 0x%0x", pmp_cfg[i].addr, i, pmp_cfg[i].addr << 2),
		   UVM_LOW);
	}
	else {
          // Add the offset to the base address to get the other pmpaddr values.
          instr ~= format("la x%0d, main", scratch_reg[0]);
	  instr ~= format("li x%0d, 0x%0x", scratch_reg[1], pmp_cfg[i].offset);
          instr ~= format("add x%0d, x%0d, x%0d",
			  scratch_reg[0], scratch_reg[0], scratch_reg[1]);
          instr ~= format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]);
          instr ~= format("csrw 0x%0x, x%0d", base_pmp_addr + i, scratch_reg[0]);
          uvm_info(get_full_name(), format("Offset of pmp_addr_%d from main: 0x%08x", i,
					   pmp_cfg[i].offset), UVM_LOW);
        }
      }

      // Now, check if we have to write to the appropriate pmpcfg CSR.
      // Short circuit if we reach the end of the list.
      if (i == pmp_cfg.length - 1) {

        instr ~= format("li x%0d, 0x%0x", scratch_reg[0], pmp_word);
        instr ~= format("csrw 0x%0x, x%0d", base_pmpcfg_addr + pmp_id,
			scratch_reg[0]);
        break;
      }
      else if ((i + 1) % cfg_per_csr == 0) {
        // if we've filled up pmp_word, write to the corresponding CSR.
        instr ~= format("li x%0d, 0x%0x", scratch_reg[0], pmp_word);
        instr ~= format("csrw 0x%0x, x%0d", base_pmpcfg_addr + pmp_id,
			scratch_reg[0]);
        pmp_word = 0;
      }
    }

    // Unsetting RLB if that was requested.
    if (support_epmp && !mseccfg.rlb) {
      uvm_info(get_full_name(), format("MSECCFG: MML %0x, MMWP %0x, RLB %0x",
				       mseccfg.mml, mseccfg.mmwp,
				       mseccfg.rlb), UVM_LOW);
      cfg_byte = booltobit(mseccfg.rlb) ~
	booltobit(mseccfg.mmwp) ~ booltobit(mseccfg.mml);
      instr ~= format("csrwi 0x%0x, %0d", privileged_reg_t.MSECCFG, cfg_byte);
    }
 }

  // This function creates a special PMP exception routine that is generated within the
  // instr_fault, load_fault, and store_fault exception routines to prevent infinite loops.
  // This routine will first find the correct pmpcfg CSR that corresponds to the address that
  // caused the exception in the first place, and then will enable the appropriate access bit
  // (X for instruction faults, W for store faults, and R for load faults).
  //
  // Note: If a pmpcfg CSR is locked, it is unable to be written to until a full reset, so in this
  //       case we will immediately jump to the <test_done> label if the faulting address matches to
  //       this region, otherwise we'll keep looping through the remaining CSRs.
  //
  // TODO(udinator) : investigate switching branch targets to named labels instead of numbers
  //                  to better clarify where the multitude of jumps are actually going to.
  void gen_pmp_exception_routine(riscv_reg_t[] scratch_reg,
				 exception_cause_t fault_type,
				 ref string[] instr) {
    assert (scratch_reg.length == 7);
    // scratch_reg[0] : temporary storage
    // scratch_reg[1] : &pmpaddr[i]
    // scratch_reg[2] : &pmpcfg[i]
    // scratch_reg[3] : 8-bit configuration fields
    // scratch_reg[4] : 2-bit pmpcfg[i].A address matching mode
    // scratch_reg[5] : holds the previous pmpaddr[i] value (necessary for TOR matching)
    // scratch_reg[6] : loop counter
    instr ~=
      ////////////////////////////////////////////////////////
      // Initialize loop counter and save to scratch_reg[6] //
      ////////////////////////////////////////////////////////
      [format("li x%0d, 0", scratch_reg[0]),
       format("mv x%0d, x%0d", scratch_reg[6], scratch_reg[0]),
       format("li x%0d, 0", scratch_reg[5]),
      ////////////////////////////////////////////////////
      // calculate next pmpaddr and pmpcfg CSRs to read //
      ////////////////////////////////////////////////////
       format("0: mv x%0d, x%0d", scratch_reg[0], scratch_reg[6]),
       format("mv x%0d, x%0d", scratch_reg[4], scratch_reg[0])];

    // Generate a sequence of loads and branches that will compare the loop index to every
    // value within [0 : pmp_num_regions] to manually check which PMP CSRs to read from
    for (int i = 1; i < pmp_num_regions + 1; i++) {
      int pmpaddr_addr = base_pmp_addr + i;
      int pmpcfg_addr = base_pmpcfg_addr + (i / cfg_per_csr);
      instr ~= format("li x%0d, %0d", scratch_reg[4], i-1);
      instr ~= format("beq x%0d, x%0d, %0df", scratch_reg[0], scratch_reg[4], i);
    }

    // Generate the branch targets for the above sequence of loads and branches to actually
    // read from the pmpaddr and pmpcfg CSRs
    for (int i = 1; i < pmp_num_regions + 1; i++) {
      int pmpaddr_addr = base_pmp_addr + i;
      int pmpcfg_addr = base_pmpcfg_addr + (i / cfg_per_csr);
      instr ~= format("%0d: csrr x%0d, 0x%0x", i, scratch_reg[1], base_pmp_addr + i - 1);
      instr ~= format("csrr x%0d, 0x%0x", scratch_reg[2], base_pmpcfg_addr + ((i-1)/4));
      instr ~=  ("j 17f");
    }

    // Logic to store pmpaddr[i] and pmpcfg[i] and branch to a code section
    // based on pmpcfg[i].A (address matching mode)
    instr ~=
      ////////////////////////////////////////////
      // get correct 8-bit configuration fields //
      ////////////////////////////////////////////
      [format("17: li x%0d, %0d", scratch_reg[3], cfg_per_csr),
       // calculate offset to left-shift pmpcfg[i] (scratch_reg[2]),
       // use scratch_reg[4] as temporary storage
       //
       // First calculate (loop_counter % cfg_per_csr)
       format("slli x%0d, x%0d, %0d", scratch_reg[0], scratch_reg[0],
	      XLEN - clog2(cfg_per_csr)),
       format("srli x%0d, x%0d, %0d", scratch_reg[0], scratch_reg[6],
	      XLEN - clog2(cfg_per_csr)),
       // Calculate (cfg_per_csr - modded_loop_counter - 1) to determine how many 8bit slots to
       // the left this needs to be shifted
       format("sub x%0d, x%0d, x%0d", scratch_reg[4], scratch_reg[3], scratch_reg[0]),
       format("addi x%0d, x%0d, %0d", scratch_reg[4], scratch_reg[4], -1),
       // Multiply this "slot offset" by 8 to get the actual number of bits it should
       // be leftshifted.
       format("slli x%0d, x%0d, 3", scratch_reg[4], scratch_reg[4]),
       // Perform the leftshifting operation
       format("sll x%0d, x%0d, x%0d", scratch_reg[3], scratch_reg[2], scratch_reg[4]),
       // Add 8*modded_loop_counter to 8*(cfg_per_csr - modded_loop_counter - 1)
       // stored in scratch_reg[4] to get "slot offset" for the pending rightshift operation.
       format("slli x%0d, x%0d, 3", scratch_reg[0], scratch_reg[0]),
       format("add x%0d, x%0d, x%0d", scratch_reg[4], scratch_reg[4], scratch_reg[0]),
       // Perform the rightshift operation
       format("srl x%0d, x%0d, x%0d", scratch_reg[3], scratch_reg[3], scratch_reg[4]),
       ///////////////////////////
       // get pmpcfg[i].A field //
       ///////////////////////////
       // pmpcfg[i].A will be bits [4:3] of the 8-bit configuration entry
       format("slli x%0d, x%0d, %0d", scratch_reg[4], scratch_reg[3], XLEN - 5),
       format("srli x%0d, x%0d, %0d", scratch_reg[4], scratch_reg[4], XLEN - 2),
       //////////////////////////////////////////////////////////////////
       // based on address match mode, branch to appropriate "handler" //
       //////////////////////////////////////////////////////////////////
       // pmpcfg[i].A == OFF
       format("beqz x%0d, 20f", scratch_reg[4]),
       // pmpcfg[i].A == TOR
       // scratch_reg[5] will contain pmpaddr[i-1]
       format("li x%0d, 1", scratch_reg[0]),
       format("beq x%0d, x%0d, 21f", scratch_reg[4], scratch_reg[0]),
       // pmpcfg[i].A == NA4
       format("li x%0d, 2", scratch_reg[0]),
       format("beq x%0d, x%0d, 24f", scratch_reg[4], scratch_reg[0]),
       // pmpcfg[i].A == NAPOT
       format("li x%0d, 3", scratch_reg[0]),
       format("beq x%0d, x%0d, 25f", scratch_reg[4], scratch_reg[0]),
       // Error check, if no address modes match, something has gone wrong
       format("la x%0d, test_done", scratch_reg[0]),
       format("jalr x0, x%0d, 0", scratch_reg[0]),
       /////////////////////////////////////////////////////////////////
       // increment loop counter and branch back to beginning of loop //
       /////////////////////////////////////////////////////////////////
       format("18: mv x%0d, x%0d", scratch_reg[0], scratch_reg[6]),
       // load pmpaddr[i] into scratch_reg[5] to store for iteration [i+1]
       format("mv x%0d, x%0d", scratch_reg[5], scratch_reg[1]),
       // increment loop counter by 1
       format("addi x%0d, x%0d, 1", scratch_reg[0], scratch_reg[0]),
       // store loop counter to scratch_reg[6]
       format("mv x%0d, x%0d", scratch_reg[6], scratch_reg[0]),
       // load number of pmp regions - loop limit
       format("li x%0d, %0d", scratch_reg[1], pmp_num_regions),
       // if counter < pmp_num_regions => branch to beginning of loop,
       // otherwise jump to the end of the loop
       format("ble x%0d, x%0d, 19f", scratch_reg[1], scratch_reg[0]),
       format("j 0b"),
       // If we reach here, it means that no PMP entry has matched the request.
       // We must immediately jump to <test_done> since the CPU is taking a PMP exception,
       // but this routine is unable to find a matching PMP region for the faulting access -
       // there is a bug somewhere.
       // In case of MMWP mode this is expected behavior, we should try to continue.
       format("19: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MSECCFG),
       format("andi x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]),
       format("bnez x%0d, 27f", scratch_reg[0]),
       format("la x%0d, test_done", scratch_reg[0]),
       format("jalr x0, x%0d, 0", scratch_reg[0])];

    /////////////////////////////////////////////////
    // Sub-sections for all address matching modes //
    /////////////////////////////////////////////////
    // scratch_reg[0] : temporary storage
    // scratch_reg[1] : pmpaddr[i]
    // scratch_reg[2] : pmpcfg[i]
    // scratch_reg[3] : 8-bit configuration fields
    // scratch_reg[4] : temporary storage
    // scratch_reg[5] : pmpaddr[i-1]

    // Sub-section to deal with address matching mode OFF.
    // If entry is OFF, simply continue looping through other PMP CSR.
    instr ~= "20: j 18b" ;

    // Sub-section to handle address matching mode TOR.
    instr ~=
      [format("21: mv x%0d, x%0d", scratch_reg[0], scratch_reg[6]),
       format("csrr x%0d, 0x%0x", scratch_reg[4], privileged_reg_t.MTVAL),
       format("srli x%0d, x%0d, 2", scratch_reg[4], scratch_reg[4]),
       // If loop_counter==0, compare fault_addr to 0
       format("bnez x%0d, 22f", scratch_reg[0]),
       // If fault_addr < 0 : continue looping
       format("bltz x%0d, 18b", scratch_reg[4]),
       format("j 23f"),
       // If fault_addr < pmpaddr[i-1] : continue looping
       format("22: bgtu x%0d, x%0d, 18b", scratch_reg[5], scratch_reg[4]),
       // If fault_addr >= pmpaddr[i] : continue looping
       format("23: bleu x%0d, x%0d, 18b", scratch_reg[1], scratch_reg[4]),
       format("j 26f")];

    // Sub-section to handle address matching mode NA4.
    // TODO(udinator) : add rv64 support
    instr ~=
      [format("24: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MTVAL),
       format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]),
       // Zero out pmpaddr[i][31:30]
       format("slli x%0d, x%0d, 2", scratch_reg[4], scratch_reg[1]),
       format("srli x%0d, x%0d, 2", scratch_reg[4], scratch_reg[4]),
       // If fault_addr[31:2] != pmpaddr[i][29:0] => there is a mismatch,
       // so continue looping
       format("bne x%0d, x%0d, 18b", scratch_reg[0], scratch_reg[4]),
       format("j 26f")];

    // Sub-section to handle address matching mode NAPOT.
    instr ~=
      [format("25: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MTVAL),
       // get fault_addr[31:2]
       format("srli x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]),
       // mask the bottom pmp_granularity bits of fault_addr
       format("srli x%0d, x%0d, %0d", scratch_reg[0], scratch_reg[0], pmp_granularity),
       format("slli x%0d, x%0d, %0d", scratch_reg[0], scratch_reg[0], pmp_granularity),
       // get pmpaddr[i][29:0]
       format("slli x%0d, x%0d, 2", scratch_reg[4], scratch_reg[1]),
       format("srli x%0d, x%0d, 2", scratch_reg[4], scratch_reg[4]),
       // mask the bottom pmp_granularity bits of pmpaddr[i]
       format("srli x%0d, x%0d, %0d", scratch_reg[4], scratch_reg[4], pmp_granularity),
       format("slli x%0d, x%0d, %0d", scratch_reg[4], scratch_reg[4], pmp_granularity),
       // If masked_fault_addr != masked_pmpaddr[i] : mismatch, so continue looping
       format("bne x%0d, x%0d, 18b", scratch_reg[0], scratch_reg[4]),
       format("j 26f")];

    // Sub-section that is common to the address modes deciding what to do what to do when hitting
    // a locked region
    instr ~=
      [
       // If we get here there is an address match.
       // First check whether we are in MML mode.
       format("26: csrr x%0d, 0x%0x", scratch_reg[4], privileged_reg_t.MSECCFG),
       format("andi x%0d, x%0d, 1", scratch_reg[4], scratch_reg[4]),
       format("bnez x%0d, 27f", scratch_reg[4]),
       // Then check whether the lock bit is set.
       format("andi x%0d, x%0d, 128", scratch_reg[4], scratch_reg[3]),
       format("bnez x%0d, 27f", scratch_reg[4]),
       format("j 29f")];


    // This case statement creates a bitmask that enables the correct access permissions
    // and ORs it with the 8-bit configuration fields.
    switch  (fault_type) {
    case  exception_cause_t.INSTRUCTION_ACCESS_FAULT:
      instr ~= 
	[ // If MML or locked just quit the test.
	  format("27: la x%0d, test_done", scratch_reg[0]),
	  format("jalr x0, x%0d, 0", scratch_reg[0]),
	  // If neither is true then try to modify the PMP permission bits.
	  // The X bit is bit 2, and 1 << 2 = 2.
	  format("29: ori x%0d, x%0d, 4", scratch_reg[3], scratch_reg[3])
	  ];
      break;
    case  exception_cause_t.STORE_AMO_ACCESS_FAULT:
      instr ~=
	[ // If MML or locked try to load the instruction and see if it is compressed so
	  // the MEPC can be advanced appropriately.
	  format("27: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MEPC),
	  // This might cause a load access fault, which we much handle in the load trap
	  // handler.
	  format("lw x%0d, 0(x%0d)", scratch_reg[0], scratch_reg[0]),
	  // Non-compressed instructions have two least significant bits set to one.
	  format("li x%0d, 3", scratch_reg[4]),
	  format("and x%0d, x%0d, x%0d", scratch_reg[0], scratch_reg[0], scratch_reg[4]),
	  // Check whether instruction is compressed.
	  format("beq x%0d, x%0d, 28f", scratch_reg[0], scratch_reg[4]),
	  format("csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MEPC),
	  // Increase MEPC by 2 in case instruction is compressed.
	  format("addi x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]),
	  format("csrw 0x%0x, x%0d", privileged_reg_t.MEPC, scratch_reg[0]),
	  format("j 34f"),
	  format("28: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MEPC),
	  // Increase MEPC by 4 in case instruction is compressed.
	  format("addi x%0d, x%0d, 4", scratch_reg[0], scratch_reg[0]),
	  format("csrw 0x%0x, x%0d", privileged_reg_t.MEPC, scratch_reg[0]),
	  format("j 34f"),
	  // If neither is true then try to modify the PMP permission bits.
	  // The combination of W:1 and R:0 is reserved, so if we are enabling write
	  // permissions, also enable read permissions to adhere to the spec.
	  format("29: ori x%0d, x%0d, 3", scratch_reg[3], scratch_reg[3])
	  ];
      break;
    case exception_cause_t.LOAD_ACCESS_FAULT:
      instr ~=
	[ // If MML or locked try to load the instruction and see if it is compressed so
	  // the MEPC can be advanced appropriately.
	  format("27: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MEPC),
	  // We must first check whether the access fault was in the trap handler in case
	  // we previously tried to load an instruction in a PMP entry that did not have
	  // read permissions.
	  format("la x%0d, main", scratch_reg[4]),
	  format("bge x%0d, x%0d, 40f", scratch_reg[0], scratch_reg[4]),
	  // In case MEPC is before main, then the load access fault probably happened in a
	  // trap handler and we should just quit the test.
	  format("la x%0d, test_done", scratch_reg[0]),
	  format("jalr x0, x%0d, 0", scratch_reg[0]),
	  // This might cause a load access fault, which we much handle in the load trap
	  // handler.
	  format("40: lw x%0d, 0(x%0d)", scratch_reg[0], scratch_reg[0]),
	  // Non-compressed instructions have two least significant bits set to one.
	  format("li x%0d, 3", scratch_reg[4]),
	  format("and x%0d, x%0d, x%0d", scratch_reg[0], scratch_reg[0], scratch_reg[4]),
	  // Check whether instruction is compressed.
	  format("beq x%0d, x%0d, 28f", scratch_reg[0], scratch_reg[4]),
	  format("csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MEPC),
	  // Increase MEPC by 2 in case instruction is compressed.
	  format("addi x%0d, x%0d, 2", scratch_reg[0], scratch_reg[0]),
	  format("csrw 0x%0x, x%0d", privileged_reg_t.MEPC, scratch_reg[0]),
	  format("j 34f"),
	  format("28: csrr x%0d, 0x%0x", scratch_reg[0], privileged_reg_t.MEPC),
	  // Increase MEPC by 4 in case instruction is compressed.
	  format("addi x%0d, x%0d, 4", scratch_reg[0], scratch_reg[0]),
	  format("csrw 0x%0x, x%0d", privileged_reg_t.MEPC, scratch_reg[0]),
	  format("j 34f"),
	  // If neither is true then try to modify the PMP permission bits.
	  // The R bit is bit 0, and 1 << 0 = 1.
	  format("29: ori x%0d, x%0d, 1", scratch_reg[3], scratch_reg[3])
	  ];
      break;
    default:
      uvm_fatal(get_full_name(), "Invalid PMP fault type");
      break;
    }
    instr ~=
      [
       // Calculate (loop_counter % cfg_per_csr) to find the index of the correct
       // entry in pmpcfg[i].
       //
       // Calculate XLEN - $clog2(cfg_per_csr) to give how many low order bits
       // of loop_counter we need to keep around
       format("li x%0d, %0d", scratch_reg[4], XLEN - clog2(cfg_per_csr)),
       // Now leftshift and rightshift loop_counter by this amount to clear all the upper
       // bits
       format("sll x%0d, x%0d, x%0d", scratch_reg[0], scratch_reg[6], scratch_reg[4]),
       format("srl x%0d, x%0d, x%0d", scratch_reg[0], scratch_reg[0], scratch_reg[4]),
       // Multiply the index by 8 to get the shift amount.
       format("slli x%0d, x%0d, 3", scratch_reg[4], scratch_reg[0]),
       // Shift the updated configuration byte to the proper alignment
       format("sll x%0d, x%0d, x%0d", scratch_reg[3], scratch_reg[3], scratch_reg[4]),
       // OR pmpcfg[i] with the updated configuration byte
       format("or x%0d, x%0d, x%0d", scratch_reg[2], scratch_reg[2], scratch_reg[3]),
       // Divide the loop counter by cfg_per_csr to determine which pmpcfg CSR to write to.
       format("mv x%0d, x%0d", scratch_reg[0], scratch_reg[6]),
       format("srli x%0d, x%0d, %0d", scratch_reg[0], scratch_reg[0], clog2(cfg_per_csr)),
       // Write the updated pmpcfg[i] to the CSR bank and exit the handler.
       //
       // Don't touch scratch_reg[2], as it contains the updated pmpcfg[i] to be written.
       // All other scratch_reg[*] can be used.
       // scratch_reg[0] contains the index of the correct pmpcfg CSR.
       // We simply check the index and then write to the correct pmpcfg CSR based on its value.
       format("beqz x%0d, 30f", scratch_reg[0]),
       format("li x%0d, 1", scratch_reg[4]),
       format("beq x%0d, x%0d, 31f", scratch_reg[0], scratch_reg[4]),
       format("li x%0d, 2", scratch_reg[4]),
       format("beq x%0d, x%0d, 32f", scratch_reg[0], scratch_reg[4]),
       format("li x%0d, 3", scratch_reg[4]),
       format("beq x%0d, x%0d, 33f", scratch_reg[0], scratch_reg[4]),
       format("30: csrw 0x%0x, x%0d", privileged_reg_t.PMPCFG0, scratch_reg[2]),
       format("j 34f"),
       format("31: csrw 0x%0x, x%0d", privileged_reg_t.PMPCFG1, scratch_reg[2]),
       format("j 34f"),
       format("32: csrw 0x%0x, x%0d", privileged_reg_t.PMPCFG2, scratch_reg[2]),
       format("j 34f"),
       format("33: csrw 0x%0x, x%0d", privileged_reg_t.PMPCFG3, scratch_reg[2]),
       // End the pmp handler with a labeled nop instruction, this provides a branch target
       // for the internal routine after it has "fixed" the pmp configuration CSR.
       format("34: nop")];
  }

  // This function is used for a directed PMP test to test writes to all the pmpcfg and pmpaddr
  // CSRs to test that writes succeed or fail appropriately.
  void gen_pmp_write_test(riscv_reg_t[2] scratch_reg,
			  ref string[] instr) {
    import esdl.base.rand: urandom;
    ubvec!12 pmp_addr;
    ubvec!12 pmpcfg_addr;
    ubvec!XLEN pmp_val;
    for (int i = 0; i < pmp_num_regions; i++) {
      pmp_addr.assign(base_pmp_addr + i);
      pmpcfg_addr.assign(base_pmpcfg_addr + (i / cfg_per_csr));
      // We randomize the lower 31 bits of pmp_val and then add this to the
      // address of <main>, guaranteeing that the random value written to
      // pmpaddr[i] doesn't interfere with the safe region.

      // `DV_CHECK_STD_RANDOMIZE_WITH_FATAL(pmp_val, pmp_val[31] == 1'b0;)
      pmp_val = urandom!(ubvec!XLEN)();
      pmp_val[31] = false;

      instr ~= format("li x%0d, 0x%0x", scratch_reg[0], pmp_val);
      instr ~= format("la x%0d, main", scratch_reg[1]);
      instr ~= format("add x%0d, x%0d, x%0d",
		      scratch_reg[0], scratch_reg[0], scratch_reg[1]);
      // Write the randomized address to pmpaddr[i].
      // Original value of pmpaddr[i] will be written to scratch_reg[0].
      instr ~= format("csrrw x%0d, 0x%0x, x%0d",
		      scratch_reg[0], pmp_addr, scratch_reg[0]);
      // Restore the original address to pmpaddr[i].
      // New value of pmpaddr[i] will be written to scratch_reg[0].
      instr ~= format("csrrw x%0d, 0x%0x, x%0d",
		      scratch_reg[0], pmp_addr, scratch_reg[0]);
      // Randomize value to be written to pmpcfg CSR.
      //
      // TODO: support rv64.
      // `DV_CHECK_STD_RANDOMIZE_WITH_FATAL(pmp_val,
      //                                    foreach (pmp_val[i]) {
      //                                      // constrain each Lock bit to 0
      //                                      if ((i+1) % 8 == 0) {
      //                                        pmp_val[i] == 1'b0;
      //                                      }
      //                                      // prevent W=1/R=0 combination
      //                                      if (i % 8 == 0) { // this is an R bit
      //                                        !((pmp_val[i] == 0) && (pmp_val[i+1] == 1'b1));
      // 					   }
      //                                    }
      //                                   )
      pmp_val = urandom!(ubvec!XLEN)();

      for (size_t j=0; j!=XLEN/8; ++j) {
	pmp_val[j*8+7] = false;
	ubvec!XLEN mask = ~ (toubvec!XLEN(0b11));
	ubvec!XLEN bits;
	uint r;

	switch (urandom(0, 3)) {
	case 0: bits[1] = false; bits[0] = false;
	  break;
	case 1: bits[1] = false; bits[0] = true;
	  break;
	case 2: bits[1] = true; bits[0] = true;
	  break;
	default: assert (false);
	}

	mask <<= j * 8;
	bits <<= j * 8;

	pmp_val &= mask;
	pmp_val |= bits;
      }

      // If we're writing to the pmpcfg CSR that contains region0 config information,
      // ensure that the "safe" region remains fully accessible.
      if (pmpcfg_addr == base_pmpcfg_addr) {
	if (mseccfg.mml) {
          // In case of MML make this a shared code region with LXWR='b1010.
          pmp_val[0..8] = 0x8a;
	}
	else {
          pmp_val[0..8] = 0x0f;
        }
      }
      instr ~= format("li x%0d, 0x%0x", scratch_reg[0], pmp_val);
      // Write the randomized address to pmpcfg[i].
      // Original value of pmpcfg[i] will be written to scratch_reg[0].
      instr ~= format("csrrw x%0d, 0x%0x, x%0d",
		      scratch_reg[0], pmpcfg_addr, scratch_reg[0]);
      // Restore the original address to pmpcfg[i].
      // New value of pmpcfg[i] will be written to scratch_reg[0].
      instr ~= format("csrrw x%0d, 0x%0x, x%0d",
		      scratch_reg[0], pmpcfg_addr, scratch_reg[0]);
    }
  }
}
