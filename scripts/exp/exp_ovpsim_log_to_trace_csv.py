"""
Copyright 2019 Google LLC
Copyright 2019 Imperas Software Ltd

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Convert ovpsim sim log to standard riscv-dv .csv instruction trace format
"""
import re
import os
import argparse
import logging

import sys
from lib import *

from exp_riscv_trace_csv import *

INSTR_RE = re.compile(r"riscvOVPsim.*, 0x(?P<addr>.*?)(?P<section>\(.*\): ?)" \
                       "(?P<mode>[A-Za-z]*?)\s+(?P<bin>[a-f0-9]*?)\s+(?P<instr_str>.*?)$")
RD_RE = re.compile(r" (?P<r>[a-z]*[0-9]{0,2}?) (?P<pre>[a-f0-9]+?)" \
                    " -> (?P<val>[a-f0-9]+?)$")

def exp_convert_mode(pri, line, stop_on_first_error=False):
  """ OVPsim uses text string, convert to numeric """
  if "Machine"    in pri:    return str(3)
  if "Supervisor" in pri:    return str(1)
  if "User"       in pri:    return str(0)
  logging.error("convert_mode = UNKNOWN PRIV MODE  [%s]: %s" % (pri, line))
  if stop_on_first_error:
    sys.exit(RET_FATAL)

def exp_is_csr(r):
  """ see if r is a csr """
  if len(r) > 4:
    return True
  elif r[0] in ["m", "v"]:
    return True
  elif r in ["frm", "dpc"]:
    return True
  else:
    return False

def exp_process_ovpsim_sim_log(ovpsim_log, csv,
                               stop_on_first_error = 0,
                               dont_truncate_after_first_ecall = 0):
  """Process OVPsim simulation log.

  Extract instruction and affected register information from ovpsim simulation
  log and save to a list.
  """
  logging.info("Processing ovpsim log : %s" % ovpsim_log)

  # Remove the header part of ovpsim log
  cmd = ("sed -i '/Info 1:/,$!d' %s" % ovpsim_log)
  os.system(cmd)
  # Remove all instructions after end of trace data (end of program excecution)
  if dont_truncate_after_first_ecall:
    cmd = ("sed -i '/^Info --/q' %s" % ovpsim_log)
    logging.info("Dont truncate logfile after first ecall: %s", ovpsim_log)
  else:
    cmd = ("sed -i '/ecall/q' %s" % ovpsim_log)
  os.system(cmd)

  instr_cnt = 0
  with open(ovpsim_log, "r") as f, open(csv, "w") as csv_fd:
    trace_csv = ExpRiscvInstructionTraceCsv(csv_fd)
    trace_csv.start_new_trace()
    prev_trace = 0
    for line in f:
      # Extract instruction infromation
      m = INSTR_RE.search(line)
      if m:
        if prev_trace: # write out the previous one when find next one
          trace_csv.write_trace_entry(prev_trace)
          instr_cnt += 1
          prev_trace = 0
        prev_trace = ExpRiscvInstructionTraceEntry()
        prev_trace.instr_str = m.group("instr_str")
        prev_trace.instr = prev_trace.instr_str.split(" ")[0]
        prev_trace.binary = m.group("bin")
        prev_trace.pc = m.group("addr")
        prev_trace.mode = exp_convert_mode(m.group("mode"), line)
        continue
      # Extract register change value information
      c = RD_RE.search(line)
      if c:
        if exp_is_csr(c.group("r")):
          prev_trace.csr.append(c.group("r") + ":" + c.group("val"))
        else:
          prev_trace.gpr.append(c.group("r") + ":" + c.group("val"))
  logging.info("Processed instruction count : %d " % instr_cnt)
  if instr_cnt == 0:
    logging.error ("No Instructions in logfile: %s" % ovpsim_log)
    sys.exit(RET_FATAL)
  logging.info("CSV saved to : %s" % csv)


def main():
  """ if used standalone set up for testing """
  # Parse input arguments
  parser = argparse.ArgumentParser()
  parser.add_argument("--log", type=str, help="Input ovpsim simulation log")
  parser.add_argument("--csv", type=str, help="Output trace csv_buf file")
  parser.add_argument("--verbose", dest="verbose", action="store_true",
                                         help="Verbose logging")
  parser.add_argument("--stop_on_first_error", dest="stop_on_first_error",
                                         action="store_true",
                                         help="Stop on first error")
  parser.add_argument("--dont_truncate_after_first_ecall",
                                         dest="dont_truncate_after_first_ecall",
                                         action="store_true",
                                         help="Dont truncate on first ecall")
  parser.set_defaults(verbose=False)
  parser.set_defaults(stop_on_first_error=False)
  parser.set_defaults(dont_truncate_after_first_ecall=False)
  args = parser.parse_args()
  # Process ovpsim log
  process_ovpsim_sim_log(args.log,
                         args.csv,
                         args.stop_on_first_error,
                         args.dont_truncate_after_first_ecall)

if __name__ == "__main__":
  main()
