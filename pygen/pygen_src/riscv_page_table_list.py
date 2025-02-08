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

# ----------------------------------------------------------------------------------------------
# Complete RISC-V page table generator
#
# This class is used to generate all the page tables and link them together.
# Below features are supported:
# - Multiple PTEs for each page table
# - Multiple tables at each level(except for root table)
# - Mixed leaf entry and non-leaf entry at any level
# - Allow injecting page table exceptions for any PTE
# ----------------------------------------------------------------------------------------------

import sys
import math
import logging
import argparse
import vsc
from importlib import import_module
from pygen_src.riscv_instr_pkg import (pkg_ins, mtvec_mode_t, f_rounding_mode_t,
                                       riscv_reg_t, privileged_mode_t,
                                       riscv_instr_group_t, data_pattern_t,
                                       riscv_instr_category_t, satp_mode_t,
                                       mem_region_t, vreg_init_method_t)


@vcs.randobj
class riscv_page_table_list():

    def __init__(self):
        self.PteSize   = rcs.XLEN / 8
        self.PteCnt    = 4096 / self.PteSize
        if satp_mode_t.MODE == satp_mode_t.SV32:
            self.PageLevel = 2
        elif satp_mode_t.MODE == satp_mode_t.SV39:
            self.PageLevel = 3
        else:
            self.PageLevel = 4
        self.LinkPtePerTable = 2
        self.SuperLeafPtePerTable = 2

        self.mode = satp_mode_t.MODE

        # NEED_TO_CHECK (from sv new function)
        default_page_table_setting()
        exception_cfg = riscv_page_table_exception_cfg()
        self.valid_leaf_pte = riscv_page_table_entry()
        self.valid_link_pte = riscv_page_table_entry()
        valid_data_leaf_pte = riscv_page_table_entry()
        illegal_pte = riscv_page_table_entry()

        # Privileged mode of the program
        self.privileged_mode = privileged_mode_t.USER_MODE

        # Starting physical address of the program.
        self.start_pa = 0x8000_0000

        # Num of page table per level
        self.num_of_page_table = vsc.uint32_t()

        # Page table list, from highest level to the lowest level
        self.page_table = []

        # Root page table PTE idx for the init code entry
        self.root_init_pte_idx = vsc.uint32_t()

        # Instruction generator configuration
        self.cfg = riscv_instr_gen_config

        # Allow exception or not
        self.enable_exception = self.argv.enable_exception
        self.exception_cfg = riscv_page_table_exception_cfg

        # Valid PTE entry for exception recovery
        self.valid_leaf_pte = []
        self.valid_link_pte = []
        self.valid_data_leaf_pte = []
        self.illegal_pte = []

        # Registers used for page table exception handling
        self.level_reg = vsc.rand_enum_t(riscv_reg_t)
        self.fault_vaddr_reg = vsc.rand_enum_t(riscv_reg_t)
        self.pte_addr_reg = vsc.rand_enum_t(riscv_reg_t)
        self.pte_reg = vsc.rand_enum_t(riscv_reg_t)
        self.tmp_reg = vsc.rand_enum_t(riscv_reg_t)
        self.mask_reg = vsc.rand_enum_t(riscv_reg_t)
        self.mpp_reg = vsc.rand_enum_t(riscv_reg_t)

    @vsc.constraint
    def page_table_exception_handling_reg_c(self):
        vsc.unique (self.level_reg, self.fault_vaddr_reg, self.pte_addr_reg,
                    self.pte_reg, self.tmp_reg, self.mask_reg, self.mpp_reg)
        not self.level_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))
        not self.fault_vaddr_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))
        not self.pte_addr_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))
        not self.pte_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))
        not self.mask_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))
        not self.mpp_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))
        not self.tmp_reg in vsc.rangelist(vsc.rng(cfg.reserved_regs, riscv_reg_t.ZERO))



  # To avoid large numbers of page tables, by default we limit the number of non-leaf PTE
  # at higher level. To be more specific, all PTEs of level 0 page table is leaf PTE. For
  # higher level page table, only PTE[0] and PTE[1] is non-leaf PTE, all other PTEs are leaf
  # PTE. All leaf PTE should have PPN map to the real physical address of the instruction
  # or data. For non-leaf PTE, the PPN should map to the physical address of the next PTE.
  # Take SV39 for example: (PteSize = 8B)
  # Table size is 4KB, PteSize=8B, entry count = 4K/8 = 512
  # Level 2: Root table, 2 entries, PTE[0] and PTE[1] is non-leaf PTE, PTE[2] is leaf PTE, all
  #          other PTEs are invalid, totalling 1 page table with 3 PTEs at this level.
  # Level 1: Two page tables, map to PTE[0] and PTE[1] of the root table.
  #          Each table has 512 entries, PTE[0], PTE[1] are non-leaf PTE, cover 4MB memory
  #          space. PTE[2:511] are leaf PTE, cover 510 * 2MB memory space.
  # Level 0: 4 page tables at this level(map to PTE[0] and PTE[1] of the previous level),
  #          each table has 512 leaf PTE.
  # In summary, 7(1+2+4) tables are needed for SV39.
  # Similarly, 3 (1+2) page tables for SV32, 15 (1 + 2 + 4 + 8) page tables for SV48.
  # Note:
  # - The number of randomization call is optimized to improve performance
  # - PPN assignment is done at program run time


    def randomize_page_table(self):
        self.pte_index = 0
        self.exception_cfg.enable_exception = self.enable_exception
        self.create_valid_pte()
        for i in range(list(self.page_table)):
            logging.info("Randomizing page table {}, num of PTE: {}".format(
                          i, self.page_table[i].pte.size()))
            if i == 0:
                self.pte_index = 0
            elif (self.page_table[i].level != self.page_table[i-1].level):
                self.pte_index = 0
            for j in range(len(self.page_table)):
                if self.page_table[i].level > 0:
                    # Superpage
                    if (j < self.LinkPtePerTable):
                    # First few super pages are link PTE to the next level
                    # $cast(self.page_table[i].pte[j], self.valid_link_pte.clone())
                    elif (j < self.SuperLeafPtePerTable + self.LinkPtePerTable):
                        # Non-link superpage table entry
                        # $cast(self.page_table[i].pte[j], self.valid_leaf_pte.clone())
                    else:
                        # Invalid unused PTEs
                        self.page_table[i].pte[j] = riscv_page_table_entry()
                        self.page_table[i].pte[j].v = 0
                else:
                    # Lowest level leaf pages
                    # $cast(self.page_table[i].pte[j], self.valid_leaf_pte.clone())
                if self.page_table[i].pte[j].xwr not self.NEXT_LEVEL_PAGE:
                    self.page_table[i].pte[j].set_ppn(self.start_pa, self.pte_index, self.page_table[i].level)
                self.pte_index++
                if self.enable_exception:
                    self.inject_page_table_exception(self.page_table[i].pte[j], self.page_table[i].level)
                self.page_table[i].pte[j].pack_entry()
                logging.info("{} PT_{}_{}: {}".format(privileged_mode.name(),
                                i, j, self.page_table[i].pte[j].convert2string()))


    # Create the basic legal page table entries
    def create_valid_pte(self):
        # Randomize a valid leaf PTE entry
        self.valid_leaf_pte.randomize(
        # Set the correct privileged mode
        if privileged_mode = privileged_mode_t.USER_MODE:
            u = 1
        else:
            # Accessing user mode page from supervisor mode is only allowed when MSTATUS.SUM and
            # MSTATUS.MPRV are both 1
            if not (cfg.mstatus_sum and cfg.mstatus_mprv):
                u == 0
        # Set a, d bit to avoid page/access fault exceptions
        a = 1
        d = 1
        # Default: Readable, writable, executable page
        soft xwr = R_W_EXECUTE_PAGE
        # Page is valid
        v = 1)
        self.illegal_pte.turn_off_default_constraint()
        self.valid_link_pte.xwr = self.NEXT_LEVEL_PAGE
        self.valid_link_pte.pack_entry()
        # Set data page to read/write, but not executable
        self.valid_data_leaf_pte.xwr = self.READ_WRITE_PAGE
        self.valid_data_leaf_pte.pack_entry()


    def inject_page_table_exception():
        self.exception_cfg.randomize()
        self.illegal_pte.randomize(
                                   xwr.not_inside(vsc.rangelist(self.NEXT_LEVEL_PAGE, R_W_EXECUTE_PAGE))
        # Wrong privilege mode setting
        if self.exception_cfg.allow_privileged_mode_exception:
            pte.u = not pte.u
        # Random access control
        # The link PTE is unchanged to avoid changing page table mappings
        if(self.exception_cfg.allow_page_access_control_exception and (pte.xwr not self.NEXT_LEVEL_PAGE)):
            pte.xwr = self.illegal_pte.xwr
        # Invalid page exception
        if self.exception_cfg.allow_invalid_page_exception:
            pte.v = 0
        # Set "access" bit to zero
        if self.exception_cfg.allow_zero_access_bit_exception:
            pte.a = 0
        # Set "dirty" bit to zero
        if self.exception_cfg.allow_zero_dirty_bit_exception:
            pte.d = 0
        # Unaligned super leaf PTE
        if (self.exception_cfg.allow_superpage_misaligned_exception and
            (level > 0) and (pte.xwr not self.NEXT_LEVEL_PAGE)):
            fault_ppn = vsc.rand_bit_t(VPN_WIDTH)
            fault_ppn.randomize()
            if level == 3:
                pte.ppn2 = fault_ppn
            elif level == 2:
                pte.ppn1 = fault_ppn
            else:
                pte.ppn0 = fault_ppn
        # Illegal link PTE for the lowest level page table
        if (self.exception_cfg.allow_leaf_link_page_exception and (level == 0)):
            pte.xwr = self.NEXT_LEVEL_PAGE

  # Page fault handling routine
  # There are two types of page fault handling routine.
  # 1. For page table error injection test, fix all PTE related to the virtual address by walking
  #    through the page table with the fault address.
  # 2. For normal test, a page table fault typically means the program is accessing a large
  #    virtual address which currently not mapped a valid physical address. Need to do a
  #    memcpy to move data from lower physical address to the place the virtual address map to.
  # TODO: Refactor this part with new reserved GPR

    def gen_page_fault_handling_routine(instr):
        level = 0
        load_store_unit = ""
        bit_mask = 1

        if satp_mode_t.MODE == satp_mode_t.SV48:
            load_store_unit = "d"
            level = 3
            bit_mask = bit_mask >> (rcs.RSVD_WIDTH + rcs.PPN3_WIDTH)
        elif satp_mode_t.MODE == satp_mode_t.SV39:
            load_store_unit = "d"
            level = 2
            bit_mask = bit_mask >> (rcs.RSVD_WIDTH + rcs.PPN2_WIDTH)
        elif satp_mode_t.MODE == satp_mode_t.SV32:
            load_store_unit = "w"
            level = 1
            bit_mask = bit_mask >> (rcs.PPN1_WIDTH)
        else:
            logging.critical("Unsupported MODE")

        if(cfg.mstatus_mprv and (rcs.SATP_MODE not satp_mode_t.BARE)):
            # Check if mstatus.mpp equals to machine mode(0x11)
            # If MPP != Machine_mode and MSTATUS.MPRV = 1, load/store address translation is the same as
            # the mode indicated by MPP
            instr.append("csrr x{}, {} // MSTATUS".format(self.mpp_reg, privilege_reg_t.MSTATUS))
            instr.append("srli x{}, x{}, 11".format(self.mpp_reg, self.mpp_reg))
            instr.append("andi x{}, x{}, 0x3".format(self.mpp_reg, self.mpp_reg))
            instr.append("xori x{}, x{}, 0x3".format(self.mpp_reg, self.mpp_reg))

        # Flush TLB to force synchronization
        instr.append("sfence.vma x0, x0")

        # Start from root level, top-down fix all related PTEs
        instr.append("li x{}, {}".format(self.level_reg, level))
        instr.append("li x{}, {}".format(self.mask_reg, bit_mask))
        # Get the address that causes the page fault
        instr.append("csrr x{}, {} # MTVAL".format(self.fault_vaddr_reg, MTVAL))
        # Remove lower 4KB offset
        instr.append("srli x{}, x{}, 12".format(self.fault_vaddr_reg, self.fault_vaddr_reg))
        # Remove the virtual address spare bits, align the VPN to the msb
        instr.append("slli x{}, x{}, {}".format(self.fault_vaddr_reg, self.fault_vaddr_reg,
                        riscv_page_table_entry()))

        # Starting from the root table
        instr.append("la x{}, page_table_0".format(self.pte_addr_reg))

        instr.append("fix_pte:")
        # Get the VPN of the current level
        # Note the VPN under process is on the msb, right shift rcs.XLEN - VPN_WIDTH to get the VPN value
        instr.append("srli x{}, x{}, {}".format(
                        self.tmp_reg, self.fault_vaddr_reg,
                        rcs.XLEN - riscv_page_table_entry()))
        # Get the actual address offset within the page table
        instr.append("slli x{}, x{}, {}".format(
                        self.tmp_reg, self.tmp_reg, $clog2(rcs.XLEN/8)))
        # Add page table starting address and PTE offset to get PTE physical address
        instr.append("add x{}, x{}, x{}".format(
                        self.pte_addr_reg, self.pte_addr_reg, self.tmp_reg))
        # Load the PTE from the memory
        instr.append("l{} x{}, 0(x{})".format(
                        load_store_unit, self.pte_reg, self.pte_addr_reg))
        # Check if the it's a link PTE (PTE[4:1] == 0)
        instr.append("slli x{}, x{}, {}".format(
                        self.tmp_reg, self.pte_reg, rcs.XLEN - 4))
        instr.append("srli x{}, x{}, {}".format(
                        self.tmp_reg, self.tmp_reg, rcs.XLEN - 3))
        instr.append("bne zero, x{}, fix_leaf_pte".format(self.tmp_reg))

        # Handle link PTE exceptions
        # - If level == 0, change the link PTE to leaf PTE, and finish exception handling
        instr.append("beq zero, x{}, fix_leaf_pte".format(self.level_reg))
        # - If level != 0, fix the link PTE, and move to the PTE it points to
        # - Override the low 10 bits with the correct link PTE setting
        instr.append("srli x{}, x{}, 10".format(self.pte_reg, self.pte_reg))
        instr.append("slli x{}, x{}, 10".format(self.pte_reg, self.pte_reg))
        instr.append("li x{}, {}".format(self.tmp_reg,self.valid_link_pte.bits))
        instr.append("or x{}, x{}, x{}".format(self.pte_reg, self.pte_reg, self.tmp_reg))
        instr.append("s{} x{}, 0(x{})".format(load_store_unit, self.pte_reg, self.pte_addr_reg))
        # - Zero out 10 lower access control bits
        instr.append("srli x{}, x{}, 10".format(self.pte_addr_reg, self.pte_reg))
        # - Left shift 12 bits to create the physical address
        instr.append("slli x{}, x{}, 12".format(self.pte_addr_reg, self.pte_addr_reg))
        # - Remove the VPN of the current level
        instr.append("slli x{}, x{}, {}".format(self.fault_vaddr_reg, self.fault_vaddr_reg,
                        riscv_page_table_entry()))
        # - Decrement the level, update the bit mask
        instr.append("addi x{}, x{}, -1".format(self.level_reg, self.level_reg))
        instr.append("srli x{}, x{}, {}".format(
                        self.mask_reg, self.mask_reg, riscv_page_table_entry()))
        # - Jump to fix the PTE of the next level
        instr.append("j fix_pte")

        # fix_leaf_pte: Override the low 10 bits with the correct leaf PTE setting
        instr.append("fix_leaf_pte:")
        # Use mask to zero out lower 10 bits and unaligned VPN
        instr.append("not x{}, x{}".format(self.mask_reg, self.mask_reg))
        instr.append("and x{}, x{}, x{}".format(self.pte_reg, self.pte_reg, self.mask_reg))
        instr.append("li x{}, {}".format(self.tmp_reg, self.valid_leaf_pte.bits))
        instr.append("or x{}, x{}, x{}".format(self.pte_reg, self.pte_reg, self.tmp_reg))
        instr.append("s{} x{}, 0(x{})".format(load_store_unit, self.pte_reg, self.pte_addr_reg))
        instr.append("j fix_kernel_leaf_pte")

        # Fix kernel leaf PTE
        instr.append("fix_kernel_leaf_pte:")
        # - Load the starting virtual address of the kernel space
        instr.append("la x{}, kernel_instr_start".format(self.tmp_reg))
        # TODO: Fix kernel instruction/data pages separatedly
        instr.append("slli x{}, x{}, {}".format(self.tmp_reg, self.tmp_reg,
                        rcs.XLEN - MAX_USED_VADDR_BITS))
        instr.append("srli x{}, x{}, {}".format(self.tmp_reg, self.tmp_reg,
                        rcs.XLEN - MAX_USED_VADDR_BITS))
        instr.append("csrr x{}, {} # MTVAL".format(self.fault_vaddr_reg, MTVAL))
        # - Check if the fault virtual address is in the kernel space
        instr.append("bgeu x{}, x{}, fix_pte_done".format(self.tmp_reg, self.fault_vaddr_reg))
        # - Set the PTE.u bit to 0 for kernel space PTE
        instr.append("li x{}, {}".format(self.tmp_reg, h10))
        instr.append("not x{}, x{}".format(self.tmp_reg, self.tmp_reg))
        instr.append("and x{}, x{}, x{}".format(self.pte_reg, self.tmp_reg, self.pte_reg))
        instr.append("s{} x{}, 0(x{})".format(load_store_unit, self.pte_reg, self.pte_addr_reg))

        # End of page table fault handling
        instr.append("fix_pte_done:")
        # Make sure all outstanding memory access is completed
        instr.append("sfence.vma")
        # Randomly decide if run some kernel program before exiting from exception handling
        # Use the low 2 bits of x30 to determine whether to skip it or not.
        instr.append("slli x30, x30, {}".format(rcs.XLEN - 2))
        instr.append("beqz x30, fix_pte_ret")
        # Randomly decide if set MPRV to 1
        instr.append("slli x31, x31, {}".format(rcs.XLEN - 2))
        instr.append("beqz x30, check_mprv")
        instr.append("csrr x{}, {}".format(self.tmp_reg, privilege_reg_t.MSTATUS))
        instr.append("li x{}, {}".format(self.mask_reg, MPRV_BIT_MASK))
        instr.append("not x{}, x{}".format(self.mask_reg, self.mask_reg))
        instr.append("or x{}, x{}, {}", self.tmp_reg, self.tmp_reg, self.mask_reg))
        instr.append("csrrw x{}, {}, x{}".format(self.tmp_reg, privilege_reg_t.MSTATUS, self.tmp_reg))
        # Run some kernel mode program before returning from exception handling
        # If MPRV = 0, jump to regular kernel mode program
        # If MPRV = 1, jump to kernel program with U mode mem load/store
        instr.append("check_mprv: li x{}, {}".format(self.mask_reg, MPRV_BIT_MASK))
        instr.append("csrr x{}, {}".format(self.tmp_reg, privilege_reg_t.MSTATUS))
        instr.append("and x{}, x{}, x{}".format(self.tmp_reg, self.tmp_reg, self.mask_reg))
        instr.append("beqz x{}, j_smode".format(self.tmp_reg))
        instr.append("jal ra, smode_lsu_program")
        instr.append("j fix_pte_ret")
        instr.append("j_smode: jal ra, smode_program")
        instr.append("fix_pte_ret:")
        # Recover the user mode GPR from kernal stack
        pop_gpr_from_kernel_stack(privilege_reg_t.MSTATUS, privilege_reg_t.MSCRATCH, cfg.mstatus_mprv, cfg.sp, cfg.tp, instr)
        instr.append("mret")

        for i in range(len(instr)):
            instr[i] = instr[i].tolower()


    def default_page_table_setting(self):
        num_of_page_table = new[self.PageLevel]
        for i in range(len(num_of_page_table):
            num_of_page_table[i] = self.LinkPtePerTable ** (self.PageLevel - i - 1)

    def create_page_table_list(self):
        self.page_table = new[num_of_page_table.sum()]
        for i in range(len(self.page_table):
            self.page_table[i] = riscv_page_table()
            self.page_table[i].init_page_table(PteCnt)
            self.page_table[i].table_id = i
            self.page_table[i].level = get_level(i)

    def get_1st_4k_table_id(self):
        for i in range(len(self.page_table)):
            if self.page_table[i].level == 0:
                return i
        return -1

    # Link page table
    def process_page_table(output string instr[$]):
        load_store_unit = ""
        pte_addr_offset = 0
        ubit_mask = vsc.rand_bit_t(rcs.XLEN - 1)
        ubit_mask[4] = 0 # U bit of PTE
        if rcs.XLEN == 32:
            load_store_unit = "w"
        else:
            load_store_unit = "d"
        # Assign the PPN of link PTE to link the page tables together
        for i in range(len(self.page_table)):
            if self.page_table[i].level == 0
                break
            instr.extend("la x{}, page_table_{}+2048 # Process PT_{}".format(
                                    cfg.gpr[1], i, i))
            for i in range(len(self.page_table[i].pte[j]):
                if j >= self.SuperLeafPtePerTable:
                    continue
            pte_addr_offset = (j * self.PteSize) - 2048
            logging.info("Processing PT_{}_PTE_{}, v = {}, level = {}".format(
                            i, j, self.page_table[i].pte[j].v, self.page_table[i].level))
            if self.page_table[i].pte[j].xwr == self.NEXT_LEVEL_PAGE:
                # Use the target table address as PPN of this PTE
                # x{} holds the target table physical address
                instr.extend(
                       # Load the current PTE value
                       ("l{} x{}, {}(x{})".format(
                           load_store_unit, cfg.gpr[2], pte_addr_offset, cfg.gpr[1])),
                       # Load the target page table physical address, PPN should be 0
                       ("la x{}, page_table_{} # Link PT_{}_PTE_{} -> PT_{}".format( cfg.gpr[0],
                           get_child_table_id(i, j), i, j, get_child_table_id(i, j))),
                       # Right shift the address for 2 bits to the correct PPN position in PTE
                       ("srli x{}, x{}, 2".format( cfg.gpr[0], cfg.gpr[0])),
                       # Assign PPN
                       ("or x{}, x{}, x{}".format( cfg.gpr[2], cfg.gpr[0], cfg.gpr[2])),
                       # Store the new PTE value
                       ("s{} x{}, {}(x{})".format(
                           load_store_unit, cfg.gpr[2], pte_addr_offset, cfg.gpr[1])))
        # ---------------------------------------------------------------------------
        # Set the kernel page u bit to 0 for supervisor mode instruction/data pages
        # ---------------------------------------------------------------------------
        if cfg.support_supervisor_mode:
          instr.extend(
                   # Process kernel instruction pages
                   ("la x{}, kernel_instr_start".format(cfg.gpr[0])),
                   ("la x{}, kernel_instr_end".format(cfg.gpr[1])),
                   # Get the VPN of the physical address
                   ("slli x{}, x{}, {}".format(
                             cfg.gpr[0], cfg.gpr[0], rcs.XLEN - pkg_ins.MAX_USED_VADDR_BITS)),
                   ("srli x{}, x{}, {}".format(
                             cfg.gpr[0], cfg.gpr[0], rcs.XLEN - pkg_ins.MAX_USED_VADDR_BITS + 12)),
                   ("slli x{}, x{}, {}".format(cfg.gpr[0], cfg.gpr[0], $clog2(rcs.XLEN))),
                   ("slli x{}, x{}, {}".format(cfg.gpr[1], cfg.gpr[1],
                             rcs.XLEN - pkg_ins.MAX_USED_VADDR_BITS)),
                   ("srli x{}, x{}, {}".format(cfg.gpr[1], cfg.gpr[1],
                             rcs.XLEN - pkg_ins.MAX_USED_VADDR_BITS + 12)),
                   ("slli x{}, x{}, {}".format(cfg.gpr[1], cfg.gpr[1], $clog2(rcs.XLEN))),
                   # Starting from the first 4KB leaf page table
                   ("la x{}, page_table_{}".format(cfg.gpr[2], get_1st_4k_table_id())),
                   ("add x{}, x{}, x{}".format(cfg.gpr[0], cfg.gpr[2], cfg.gpr[0])),
                   ("add x{}, x{}, x{}".format(cfg.gpr[1], cfg.gpr[2], cfg.gpr[1])),
                   ("li x{}, {}".format(cfg.gpr[2], ubit_mask)),
                   "1:",
                   # Load the PTE from the memory
                   ("l{} x{}, 0(x{})".format(load_store_unit, cfg.gpr[3], cfg.gpr[0])),
                   # Unset U bit
                   ("and x{}, x{}, x{}".format(cfg.gpr[3], cfg.gpr[3], cfg.gpr[2])),
                   # Save PTE back to memory
                   ("s{} x{}, 0(x{})".format(load_store_unit, cfg.gpr[3], cfg.gpr[0])),
                   # Move to the next PTE
                   ("addi x{}, x{}, {}".format(cfg.gpr[0], cfg.gpr[0], rcs.XLEN/8)),
                   # If not the end of the kernel space, process the next PTE
                   ("ble x{}, x{}, 1b".format(cfg.gpr[0], cfg.gpr[1])),
                   # Process kernel data pages
                   ("la x{}, kernel_data_start".format(cfg.gpr[0])),
                   # Get the VPN of the physical address
                   ("slli x{}, x{}, {}".format(cfg.gpr[0], cfg.gpr[0],
                             rcs.XLEN - pkg_ins.MAX_USED_VADDR_BITS)),
                   ("srli x{}, x{}, {}".format(cfg.gpr[0], cfg.gpr[0],
                             rcs.XLEN - pkg_ins.MAX_USED_VADDR_BITS + 12)),
                   ("slli x{}, x{}, {}".format(cfg.gpr[0], cfg.gpr[0], $clog2(rcs.XLEN))),
                   # Starting from the first 4KB leaf page table
                   ("la x{}, page_table_{}".format(cfg.gpr[2], get_1st_4k_table_id())),
                   ("add x{}, x{}, x{}".format(cfg.gpr[0], cfg.gpr[2], cfg.gpr[0])),
                   ("li x{}, {}".format(cfg.gpr[2], ubit_mask)),
                   # Assume 20 PTEs for kernel data pages
                   ("addi x{}, x{}, {}".format(cfg.gpr[1], cfg.gpr[1], 20 * rcs.XLEN/8)),
                   "2:",
                   # Load the PTE from the memory
                   ("l{} x{}, 0(x{})".format(load_store_unit, cfg.gpr[3], cfg.gpr[0])),
                   # Unset U bit
                   ("and x{}, x{}, x{}".format(cfg.gpr[3], cfg.gpr[3], cfg.gpr[2])),
                   # Save PTE back to memory
                   ("s{} x{}, 0(x{})".format(load_store_unit, cfg.gpr[3], cfg.gpr[0])),
                   # Move to the next PTE
                   ("addi x{}, x{}, {}".format(cfg.gpr[0], cfg.gpr[0], rcs.XLEN/8)),
                   # If not the end of the kernel space, process the next PTE
                   ("ble x{}, x{}, 2b".format(cfg.gpr[0], cfg.gpr[1])))
        instr.extend("sfence.vma")

    # If you want to create custom page table topology, override the below tasks to specify the
    # level and parent of each table.
    def get_level(self):
        for level in range(self.PageLevel):
            if table_id < num_of_page_table[level]:
                return level
                table_id -= num_of_page_table[level]

    def get_child_table_id(table_id, pte_id)
        return table_id * self.LinkPtePerTable + pte_id + 1
