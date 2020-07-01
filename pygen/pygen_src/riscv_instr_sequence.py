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
from pygen_src.riscv_instr_stream import riscv_instr_stream, riscv_rand_instr_stream
import random
import constraint
from pygen_src.target.rv32i import riscv_core_setting as rcs
from pygen_src.riscv_instr_gen_config import cfg
from pygen_src.riscv_instr_gen_config import riscv_instr_gen_config
from pygen_src.riscv_instr_pkg import pkg_ins
import logging

class riscv_instr_sequence:

  def __init__(self):
    self.instr_cnt = 0
    # self.instr_stack_enter = riscv_directed_instr_lib.riscv_push_stack_instr("instr_stack_enter")  # Stack push instructions for sub-programs
    # self.instr_stack_exit = riscv_directed_instr_lib.riscv_pop_stack_instr("instr_stack_exit")  # Stack pop instructions for sub-programs
    self.instr_stream = riscv_rand_instr_stream()
    self.is_main_program = 0
    self.is_debug_program = 0
    self.label_name = ""
    self.instr_string_list = [] # Save the instruction list
    self.program_stack_len = 0  # Stack space allocated for this program
    self.directed_instr = []    # List of all directed instruction stream
#    self.illegal_instr = riscv_illegal_instr()
    self.illegal_instr_pct = 0  # Percentage of illegal instructions
    self.hint_instr_pct = 0     # Percentage of hint instructions


  def gen_instr(self, is_main_program, no_branch = 1):
    self.is_main_program = is_main_program
    self.instr_stream.initialize_instr_list(self.instr_cnt)
    logging.info("Start generating %d instruction" % len(self.instr_stream.instr_list))
    self.instr_stream.gen_instr(no_branch = no_branch,no_load_store=1,is_debug_program =self.is_debug_program)
    
    if not is_main_program:
      self.gen_stack_enter_instr()
      self.gen_stack_exit_instr()

  def gen_stack_enter_instr(self):
    allow_branch = 0
# TBD, illegal/hint instructions are not supported yet
#    if (self.illegal_instr_pct > 0) or (hint_instr_pct > 0):
#      allow_branch = 0
#    else 
#      allow_branch = 1
#    allow_branch &= not cfg.no_branch_jump
    problem = constraint.Problem(constraint.MinConflictsSolver())
    problem.addVariable(stk_len, range(cfg.min_stack_len_per_program, cfg.min_stack_len_per_program))

    def cons_stk_len(stk_len):
      range_lst = list(range(cfg.min_stack_len_per_program, cfg.min_stack_len_per_program))
      if (stk_len in range_lst) and (stk_len % rcs.XLEN/8):
        logging.info("stack_len value = %d", (stk_len))
        return True

    problem.addConstraint(cons_stk_len, [stk_len])
    self.program_stack_len = problem.getSolution()
#    TBC, gen_config class partially completed. need to be implemented in instr_stack_enter
#    self.instr_stack_enter.cfg = cfg
    self.instr_stack_enter.push_start_label = self.label_name + "_stack_p"
    self.instr_stack_enter.gen_push_stack_instr(
        self.program_stack_len, allow_branch)
    self.instr_stream.instr_list = self.instr_stack_enter.instr_list + self.instr_stream.instr_list 


  def gen_stack_exit_instr(self):
    self.instr_stack_exit.cfg = cfg
    instr_stack_exit.gen_pop_stack_instr(self.program_stack_len, self.instr_stack_enter.saved_regs)
    self.instr_stream.instr_list = append.self.instr_stream.instr_list
    self.instr_stream.instr_list = append.instr_stack_exit.instr_list


  def post_process_instr(self):
    label_idx = 0
    branch_target = dict()

    for dir_instr in self.directed_instr:
      self.instr_stream.insert_instr_stream(dir_instr.instr_list)

    for item in self.instr_stream.instr_list:
      item.idx = label_idx
      if item.has_label and not item.atomic:
        if self.illegal_instr_pct > 0 and not item.is_illegal_instr:
          # The illegal instruction generator always increase PC by 4 when resume execution, need
          # to make sure PC + 4 is at the correct instruction boundary.
          if item.is_compressed:
            pass  # TODO: TO DO when we add the support for compressed instructions
        if self.hint_instr_pct > 0 and not item.is_illegal_instr:
          if item.is_compressed:
            pass  # TODO: TO DO when we add the support for compressed instructions
        item.label = "{}".format(label_idx)
        item.is_local_numeric_label = 1
        label_idx += 1
    # Generate branch target
    for item in self.instr_stream.instr_list:
      if item.solution[
          item.
          instr_category] == "BRANCH" and not item.branch_assigned and not item.is_illegal_instr:
        # Post process the branch instructions to give a valid local label
        # Here we only allow forward branch to avoid unexpected infinite loop
        # The loop structure will be inserted with a separate routine using
        # Reserved loop registers
        branch_byte_offset = 0
        branch_target_label = random.randint(item.idx + 1,
                                             min(label_idx - 1, item.idx +
                                                 20))  # TODO: TO DO need to do
        # the config class, here 20 is the max_branch_step
        item.imm_str = "{}f".format(branch_target_label)
        # Below calculation is only needed for generating the instruction stream in binary format
        for j in (self.instr_stream.instr_list.index(item) + 1,
                  len(self.instr_stream.instr_list) - 1):
          branch_byte_offset = branch_byte_offset + 2 if self.instr_stream.instr_list[
              j - 1].is_compressed else branch_byte_offset + 4
          if self.instr_stream.instr_list[j].label == "{}".format(
              branch_target_label):
            item.imm = branch_byte_offset
            break
          elif j == len(self.instr_stream.instr_list) - 1:
            # Cannot find target label
            pass
        item.branch_assigned = 1
        branch_target[branch_target_label] = 1
      # Remove the local label which is not used as branch target
      if item.has_label and item.is_local_numeric_label:
        idx = int(item.label)
        if not branch_target.get(idx):
          item.has_label = 0
    # Finished post-processing instructions

  # Inject a jump instruction stream
  # This function is called by riscv_asm_program_gen with the target program label
  # The jump routine is implemented with an atomic instruction stream(riscv_jump_instr). Similar
  # to load/store instructions, JALR/JAL instructions also need a proper base address and offset

    pass


  def insert_jump_instr(self):
      jump_instr = riscv_directed_instr_lib.riscv_jump_instr("jump_instr")
      jump_instr.target_program_label = target_label

      if not self.is_main_program:
        jump_instr.stack_exit_instr = self.instr_stack_exit.pop_stack_instr
      # TO DO: cfg
      # jump_instr.cfg = cfg
      jump_instr.label = self.label_name
      jump_instr.idx = idx
  
      jump_instr.problem_definition()
      jump_instr.randomize()
  
      self.instr_stream.insert_instr_stream(jump_instr.instr_list)


  def generate_instr_stream(self, no_label = 0):
        prefix = ''
        string = ''
        self.instr_string_list.clear()
        
        for i in range(len(self.instr_stream.instr_list)):
            if i == 0:
                if no_label:
                    prefix = pkg_ins.format_string(string=' ',length=pkg_ins.LABEL_STR_LEN)
                else:
                    prefix = \
                        pkg_ins.format_string(string='{}:'.format(self.label_name), length=pkg_ins.LABEL_STR_LEN)
            
                self.instr_stream.instr_list[i].has_label = 1
            else:
              if(self.instr_stream.instr_list[i].has_label):
                prefix = pkg_ins.format_string(string = '{}'.format(self.instr_stream.instr_list[i].label), length = pkg_ins.LABEL_STR_LEN)
              else:
                prefix = pkg_ins.format_string(string = " ", length = pkg_ins.LABEL_STR_LEN)
            string = prefix + self.instr_stream.instr_list[i].convert2asm()
            self.instr_string_list.append(string)
  def generate_return_routine(self):
    pass


  def insert_illegal_hint_instr(self):
    pass
