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

def process_jalr(trace, operands, gpr):
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
        #trace_mode = convert_mode(m.group("mode"), line)
        instr_cnt += 1
        prev_trace = RiscvInstructiontTraceEntry()
        prev_trace.instr_str = trace_instr_str
        prev_trace.binary = trace_bin
        prev_trace.addr = trace_addr
        #prev_trace.privileged_mode = trace_mode
        prev_trace.instr = trace_instr

        if 0:
            print ("line ::"+line)
            print ("bin  ::"+trace_bin)
            print ("instr::"+trace_instr_str)
            print ("ins  ::"+trace_instr)
            print ("addr ::"+trace_addr)
            print ("sect ::"+trace_section)
            #print ("mode ::"+prev_trace.privileged_mode)
            sys.exit(-1)

        if full_trace:
            i = re.search (r"(?P<instr>[a-z]*?)\s", trace_instr_str)
            if i:
                trace_instr = i.group("instr")
            if trace_instr_str == "nop" or \
               trace_instr_str == "mret" or \
               trace_instr_str == "ecall" :
               # this will probably need also doing for things like wfi too
              trace_instr = trace_instr_str
            prev_trace.instr = trace_instr
            o = re.search (r"(?P<instr>[a-z]*?)\s(?P<operand>.*)", trace_instr_str)
            if o:
                operand_str = o.group("operand").replace(" ", "")
                operands = operand_str.split(",")
                if (prev_trace.instr in ['jalr']):
                  process_jalr(prev_trace, operands, gpr)
                else:
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
            #rv_instr_trace.privileged_mode = trace_mode
            gpr[rv_instr_trace.rd] = rv_instr_trace.rd_val
            if full_trace:
                rv_instr_trace.instr = trace_instr
            trace_csv.write_trace_entry(rv_instr_trace)
            prev_trace = 0 # we wrote out as it had data, so no need to write it next time round
            if 0:
              print ("write entry [[%d]]: rd[%s] val[%s] instr(%s) bin(%s) addr(%s)"
                  % (instr_cnt, rv_instr_trace.rd, rv_instr_trace.rd_val,
                     trace_instr_str, trace_bin, trace_addr))
              print (rv_instr_trace.__dict__)
              sys.exit(-1)
        else:
            if 0:
                print ("write previous entry: [%s] %s " % (str(instr_cnt), line))
                sys.exit(-1)
  logging.info("Processed instruction count : %d" % instr_cnt)
  logging.info("CSV saved to : %s" % csv)


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

