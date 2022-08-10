/*
 * Copyright 2019 Google LLC
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

// This expression is needed in multiple constraints so is expressed as a macro. It could be
// implemented within a function but the constraint solver is unable to work with function contents.
// So when used in a constraint it will just try different values until it finds something that
// satisifies what it requires or it gives up. When the set of writable CSRs is small relative to
// the set of readable CSRs such failures are common. Instead by using an expression that can be
// directly used in constraints the solver can intelligently solve to find a useable CSR and there
// are no constraint failures.
`define CSR_WRITABLE (csr[11:10] == 2'b11 && allow_ro_write) || \
  ((include_write_reg.size() > 0) && (csr inside {include_write_reg})) || \
  ((csr[11:10] != 2'b11) && (include_write_reg.size() == 0))

class riscv_csr_instr extends riscv_instr;
  // Privileged CSR filter
  static bit [11:0]  exclude_reg[$];
  static bit [11:0]  include_reg[$];
  static bit [11:0]  include_write_reg[$];

  // When set writes to read-only CSRs can be generated
  static bit allow_ro_write;

  constraint csr_addr_c {
    if (include_reg.size() > 0) {
      csr inside {include_reg};
    }
    if (exclude_reg.size() > 0) {
      !(csr inside {exclude_reg});
    }
  }

  constraint csr_csrrw {
    if (instr_name == CSRRW || instr_name == CSRRWI) {
      `CSR_WRITABLE;
    }
  }

  constraint csr_csrrsc {
    if (instr_name == CSRRS || instr_name == CSRRC) {
      `CSR_WRITABLE || rs1 == 0;
    }
  }

  constraint csr_csrrsci {
    if(instr_name == CSRRSI || instr_name == CSRRCI) {
      `CSR_WRITABLE || imm == 0;
    }
  }

  constraint order {
    // Choose a CSR before rs1 and imm values. This ensures read-only accesses to read-only CSRs
    // with similar probability to other CSR accesses.
    solve csr before rs1, imm;
  }

  `uvm_object_utils(riscv_csr_instr)

  function new(string name = "");
    super.new(name);
  endfunction

  static function void create_csr_filter(riscv_instr_gen_config cfg);
    include_reg.delete();
    exclude_reg.delete();

    allow_ro_write = 1;

    if (cfg.enable_illegal_csr_instruction) begin
      exclude_reg = {implemented_csr};
    end else if (cfg.enable_access_invalid_csr_level) begin
      include_reg = {cfg.invalid_priv_mode_csrs};
    end else if (cfg.gen_all_csrs_by_default) begin
      allow_ro_write = cfg.gen_csr_ro_write;
      include_reg = {implemented_csr, custom_csr};

      create_include_write_reg(cfg.add_csr_write, cfg.remove_csr_write, default_include_csr_write);
    end else begin
      // Use scratch register to avoid the side effect of modifying other privileged mode CSR.
      if (cfg.init_privileged_mode == MACHINE_MODE) begin
        include_reg = {MSCRATCH};
      end else if (cfg.init_privileged_mode == SUPERVISOR_MODE) begin
        include_reg = {SSCRATCH};
      end else begin
        include_reg = {USCRATCH};
      end
    end
  endfunction : create_csr_filter

  static function void create_include_write_reg(privileged_reg_t add_csr[], privileged_reg_t remove_csr[], bit [11:0] initial_csrs[$]);
    include_write_reg.delete();

    foreach (initial_csrs[r]) begin
      if (!(initial_csrs[r] inside {remove_csr})) begin
        include_write_reg.push_back(initial_csrs[r]);
      end
    end

    foreach (add_csr[r]) begin
      include_write_reg.push_back(add_csr[r]);
    end
  endfunction

  virtual function void set_rand_mode();
    super.set_rand_mode();

    has_rs2 = 1'b0;
    if (format == I_FORMAT) begin
      has_rs1 = 1'b0;
    end
  endfunction

  // Convert the instruction to assembly code
  virtual function string convert2asm(string prefix = "");
    string asm_str;
    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);

    case(format)
        I_FORMAT: // instr rd,rs1,imm
          asm_str = $sformatf("%0s%0s, 0x%0x, %0s", asm_str, rd.name(), csr, get_imm());
        R_FORMAT: // instr rd,rs1,rs2
          asm_str = $sformatf("%0s%0s, 0x%0x, %0s", asm_str, rd.name(), csr, rs1.name());
        default:
          `uvm_fatal(`gfn, $sformatf("Unsupported format %0s [%0s]", format.name(),
                                     instr_name.name()))
    endcase

    if(comment != "")
      asm_str = {asm_str, " #",comment};
    return asm_str.tolower();
  endfunction : convert2asm

  function bit [6:0] get_opcode();
    get_opcode = 7'b1110011;
  endfunction

  virtual function bit [2:0] get_func3();
    case (instr_name)
      CSRRW      : get_func3 = 3'b001;
      CSRRS      : get_func3 = 3'b010;
      CSRRC      : get_func3 = 3'b011;
      CSRRWI     : get_func3 = 3'b101;
      CSRRSI     : get_func3 = 3'b110;
      CSRRCI     : get_func3 = 3'b111;
      default : get_func3 = super.get_func3();
    endcase
  endfunction : get_func3

  virtual function string convert2bin(string prefix = "");
    string binary;

    case(format)
      I_FORMAT: binary = $sformatf("%8h", {csr[11:0], imm[4:0], get_func3(), rd, get_opcode()});
      R_FORMAT: binary = $sformatf("%8h", {csr[11:0], rs1, get_func3(), rd, get_opcode()});
      default: `uvm_fatal(`gfn, $sformatf("Unsupported format %0s", format.name()))
    endcase

    return {prefix, binary};
  endfunction
endclass : riscv_csr_instr
