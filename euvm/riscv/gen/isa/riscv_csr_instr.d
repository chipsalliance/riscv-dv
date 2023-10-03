/*
 * Copyright 2019 Google LLC
 * Copyright 2023 Coverify Systems Technology
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

module riscv.gen.isa.riscv_csr_instr;

import riscv.gen.riscv_instr_pkg: riscv_instr_group_t, riscv_instr_name_t,
  riscv_instr_format_t, riscv_instr_category_t, MAX_INSTR_STR_LEN, format_string;
import riscv.gen.isa.riscv_instr: riscv_instr;
import riscv.gen.target: XLEN;
import riscv.gen.riscv_instr_gen_config: riscv_instr_gen_config;
import riscv.gen.target: supported_isa;

import std.format: format;

import esdl.data.bvec: ubvec, toubvec, clog2;
import esdl.rand: constraint, rand;
import uvm;

import std.algorithm: canFind;


class riscv_csr_instr: riscv_instr
{
  // Moved to riscv_instr_gen_config
  // Privileged CSR filter
  // static ubvec!12[]    exclude_reg[];
  // static ubvec!12[]    include_reg[];
  // static ubvec!12[]    include_write_reg;
  // When set writes to read-only CSRs can be generated
  // static bit allow_ro_write;

  @rand bool write_csr;

  // m_cfg is declared in the base class

  constraint! q{
    if (m_cfg.csr_cfg.include_reg.length > 0) {
      csr inside [m_cfg.csr_cfg.include_reg];
    }
    if (m_cfg.csr_cfg.exclude_reg.length > 0) {
      csr !inside [m_cfg.csr_cfg.exclude_reg];
    }
  }  csr_addr_c;

  constraint! q{
    // We can only write a CSR if:
    // - It's a read-only CSR and we're generating writes to read-only CSRs
    // - Specific CSRs to write to are specified and this CSR is one
    // - No specific CSRs to write to are specified and this isn't a read-only CSR
    if (!((csr[10..12] == 0b11 && m_cfg.csr_cfg.allow_ro_write) ||
	  ((m_cfg.csr_cfg.include_write_reg.length > 0) &&
	   (csr inside [m_cfg.csr_cfg.include_write_reg])) ||
	  ((csr[10..12] != 0b11) && (m_cfg.csr_cfg.include_write_reg.length == 0)))) {
      write_csr == false;
    }
  } write_csr_c;

 constraint! q{ 
    if (instr_name == riscv_instr_name_t.CSRRW ||
	instr_name == riscv_instr_name_t.CSRRWI) {
      write_csr == true;
    }
  } csr_csrrw;

  constraint! q{
    if (instr_name == riscv_instr_name_t.CSRRS ||
	instr_name == riscv_instr_name_t.CSRRC) {
      write_csr == true || rs1 == 0;
    }
  } csr_csrrsc;

  constraint! q{
    if (instr_name == riscv_instr_name_t.CSRRSI ||
	instr_name == riscv_instr_name_t.CSRRCI) {
      write_csr == true || imm == 0;
    }
  } csr_csrrsci;

  constraint! q{
    // Choose a CSR before rs1 and imm values. This ensures read-only accesses to read-only CSRs
    // with similar probability to other CSR accesses.
    solve csr before write_csr;
    solve csr before rs1;
    solve csr before imm;
    // EUVM -- Uncommenting the next two results in non-converging constraints
    // solve write_csr before rs1;
    // solve write_csr before imm;
  } order;


  mixin uvm_object_utils;

  this(string name = "") {
    super(name);
  }

  static void create_csr_filter(riscv_instr_gen_config cfg) {
    cfg.csr_cfg.create_csr_filter(cfg);
  }

  override void set_rand_mode() {
    super.set_rand_mode();

    has_rs2 = false;
    if (instr_format == riscv_instr_format_t.I_FORMAT) {
      has_rs1 = false;
    }
  }

  // Convert the instruction to assembly code
  override string convert2asm(string prefix = "") {
    import std.string: toLower;
    string asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);

    switch (instr_format) {
    case riscv_instr_format_t.I_FORMAT: // instr rd,rs1,imm
      asm_str = format("%0s%0s, 0x%0x, %0s", asm_str, rd, csr, get_imm());
      break;
    case riscv_instr_format_t.R_FORMAT: // instr rd,rs1,rs2
      asm_str = format("%0s%0s, 0x%0x, %0s", asm_str, rd, csr, rs1);
      break;
    default:
      uvm_fatal(get_full_name(), format("Unsupported format %0s [%0s]", instr_format,
					instr_name));
    }

    if (comment != "")
      asm_str ~= " #" ~ comment;
    return asm_str.toLower();
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
    case riscv_instr_format_t.I_FORMAT: // instr rd,rs1,imm
      asm_buf = sformat!("%0s%0s, 0x%0x, %0s")(buf, instr_name_str, rd, csr, get_imm());
      break;
    case riscv_instr_format_t.R_FORMAT: // instr rd,rs1,rs2
      asm_buf = sformat!("%0s%0s, 0x%0x, %0s")(buf, instr_name_str, rd, csr, rs1);
      break;
    default:
      uvm_fatal(get_full_name(), format("Unsupported format %0s [%0s]", instr_format,
					instr_name));
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
    return toubvec!7(0b1110011);
  }

  override ubvec!3 get_func3() {
    switch (instr_name) {
    case riscv_instr_name_t.CSRRW:  return toubvec!3(0b001);
    case riscv_instr_name_t.CSRRS:  return toubvec!3(0b010);
    case riscv_instr_name_t.CSRRC:  return toubvec!3(0b011);
    case riscv_instr_name_t.CSRRWI: return toubvec!3(0b101);
    case riscv_instr_name_t.CSRRSI: return toubvec!3(0b110);
    case riscv_instr_name_t.CSRRCI: return toubvec!3(0b111);
    default:     return super.get_func3();
    }
  }

  override string convert2bin(string prefix = "") {
    string binary;

    switch (instr_format) {
    case riscv_instr_format_t.I_FORMAT: binary =
	format("%8h", csr ~ cast(ubvec!5)(imm[0..5]) ~ get_func3() ~ rd ~ get_opcode());
      break;
    case riscv_instr_format_t.R_FORMAT: binary =
	format("%8h", csr ~ rs1 ~ get_func3() ~ rd ~ get_opcode());
      break;
    default: uvm_fatal(get_full_name(),
		       format("Unsupported format %0s", instr_format));
      break;
    }

    return  prefix ~ binary;
  }
}
