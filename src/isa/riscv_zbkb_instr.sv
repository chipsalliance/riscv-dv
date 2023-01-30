/*
 * Copyright 2018 Google LLC
 * Copyright 2021 Silicon Labs, Inc.
 * Copyright 2023 Frontgrade Gaisler
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
class riscv_zbkb_instr extends riscv_instr;
  `uvm_object_utils(riscv_zbkb_instr)

  function new(string name = "");
    super.new(name);
  endfunction : new

  virtual function void set_rand_mode();
    super.set_rand_mode();
    case (format) inside
      I_FORMAT: begin
        has_imm = 1'b0;
      end
    endcase
  endfunction : set_rand_mode

  function void pre_randomize();
    super.pre_randomize();
  endfunction

  virtual function string convert2asm(string prefix = "");
    string asm_str_final;
    string asm_str;

    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);

    case (format)
      I_FORMAT : begin // instr rd rs1
        if (!has_imm) begin
          asm_str_final = $sformatf("%0s%0s, %0s", asm_str, rd.name(), rs1.name());
        end
      end

      R_FORMAT : begin // instr rd rs1
        if (!has_rs2) begin
          asm_str_final = $sformatf("%0s%0s, %0s", asm_str, rd.name(), rs1.name());
        end
      end

      default: `uvm_info(`gfn, $sformatf("Unsupported format %0s", format.name()), UVM_LOW)
    endcase

    if (asm_str_final == "") begin
      return super.convert2asm(prefix);
    end

    if (comment != "") begin
      asm_str_final = { asm_str_final, " #", comment };
    end

    return asm_str_final.tolower();

  endfunction : convert2asm

  function bit[6:0] get_opcode();
    case (instr_name) inside
      default : get_opcode = super.get_opcode();
      PACK    : get_opcode = 7'b0110011;
      PACKH   : get_opcode = 7'b0110111;
      PACKW   : get_opcode = 7'b0111011;
      BREV8   : get_opcode = 7'b0010011;
      ZIP     : get_opcode = 7'b0010011;
      UNZIP   : get_opcode = 7'b0010011;
    endcase
  endfunction : get_opcode

  virtual function bit [2:0] get_func3();
    case (instr_name) inside
      PACK    : get_func3 = 3'b100;
      PACKH   : get_func3 = 3'b111;
      PACKW   : get_func3 = 3'b100;
      BREV8   : get_func3 = 3'b101;
      ZIP     : get_func3 = 3'b001;
      UNZIP   : get_func3 = 3'b101;
      default : get_func3 = super.get_func3();
    endcase
  endfunction : get_func3

  virtual function bit [4:0] get_func5();
    case (instr_name) inside
      BREV8   : get_func5 = 5'b00111;
      ZIP     : get_func5 = 5'b01111;
      UNZIP   : get_func5 = 5'b01111;
    endcase
  endfunction : get_func5

  virtual function bit [6:0] get_func7();
    case (instr_name) inside
      PACK    : get_func7 = 7'b0000100;
      PACKH   : get_func7 = 7'b0000100;
      PACKW   : get_func7 = 7'b0000100;
      BREV8   : get_func7 = 7'b0110100;
      ZIP     : get_func7 = 7'b0000100;
      UNZIP   : get_func7 = 7'b0000100;
      default : get_func7 = super.get_func7();
    endcase
  endfunction : get_func7

  virtual function string convert2bin(string prefix = "");
    string binary = "";

    case (format)
      R_FORMAT: begin
        binary = $sformatf("%8h", {get_func7(), rs2, rs1, get_func3(), rd, get_opcode()});
      end

      I_FORMAT: begin
        binary = $sformatf("%8h", {get_func7(), get_func5(), rs1, get_func3(), rd, get_opcode()});
      end

      default: begin
        if (binary == "") begin
          binary = super.convert2bin(prefix);
        end
      end

    endcase // case (format)
  endfunction : convert2bin

  virtual function bit is_supported(riscv_instr_gen_config cfg);
    return (cfg.enable_zbkb_extension &&
           (RV32ZBKB inside { supported_isa } || RV64ZBKB inside { supported_isa }) &&
           instr_name inside {
            PACK, PACKH, PACKW, BREV8, ZIP, UNZIP
           });
  endfunction : is_supported

endclass : riscv_zbkb_instr
