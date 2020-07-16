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

import logging
import sys
import vsc
from bitstring import BitArray
from pygen_src.riscv_instr_pkg import mtvec_mode_t, f_rounding_mode_t, \
    riscv_reg_t, privileged_mode_t, \
    riscv_instr_group_t
from pygen_src.target.rv32i import riscv_core_setting as rcs


@vsc.randobj
class riscv_instr_gen_config:
    def __init__(self):
        # TODO Support for command line argument
        self.main_program_instr_cnt = 100  # count of main_prog
        self.sub_program_instr_cnt = []  # count of sub_prog
        self.debug_program_instr_cnt = 0  # count of debug_rom
        self.debug_sub_program_instr_cnt = []  # count of debug sub_progrms
        # Commenting out for now
        # self.data_page_pattern = list(
        # map(lambda dta_pg: dta_pg.name, data_pattern_t))
        # dicts for exception_cause_t & interrupt_cause_t Enum classes

        self.m_mode_exception_delegation = {}
        self.s_mode_exception_delegation = {}
        self.m_mode_interrupt_delegation = {}
        self.s_mode_interrupt_delegation = {}

        # init_privileged_mode default to MACHINE_MODE
        self.init_privileged_mode = privileged_mode_t.MACHINE_MODE

        self.mstatus = BitArray(bin(0b0), length=rcs.XLEN - 1)
        self.mie = BitArray(bin(0b0), length=rcs.XLEN - 1)
        self.sstatus = BitArray(bin(0b0), length=rcs.XLEN - 1)
        self.sie = BitArray(bin(0b0), length=rcs.XLEN - 1)
        self.ustatus = BitArray(bin(0b0), length=rcs.XLEN - 1)
        self.uie = BitArray(bin(0b0), length=rcs.XLEN - 1)

        self.mstatus_mprv = 0
        self.mstatus_mxr = 0
        self.mstatus_sum = 0
        self.mstatus_tvm = 0
        self.mstatus_fs = BitArray(bin(0b0), length=2)
        self.mstatus_vs = BitArray(bin(0b0), length=2)
        self.mtvec_mode = vsc.rand_enum_t(mtvec_mode_t)

        self.tvec_alignment = 2

        self.fcsr_rm = list(map(lambda csr_rm: csr_rm.name, f_rounding_mode_t))
        self.enable_sfence = 0
        self.gpr = vsc.rand_list_t(vsc.enum_t(riscv_reg_t), sz =4)
        self.scratch_reg = vsc.rand_enum_t(riscv_reg_t)
        self.pmp_reg = vsc.rand_enum_t(riscv_reg_t)
        self.sp = vsc.rand_enum_t(riscv_reg_t)
        self.tp = vsc.rand_enum_t(riscv_reg_t)
        self.ra = vsc.rand_enum_t(riscv_reg_t)
        self.check_misa_init_val = 0
        self.check_xstatus = 1
        self.virtual_addr_translation_on = 0

        # Commenting out for now
        # vector_cfg = riscv_vector_cfg # TODO
        # pmp_cfg = riscv_pmp_cfg  # TODO
        # self.mem_region = [] # TODO
        # Self.amo_region = [] # TODO

        self.stack_len = 5000

        # Self.s_mem_region = [] # TODO

        self.kernel_stack_len = 4000
        self.kernel_program_instr_cnt = 400
        # list of main implemented CSRs
        self.invalid_priv_mode_csrs = []
        self.num_of_sub_program = 5
        self.instr_cnt = 200
        self.num_of_tests = 1
        self.no_data_page = 0
        self.no_branch_jump = 1
        self.no_load_store = 0
        self.no_csr_instr = 0
        self.no_ebreak = 1
        self.no_dret = 1
        self.no_fence = 1
        self.no_wfi = 1
        self.enable_unaligned_load_store = 0
        self.illegal_instr_ratio = 0
        self.hint_instr_ratio = 0
        self.num_of_harts = rcs.NUM_HARTS
        self.fix_sp = 0
        self.use_push_data_section = 0
        self.boot_mode_opts = ""
        self.enable_page_table_exception = 0
        self.no_directed_instr = 0
        self.asm_test_suffix = ""
        self.enable_interrupt = 0
        self.enable_nested_interrupt = 0
        self.enable_timer_irq = 0
        self.bare_program_mode = 0
        self.enable_illegal_csr_instruction = 0
        self.enable_access_invalid_csr_level = 0
        self.enable_misaligned_instr = 0
        self.enable_dummy_csr_write = 0
        self.randomize_csr = 0
        self.allow_sfence_exception = 0
        self.no_delegation = 1
        self.force_m_delegation = 0
        self.force_s_delegation = 0
        self.support_supervisor_mode = 0
        self.disable_compressed_instr = 0
        self.signature_addr = 0xdeadbeef
        self.require_signature_addr = 0
        self.gen_debug_section = 0
        self.enable_ebreak_in_debug_rom = 0
        self.set_dcsr_ebreak = 0
        self.num_debug_sub_program = 0
        self.enable_debug_single_step = 0
        self.single_step_iterations = 0
        self.set_mstatus_tw = 0
        self.set_mstatus_mprv = 0
        self.min_stack_len_per_program = 10 * (rcs.XLEN / 8)
        self.max_stack_len_per_program = 16 * (rcs.XLEN / 8)
        self.max_branch_step = 20
        self.max_directed_instr_stream_seq = 20
        self.reserved_regs = vsc.list_t(vsc.enum_t(riscv_reg_t))
        self.enable_floating_point = 0
        self.enable_vector_extension = 0
        self.enable_b_extension = 0
        # Commenting out for now
        # self.enable_bitmanip_groups = ['ZBB', 'ZBS', 'ZBP', 'ZBE', 'ZBF',
        # 'ZBC', 'ZBR', 'ZBM', 'ZBT', 'ZB_TMP']
        self.dist_control_mode = 0
        self.category_dist = {}

    @vsc.constraint
    def gpr_c(self):
        pass  # TODO

    def check_setting(self):
        support_64b = 0
        support_128b = 0

        # list of satp_mode_t from riscv_core_setting.py
        stp_md_lst = rcs.SATP_MODE

        # list of riscv_instr_group_t with names of riscv_instr_name_t in it.
        supported_isa_lst = list(map(lambda z: z.name, riscv_instr_group_t))

        # check the valid isa support
        for x in rcs.supported_isa:
            if x == (supported_isa_lst[1] or supported_isa_lst[3] or supported_isa_lst[5] or
                     supported_isa_lst[8] or supported_isa_lst[11] or supported_isa_lst[13] or
                     supported_isa_lst[19]):
                support_64b = 1
                logging.info("support_64b=%d" % support_64b)
                logging.debug("Supported ISA=%s" % x)
            elif x == (supported_isa_lst[14] or supported_isa_lst[15]):
                support_128b = 1
                logging.info("support_128b=%d" % support_128b)
                logging.debug("Supported ISA=%s" % x)

        if (support_128b == 1) and (rcs.XLEN != 128):
            logging.critical("XLEN should be set to 128 based on \
                              riscv_core_setting.supported_isa setting")
            logging.info("XLEN Value=%d" % rcs.XLEN)
            sys.exit("XLEN is not equal to 128, set it Accordingly!")

        if (support_128b == 0) and (support_64b == 1) and (rcs.XLEN != 64):
            logging.critical("XLEN should be set to 64 based on \
                              riscv_core_setting.supported_isa setting")
            logging.info("XLEN Value=%d" % rcs.XLEN)
            sys.exit("XLEN is not equal to 64, set it Accordingly!")

        if not(support_128b or support_64b) and (rcs.XLEN != 32):
            logging.critical("XLEN should be set to 32 based on \
                              riscv_core_setting.supported_isa setting")
            logging.info("XLEN Value=%d" % rcs.XLEN)
            sys.exit("XLEN is not equal to 32, set it Accordingly!")

        if not(support_128b or support_64b) and not(('SV32' in stp_md_lst) or
                                                    ('BARE' in stp_md_lst)):
            logging.critical("SATP mode is not supported for RV32G ISA")
            logging.info(stp_md_lst)
            sys.exit("Supported SATP mode is not provided")

    # TODO
    def setup_instr_distribution(self):
        pass

    def init_delegation(self):
        for i in self.mode_exp_lst:
            if i == self.mode_exp_lst[0]:
                continue
            self.m_mode_exception_delegation[i] = 0
            self.s_mode_exception_delegation[i] = 0

        for j in self.mode_intrpt_lst:
            if j == self.mode_intrpt_lst[0]:
                continue
            self.m_mode_interrupt_delegation[j] = 0
            self.s_mode_interrupt_delegation[j] = 0

    def pre_randomize(self):
        for x in rcs.supported_privileged_mode:
            if(x == "SUPERVISOR_MODE"):
                self.support_supervisor_mode = 1

    def get_non_reserved_gpr(self):
        pass

    def post_randomize(self):
        self.reserved_regs.append(self.tp)
        self.reserved_regs.append(self.sp)
        self.reserved_regs.append(self.scratch_reg)
        self.min_stack_len_per_program = 2 * (rcs.XLEN / 8)
        logging.info("min_stack_len_per_program value = %d"
                     % self.min_stack_len_per_program)
        self.check_setting()  # to check the setting is legal

        # TODO, Need to change the logic once the constraints are up.
        if "USER_MODE" == self.init_privileged_mode:
            logging.info("mode=%s" % "USER_MODE")
            self.no_wfi = 1

    def get_invalid_priv_lvl_csr(self):
        invalid_lvl = []
        # Debug CSRs are inaccessible from all but Debug Mode
        # and we cannot boot into Debug Mode.
        invalid_lvl.append('D')

        # TODO Need to change the logic once the constraints are up.
        for mode in self.init_privileged_mode:
            if mode == "MACHINE_MODE":
                continue
            elif mode == 'SUPERVISOR_MODE':
                invalid_lvl.append('M')
                logging.info("supr_mode---")
                logging.debug(invalid_lvl)
            elif mode == 'USER_MODE':
                invalid_lvl.append('S')
                invalid_lvl.append('M')
                logging.info("usr_mode---")
                logging.debug(invalid_lvl)
            else:
                logging.critical("Unsupported initialization privilege mode")

        # implemented_csr from riscv_core_setting.py
        for x in rcs.implemented_csr:
            if x[0] in invalid_lvl:
                self.invalid_priv_mode_csrs.append(x)

    # This function calls all the above defined function which should
    # be called in init function as per SV logic.This function as to be
    # called after every instance of the gen_config handle
    def func_call_init(self):
        self.init_delegation()
        # self.setup_instr_distribution()  # TODO
        self.get_invalid_priv_lvl_csr()


cfg = riscv_instr_gen_config()
