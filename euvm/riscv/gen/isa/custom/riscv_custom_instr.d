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

// Custom instruction class

module riscv.gen.isa.custom.riscv_custom_instr;

import riscv.gen.riscv_instr_pkg: riscv_instr_group_t,
  riscv_instr_name_t, MAX_INSTR_STR_LEN, riscv_fpr_t,
  riscv_instr_format_t, riscv_instr_category_t,
  f_rounding_mode_t;
import riscv.gen.isa.riscv_instr: riscv_instr;
import std.string: toUpper, toLower;
import std.format: format;
import std.algorithm: canFind;

import esdl.rand: rand;
import esdl.data.bvec: ubvec;
import uvm;

class riscv_custom_instr: riscv_instr
{
  // TODO: Add custom operands here, example:
  // rand riscv_reg_t rs3;

  mixin uvm_object_utils;
  this(string name = "") {
    super(name);
  }

  override string get_instr_name() {
    import std.conv: to;
    return instr_name.to!string();
    // TODO: Add custom instruction name encoding here
  }

  override char[] get_instr_name(char[] buf) {
    import std.format: sformat;
    char[] str_instr_name = sformat!("%s")(buf, instr_name);
    return str_instr_name;
  }

  // Convert the instruction to assembly code
  override string convert2asm(string prefix = "") {
    string asm_str;
    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
    asm_str = format!FMT("nop");
    /* TODO: Convert custom instruction to assembly format. Example:
    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
    case (instr_name)
      CUSTOM_1: asm_str = $sformatf("%0s %0s, (%0s)", asm_str, rd.name(), rs1.name());
      CUSTOM_2: asm_str = $sformatf("%0s %0s", asm_str, r3.name());
    endcase
    */
    comment = get_instr_name() ~ " " ~ comment;
    if (comment != "") {
      asm_str ~= " #" ~ comment;
    }
    return asm_str.toLower();
  }

  override char[] convert2asm(char[] buf, string prefix = "") {
    import std.string: toLower, toLowerInPlace;
    import std.format: sformat;

    char[32] instr_buf;
    char[MAX_INSTR_STR_LEN+8] instr_name_buf;

    char[] asm_buf;

    enum string FMT = "%-" ~ MAX_INSTR_STR_LEN.stringof ~ "s";
    char[] instr_name_str = sformat!FMT(instr_name_buf, "nop");

    /* TODO: Convert custom instruction to assembly format. Example:
       asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
       case (instr_name)
       CUSTOM_1: asm_str = $sformatf("%0s %0s, (%0s)", asm_str, rd.name(), rs1.name());
       CUSTOM_2: asm_str = $sformatf("%0s %0s", asm_str, r3.name());
       endcase
    */

    asm_buf = sformat!("%s #%s %s")(buf, instr_name_str, get_instr_name(instr_buf), comment);

    toLowerInPlace(asm_buf);

    assert(asm_buf.ptr is buf.ptr);
    return asm_buf;
  }
}
