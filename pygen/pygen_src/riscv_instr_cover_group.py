"""Copyright 2020 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""

import vsc
from pygen.pygen_src.riscv_instr_pkg import *
from pygen.pygen_src.isa.riscv_cov_instr import *


class riscv_instr_cover_group:
    def __init__(self):
        self.pre_instr = riscv_cov_instr()
        self.cfg = None
        self.instr_list = []
        self.instr_cnt = 0
        self.branch_instr_cnt = 0
        self.branch_hit_history = vsc.bit_t(5)  # The last 5 branch result
        self.ignored_exceptions = []
        self.exception_list = []
        ''' 
        Mode of the coverage model:
        In complicance mode, all the micro-architecture related covergroups 
        are removed. Only the ones related to RISC-V specification compliance 
        is sampled.
        '''
        self.compliance_mode = vsc.bit_t(1)
        self.select_isa = vsc.bit_t(1)  # Select an ISA extension to cover
        self.cov_isa = None

    @vsc.covergroup
    class r_instr_cg(object):
        def __init__(self, instr):
            super().__init__()

            self.cp_rs1 = vsc.coverpoint(instr.rs1, cp_t=vsc.enum_t(riscv_reg_t))
            self.cp_rs2 = vsc.coverpoint(instr.rs2, cp_t=vsc.enum_t(riscv_reg_t))
            self.cp_rd = vsc.coverpoint(instr.rd, cp_t=vsc.enum_t(riscv_reg_t))
            self.cp_rs1_sign = vsc.coverpoint(instr.rs1_sign, cp_t=vsc.enum_t(operand_sign_e))
            self.cp_rs2_sign = vsc.coverpoint(instr.rs2_sign, cp_t=vsc.enum_t(operand_sign_e))
            self.cp_rd_sign = vsc.coverpoint(instr.rd_sign, cp_t=vsc.enum_t(operand_sign_e))
            self.cp_gpr_hazard = vsc.coverpoint(instr.gpr_hazard, cp_t=vsc.enum_t(hazard_e))

    @vsc.covergroup
    class add_cg(r_instr_cg):
        def __init__(self, instr):
            super().__init__(instr)

            self.cp_sign_cross = vsc.cross([self.cp_rs1_sign, self.cp_rs2_sign, self.cp_rd_sign])

    @vsc.covergroup
    class sub_cg(r_instr_cg):
        def __init__(self, instr):
            super().__init__(instr)

            self.cp_sign_cross = vsc.cross([self.cp_rs1_sign, self.cp_rs2_sign, self.cp_rd_sign])

    @vsc.covergroup
    class addi_cg(object):
        def __init__(self, instr):
            super().__init__()

            self.cp_rs1 = vsc.coverpoint(instr.rs1, cp_t=vsc.enum_t(riscv_reg_t))
            # TODO: ignore bins isn't yet supported; exclude ZERO
            self.cp_rd = vsc.coverpoint(instr.rd, cp_t=vsc.enum_t(riscv_reg_t))
            self.cp_rs1_sign = vsc.coverpoint(instr.rs1_sign, cp_t=vsc.enum_t(operand_sign_e))
            self.cp_rd_sign = vsc.coverpoint(instr.rd_sign, cp_t=vsc.enum_t(operand_sign_e))
            self.cp_imm_sign = vsc.coverpoint(instr.imm_sign, cp_t=vsc.enum_t(operand_sign_e))
            self.cp_gpr_hazard = vsc.coverpoint(instr.gpr_hazard, cp_t=vsc.enum_t(hazard_e))
            self.cp_sign_cross = vsc.cross([self.cp_rs1_sign, self.cp_imm_sign, self.cp_rd_sign])

    def sample(self, instr):
        pass
