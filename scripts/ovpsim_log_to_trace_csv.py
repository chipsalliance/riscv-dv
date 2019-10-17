"""
Copyright 2019 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Convert ovpsim sim log to standard riscv instruction trace format
"""
import re
import os
import argparse
import logging

import sys
import pprint as pp

from riscv_trace_csv import *

def convert_mode(pri, line):
    if "Machine" in pri: return str(3)
    logging.info("convert_mode = UNKNOWN PRIV MODE  [%s]: %s" % (pri, line))
    sys.exit(-1)
    
REGS = ["zero","ra","sp","gp","tp","t0","t1","t2","s0","s1",
    "a0","a1","a2","a3","a4","a5","a6","a7",
    "s2","s3","s4","s5","s6","s7","s8","s9","s10","s11",
    "t3","t4","t5","t6"]

def process_ovpsim_sim_log(ovpsim_log, csv, full_trace = 0):
  """Process SPIKE simulation log.

  Extract instruction and affected register information from ovpsim simulation
  log and save to a list.
  """
  logging.info("Processing ovpsim log [%d]: %s" % (full_trace, ovpsim_log))
  instr_cnt = 0
  trace_instr = ""
  trace_bin = ""
  trace_addr = ""

  # Remove the header part of ovpsim log
  cmd = ("sed -i '/Info 1:/,$!d' %s" % ovpsim_log)
  os.system(cmd)
  # Remove all instructions after ecall (end of program excecution)
  cmd = ("sed -i '/ecall/q' %s" % ovpsim_log)
  os.system(cmd)

  gpr = {}
  
  for g in REGS:
    gpr[g] = 0

  with open(ovpsim_log, "r") as f, open(csv, "w") as csv_fd:
    trace_csv = RiscvInstructiontTraceCsv(csv_fd)
    trace_csv.start_new_trace()
    prev_trace = 0
    for line in f:
      # Extract instruction infromation
      m = re.search(r"riscvOVPsim.*, 0x(?P<addr>.*?)(?P<section>\(.*\): ?)" \
                     "(?P<mode>[A-Za-z]*?)\s+(?P<bin>[a-f0-9]*?)\s+(?P<instr>.*?)$", line)
      if m:
        if prev_trace: # if not yet written as it had no data following it
            trace_csv.write_trace_entry(prev_trace)
            prev_trace = 0
        trace_bin = m.group("bin")
        trace_instr_str = m.group("instr")
        trace_addr = m.group("addr")
        trace_section = m.group("section") # not yet used
        trace_mode = convert_mode(m.group("mode"), line)
        instr_cnt += 1
        prev_trace = RiscvInstructiontTraceEntry()
        prev_trace.instr_str = trace_instr_str
        prev_trace.binary = trace_bin
        prev_trace.addr = trace_addr
        prev_trace.privileged_mode = trace_mode
        prev_trace.instr = trace_instr

        if 0:
            print ("line ::"+line)
            print ("bin  ::"+trace_bin)
            print ("instr::"+trace_instr_str)
            print ("ins  ::"+trace_instr)
            print ("addr ::"+trace_addr)
            print ("sect ::"+trace_section)
            print ("mode ::"+prev_trace.privileged_mode)
            sys.exit(-1)

        if full_trace:
            i = re.search (r"(?P<instr>[a-z]*?)\s", trace_instr_str)
            if i:
                trace_instr = i.group("instr")
            if trace_instr_str == "nop" or trace_instr_str == "mret" or trace_instr_str == "ecall" : 
                    # this will probably need also doing for things like wfi too
                trace_instr = trace_instr_str
            prev_trace.instr = trace_instr
            o = re.search (r"(?P<instr>[a-z]*?)\s(?P<operand>.*)", trace_instr_str)
            if o:
                operand_str = o.group("operand").replace(" ", "")
                operands = operand_str.split(",")
                assign_operand(prev_trace, operands, gpr)
                # sys.exit(-1)
            else:
                # print("no operand for [%s] in [%s]" % (trace_instr, trace_instr_str))
                pass
        else:
            trace_instr = ""
       
      else:
        if 0:
            print ("not ins line... [%s]" % (line))
        # Extract register value information
        n = re.search(r" (?P<rd>[a-z]{1,3}[0-9]{0,2}?) (?P<pre>[a-f0-9]+?)" \
                       " -> (?P<val>[a-f0-9]+?)$", line)
        if n:
          # Write the extracted instruction to a csvcol buffer file
          # print("%0s %0s = %0s" % (trace_instr_str, m.group("rd"), m.group("val")))
          if n.group("rd") != "frm":
            rv_instr_trace = RiscvInstructiontTraceEntry()
            rv_instr_trace.rd = n.group("rd")
            rv_instr_trace.rd_val = n.group("val")
            rv_instr_trace.rs1 = prev_trace.rs1
            rv_instr_trace.rs1_val = prev_trace.rs1_val
            rv_instr_trace.rs2 = prev_trace.rs2
            rv_instr_trace.rs2_val = prev_trace.rs2_val
            rv_instr_trace.instr_str = trace_instr_str
            rv_instr_trace.binary = trace_bin
            rv_instr_trace.addr = trace_addr
            rv_instr_trace.privileged_mode = trace_mode
            gpr[rv_instr_trace.rd] = rv_instr_trace.rd_val
            if full_trace:
                rv_instr_trace.instr = trace_instr
            trace_csv.write_trace_entry(rv_instr_trace)
            prev_trace = 0 # we wrote out as it had data, so no need to write it next time round
            if 0:
              print ("write entry [[%d]]: rd[%s] val[%s] instr(%s) bin(%s) addr(%s)" 
                  % (instr_cnt, rv_instr_trace.rd, rv_instr_trace.rd_val, trace_instr_str, trace_bin, trace_addr))
              print (rv_instr_trace.__dict__)
              sys.exit(-1)
        else:
            if 0:
                print ("write previous entry: [%s] %s " % (str(instr_cnt), line))
                sys.exit(-1)
  logging.info("Processed instruction count : %d" % instr_cnt)
  logging.info("CSV saved to : %s" % csv)

def sint_to_hex(val):
  """Signed integer to hex conversion"""
  return str(hex((val + (1 << 32)) % (1 << 32)))


def get_imm_hex_val(imm):
  """Get the hex representation of the imm value"""
  #print("get_imm_hex_val(%s)" % imm)
  if imm[0] == '-':
    is_negative = 1
    imm = imm[1:]
  else:
    is_negative = 0
  if len(imm) > 1 and imm[1] != 'x': 
    imm = "0x"+imm
  imm_val = int(imm, 0)
  if is_negative:
    imm_val = -imm_val
  hexstr = sint_to_hex(imm_val)
  return hexstr[2:]

ADDR_RE  = re.compile(r"(?P<imm>[\-0-9]+?)\((?P<rs1>.*)\)")

def assign_operand(trace, operands, gpr):
  logging.debug("-> [%0s] %0s" % (trace.instr, trace.instr_str))
  if trace.instr in ['lb', 'lh', 'lw', 'lbu', 'lhu', 'ld', 'lq', 'lwu', 'ldu',
                     'c.lw', 'c.ld', 'c.lq', 'c.lwsp', 'c.ldsp', 'c.lqsp']:
    # TODO: Support regular load/store format
    m = ADDR_RE.search(operands[1])
    # Load instruction
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    if m:
      trace.imm = get_imm_hex_val(m.group('imm'))
      trace.rs1 = m.group('rs1')
      trace.rs1_val = gpr[trace.rs1]
    else:
      logging.info("Unexpected load address %0s", operands[1])
  elif trace.instr in ['sb', 'sh', 'sw', 'sd', 'sq', 'c.sw', 'c.sd', 'c.sq',
                       'c.swsp', 'c.sdsp', 'c.sqsp']:
    # Store instruction
    m = ADDR_RE.search(operands[1])
    # Load instruction
    trace.rs2 = operands[0]
    trace.rs2_val = gpr[trace.rs2]
    if m:
      trace.imm = get_imm_hex_val(m.group('imm'))
      trace.rs1 = m.group('rs1')
      trace.rs1_val = gpr[trace.rs1]
    else:
      logging.info("Unexpected store address %0s", operands[1])
  elif trace.instr in ['mul', 'mulh', 'mulhsu', 'mulhu', 'div', 'divu', 'rem', 'remu',
                       'mulw', 'muld', 'divw', 'divuw', 'divd', 'remw', 'remd', 'remuw',
                       'remud', 'sll', 'srl', 'sra', 'add', 'sub', 'xor', 'or', 'and',
                       'slt', 'sltu', 'sllw', 'slld', 'srlw', 'srld', 'sraw', 'srad',
                       'addw', 'addd', 'subw', 'subd']:
    # R type instruction
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.rs2 = operands[2]
    trace.rs2_val = gpr[trace.rs2]
  elif trace.instr in ['c.add', 'c.addw', 'c.mv', 'c.sub', 'c.jr', 'c.and', 'c.or',
                       'c.xor', 'c.subw']:
    # CR type
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[0]
    trace.rs1_val = gpr[trace.rs1]
    trace.rs2 = operands[1]
    trace.rs2_val = gpr[trace.rs2]
  elif trace.instr in ['slli', 'srli', 'srai', 'addi', 'xori', 'ori', 'andi', 'slti',
                       'sltiu', 'slliw', 'sllid', 'srliw', 'srlid', 'sraiw', 'sraid',
                       'addiw', 'addid']:
    # I type instruction
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.imm = get_imm_hex_val(operands[2])
  elif trace.instr in ['c.addi', 'c.addiw', 'c.addi16sp', 'c.addi4spn', 'c.li', 'c.lui',
                       'c.slli', 'c.srai', 'c.srli', 'c.andi']:
    # CI/CIW type
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.imm = get_imm_hex_val(operands[-1])
  elif trace.instr in ['beq', 'bne', 'blt', 'bge', 'bltu', 'bgeu']:
    # SB type instruction
    trace.rs1 = operands[0]
    trace.rs1_val = gpr[trace.rs1]
    trace.rs2 = operands[1]
    trace.rs2_val = gpr[trace.rs2]
    trace.imm = get_imm_hex_val(operands[2])
  elif trace.instr in ['c.beqz', 'c.bnez']:
    # CB type instruction
    trace.rs1 = operands[0]
    trace.rs1_val = gpr[trace.rs1]
    trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['csrrw', 'csrrs', 'csrrc']:
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.csr = operands[1]
    trace.rs1 = operands[2]
    trace.rs1_val = gpr[trace.rs1]
  elif trace.instr in ['csrrwi', 'csrrsi', 'csrrci']:
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.csr = operands[1]
    trace.imm = get_imm_hex_val(operands[2])
  elif trace.instr in ['scall', 'sbreak', 'fence', 'fence.i', 'ecall', 'ebreak', 'wfi',
                       'sfence.vma', 'c.ebreak', 'nop', 'c.nop']:
    trace.rd  = 'zero'
    trace.rs1 = 'zero'
    trace.rs2 = 'zero'
    trace.rd_val  = '0'
    trace.rs1_val = '0'
    trace.rs2_val = '0'
    trace.imm = get_imm_hex_val('0')
  elif trace.instr in ['lui', 'auipc']:
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['jal']:
    if len(operands) == 1:
      trace.imm = get_imm_hex_val(operands[0])
    else:
      trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['jalr']:
    ## jalr x3
    ## jalr 9(x3)
    ## jalr x2,x3
    ## jalr x2,4(x3)
    if len(operands) == 1:
      trace.rd = 'zero'
      trace.rd_val  = '0'
      m = ADDR_RE.search(operands[0])
      if m: # jalr 9(x3)
        trace.rs1 = m.group('rs1')
        trace.rs1_val = gpr[trace.rs1]
        trace.imm = get_imm_hex_val(m.group('imm'))
      else: # jalr x3
        trace.rs1 = operands[0]
        trace.rs1_val = gpr[trace.rs1]
        trace.imm = get_imm_hex_val('0')
    elif len(operands) == 2:
        trace.rd = operands[0]
        trace.rd_val = gpr[trace.rd]
        m = ADDR_RE.search(operands[1])
        if m: # jalr x2,4(x3)
          trace.rs1 = m.group('rs1')
          trace.rs1_val = gpr[trace.rs1]
          trace.imm = get_imm_hex_val(m.group('imm'))
        else: # jalr x2,x3
          trace.rs1 = operands[1]
          trace.rs1_val = gpr[trace.rs1]
          trace.imm = get_imm_hex_val('0')
  elif trace.instr in ['c.j', 'c.jal']:
    trace.imm = get_imm_hex_val(operands[0])
  # Pseudo instruction convertion below
  elif trace.instr in ['mv']:
    trace.instr = 'addi'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.imm = get_imm_hex_val('0')
  elif trace.instr in ['not']:
    trace.instr = 'xori'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.imm = get_imm_hex_val('-1')
  elif trace.instr in ['neg']:
    trace.instr = 'sub'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
  elif trace.instr in ['negw']:
    trace.instr = 'subw'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
    trace.rs2 = operands[1]
    trace.rs2_val = gpr[trace.rs2]
  elif trace.instr in ['sext.w']:
    trace.instr = 'addiw'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.imm = get_imm_hex_val('0')
  elif trace.instr in ['seqz']:
    trace.instr = 'sltiu'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.imm = get_imm_hex_val('1')
  elif trace.instr in ['snez']:
    trace.instr = 'sltu'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
    trace.rs2 = operands[1]
    trace.rs2_val = gpr[trace.rs2]
  elif trace.instr in ['sltz']:
    trace.instr = 'slt'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.rs2 = 'zero'
    trace.rs2_val = '0'
  elif trace.instr in ['sgtz']:
    trace.instr = 'slt'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
    trace.rs2 = operands[1]
    trace.rs2_val = gpr[trace.rs2]
  elif trace.instr in ['beqz', 'bnez', 'bgez', 'bltz']:
    trace.instr = trace.instr[0:3]
    trace.rs1 = operands[0]
    trace.rs1_val = gpr[trace.rs1]
    trace.rs2 = 'zero'
    trace.rs2_val = '0'
    trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['blez']:
    trace.instr = 'bge'
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
    trace.rs2 = operands[0]
    trace.rs2_val = gpr[trace.rs2]
    trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['bgtz']:
    trace.instr = 'blt'
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
    trace.rs2 = operands[0]
    trace.rs2_val = gpr[trace.rs2]
    trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['csrr']:
    trace.instr = 'csrrw'
    trace.rd = operands[0]
    trace.rd_val = gpr[trace.rd]
    trace.csr = operands[1]
    trace.rs1 = 'zero'
    trace.rs1_val = '0'
  elif trace.instr in ['csrw', 'csrs', 'csrc']:
    trace.instr = 'csrr' + trace.instr[-1]
    trace.csr = operands[0]
    trace.rs1 = operands[1]
    trace.rs1_val = gpr[trace.rs1]
    trace.rd = 'zero'
    trace.rd_val = '0'
  elif trace.instr in ['csrwi', 'csrsi', 'csrci']:
    trace.instr = 'csrr' + trace.instr[-2:]
    trace.rd = 'zero'
    trace.rd_val = '0'
    trace.csr = operands[0]
    trace.imm = get_imm_hex_val(operands[1])
  elif trace.instr in ['j']:
    trace.instr = 'jal'
    trace.rd = 'zero'
    trace.rd_val = '0'
    trace.imm = get_imm_hex_val(operands[0])
  elif trace.instr in ['jr']:
    trace.instr = 'jal'
    trace.rd = 'zero'
    trace.rd_val = '0'
    trace.rs1 = operands[0]
    if trace.rs1 in gpr:
      trace.rs1_val = gpr[trace.rs1]
  elif trace.instr in ['li']:
    trace.instr = 'li'
  elif trace.instr[0:2] in ['lr', 'am', 'sc']:
    # TODO: Support A-extension
    pass
  else:
    # TODO: Support other instructions
    logging.info("Unsupported instr : %s" % trace.instr)

def main():
  instr_trace = []
  # Parse input arguments
  parser = argparse.ArgumentParser()
  parser.add_argument("--log", type=str, help="Input ovpsim simulation log")
  parser.add_argument("--csv", type=str, help="Output trace csv_buf file")
  parser.add_argument("-f", "--full_trace", dest="full_trace", action="store_true",
                                         help="Generate the full trace")
  parser.add_argument("-v", "--verbose", dest="verbose", action="store_true",
                                         help="Verbose logging")
  parser.set_defaults(full_trace=False)
  parser.set_defaults(verbose=False)
  args = parser.parse_args()
  setup_logging(args.verbose)
  # Process ovpsim log
  process_ovpsim_sim_log(args.log, args.csv, args.full_trace)


if __name__ == "__main__":
  main()

