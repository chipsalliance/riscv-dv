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

import math
import logging
import vsc
from importlib import import_module
from pygen_src.isa.riscv_instr import riscv_instr
from pygen_src.riscv_instr_pkg import (pkg_ins, riscv_instr_category_t, riscv_reg_t,
                                       riscv_instr_name_t, riscv_instr_group_t,
                                       riscv_instr_format_t)
from pygen_src.riscv_instr_gen_config import cfg
rcs = import_module("pygen_src.target." + cfg.argv.target + ".riscv_core_setting")


@vsc.randobj
class riscv_b_instr(riscv_instr):
    def __init__(self):
        super().__init__()
        self.rs3 = vsc.rand_enum_t(riscv_reg_t)
        self.has_rs3 = vsc.bit_t(1)

    def set_rand_mode(self):
        super().set_rand_mode()
        self.has_rs3 = 0
        if self.format == riscv_instr_format_t.R_FORMAT:
            if self.instr_name in [riscv_instr_name_t.BMATFLIP, riscv_instr_name_t.CRC32_B,
                                   riscv_instr_name_t.CRC32_H, riscv_instr_name_t.CRC32_W,
                                   riscv_instr_name_t.CRC32C_B, riscv_instr_name_t.CRC32C_H,
                                   riscv_instr_name_t.CRC32C_W, riscv_instr_name_t.CRC32_D]:
                self.has_rs2 = 0
        elif self.format == riscv_instr_format_t.R4_FORMAT:
            self.has_imm = 0
            self.has_rs3 = 1
        elif self.format == riscv_instr_format_t.I_FORMAT:
            self.has_rs2 = 0
            if self.instr_name in [riscv_instr_name_t.FSRI, riscv_instr_name_t.FSRIW]:
                self.has_rs3 = 1

    def pre_randomize(self):
        super().pre_randomize()
        with vsc.raw_mode():
            self.rs3.rand_mode = bool(self.has_rs3)

    def set_imm_len(self):
        if self.format == riscv_instr_format_t.I_FORMAT:
            if self.category in [riscv_instr_category_t.SHIFT, riscv_instr_category_t.LOGICAL]:
                self.imm_len = math.ceil(math.log2(rcs.XLEN))
            # ARITHMETIC RV32B
            if self.instr_name in [riscv_instr_name_t.SHFLI, riscv_instr_name_t.UNSHFLI]:
                self.imm_len = math.ceil(math.log2(rcs.XLEN)) - 1
                self.imm_mask = self.imm_mask << self.imm_len

    # Convert the instruction to assembly code
    def convert2asm(self, prefix = " "):
        asm_str_final = ""
        asm_str = pkg_ins.format_string(self.get_instr_name(), pkg_ins.MAX_INSTR_STR_LEN)
        if self.format == riscv_instr_format_t.I_FORMAT:
            if self.instr_name in [riscv_instr_name_t.FSRI,
                                   riscv_instr_name_t.FSRIW]:  # instr rd, rs1, rs3, imm
                asm_str_final = "{}{}, {}, {}, {}".format(asm_str, self.rd.name, self.rs1.name,
                                                          self.rs3.name, self.get_imm())
        elif self.format == riscv_instr_format_t.R_FORMAT:   # instr rd, rs1
            if not self.has_rs2:
                asm_str_final = "{}{}, {}".format(asm_str, self.rd.name, self.rs1.name)

        elif self.format == riscv_instr_format_t.R4_FORMAT:  # instr rd, rs1, rs2, rs3
            asm_str_final = "{}{}, {}, {}, {}".format(asm_str, self.rd.name, self.rs1.name,
                                                      self.rs2.name, self.rs3.name)
        else:
            logging.info("Unsupported format {}".format(self.format))
        if asm_str_final == "":
            return super().convert2asm(prefix)

        if self.comment != "":
            asm_str_final = asm_str_final + " #" + self.comment
        return asm_str_final.lower()

    def is_supported(self, cfg):
        return (cfg.enable_b_extension and
                ("ZBP" in cfg.enable_bitmanip_groups and self.instr_name.name in
                 ["GREV", "GREVW", "GREVI", "GREVIW", "GORC", "GORCW", "GORCI",
                  "GORCIW", "SHFL", "SHFLW", "UNSHFL", "UNSHFLW", "SHFLI", "UNSHFLI",
                  "XPERM_N", "XPERM_B", "XPERM_H", "XPERM_W", "SLO", "SLOW", "SLOI",
                  "SLOIW", "SRO", "SROW", "SROI", "SROIW"]) or
                ("ZBE" in cfg.enable_bitmanip_groups and self.instr_name.name in
                 ["BCOMPRESS", "BCOMPRESSW", "BDECOMPRESS", "BDECOMPRESSW"]) or
                ("ZBF" in cfg.enable_bitmanip_groups and self.instr_name.name in
                 ["BFP", "BFPW"]) or
                ("ZBR" in cfg.enable_bitmanip_groups and self.instr_name in
                 ["CRC32_B", "CRC32_H", "CRC32_W", "CRC32_D",
                  "CRC32C_B", "CRC32C_H", "CRC32C_W", "CRC32C_D"]) or
                ("ZBM" in cfg.enable_bitmanip_groups and self.instr_name.name in
                 ["BMATOR", "BMATXOR", "BMATFLIP"
                  ]) or
                ("ZBT" in cfg.enable_bitmanip_groups and self.instr_name.name in
                 ["CMOV", "CMIX", "FSL", "FSLW", "FSR", "FSRW", "FSRI", "FSRIW"]))

    # Coverage related functions
    def update_src_regs(self, operands):
        # TODO
        pass
