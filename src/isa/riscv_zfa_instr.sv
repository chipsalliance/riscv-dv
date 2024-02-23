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
class riscv_zfa_instr extends riscv_floating_point_instr;
  string all_fli_imm[] = {"-1.0", "min", "1.52587891e-5", "3.05175781e-5", "3.90625e-3", "7.8125e-3", "0.0625", "0.125",
                          "0.25", "0.3125", "0.375", "0.4375", "0.5", "0.625", "0.75", "0.875",
                          "1.0", "1.25", "1.5", "1.75", "2.0", "2.5", "3", "4",
                          "8", "16", "128", "256", "3.2768e+4", "6.5536e+4", "inf", "nan"};  
  rand bit [4:0]  imm_tbl_idx;
  bit             has_fli_imm = 1'b0;

  `uvm_object_utils(riscv_zfa_instr)

  function new(string name = "");
    super.new(name);
  endfunction : new

  virtual function void set_rand_mode();
    has_rs1 = 1'b0;
    has_rs2 = 1'b0;
    has_rd  = 1'b0;
    has_imm = 1'b0;

    case (format) inside
      R_FORMAT: begin
        if (instr_name inside {FLEQ_H, FLTQ_H, FLEQ_S, FLTQ_S, FLEQ_D, FLTQ_D, FLEQ_Q, FLTQ_Q}) begin
          has_rd = 1'b1;
          has_fd  = 1'b0;
        end else if (instr_name inside {FMVP_Q_X, FMVP_D_X}) begin
          has_rs1 = 1'b1;
          has_rs2 = 1'b1;
          has_fs1 = 1'b0;
          has_fs2 = 1'b0;
        end else if (instr_name inside {FMVH_X_D, FMVH_X_Q}) begin
          has_rs1 = 1'b1;
          has_fs1 = 1'b0;
          has_fs2 = 1'b0;
          // cte rs2 value
        end
        // FMINM_H, FMINM_S, FMINM_D, FMINM_Q, FMAXM_H, FMAXM_S, FMAXM_D, FMAXM_Q use default values
      end

      I_FORMAT: begin
        if (instr_name inside {FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, 
                              FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q}) begin
          has_fs2 = 1'b0;
          // can use the rm field
          // cte rs2 value
        end else if (instr_name inside {FCVTMOD_W_D}) begin
          has_fs2 = 1'b0;
          has_fd  = 1'b0;
          has_rd  = 1'b1;
          // cte rs2 value
        end else if (instr_name inside {FLI_H, FLI_S, FLI_D, FLI_Q}) begin
          has_fli_imm = 1'b1;
          has_fs1 = 1'b0;
          has_fs2 = 1'b0;
          // cte rs2 value
        end
      end
    endcase
  endfunction : set_rand_mode

  function void pre_randomize();
    imm_tbl_idx.rand_mode(has_fli_imm);
    super.pre_randomize();
  endfunction
  
  virtual function string convert2asm(string prefix = "");
    string asm_str_final;
    string asm_str;

    asm_str = format_string(get_instr_name(), MAX_INSTR_STR_LEN);
    
    case (format) inside
      R_FORMAT: begin
        if (instr_name inside {FLEQ_H, FLTQ_H, FLEQ_S, FLTQ_S, FLEQ_D, FLTQ_D, FLEQ_Q, FLTQ_Q}) begin
          asm_str_final = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), fs1.name(), fs2.name());
        end else if (instr_name inside {FMVP_Q_X, FMVP_D_X}) begin
          asm_str_final = $sformatf("%0s%0s, %0s, %0s", asm_str, fd.name(), rs1.name(), rs2.name());
        end else if (instr_name inside {FMVH_X_D, FMVH_X_Q}) begin
          asm_str_final = $sformatf("%0s%0s, %0s", asm_str, fd.name(), rs1.name());
        end else if (instr_name inside {FMINM_H, FMINM_S, FMINM_D, FMINM_Q, FMAXM_H, FMAXM_S, FMAXM_D, FMAXM_Q}) begin
          asm_str_final = $sformatf("%0s%0s, %0s, %0s", asm_str, fd.name(), fs1.name(), fs2.name());
        end
      end

      I_FORMAT: begin
        if (instr_name inside {FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, 
                              FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q}) begin
          asm_str_final = $sformatf("%0s%0s, %0s", asm_str, fd.name(), fs1.name());
          if (use_rounding_mode_from_instr) begin
            asm_str_final = {asm_str_final, ", ", rm.name()};
          end
        end else if (instr_name inside {FCVTMOD_W_D}) begin
          asm_str_final = $sformatf("%0s%0s, %0s, %0s", asm_str, rd.name(), fs1.name(), "RTZ");
        end else if (instr_name inside {FLI_H, FLI_S, FLI_D, FLI_Q}) begin
          asm_str_final = $sformatf("%0s%0s, %0s", asm_str, fd.name(), all_fli_imm[imm_tbl_idx]);
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
  
  virtual function void set_imm_len();
    if (instr_name inside {FLI_H, FLI_S, FLI_D, FLI_Q}) begin
      imm_len = 5;
    end
  endfunction: set_imm_len

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
      default : get_opcode = super.get_opcode();
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
      default : get_rs2_cte = 5'b0000;
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
      FROUND_H    : get_func7 = 7'b0100010; 
      FROUNDNX_H  : get_func7 = 7'b0100010; 
      FROUND_S    : get_func7 = 7'b0100000; 
      FROUNDNX_S  : get_func7 = 7'b0100000; 
      FROUND_D    : get_func7 = 7'b0100001; 
      FROUNDNX_D  : get_func7 = 7'b0100001; 
      FROUND_Q    : get_func7 = 7'b0100011; 
      FROUNDNX_Q  : get_func7 = 7'b0100011; 
      FCVTMOD_W_D : get_func7 = 7'b1100001; 
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
    case (format) inside
      R_FORMAT: begin
        if (instr_name inside {FLEQ_H, FLTQ_H, FLEQ_S, FLTQ_S, FLEQ_D, FLTQ_D, FLEQ_Q, FLTQ_Q}) begin
          binary = $sformatf("%8h", {get_func7(), fs2, fs1, get_func3(), rd, get_opcode()});
        end else if (instr_name inside {FMVP_Q_X, FMVP_D_X}) begin
          binary = $sformatf("%8h", {get_func7(), rs2, rs1, get_func3(), fd, get_opcode()});
        end else if (instr_name inside {FMVH_X_D, FMVH_X_Q}) begin
          binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), rs1, get_func3(), fd, get_opcode()});
        end else if (instr_name inside {FMINM_H, FMINM_S, FMINM_D, FMINM_Q, FMAXM_H, FMAXM_S, FMAXM_D, FMAXM_Q}) begin
          binary = $sformatf("%8h", {get_func7(), fs2, fs1, get_func3(), fd, get_opcode()});
        end
      end

      I_FORMAT: begin
        if (instr_name inside {FROUND_H, FROUNDNX_H, FROUND_S, FROUNDNX_S, 
                              FROUND_D, FROUNDNX_D, FROUND_Q, FROUNDNX_Q}) begin
          if(use_rounding_mode_from_instr) begin
            binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), fs1, rm, fd, get_opcode()});
          end else begin
            binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), fs1, 3'b111, fd, get_opcode()});
          end
        end else if (instr_name inside {FCVTMOD_W_D}) begin
          binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), fs1, get_func3(), rd, get_opcode()});
        end else if (instr_name inside {FLI_H, FLI_S, FLI_D, FLI_Q}) begin
          binary = $sformatf("%8h", {get_func7(), get_rs2_cte(), imm_tbl_idx, get_func3(), rd, get_opcode()});
        end
      end

      default: binary = super.convert2bin(prefix);
    endcase
  endfunction : convert2bin

  virtual function bit is_supported(riscv_instr_gen_config cfg);
    if (cfg.enable_floating_point && cfg.enable_zfa_extension &&
       (RV32ZFA inside { supported_isa } || RV64ZFA inside { supported_isa } )) begin
      
      if ((RV32D inside {supported_isa}) && (XLEN == 32) && (instr_name inside {FMVH_X_D, FMVP_D_X})) begin
        return 1'b1;
      end
      
      if ((RV64Q inside {supported_isa}) && (XLEN == 64) && (instr_name inside {FMVH_X_Q, FMVP_Q_X})) begin
        return 1'b1;
      end
      
      if ((RV32D inside {supported_isa} || RV64D inside {supported_isa}) && 
         (instr_name inside {FLI_D, FMINM_D, FMAXM_D, FROUND_D, 
                             FROUNDNX_D, FCVTMOD_W_D, FLEQ_D, FLTQ_D})) begin
        return 1'b1;
      end
      
      if ((RV32Q inside {supported_isa} || RV64Q inside {supported_isa}) && 
         (instr_name inside {FLI_Q, FMINM_Q, FMAXM_Q, FROUND_Q, FROUNDNX_Q, 
         FLEQ_Q, FLTQ_Q})) begin 
        return 1'b1;
      end

      if (cfg.enable_zfh_extension && (instr_name inside {FLI_H, FMINM_H, FMAXM_H, 
         FROUND_H, FROUNDNX_H, FLEQ_H, FLTQ_H})) begin
        return 1'b1;
      end

      return (instr_name inside {FLEQ_S, FLTQ_S, FLI_S, FMINM_S, FMAXM_S, FROUND_S, FROUNDNX_S});
    end

    return 1'b0;
  endfunction : is_supported

  // coverage related functons
  virtual function void update_src_regs(string operands[$]);
    super.update_src_regs(operands);
    if(instr_name inside {FLI_S, FLI_H, FLI_D, FLI_Q}) begin
      imm_tbl_idx = 5'b01010;
      foreach (all_fli_imm[i]) begin
        if(all_fli_imm[i] == operands[1]) begin
          imm_tbl_idx = i;
          break;
        end
      end
    end
  endfunction : update_src_regs

endclass : riscv_zfa_instr