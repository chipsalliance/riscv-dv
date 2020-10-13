"""
 Copyright 2018 Google LLC
 
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

# RISC-V privileged register class

import logging
from importlib import import_module
from pygen_src.riscv_instr_pkg import privileged_reg_t, reg_field_access_t
from pygen_src.riscv_reg import riscv_reg
from pygen_src.riscv_instr_gen_config import riscv_instr_gen_config

rcs = import_module("pygen_src.target." + cfg.argv.target + ".riscv_core_setting")

class riscv_privil_reg(riscv_reg):
    def __init__(self):
        super().__init__()

    def init_reg(self, reg_name):
        super().init_reg(reg_name)
        ##############Match mode register################
        #Machine status Register
        if(reg_name == privileged_reg_t.MSTATUS):
            self.privil_level = privileged_reg_t.M_LEVEL
            self.add_field("UIE", 1, reg_field_access_t.WARL)
            self.add_field("SIE", 1, reg_field_access_t.WARL)
            self.add_field("WPRI0", 1, reg_field_access_t.WPRI)
            self.add_field("MIE", 1, reg_field_access_t.WARL)
            self.add_field("UPIE", 1, reg_field_access_t.WARL)
            self.add_field("SPIE", 1, reg_field_access_t.WARL)
            self.add_field("WPRI1", 1, reg_field_access_t.WPRI)
            self.add_field("MPIE", 1, reg_field_access_t.WARL)
            self.add_field("SPP", 1, reg_field_access_t.WLRL)
            self.add_field("VS", 2, reg_field_access_t.WARL)
            self.add_field("MPP", 2, reg_field_access_t.WLRL)
            self.add_field("FS", 2, reg_field_access_t.WARL)
            self.add_field("XS", 2, reg_field_access_t.WARL)
            self.add_field("MPRV", 1, reg_field_access_t.WARL)
            self.add_field("SUM", 1, reg_field_access_t.WARL)
            self.add_field("MXR", 1, reg_field_access_t.WARL)
            self.add_field("TVM", 1, reg_field_access_t.WARL)
            self.add_field("TW", 1, reg_field_access_t.WARL)
            self.add_field("TSR", 1, reg_field_access_t.WARL)
            if(rcs.XLEN == 32):
                self.add_field("WPRI3", 8, reg_field_access_t.WPRI)
            else:
                self.add_field("WPRI3", 9, reg_field_access_t.WPRI)
                self.add_field("UXL", 2, reg_field_access_t.WARL)
                self.add_field("SXL", 2, reg_field_access_t.WARL)
                self.add_field("WPRI4", rcs.XLEN - 37, reg_field_access_t.WPRI)
            self.add_field("SD", 1, reg_field_access_t.WARL)
        # Machine interrupt-enable register
        elif(reg_name == privileged_reg_t.MIE):
            self.privil_level = privileged_reg_t.M_LEVEL
            self.add_field("USIE", 1, reg_field_access_t.WARL)
            self.add_field("SSIE", 1, reg_field_access_t.WARL)
            self.add_field("WPRI0", 1, reg_field_access_t.WPRI)
            self.add_field("MSIE", 1, reg_field_access_t.WARL)
            self.add_field("UTIE", 1, reg_field_access_t.WARL)
            self.add_field("STIE", 1, reg_field_access_t.WARL)
            self.add_field("WPRI1", 1, reg_field_access_t.WPRI)
            self.add_field("MTIE", 1, reg_field_access_t.WARL)
            self.add_field("UEIE", 1, reg_field_access_t.WARL)
            self.add_field("SEIE", 1, reg_field_access_t.WARL)
            self.add_field("WPEI2", 1, reg_field_access_t.WPRI)
            self.add_field("MEIE", 1, reg_field_access_t.WARL)
            self.add_field("WPRI3", rcs.XLEN - 12, reg_field_access_t.WPRI)
        else:
            logging.error("reg %0s is not supported yet", reg_name.name)
