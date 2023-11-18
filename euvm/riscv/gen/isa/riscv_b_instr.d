/*
 * Copyright 2019 Google LLC
 * Copyright 2019 Mellanox Technologies Ltd
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

module riscv.gen.isa.riscv_b_instr;

import riscv.gen.riscv_instr_pkg: riscv_reg_t, riscv_instr_name_t, b_ext_group_t,
  riscv_instr_category_t, riscv_instr_format_t, riscv_instr_group_t,
  MAX_INSTR_STR_LEN;
import riscv.gen.target: XLEN;
import riscv.gen.riscv_instr_gen_config: riscv_instr_gen_config;
import riscv.gen.isa.riscv_instr: riscv_instr;
import std.format: format;

import esdl.rand: rand;
import esdl.data.bvec: ubvec, UBVEC, clog2;
import std.algorithm: canFind;

import std.string: toLower;

import uvm;

class riscv_b_instr: riscv_instr
{
  mixin uvm_object_utils;

  @rand riscv_reg_t rs3;
  bool has_rs3 = false;


  this(string name = "") {
    super(name);
  }

  override void set_rand_mode() {
    super.set_rand_mode();
    has_rs3 = false;
    switch (instr_format) {
    case riscv_instr_format_t.R_FORMAT:
      if ([riscv_instr_name_t.BMATFLIP, riscv_instr_name_t.CRC32_B,
	   riscv_instr_name_t.CRC32_H,  riscv_instr_name_t.CRC32_W,
	   riscv_instr_name_t.CRC32C_B, riscv_instr_name_t.CRC32C_H,
	   riscv_instr_name_t.CRC32C_W, riscv_instr_name_t.CRC32_D,
	   riscv_instr_name_t.CRC32C_D].canFind(instr_name)) {
	has_rs2 = false;
      }
      break;
    case riscv_instr_format_t.R4_FORMAT:
        has_imm = false;
        has_rs3 = true;
	break;
    case riscv_instr_format_t.I_FORMAT:
      has_rs2 = false;
      if ([riscv_instr_name_t.FSRI,
	   riscv_instr_name_t.FSRIW].canFind(instr_name)) {
	has_rs3 = true;
      }
      break;
    default: break;
    }
  }

  override void pre_randomize() {
    super.pre_randomize();
    rand_mode!q{rs3}(has_rs3);
  }

  override void set_imm_len() {

    if ([riscv_instr_format_t.I_FORMAT].canFind(instr_format)) {
      if ([riscv_instr_category_t.SHIFT,
	   riscv_instr_category_t.LOGICAL].canFind(category)) {
	imm_len = UBVEC!(5, clog2(XLEN));
      }
      // ARITHMETIC RV32B
      if ([riscv_instr_name_t.SHFLI,
	   riscv_instr_name_t.UNSHFLI].canFind(instr_name)) {
        imm_len = UBVEC!(5, clog2(XLEN) - 1);
      }
    }

    imm_mask <<= imm_len;
  }

  // Convert the instruction to assembly code
  override string convert2asm(string prefix = "") {
    string asm_str_final, asm_str;
    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
    asm_str = format!FMT(get_instr_name());

    switch (instr_format) {
    case riscv_instr_format_t.I_FORMAT:
      if ([riscv_instr_name_t.FSRI,
	   riscv_instr_name_t.FSRIW].canFind(instr_name)) {  // instr rd,rs1,rs3,imm
	asm_str_final = format("%0s%0s, %0s, %0s, %0s", asm_str, rd, rs1,
			       rs3, get_imm());
      }
      break;
    case riscv_instr_format_t.R_FORMAT:  //instr rd rs1
      if (! has_rs2) {
	asm_str_final = format("%0s%0s, %0s", asm_str, rd, rs1);
      }
      break;
    case riscv_instr_format_t.R4_FORMAT: // instr rd,rs1,rs2,rs3
      asm_str_final = format("%0s%0s, %0s, %0s, %0s", asm_str, rd, rs1,
			     rs2, rs3);
      break;
    default: uvm_info(get_full_name(), format("Unsupported format %0s", instr_format), UVM_LOW);
    }

    if (asm_str_final == "") {
      return super.convert2asm(prefix);
    }

    if (comment != "") asm_str_final ~= " #" ~ comment;
    return asm_str_final.toLower();
  }

  override char[] convert2asm(char[] buf, string prefix = "") {
    import std.string: toLower, toLowerInPlace;
    import std.format: sformat;

    char[32] instr_buf;
    char[MAX_INSTR_STR_LEN+8] instr_name_buf;

    char[] asm_buf;


    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
    char[] instr_name_str = sformat!FMT(instr_name_buf, get_instr_name(instr_buf));

    switch (instr_format) {
    case riscv_instr_format_t.I_FORMAT: 
      if ([riscv_instr_name_t.FSRI,
	   riscv_instr_name_t.FSRIW].canFind(instr_name)) {  // instr rd,rs1,rs3,imm
	asm_buf = sformat!("%0s%0s, %0s, %0s, %0s")(buf, instr_name_str, rd, rs1,
						    rs3, get_imm());
      }
      break;
    case riscv_instr_format_t.R_FORMAT:  //instr rd rs1
      if (! has_rs2) {
	asm_buf = sformat!("%0s%0s, %0s")(buf, instr_name_str, rd, rs1);
      }
      break;
    case riscv_instr_format_t.R4_FORMAT: // instr rd,rs1,rs2,rs3
      asm_buf = sformat!("%0s%0s, %0s, %0s, %0s")(buf, instr_name_str, rd, rs1,
						  rs2, rs3);
      break;
    default: uvm_info(get_full_name(), format("Unsupported format %0s", instr_format), UVM_LOW);
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
    case riscv_instr_name_t.GORC,
      riscv_instr_name_t.SLO,
      riscv_instr_name_t.SRO,
      riscv_instr_name_t.GREV,
      riscv_instr_name_t.XPERM4,
      riscv_instr_name_t.XPERM8,
      riscv_instr_name_t.XPERM16,
      riscv_instr_name_t.XPERM32: return UBVEC!(7, 0b0110011);
    case riscv_instr_name_t.GORCI,
      riscv_instr_name_t.SLOI,
      riscv_instr_name_t.SROI,
      riscv_instr_name_t.GREVI,
      riscv_instr_name_t.CMIX,
      riscv_instr_name_t.CMOV,
      riscv_instr_name_t.FSL: return UBVEC!(7, 0b0010011);
    case riscv_instr_name_t.FSR,
      riscv_instr_name_t.FSRI,
      riscv_instr_name_t.BMATFLIP,
      riscv_instr_name_t.CRC32_B,
      riscv_instr_name_t.CRC32_H,
      riscv_instr_name_t.CRC32_W,
      riscv_instr_name_t.CRC32C_B,
      riscv_instr_name_t.CRC32C_H: return UBVEC!(7, 0b0010011);
    case riscv_instr_name_t.CRC32C_W,
      riscv_instr_name_t.CRC32_D,
      riscv_instr_name_t.CRC32C_D: return UBVEC!(7, 0b0010011);
    case riscv_instr_name_t.SHFL,
      riscv_instr_name_t.UNSHFL,
      riscv_instr_name_t.BCOMPRESS,
      riscv_instr_name_t.BDECOMPRESS,
      riscv_instr_name_t.PACK,
      riscv_instr_name_t.PACKU,
      riscv_instr_name_t.BMATOR,
      riscv_instr_name_t.BMATXOR,
      riscv_instr_name_t.PACKH,
      riscv_instr_name_t.BFP: return UBVEC!(7, 0b0110011);
    case riscv_instr_name_t.SHFLI,
      riscv_instr_name_t.UNSHFLI: return UBVEC!(7, 0b0010011);
    case riscv_instr_name_t.SLOW,
      riscv_instr_name_t.SROW,
      riscv_instr_name_t.GORCW,
      riscv_instr_name_t.GREVW: return UBVEC!(7, 0b0111011);
    case riscv_instr_name_t.SLOIW,
      riscv_instr_name_t.SROIW,
      riscv_instr_name_t.GORCIW,
      riscv_instr_name_t.GREVIW: return UBVEC!(7, 0b0011011);
    case riscv_instr_name_t.FSLW,
      riscv_instr_name_t.FSRW: return UBVEC!(7, 0b0111011);
    case riscv_instr_name_t.FSRIW: return UBVEC!(7, 0b0011011);
    case riscv_instr_name_t.SHFLW,
      riscv_instr_name_t.UNSHFLW,
      riscv_instr_name_t.BCOMPRESSW,
      riscv_instr_name_t.BDECOMPRESSW,
      riscv_instr_name_t.PACKW,
      riscv_instr_name_t.PACKUW,
      riscv_instr_name_t.BFPW: return UBVEC!(7, 0b0111011);
    default:                   return super.get_opcode();
    }
  }

  override ubvec!3 get_func3() {
    switch (instr_name) {
    case riscv_instr_name_t.GORC: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.GORCI: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.SLO: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.SRO: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.SLOI: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.SROI: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.GREV: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.GREVI: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.CMIX: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CMOV: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.FSL: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.FSR: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.FSRI: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.BMATFLIP: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32_B: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32_H: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32_W: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32C_B: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32C_H: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32C_W: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32_D: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.CRC32C_D: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.SHFL: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.UNSHFL: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.BCOMPRESS: return UBVEC!(3, 0b110);
    case riscv_instr_name_t.BDECOMPRESS: return UBVEC!(3, 0b110);
    case riscv_instr_name_t.PACK: return UBVEC!(3, 0b100);
    case riscv_instr_name_t.PACKU: return UBVEC!(3, 0b100);
    case riscv_instr_name_t.BMATOR: return UBVEC!(3, 0b011);
    case riscv_instr_name_t.BMATXOR: return UBVEC!(3, 0b011);
    case riscv_instr_name_t.PACKH: return UBVEC!(3, 0b111);
    case riscv_instr_name_t.BFP: return UBVEC!(3, 0b111);
    case riscv_instr_name_t.SHFLI: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.UNSHFLI: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.SLOW: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.SROW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.ROLW: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.GORCW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.GREVW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.SLOIW: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.SROIW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.RORIW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.GORCIW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.GREVIW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.FSLW: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.FSRW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.FSRIW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.SHFLW: return UBVEC!(3, 0b001);
    case riscv_instr_name_t.UNSHFLW: return UBVEC!(3, 0b101);
    case riscv_instr_name_t.BCOMPRESSW: return UBVEC!(3, 0b110);
    case riscv_instr_name_t.BDECOMPRESSW: return UBVEC!(3, 0b110);
    case riscv_instr_name_t.PACKW: return UBVEC!(3, 0b100);
    case riscv_instr_name_t.PACKUW: return UBVEC!(3, 0b100);
    case riscv_instr_name_t.BFPW: return UBVEC!(3, 0b111);
    case riscv_instr_name_t.XPERM4: return UBVEC!(3, 0b010);
    case riscv_instr_name_t.XPERM8: return UBVEC!(3, 0b100);
    case riscv_instr_name_t.XPERM16: return UBVEC!(3, 0b110);
    case riscv_instr_name_t.XPERM32: return UBVEC!(3, 0b000);
    default:                         return super.get_func3();
    }
  }

  override ubvec!7 get_func7() {
    switch (instr_name) {
    case riscv_instr_name_t.ANDN: return UBVEC!(7, 0b0100000);
    case riscv_instr_name_t.ORN: return UBVEC!(7, 0b0100000);
    case riscv_instr_name_t.XNOR: return UBVEC!(7, 0b0100000);
    case riscv_instr_name_t.GORC: return UBVEC!(7, 0b0010100);
    case riscv_instr_name_t.SLO: return UBVEC!(7, 0b0010000);
    case riscv_instr_name_t.SRO: return UBVEC!(7, 0b0010000);
    case riscv_instr_name_t.ROL: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.ROR: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.GREV: return UBVEC!(7, 0b0110100);
    case riscv_instr_name_t.BMATFLIP: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32_B: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32_H: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32_W: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32C_B: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32C_H: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32C_W: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32_D: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.CRC32C_D: return UBVEC!(7, 0b0110000);
    case riscv_instr_name_t.SHFL: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.UNSHFL: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.BCOMPRESS: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.BDECOMPRESS: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.PACK: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.PACKU: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.BMATOR: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.BMATXOR: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.PACKH: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.BFP: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.SLOW: return UBVEC!(7, 0b0010000);
    case riscv_instr_name_t.SROW: return UBVEC!(7, 0b0010000);
    case riscv_instr_name_t.GORCW: return UBVEC!(7, 0b0010100);
    case riscv_instr_name_t.GORCIW: return UBVEC!(7, 0b0010100);
    case riscv_instr_name_t.GREVW: return UBVEC!(7, 0b0110100);
    case riscv_instr_name_t.GREVIW: return UBVEC!(7, 0b0110100);
    case riscv_instr_name_t.SLOIW: return UBVEC!(7, 0b0010000);
    case riscv_instr_name_t.SROIW: return UBVEC!(7, 0b0010000);
    case riscv_instr_name_t.SHFLW: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.UNSHFLW: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.BCOMPRESSW: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.BDECOMPRESSW: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.PACKW: return UBVEC!(7, 0b0000100);
    case riscv_instr_name_t.PACKUW: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.BFPW: return UBVEC!(7, 0b0100100);
    case riscv_instr_name_t.XPERM4: return UBVEC!(7, 0b0010100);
    case riscv_instr_name_t.XPERM8: return UBVEC!(7, 0b0010100);
    case riscv_instr_name_t.XPERM16: return UBVEC!(7, 0b0010100);
    case riscv_instr_name_t.XPERM32: return UBVEC!(7, 0b0010100);
    default:                         return super.get_func7();
    }
  }

  ubvec!5 get_func5() {
    switch (instr_name) {
    case riscv_instr_name_t.SLOI: return UBVEC!(5, 0b00100);
    case riscv_instr_name_t.SROI: return UBVEC!(5, 0b00100);
    case riscv_instr_name_t.RORI: return UBVEC!(5, 0b01100);
    case riscv_instr_name_t.GORCI: return UBVEC!(5, 0b00101);
    case riscv_instr_name_t.GREVI: return UBVEC!(5, 0b01101);

    case riscv_instr_name_t.CRC32_B: return UBVEC!(5, 0b10000);
    case riscv_instr_name_t.CRC32_H: return UBVEC!(5, 0b10001);
    case riscv_instr_name_t.CRC32_W: return UBVEC!(5, 0b10010);
    case riscv_instr_name_t.CRC32C_B: return UBVEC!(5, 0b11000);
    case riscv_instr_name_t.CRC32C_H: return UBVEC!(5, 0b11001);
    case riscv_instr_name_t.CRC32C_W: return UBVEC!(5, 0b11010);
    case riscv_instr_name_t.CRC32_D: return UBVEC!(5, 0b10011);
    case riscv_instr_name_t.CRC32C_D: return UBVEC!(5, 0b11011);

    case riscv_instr_name_t.BMATFLIP: return UBVEC!(5, 0b00011);
    default: uvm_fatal(get_full_name(), format("Unsupported instruction %0s", instr_name));
      assert (false);
    }
  }

  ubvec!2 get_func2() {
    switch (instr_name) {
    case riscv_instr_name_t.CMIX: return UBVEC!(2, 0b11);
    case riscv_instr_name_t.CMOV: return UBVEC!(2, 0b11);
    case riscv_instr_name_t.FSL: return UBVEC!(2, 0b10);
    case riscv_instr_name_t.FSR: return UBVEC!(2, 0b10);
    case riscv_instr_name_t.FSLW: return UBVEC!(2, 0b10);
    case riscv_instr_name_t.FSRW: return UBVEC!(2, 0b10);
    case riscv_instr_name_t.FSRIW: return UBVEC!(2, 0b10);
    default: uvm_fatal(get_full_name(), format("Unsupported instruction %0s", instr_name));
      assert (false);
    }
  }

  // Convert the instruction to assembly code
  override string convert2bin(string prefix = "") {
    string binary = "";
    switch (instr_format) {
    case riscv_instr_format_t.R_FORMAT:
      if ((category == riscv_instr_category_t.ARITHMETIC) &&
	  (group == riscv_instr_group_t.RV32B)) {
	if ([riscv_instr_name_t.CRC32_B,
	     riscv_instr_name_t.CRC32_H,
	     riscv_instr_name_t.CRC32_W,
	     riscv_instr_name_t.CRC32C_B,
	     riscv_instr_name_t.CRC32C_H,
	     riscv_instr_name_t.CRC32C_W].canFind(instr_name)) {
	  binary =
	    format("%8h", get_func7() ~ get_func5() ~ rs1 ~ get_func3() ~
		   rd ~ get_opcode());
	}
      }

      if ((category == riscv_instr_category_t.ARITHMETIC) &&
	  (group == riscv_instr_group_t.RV64B)) {
	if ([riscv_instr_name_t.CRC32_D,
	     riscv_instr_name_t.CRC32C_D,
	     riscv_instr_name_t.BMATFLIP].canFind(instr_name)) {
	  binary =
	    format("%8h", get_func7() ~ get_func5() ~ rs1 ~ get_func3() ~
		   rd ~ get_opcode());
	}
      }
      break;
    case riscv_instr_format_t.I_FORMAT:
      if (([riscv_instr_category_t.SHIFT,
	    riscv_instr_category_t.LOGICAL].canFind(category)) &&
	  (group == riscv_instr_group_t.RV32B)) {
	binary = format("%8h", get_func5() ~ cast(ubvec!7) imm[0..7] ~ rs1 ~
			get_func3() ~ rd ~ get_opcode());
      }
      else if (([riscv_instr_category_t.SHIFT,
		 riscv_instr_category_t.LOGICAL].canFind(category)) &&
	       (group == riscv_instr_group_t.RV64B)) {
	binary = format("%8h", get_func7() ~ cast(ubvec!5) imm[0..5] ~ rs1 ~
			get_func3() ~ rd ~ get_opcode());
      }

      if ([riscv_instr_name_t.FSRI].canFind(instr_name)) {
	binary = format("%8h", rs3 ~ UBVEC!(1, 0b1) ~ cast(ubvec!6) imm[0..6] ~
			rs1 ~ get_func3() ~ rd ~ get_opcode());
      }

      if (([riscv_instr_category_t.ARITHMETIC].canFind(category)) &&
	  (group == riscv_instr_group_t.RV32B)) {
	binary = format("%8h", UBVEC!(6, 0b00_0010) ~ cast(ubvec!6) (imm[0..6]) ~
			rs1 ~ get_func3() ~ rd ~ get_opcode());
      }

      if (([riscv_instr_category_t.ARITHMETIC].canFind(category)) &&
	  (group == riscv_instr_group_t.RV64B)) {
	binary = format("%8h", cast(ubvec!12) imm[0..12] ~ rs1 ~ get_func3() ~
			rd ~ get_opcode());
      }
      break;

    case riscv_instr_format_t.R4_FORMAT:
      binary = format("%8h", rs3 ~ get_func2() ~ rs2 ~ rs1 ~
		      get_func3() ~ rd ~ get_opcode());
      break;
    default:
      if (binary == "") binary = super.convert2bin(prefix);
    }

    return prefix ~ binary;
  }

  override void do_copy(uvm_object rhs) {
    super.copy(rhs);
    riscv_b_instr rhs_ = cast(riscv_b_instr) rhs;
    assert (rhs_ !is null);
    this.rs3 = rhs_.rs3;
    this.has_rs3 = rhs_.has_rs3;
  }

  override bool is_supported(riscv_instr_gen_config cfg) {
    return cfg.enable_b_extension &&
      (((canFind(cfg.enable_bitmanip_groups, b_ext_group_t.ZBP)) &&
	[riscv_instr_name_t.GREV, riscv_instr_name_t.GREVW,
	 riscv_instr_name_t.GREVI, riscv_instr_name_t.GREVIW,
	 riscv_instr_name_t.GORC, riscv_instr_name_t.GORCW,
	 riscv_instr_name_t.GORCI, riscv_instr_name_t.GORCIW,
	 riscv_instr_name_t.SHFL, riscv_instr_name_t.SHFLW,
	 riscv_instr_name_t.UNSHFL, riscv_instr_name_t.UNSHFLW,
	 riscv_instr_name_t.SHFLI, riscv_instr_name_t.UNSHFLI,
	 riscv_instr_name_t.XPERM4, riscv_instr_name_t.XPERM8,
	 riscv_instr_name_t.XPERM16, riscv_instr_name_t.XPERM32,
	 riscv_instr_name_t.SLO, riscv_instr_name_t.SLOW,
	 riscv_instr_name_t.SLOI, riscv_instr_name_t.SLOIW,
	 riscv_instr_name_t.SRO, riscv_instr_name_t.SROW,
	 riscv_instr_name_t.SROI, riscv_instr_name_t.SROIW].canFind(instr_name)) ||
       ((canFind(cfg.enable_bitmanip_groups, b_ext_group_t.ZBE)) &&
	[riscv_instr_name_t.BCOMPRESS, riscv_instr_name_t.BDECOMPRESS,
	 riscv_instr_name_t.BCOMPRESSW, riscv_instr_name_t.BDECOMPRESSW].canFind(instr_name)) ||
       ((canFind(cfg.enable_bitmanip_groups, b_ext_group_t.ZBF)) &&
	[riscv_instr_name_t.BFP, riscv_instr_name_t.BFPW].canFind(instr_name)) ||
       ((canFind(cfg.enable_bitmanip_groups, b_ext_group_t.ZBR)) &&
	[riscv_instr_name_t.CRC32_B, riscv_instr_name_t.CRC32_H,
	 riscv_instr_name_t.CRC32_W, riscv_instr_name_t.CRC32_D,
	 riscv_instr_name_t.CRC32C_B, riscv_instr_name_t.CRC32C_H,
	 riscv_instr_name_t.CRC32C_W, riscv_instr_name_t.CRC32C_D].canFind(instr_name)) ||
       ((canFind(cfg.enable_bitmanip_groups, b_ext_group_t.ZBM)) &&
	[riscv_instr_name_t.BMATOR, riscv_instr_name_t.BMATXOR,
	 riscv_instr_name_t.BMATFLIP].canFind(instr_name)) ||
       ((canFind(cfg.enable_bitmanip_groups, b_ext_group_t.ZBT)) &&
	[riscv_instr_name_t.CMOV, riscv_instr_name_t.CMIX,
	 riscv_instr_name_t.FSL, riscv_instr_name_t.FSLW,
	 riscv_instr_name_t.FSR, riscv_instr_name_t.FSRW,
	 riscv_instr_name_t.FSRI, riscv_instr_name_t.FSRIW].canFind(instr_name)));
  }

  // // coverage related functons
  // void update_src_regs(string[] operands) {
  //   // handle special I_FORMAT (FSRI, FSRIW) and R4_FORMAT
  //   switch(instr_format) {
  //   case riscv_instr_format_t.I_FORMAT:
  //     if ([riscv_instr_name_t.FSRI, riscv_instr_name_t.FSRIW].canFind(instr_name)) {
  // 	assert (operands.length == 4);
  // 	// fsri rd, rs1, rs3, imm
  // 	rs1 = get_gpr(operands[1]);
  // 	rs1_value = get_gpr_state(operands[1]);
  // 	rs3 = get_gpr(operands[2]);
  // 	rs3_value = get_gpr_state(operands[2]);
  // 	get_val(operands[3], imm);
  // 	return;
  //     }
  //     break;
  //   case riscv_instr_format_t.R4_FORMAT:
  //     assert (operands.length == 4);
  //     rs1 = get_gpr(operands[1]);
  //     rs1_value = get_gpr_state(operands[1]);
  //     rs2 = get_gpr(operands[2]);
  //     rs2_value = get_gpr_state(operands[2]);
  //     rs3 = get_gpr(operands[3]);
  //     rs3_value = get_gpr_state(operands[3]);
  //     return;
  //   default: break;
  //   }
  //   // reuse base function to handle the other instructions
  //   super.update_src_regs(operands);
  // }
}
