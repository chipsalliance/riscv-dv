/*
 * Copyright 2018 Google LLC
 * Copyright 2021 Silicon Labs, Inc.
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
module riscv.gen.isa.riscv_zbb_instr;

import riscv.gen.riscv_instr_pkg: riscv_instr_group_t, riscv_instr_name_t,
  riscv_instr_format_t, MAX_INSTR_STR_LEN;
import riscv.gen.target: XLEN;
import riscv.gen.isa.riscv_instr: riscv_instr;
import riscv.gen.riscv_instr_gen_config: riscv_instr_gen_config;
import riscv.gen.target: supported_isa;

import std.format: format;
import std.string: toLower;

import esdl.data.bvec: ubvec, toubvec, clog2, UBVEC;
import uvm;

import std.algorithm: canFind;

class riscv_zbb_instr: riscv_instr
{
  mixin uvm_object_utils;

  this(string name = "") {
    super(name);
  }

  override void set_rand_mode() {
    super.set_rand_mode();
    switch (instr_format) {
    case riscv_instr_format_t.R_FORMAT:
      if (instr_name == riscv_instr_name_t.ZEXT_H) {
	has_rs2 = true;
      }
      break;
    case riscv_instr_format_t.I_FORMAT:
      if ([riscv_instr_name_t.CLZ, riscv_instr_name_t.CLZW,
	   riscv_instr_name_t.CTZ, riscv_instr_name_t.CTZW,
	   riscv_instr_name_t.CPOP, riscv_instr_name_t.CPOPW,
	   riscv_instr_name_t.ORC_B, riscv_instr_name_t.SEXT_B,
	   riscv_instr_name_t.SEXT_H, riscv_instr_name_t.REV8].canFind(instr_name)) {
	has_imm = false;
      }
      break;
    default: uvm_fatal(get_full_name(), format("Unsupported instruction %0s", instr_name));
      assert (false);
    }
  }

  override void pre_randomize() {
    super.pre_randomize();
  }

  final bool is_rv64() {
    return group == riscv_instr_group_t.RV64B;
  }

  override void set_imm_len() {
    if (instr_format == riscv_instr_format_t.I_FORMAT) {
      if (instr_name == riscv_instr_name_t.RORI) {
        imm_len = UBVEC!(5, clog2(XLEN));
      }
      else {
        imm_len = UBVEC!(5, 5);
      }
    }
    imm_mask = imm_mask << imm_len;
  }

  override string convert2asm(string prefix = "") {
    string asm_str_final;
    string asm_str;

    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
    asm_str = format!FMT(get_instr_name());

    switch (instr_format) {
    case riscv_instr_format_t.I_FORMAT: // instr rd rs1
      if (! has_imm) {
	asm_str_final = format("%0s%0s, %0s", asm_str, rd, rs1);
      }
      break;
    case riscv_instr_format_t.R_FORMAT: // instr rd rs1
      if (! has_rs2) {
	asm_str_final = format("%0s%0s, %0s", asm_str, rd, rs1);
      }
      break;
    default: uvm_info(get_full_name(),
		      format("Unsupported format %0s", instr_format),
		      UVM_LOW);
      break;
    }

    if (asm_str_final == "") {
      return super.convert2asm(prefix);
    }

    if (comment != "") {
      asm_str_final = asm_str_final ~ " #" ~ comment;
    }

    return asm_str_final.toLower();
  }

  override char[] convert2asm(char[] buf, string prefix = "") {
    import std.string: toLower, toLowerInPlace;
    import std.format: sformat;

    char[32] instr_buf;
    char[MAX_INSTR_STR_LEN+8] instr_name_buf;

    string asm_str;
    char[] asm_buf;

    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
    char[] instr_name_str = sformat!FMT(instr_name_buf, get_instr_name(instr_buf));

    switch (instr_format) {
    case riscv_instr_format_t.I_FORMAT: // instr rd rs1
      if (! has_imm) {
	asm_buf = sformat!("%0s%0s, %0s")(buf, instr_name_str, rd, rs1);
      }
      break;
    case riscv_instr_format_t.R_FORMAT: // instr rd rs1
      if (! has_rs2) {
	asm_buf = sformat!("%0s%0s, %0s")(buf, instr_name_str, rd, rs1);
      }
      break;
    default: uvm_info(get_full_name(),
		      format("Unsupported format %0s", instr_format),
		      UVM_LOW);
      break;
    }

    if (asm_buf == "") {
      return super.convert2asm(buf, prefix);
    }

    if (comment != "") {
      buf[asm_buf.length..asm_buf.length+2] = " #";
      buf[asm_buf.length+2..asm_buf.length+2+comment.length] = comment;
      asm_buf = buf[0..asm_buf.length+2+comment.length];
    }

    toLowerInPlace(asm_buf);

    assert(asm_buf.ptr is buf.ptr);
    return asm_buf;
  }

  override ubvec!7 get_opcode() {
    switch (instr_name) {
    case riscv_instr_name_t.ANDN,
      riscv_instr_name_t.MAX,
      riscv_instr_name_t.MAXU,
      riscv_instr_name_t.MIN,
      riscv_instr_name_t.MINU,
      riscv_instr_name_t.ORN,
      riscv_instr_name_t.ROL,
      riscv_instr_name_t.ROR,
      riscv_instr_name_t.XNOR:      return UBVEC!(7, 0b011_0011);
    case riscv_instr_name_t.ZEXT_H:
      return (UBVEC!(7, 0b011_0011) | (toubvec!7(is_rv64()) << 3));
    case riscv_instr_name_t.ROLW,
      riscv_instr_name_t.RORW:      return UBVEC!(7, 0b011_1011);
    case riscv_instr_name_t.CLZ,
      riscv_instr_name_t.CPOP,
      riscv_instr_name_t.CTZ,
      riscv_instr_name_t.ORC_B,
      riscv_instr_name_t.CLZW,
      riscv_instr_name_t.CPOPW,
      riscv_instr_name_t.CTZW,
      riscv_instr_name_t.RORIW:     return UBVEC!(7, 0b001_1011);
    case riscv_instr_name_t.REV8,
      riscv_instr_name_t.RORI,
      riscv_instr_name_t.SEXT_B,
      riscv_instr_name_t.SEXT_H:    return UBVEC!(7, 0b001_0011);
    default:                        return super.get_opcode();
    }
  }

  override ubvec!3 get_func3() {
    switch (instr_name) {
    case riscv_instr_name_t.ANDN:   return UBVEC!(3, 0b111);
    case riscv_instr_name_t.CLZ:    return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CLZW:   return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CPOP:   return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CPOPW:  return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CTZ:    return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CTZW:   return UBVEC!(3, 0b001);
    case riscv_instr_name_t.MAX:    return UBVEC!(3, 0b110);
    case riscv_instr_name_t.MAXU:   return UBVEC!(3, 0b111);
    case riscv_instr_name_t.MIN:    return UBVEC!(3, 0b100);
    case riscv_instr_name_t.MINU:   return UBVEC!(3, 0b101);
    case riscv_instr_name_t.ORC_B:  return UBVEC!(3, 0b101);
    case riscv_instr_name_t.ORN:    return UBVEC!(3, 0b110);
    case riscv_instr_name_t.REV8:   return UBVEC!(3, 0b101);
    case riscv_instr_name_t.ROL:    return UBVEC!(3, 0b001);
    case riscv_instr_name_t.ROLW:   return UBVEC!(3, 0b001);
    case riscv_instr_name_t.ROR:    return UBVEC!(3, 0b101);
    case riscv_instr_name_t.RORW:   return UBVEC!(3, 0b101);
    case riscv_instr_name_t.RORI:   return UBVEC!(3, 0b101);
    case riscv_instr_name_t.RORIW:  return UBVEC!(3, 0b101);
    case riscv_instr_name_t.SEXT_B: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.SEXT_H: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.XNOR:   return UBVEC!(3, 0b100);
    case riscv_instr_name_t.ZEXT_H: return UBVEC!(3, 0b100);
    default:                        return super.get_func3();
    }
  }

  ubvec!5 get_func5() {
    switch (instr_name) {
    case riscv_instr_name_t.CLZ:    return UBVEC!(5, 0b0_0000);
    case riscv_instr_name_t.CLZW:   return UBVEC!(5, 0b0_0000);
    case riscv_instr_name_t.CPOP:   return UBVEC!(5, 0b0_0010);
    case riscv_instr_name_t.CPOPW:  return UBVEC!(5, 0b0_0010);
    case riscv_instr_name_t.CTZ:    return UBVEC!(5, 0b0_0001);
    case riscv_instr_name_t.CTZW:   return UBVEC!(5, 0b0_0001);
    case riscv_instr_name_t.ORC_B:  return UBVEC!(5, 0b0_0111);
    case riscv_instr_name_t.REV8:   return UBVEC!(5, 0b1_1000);
    case riscv_instr_name_t.SEXT_B: return UBVEC!(5, 0b0_0100);
    case riscv_instr_name_t.SEXT_H: return UBVEC!(5, 0b0_0101);
    default: uvm_fatal(get_full_name(), format("Unsupported instruction %0s", instr_name));
      assert (false);
    }
  }

  override ubvec!7 get_func7() {
    switch (instr_name) {
    case riscv_instr_name_t.ANDN:   return UBVEC!(7, 0b010_0000);
    case riscv_instr_name_t.CLZ:    return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.CLZW:   return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.CPOP:   return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.CPOPW:  return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.CTZ:    return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.CTZW:   return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.MAX:    return UBVEC!(7, 0b000_0101);
    case riscv_instr_name_t.MAXU:   return UBVEC!(7, 0b000_0101);
    case riscv_instr_name_t.MIN:    return UBVEC!(7, 0b000_0101);
    case riscv_instr_name_t.MINU:   return UBVEC!(7, 0b000_0101);
    case riscv_instr_name_t.ORC_B:  return UBVEC!(7, 0b001_0100);
    case riscv_instr_name_t.ORN:    return UBVEC!(7, 0b010_0000);
    case riscv_instr_name_t.REV8:
      return (UBVEC!(7, 0b011_0100) | toubvec!7(is_rv64())); // 0110101 64 bit
    case riscv_instr_name_t.ROL:    return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.ROLW:   return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.ROR:    return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.RORW:   return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.RORI:   return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.RORIW:  return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.SEXT_B: return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.SEXT_H: return UBVEC!(7, 0b011_0000);
    case riscv_instr_name_t.XNOR:   return UBVEC!(7, 0b010_0000);
    case riscv_instr_name_t.ZEXT_H: return UBVEC!(7, 0b000_0100);
    default:                        return super.get_func7();
    }
  }

  override string convert2bin(string prefix = "") {
    string binary = "";

    switch (instr_format) {
    case riscv_instr_format_t.R_FORMAT:
      if (instr_name == riscv_instr_name_t.ZEXT_H) {
	binary = format("%8h", get_func7() ~ get_func5() ~ rs1 ~ get_func3() ~ rd ~ get_opcode());
      }
      break;
    case riscv_instr_format_t.I_FORMAT:
      switch (instr_name) {
      case riscv_instr_name_t.CLZ,
	riscv_instr_name_t.CLZW,
	riscv_instr_name_t.CPOP,
	riscv_instr_name_t.CPOPW,
	riscv_instr_name_t.CTZ,
	riscv_instr_name_t.CTZW,
	riscv_instr_name_t.ORC_B,
	riscv_instr_name_t.REV8,
	riscv_instr_name_t.SEXT_B,
	riscv_instr_name_t.SEXT_H:
	binary = format("%8h", get_func7() ~ get_func5() ~ rs1 ~ get_func3() ~ rd ~
			get_opcode());
	break;
      case riscv_instr_name_t.RORIW:
	binary = format("%8h", get_func7() ~ cast (ubvec!6) imm[0..6] ~
			rs1 ~ get_func3() ~ rd ~ get_opcode());
	break;
      case riscv_instr_name_t.RORI:
	// set bit 0 of funct7 only if rv64 and shamt[MSB] is set
	binary = format("%8h", (get_func7() | cast (ubvec!7) (is_rv64() && imm[5])) ~
			cast (ubvec!5) imm[0..5] ~ rs1 ~ get_func3() ~ rd ~ get_opcode());
	break;
      default: uvm_fatal(get_full_name(), format("Unsupported instruction %0s", instr_name));
	assert (false);
      }
      break;
    default:
      assert (binary == "");
      binary = super.convert2bin(prefix);
      break;
    }
    return binary;
  }

  override bool is_supported(riscv_instr_gen_config cfg) {
    return (cfg.enable_zbb_extension &&
	    (supported_isa.canFind(riscv_instr_group_t.RV32ZBB) ||
	     supported_isa.canFind(riscv_instr_group_t.RV64ZBB)) &&
	    [riscv_instr_name_t.ANDN, riscv_instr_name_t.CLZ,
	     riscv_instr_name_t.CLZW, riscv_instr_name_t.CPOP,
	     riscv_instr_name_t.CPOPW, riscv_instr_name_t.CTZ,
	     riscv_instr_name_t.CTZW,  riscv_instr_name_t.MAX,
	     riscv_instr_name_t.MAXU, riscv_instr_name_t.MIN,
	     riscv_instr_name_t.MINU, riscv_instr_name_t.ORC_B,
	     riscv_instr_name_t.ORN, riscv_instr_name_t.REV8,
             riscv_instr_name_t.ROL, riscv_instr_name_t.ROLW,
             riscv_instr_name_t.ROR, riscv_instr_name_t.RORW,
             riscv_instr_name_t.RORI, riscv_instr_name_t.RORIW,
             riscv_instr_name_t.SEXT_B, riscv_instr_name_t.SEXT_H,
             riscv_instr_name_t.XNOR, riscv_instr_name_t.ZEXT_H].canFind(instr_name));
  }
}
