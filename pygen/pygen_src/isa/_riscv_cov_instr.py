from pygen.pygen_src.riscv_instr_pkg import (riscv_instr_name_t,
                                             riscv_instr_format_t,
                                             riscv_instr_category_t,
                                             riscv_instr_group_t, imm_t)


def assign_attributes(self, instruction):
    attr_list = self.get_attr_list(instruction)
    self.format = attr_list[0]
    self.category = attr_list[1]
    self.group = attr_list[2]
    self.imm_t = imm_t.IMM
    if len(attr_list) > 3:
        self.imm_t = attr_list[3]


def get_attr_list(instruction):
    switcher = {
        # LOAD instructions
        riscv_instr_name_t.LB: [riscv_instr_format_t.I_FORMAT,
                                riscv_instr_category_t.LOAD, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.LH: [riscv_instr_format_t.I_FORMAT,
                                riscv_instr_category_t.LOAD, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.LW: [riscv_instr_format_t.I_FORMAT,
                                riscv_instr_category_t.LOAD, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.LBU: [riscv_instr_format_t.I_FORMAT,
                                 riscv_instr_category_t.LOAD, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.LHU: [riscv_instr_format_t.I_FORMAT,
                                 riscv_instr_category_t.LOAD, riscv_instr_group_t.RV32I],
        # STORE instructions
        riscv_instr_name_t.SB: [riscv_instr_format_t.S_FORMAT,
                                riscv_instr_category_t.STORE, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SH: [riscv_instr_format_t.S_FORMAT,
                                riscv_instr_category_t.STORE, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SW: [riscv_instr_format_t.S_FORMAT,
                                riscv_instr_category_t.STORE, riscv_instr_group_t.RV32I],
        # SHIFT intructions
        riscv_instr_name_t.SLL: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SLLI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SRL: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SRLI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SRA: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SRAI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SHIFT, riscv_instr_group_t.RV32I],
        # ARITHMETIC intructions
        riscv_instr_name_t.ADD: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.ADDI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.NOP: [riscv_instr_format_t.I_FORMAT,
                                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SUB: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.LUI: [riscv_instr_format_t.U_FORMAT,
                                 riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32I, imm_t.UIMM],
        riscv_instr_name_t.AUIPC: [riscv_instr_format_t.U_FORMAT,
                                   riscv_instr_category_t.ARITHMETIC, riscv_instr_group_t.RV32I, imm_t.UIMM],
        # LOGICAL instructions
        riscv_instr_name_t.XOR: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.XORI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.OR: [riscv_instr_format_t.R_FORMAT,
                                riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.ORI: [riscv_instr_format_t.I_FORMAT,
                                 riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.AND: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.ANDI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.LOGICAL, riscv_instr_group_t.RV32I],
        # COMPARE instructions
        riscv_instr_name_t.SLT: [riscv_instr_format_t.R_FORMAT,
                                 riscv_instr_category_t.COMPARE, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SLTI: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.COMPARE, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SLTU: [riscv_instr_format_t.R_FORMAT,
                                  riscv_instr_category_t.COMPARE, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SLTIU: [riscv_instr_format_t.I_FORMAT,
                                   riscv_instr_category_t.COMPARE, riscv_instr_group_t.RV32I],
        # BRANCH instructions
        riscv_instr_name_t.BEQ: [riscv_instr_format_t.B_FORMAT,
                                 riscv_instr_category_t.BRANCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.BNE: [riscv_instr_format_t.B_FORMAT,
                                 riscv_instr_category_t.BRANCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.BLT: [riscv_instr_format_t.B_FORMAT,
                                 riscv_instr_category_t.BRANCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.BGE: [riscv_instr_format_t.B_FORMAT,
                                 riscv_instr_category_t.BRANCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.BLTU: [riscv_instr_format_t.B_FORMAT,
                                  riscv_instr_category_t.BRANCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.BGEU: [riscv_instr_format_t.B_FORMAT,
                                  riscv_instr_category_t.BRANCH, riscv_instr_group_t.RV32I],
        # JUMP instructions
        riscv_instr_name_t.JAL: [riscv_instr_format_t.J_FORMAT,
                                 riscv_instr_category_t.JUMP, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.JALR: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.JUMP, riscv_instr_group_t.RV32I],
        # SYNCH instructions
        riscv_instr_name_t.FENCE: [riscv_instr_format_t.I_FORMAT,
                                   riscv_instr_category_t.SYNCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.FENCE_I: [riscv_instr_format_t.I_FORMAT,
                                     riscv_instr_category_t.SYNCH, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SFENCE_VMA: [riscv_instr_format_t.R_FORMAT,
                                        riscv_instr_category_t.SYNCH, riscv_instr_group_t.RV32I],
        # SYSTEM instructions
        riscv_instr_name_t.ECALL: [riscv_instr_format_t.I_FORMAT,
                                   riscv_instr_category_t.SYSTEM, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.EBREAK: [riscv_instr_format_t.I_FORMAT,
                                    riscv_instr_category_t.SYSTEM, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.URET: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SYSTEM, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.SRET: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SYSTEM, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.MRET: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SYSTEM, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.DRET: [riscv_instr_format_t.I_FORMAT,
                                  riscv_instr_category_t.SYSTEM, riscv_instr_group_t.RV32I],
        riscv_instr_name_t.WFI: [riscv_instr_format_t.I_FORMAT,
                                 riscv_instr_category_t.INTERRUPT, riscv_instr_group_t.RV32I],
        # CSR instructions
        riscv_instr_name_t.CSRRW: [riscv_instr_format_t.R_FORMAT,
                                   riscv_instr_category_t.CSR, riscv_instr_group_t.RV32I, imm_t.UIMM],
        riscv_instr_name_t.CSRRS: [riscv_instr_format_t.R_FORMAT,
                                   riscv_instr_category_t.CSR, riscv_instr_group_t.RV32I, imm_t.UIMM],
        riscv_instr_name_t.CSRRC: [riscv_instr_format_t.R_FORMAT,
                                   riscv_instr_category_t.CSR, riscv_instr_group_t.RV32I, imm_t.UIMM],
        riscv_instr_name_t.CSRRWI: [riscv_instr_format_t.I_FORMAT,
                                    riscv_instr_category_t.CSR, riscv_instr_group_t.RV32I, imm_t.UIMM],
        riscv_instr_name_t.CSRRSI: [riscv_instr_format_t.I_FORMAT,
                                    riscv_instr_category_t.CSR, riscv_instr_group_t.RV32I, imm_t.UIMM],
        riscv_instr_name_t.CSRRCI: [riscv_instr_format_t.I_FORMAT,
                                    riscv_instr_category_t.CSR, riscv_instr_group_t.RV32I, imm_t.UIMM],
    }
    # if instruction is not present in the dictionary,second argument well
    # be assigned as default value of passed argument
    attr_list = switcher.get(instruction, "Cannot find instruction")
    return attr_list
