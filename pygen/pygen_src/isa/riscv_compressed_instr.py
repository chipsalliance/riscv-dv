"""
Copyright 2020 Google LLC
Copyright 2020 PerfectVIPs Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
"""

import vsc
from pygen_src.isa.riscv_instr import riscv_instr
from pygen_src.riscv_instr_pkg import riscv_instr_name_t, riscv_instr_format_t, riscv_instr_category_t, riscv_reg_t,imm_t, pkg_ins
from pygen_src.target.rv32i import riscv_core_setting as rcs
import logging
from enum import Enum

@vsc.randobj
class riscv_compressed_instr(riscv_instr):
    def __init__(self):
        super().__init__()
        self.imm_align = 0
        self.rs1 = riscv_reg_t.S0
        self.rs2 = riscv_reg_t.S0
        self.rd = riscv_reg_t.S0
        self.is_compressed = 1
        self.a = vsc.rand_enum_t(riscv_reg_t)
    
    @vsc.constraint
    def rvc_csr_c(self):
        # self.a.inside(vsc.rangelist(vsc.rng(riscv_reg_t.S0,riscv_reg_t.A5)))
        # Registers specified by the three-bit rs1’, rs2’, and rd’
        '''if self.format in [riscv_instr_format_t.CIW_FORMAT,riscv_instr_format_t.CL_FORMAT,
                           riscv_instr_format_t.CS_FORMAT, riscv_instr_format_t.CB_FORMAT,riscv_instr_format_t.CA_FORMAT]:'''
        logging.info("Inside rvc_csr_c")
        self.a.inside(vsc.rangelist(vsc.rng(riscv_reg_t.S0,riscv_reg_t.A5)))
        #if self.has_rs1:
        self.rs1.inside(vsc.rangelist(vsc.rng(riscv_reg_t.S0,riscv_reg_t.A5)))
        #if self.has_rs2:
        self.rs2.inside(vsc.rangelist(vsc.rng(riscv_reg_t.A4,riscv_reg_t.A5)))
        #if self.has_rd:
        self.rd.inside(vsc.rangelist(vsc.rng(riscv_reg_t.S0,riscv_reg_t.A5)))
        #_ADDI16SP is only valid when rd == SP
        if self.instr_name == riscv_instr_name_t.C_ADDI16SP.name:
            self.rd == riscv_reg_t.SP
        if self.instr_name in [riscv_instr_name_t.C_JR.name, riscv_instr_name_t.C_JALR.name]:
            self.rs1 != riscv_reg_t.ZERO
            self.rs2 == riscv_reg_t.ZERO

    @vsc.constraint
    def imm_val_c(self):
        logging.info("imm_val_C instr {}".format(self.instr_name))
        if self.imm_type in [imm_t.NZIMM, imm_t.NZUIMM]:
            logging.info("Inside imm_val_c")
            self.imm[5:0] != 0
            if self.instr_name == riscv_instr_name_t.C_LUI.name:
                self.imm[31:5] == 0
            if self.instr_name in [riscv_instr_name_t.C_SRAI.name, riscv_instr_name_t.C_SRLI.name, riscv_instr_name_t.C_SLLI.name]:
                self.imm[31:5] == 0
            if self.instr_name == riscv_instr_name_t.C_ADDI4SPN.name:
                self.imm[1:0] == 0
    
    # C_JAL is RV32C only instruction
    @vsc.constraint
    def jal_c(self):
        logging.info("Inside jal_c")
        if rcs.XLEN != 32:
            self.instr_name != riscv_instr_name_t.C_JAL.name
    
    # Avoid generating HINT or illegal instruction by default as it's not supported by the compiler
    @vsc.constraint
    def no_hint_illegal_instr_c(self):
        if self.instr_name in [riscv_instr_name_t.C_ADDI.name,riscv_instr_name_t.C_ADDIW.name,riscv_instr_name_t.C_LI.name,riscv_instr_name_t.C_LUI.name,riscv_instr_name_t.C_SLLI.name,riscv_instr_name_t.C_SLLI64.name,riscv_instr_name_t.C_LQSP.name,riscv_instr_name_t.C_LDSP.name,riscv_instr_name_t.C_MV.name,riscv_instr_name_t.C_ADD.name,riscv_instr_name_t.C_LWSP.name]:
            self.rd != riscv_reg_t.ZERO
        if self.instr_name == riscv_instr_name_t.C_JR.name:
            self.rs1 != riscv_reg_t.ZERO
        if self.instr_name in [riscv_instr_name_t.C_ADD.name, riscv_instr_name_t.C_MV.name]:
            self.rs2 != riscv_reg_t.ZERO
        if self.instr_name == riscv_instr_name_t.C_LUI.name:
            self.rd != riscv_reg_t.SP
        
    def set_imm_len(self):
        if self.format in [riscv_instr_format_t.CI_FORMAT, riscv_instr_format_t.CSS_FORMAT]:
            self.imm_len = 6
        elif self.format in [riscv_instr_format_t.CL_FORMAT, riscv_instr_format_t.CS_FORMAT]:
            self.imm_len = 5
        elif self.format in [riscv_instr_format_t.CJ_FORMAT]:
            self.imm_len = 11
        elif self.format in [riscv_instr_format_t.CB_FORMAT]:
            if self.instr_name == riscv_instr_name_t.C_ANDI.name:
                self.imm_len = 6 
            else:
                self.imm_len = 7
        elif self.format in [riscv_instr_format_t.CB_FORMAT, riscv_instr_format_t.CIW_FORMAT]:
            self.imm_len = 8
        if self.instr_name in [riscv_instr_name_t.C_SQ.name, riscv_instr_name_t.C_LQ.name, riscv_instr_name_t.C_LQSP.name, riscv_instr_name_t.C_SQSP.name, riscv_instr_name_t.C_ADDI16SP.name]:
            self.imm_align = 4
        elif self.instr_name in [riscv_instr_name_t.C_SD.name, riscv_instr_name_t.C_LD.name, riscv_instr_name_t.C_LDSP.name, riscv_instr_name_t.C_SDSP.name]:
            self.imm_align = 3
        elif self.instr_name in [riscv_instr_name_t.C_SW.name, riscv_instr_name_t.C_LW.name, riscv_instr_name_t.C_LWSP.name, riscv_instr_name_t.C_SWSP.name, riscv_instr_name_t.C_ADDI4SPN.name]:
            self.imm_align = 2
        elif self.instr_name in [riscv_instr_name_t.C_LUI.name]:
            self.imm_align = 12
        elif self.instr_name in [riscv_instr_name_t.C_J.name, riscv_instr_name_t.C_JAL.name, riscv_instr_name_t.C_BNEZ.name, riscv_instr_name_t.C_BEQZ.name]:
            self.imm_align = 1

    def extend_imm(self):
        if self.instr_name != riscv_instr_name_t.C_LUI.name:
            super().extend_imm()
            self.imm = self.imm << self.imm_align

    def set_rand_mode(self):
        if self.format in [riscv_instr_format_t.CR_FORMAT]:
            if self.category in [riscv_instr_category_t.JUMP]:
                self.has_rd = 0
            else:
                self.has_rs1 = 0
                self.has_imm = 0
        elif self.format in [riscv_instr_format_t.CI_FORMAT, riscv_instr_format_t.CIW_FORMAT]:
            self.has_rs2 = 0
            self.has_rs1 = 0
        elif self.format in [riscv_instr_format_t.CSS_FORMAT]:
            self.has_rs1 = 0
            self.has_rd = 0
        elif self.format in [riscv_instr_format_t.CL_FORMAT]:
            self.has_rs2 = 0
        elif self.format in [riscv_instr_format_t.CS_FORMAT]:
            self.has_rd = 0
        elif self.format in [riscv_instr_format_t.CA_FORMAT]:
            self.has_rs1 = 0
            self.has_imm = 0
        elif self.format == riscv_instr_format_t.CJ_FORMAT:
            self.has_rs1 = 0
            self.has_rs2 = 0
            self.has_rd = 0
        elif self.format == riscv_instr_format_t.CB_FORMAT:
            if self.instr_name != riscv_instr_name_t.C_ANDI.name:
                self.has_rd = 0
                self.has_rs2 = 0

    def convert2asm(self, prefix=""):
        logging.info("self.a {}".format(self.a.name))
        asm_str = pkg_ins.format_string(string=self.get_instr_name(), length=pkg_ins.MAX_INSTR_STR_LEN)
        logging.info("asm_str {}".format(asm_str))
        if self.category != riscv_instr_category_t.SYSTEM:
            logging.info("Instr name {} self.rd {} self.rs1 {} self.has_rs1 {} format {}".format(self.instr_name, self.rd.name,self.rs1.name,self.has_rs1, self.format.name))
            if self.format in [riscv_instr_format_t.CI_FORMAT, riscv_instr_format_t.CIW_FORMAT]:
                if self.instr_name is riscv_instr_name_t.C_NOP.name:
                    asm_str = "c.nop"
                elif self.instr_name is riscv_instr_name_t.C_ADDI16SP.name:
                    asm_str = "{} sp, {}".format(asm_str, self.get_imm())
                elif self.instr_name is riscv_instr_name_t.C_ADDI4SPN.name:
                    asm_str = "{} {}, sp, {}".format(asm_str, self.rd.name, self.get_imm())
                elif self.instr_name in [riscv_instr_name_t.C_LDSP.name, riscv_instr_name_t.C_LWSP.name, riscv_instr_name_t.C_LQSP.name]:
                    asm_str = "{} {}, {}(sp)".format(asm_str, self.rd.name, self.get_imm())
                else:
                    asm_str = "{} {}, {}".format(asm_str, self.rd.name, self.get_imm())
            elif self.format is riscv_instr_format_t.CL_FORMAT:
                asm_str = "{} {}, {} ({})".format(asm_str, self.rd.name, self.get_imm(), self.rs1.name)
            elif self.format is riscv_instr_format_t.CS_FORMAT:
                if self.category is riscv_instr_category_t.STORE:
                    asm_str = "{} {}, {} ({})".format(asm_str, self.rs2.name, self.get_imm(), self.rs1.name)
                else:
                    asm_str = "{} {}, {}".format(asm_str, self.rs1.name, self.rs2.name)
            elif self.format is riscv_instr_format_t.CA_FORMAT:
                asm_str = "{} {}, {}".format(asm_str, self.rd.name, self.rs2.name)
            elif self.format is riscv_instr_format_t.CB_FORMAT:
                asm_str = "{} {}, {}".format(asm_str, self.rs1.name, self.get_imm())
            elif self.format is riscv_instr_format_t.CSS_FORMAT:
                if self.category is riscv_instr_category_t.STORE:
                    asm_str = "{} {}, {} (sp)".format(asm_str, self.rs2.name, self.get_imm())
                else:
                    asm_str = "{} {}, {}".format(asm_str, self.rs2.name, self.get_imm())
            elif self.format is riscv_instr_format_t.CR_FORMAT:
                if self.instr_name in [riscv_instr_name_t.C_JR.name, riscv_instr_name_t.C_JALR.name]:
                    asm_str = "{} {}".format(asm_str, self.rs1.name)
                else:
                    asm_str = "{} {}, {}".format(asm_str, self.rd.name, self.rs2.name)
            elif self.format is riscv_instr_format_t.CJ_FORMAT:
                asm_str = "{} {}".format(asm_str, self.get_imm())
            else:
                logging.info("Unsupported format {}".format(self.format.name))
        else:
            # For EBREAK,C.EBREAK, making sure pc+4 is a valid instruction boundary
            # This is needed to resume execution from epc+4 after ebreak handling
            if self.instr_name is riscv_instr_name_t.C_EBREAK.name:
                asm_str = "c.ebreak;c.nop;"
            if self.comment != "":
                asm_str = asm_str + " #" + self.comment
        return asm_str.lower()

    # TODO
    def conver2bin(self, prefix=""):
    	pass

    # TODO
    def get_c_opcode(self):
    	pass

    # TOD0
    def get_func3(self):
    	pass
