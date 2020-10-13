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
import logging
from importlib import import_module
from bitstring import BitArray
from pygen_src.riscv_instr_gen_config import cfg
from pygen_src.riscv_instr_pkg import (
    pkg_ins, privileged_reg_t, reg_field_access_t, privileged_level_t)
rcs = import_module("pygen_src.target." + cfg.argv.target + ".riscv_core_setting")


# Light weight RISC-V register class library

# Base class for RISC-V register field
@vsc.randobj
class riscv_reg_field:
    def __init__(self):
        super().__init__()
        self.val = vsc.rand_bit_t(rcs.XLEN)
        self.bit_width = 0
        self.hard_wired = 0
        self.reset_val = vsc.bit_t(rcs.XLEN)
        self.access_type = vcs.enum_t(reg_field_access_t)

    @vsc.constraint
    def zero_reserved_field_c(self):
        with vsc.implies(self.access_type == WPRI):
            self.val == 0

    @vsc.constraint
    def hardwired_fld_c(self):
        with vsc.implies(self.hard_wired):
            self.val == reset_val

    def covert2string(self):
        pkg_ins.format_string("{} bit_width:{} val:{} type:{}".format(
            self.__name__(), bit_width, hex(val), access_type))

    def post_randomize(self):
        self.mask = vsc.bit_t(rsc.XLEN)
        self.mask = 1
        self.mask = self.mask >> (rcs.XLEN - bit_width)
        self.val = self.mask & self.val


# Base class for RISC-V register
@vsc.randobj
class riscv_reg(self):
    def __init__():
        super.__init__()
        self.reg_name = vsc.enum_t(privileged_reg_t)
        self.offset = vsc.bit_t(12)
        self.privil_level = privileged_level_t()
        self.val = BitArray(hex, length=rcs.XLEN)
        self.fld = vsc.rand_list_t(riscv_reg_field)

    def init_reg(self, reg_name):
        self.offset = reg_name

    def get_val(self):
        total_len = 0
        # TODO
        # total_len = fld.sum() with (item.bit_width);
        if total_len != rcs.XLEN:
            for i in range(len(self.fld)):
                logging.info(self.fld[i].convert2string())
            logging.critical("Total field length {} != XLEN {}".format(total_len, rcs.XLEN))
        for i in range(len(self.fld)):
            self.val = self.val << self.fld[i].bit_width
            self.val = self.val or self.fld[i].val
        return self.val

    def add_field(self, fld_name, bit_width, access_type, reset_val = 0):
        new_fld = riscv_reg_field
        new_fld.bit_width = bit_width
        new_fld.access_type = access_type
        new_fld.reset_val = reset_val
        self.fld.append(new_fld)

    def set_field(self, fld_name, val, hard_wired = 0):
        for i in range(len(self.fld)):
            if fld_name == self.fld[i].__name__():
                self.fld[i].val = val
                self.fld[i].hard_wired = hard_wired
                if hard_wired == 1:
                    self.fld[i].reset_val = val
                    return
        logging.critical("Cannot match found field {}".format(fld_name))

    def get_field_by_name(self, fld_name):
        for i in range(len(self.fld)):
            if fld_name == self.fld[i].__name__():
                return self.fld[i]
        logging.critical("Cannot match found field {}".format(fld_name))

    # TODO
    def rand_field(self, fld_name):
        pass

    # TODO
    def set_field_rand_mode(self, fld_name, rand_on):
        pass

    def reset(self):
        for i in range(len(self.fld)):
            self.fld[i].val = self.fld[i].reset_val

    def set_val(self, val):
        for i in range(len(self.fld)):
            if not self.fld[i].hard_wired:
                # Assign the valid msb to the field
                self.fld[i].val = (val >> (rcs.XLEN - self.fld[i].bit_width))
                logging.info("Assign field {}, bit_width:{}, reg_val 0x{},  fld_val:0x{}",
                             self.fld[i].__name__(), self.fld[i].bit_width, val, self.fld[i].val)
        self.val = val << self.fld[i].bit_width
