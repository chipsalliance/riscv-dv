/*
 * Copyright 2018 Google LLC
 * Copyright 2021 Silicon Labs, Inc.
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
class riscv_zfa_instr extends riscv_instr;
  bit                       has_rm = 1'b0;
  rand f_rounding_mode_t    rm;
  static riscv_instr_name_t rs2_cte_instr_name[$];

  `uvm_object_utils(riscv_zfa_instr)

  function new(string name = "");
    super.new(name);
  endfunction : new

  virtual function void set_rand_mode();
    super.set_rand_mode();
    case (format) inside
      R_FORMAT: begin
        if (instr_name inside {FLEQ_H, FLTQ_H, FLEQ_S, FLTQ_S, FLEQ_D, FLTQ_D, FLEQ_Q, FLTQ_Q,
                               FMINM_H, FMINM_S, FMINM_D, FMINM_Q, FMAXM_H, FMAXM_S, FMAXM_D, FMAXM_Q, 
                               FMVP_Q_X, FMVP_D_X}) begin
          has_rs2 = 1'b1;
          has_rs1 = 1'b1;
          has_rd = 1'b1;
          has_imm = 1'b0;
        end
      end
      I_FORMAT: begin
        if (instr_name inside {FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, 
                              FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q}) begin
          has_rs2 = 1'b0;
          has_rs1 = 1'b1;
          has_rd = 1'b1;
          has_rm = 1'b1;
          has_imm = 1'b0;
        end else if (instr_name inside {FCVTMOD_W_D, 
                                        FLI_H, FLI_S, FLI_D, FLI_Q,
                                        FMVH_X_D, FMVH_X_Q}) begin // use funct3 (no rm field)
          has_rs2 = 1'b0;
          has_rs1 = 1'b1;
          has_rd = 1'b1;
          has_imm = 1'b0;
        end
      end

    endcase
  endfunction : set_rand_mode

  function void pre_randomize();
    // rand_mode deactivated for instructions that dont use it
    if (!(instr_name inside {FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, 
                            FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q})) begin
      rm.rand_mode(0);
    end
    super.pre_randomize();
  endfunction

  virtual function string convert2asm(string prefix = "");
    string asm_str_final;
    string asm_str;

    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);

    case (format)
      I_FORMAT : begin // instr rd rs1
          asm_str_final = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), rs1.name());
        end
      R_FORMAT : begin // instr rd rs1
          asm_str_final = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), rs1.name(), rs2.name());
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
      FLI_H, FLI_S, FLI_D, FLI_Q, FMINM_H: get_opcode = 7'b1111000;
      FMINM_S, FMINM_D,FMINM_Q, FMAXM_H, FMAXM_S, FMAXM_D, FMAXM_Q: get_opcode = 7'b1010011;
      FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q: get_opcode = 7'b1010011;
      FCVTMOD_W_D: get_opcode = 7'b1010011;
      FMVH_X_D: get_opcode = 7'b1010011;
      FMVP_D_X: get_opcode = 7'b1010011;
      FMVH_X_Q: get_opcode = 7'b1010011;
      FMVP_Q_X: get_opcode = 7'b1010011;
      FLEQ_H, FLTQ_H, FLEQ_S, FLTQ_S, FLEQ_D, FLTQ_D, FLEQ_Q, FLTQ_Q: get_opcode = 7'b1010011;
      default :                         get_opcode = super.get_opcode();
    endcase
  endfunction : get_opcode

  virtual function bit [2:0] get_func3();
    case (instr_name) inside
      FLI_H       : get_func3 = 3'b000; 
      FLI_S       : get_func3 = 3'b000; 
      FLI_D       : get_func3 = 3'b000; 
      FLI_Q       : get_func3 = 3'b000; 
      FMINM_H     : get_func3 = 3'b010; 
      FMINM_S     : get_func3 = 3'b010; 
      FMINM_D     : get_func3 = 3'b010; 
      FMINM_Q     : get_func3 = 3'b010; 
      FMAXM_H     : get_func3 = 3'b011; 
      FMAXM_S     : get_func3 = 3'b011; 
      FMAXM_D     : get_func3 = 3'b011; 
      FMAXM_Q     : get_func3 = 3'b011; 
      FCVTMOD_W_D : get_func3 = 3'b001;
      FMVH_X_D    : get_func3 = 3'b000; 
      FMVP_D_X    : get_func3 = 3'b000; 
      FMVH_X_Q    : get_func3 = 3'b000; 
      FMVP_Q_X    : get_func3 = 3'b000; 
      FLEQ_H      : get_func3 = 3'b100; 
      FLTQ_H      : get_func3 = 3'b101; 
      FLEQ_S      : get_func3 = 3'b100; 
      FLTQ_S      : get_func3 = 3'b101; 
      FLEQ_D      : get_func3 = 3'b100; 
      FLTQ_D      : get_func3 = 3'b101; 
      FLEQ_Q      : get_func3 = 3'b100; 
      FLTQ_Q      : get_func3 = 3'b101; 
      default   : get_func3 = super.get_func3();
    endcase
  endfunction : get_func3

  function bit [6:0] get_rs2_cte();
    case (instr_name) inside
      FLI_H       : get_rs2_cte = 5'b00001; 
      FLI_S       : get_rs2_cte = 5'b00001; 
      FLI_D       : get_rs2_cte = 5'b00001; 
      FLI_Q       : get_rs2_cte = 5'b00001; 
      FROUND_H    : get_rs2_cte = 5'b00100; 
      FROUNDNX_H  : get_rs2_cte = 5'b00101; 
      FROUND_S    : get_rs2_cte = 5'b00100; 
      FROUNDNX_S  : get_rs2_cte = 5'b00101; 
      FROUND_D    : get_rs2_cte = 5'b00100; 
      FROUNDNX_D  : get_rs2_cte = 5'b00101; 
      FROUND_Q    : get_rs2_cte = 5'b00100; 
      FROUNDNX_Q  : get_rs2_cte = 5'b00101; 
      FCVTMOD_W_D : get_rs2_cte = 5'b01000; 
      FMVH_X_D    : get_rs2_cte = 5'b00001; 
      FMVH_X_Q    : get_rs2_cte = 5'b00001; 
      default   : get_rs2_cte = 5'b0000;
    endcase
  endfunction : get_rs2_cte

  function bit [6:0] get_func7();
    case (instr_name) inside
      FLI_H       : get_func7 = 7'b1111000; 
      FLI_S       : get_func7 = 7'b1111000; 
      FLI_D       : get_func7 = 7'b1111000; 
      FLI_Q       : get_func7 = 7'b1111000; 
      FMINM_H     : get_func7 = 7'b0010100; 
      FMINM_S     : get_func7 = 7'b0010100; 
      FMINM_D     : get_func7 = 7'b0010100; 
      FMINM_Q     : get_func7 = 7'b0010100; 
      FMAXM_H     : get_func7 = 7'b0010100; 
      FMAXM_S     : get_func7 = 7'b0010100; 
      FMAXM_D     : get_func7 = 7'b0010100; 
      FMAXM_Q     : get_func7 = 7'b0010100; 
      FROUND_H    : get_func7 = 7'b0000000; 
      FROUNDNX_H  : get_func7 = 7'b0000000; 
      FROUND_S    : get_func7 = 7'b0100000; 
      FROUNDNX_S  : get_func7 = 7'b0100000; 
      FROUND_D    : get_func7 = 7'b0000000; 
      FROUNDNX_D  : get_func7 = 7'b0000000; 
      FROUND_Q    : get_func7 = 7'b0000000; 
      FROUNDNX_Q  : get_func7 = 7'b0000000; 
      FCVTMOD_W_D : get_func7 = 7'b0000000; 
      FMVH_X_D    : get_func7 = 7'b1110001; 
      FMVP_D_X    : get_func7 = 7'b1011001; 
      FMVH_X_Q    : get_func7 = 7'b1110011; 
      FMVP_Q_X    : get_func7 = 7'b1011011; 
      FLEQ_H      : get_func7 = 7'b1010001; 
      FLTQ_H      : get_func7 = 7'b1010001; 
      FLEQ_S      : get_func7 = 7'b1010001; 
      FLTQ_S      : get_func7 = 7'b1010001; 
      FLEQ_D      : get_func7 = 7'b1010001; 
      FLTQ_D      : get_func7 = 7'b1010001; 
      FLEQ_Q      : get_func7 = 7'b1010001; 
      FLTQ_Q      : get_func7 = 7'b1010001; 
      default   : get_func7 = super.get_func7();
    endcase
  endfunction : get_func7

  virtual function string convert2bin(string prefix = "");
    string binary = "";
    if (format == R_FORMAT) begin
      binary = $sformatf("%8h", {get_func7(), rs2, rs1, get_func3(), rd, get_opcode()});
    end
    else if (format == I_FORMAT) begin //for I_FORMAT, rs2 is cte
      // use the rm field
      if (instr_name inside {FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, 
                            FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q}) begin
        binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), rs1, rm, rd, get_opcode()});
      end else begin // use funct3 (no rm field)
        binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), rs1, get_func3(), rd, get_opcode()});
      end
    end
    else begin
      binary = super.convert2bin(prefix);
    end
  endfunction : convert2bin

  virtual function bit is_supported(riscv_instr_gen_config cfg);
    return (cfg.enable_floating_point && cfg.enable_zfa_extension &&
           (RV32ZFA inside { supported_isa } || RV64ZFA inside { supported_isa } ) &&
           instr_name inside {
            FLI_H, FLI_S, FLI_D, FLI_Q, FMINM_H,
            FMINM_S, FMINM_D,FMINM_Q, FMAXM_H, FMAXM_S, FMAXM_D, FMAXM_Q, 
            FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q, 
            FCVTMOD_W_D, 
            FMVH_X_D, 
            FMVP_D_X, 
            FMVH_X_Q, 
            FMVP_Q_X
           });
  endfunction : is_supported

endclass : riscv_zfa_instr