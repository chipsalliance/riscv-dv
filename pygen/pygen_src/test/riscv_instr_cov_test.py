# Lint as: python3
"""Tests for riscv_instr_cov."""
import sys
import os
import logging
import argparse
import vsc  # PyVSC library
import csv  # Python library to read/write from/to CSV files

sys.path.append("../../")
from pygen_src.riscv_instr_pkg import *

logging.basicConfig(filename='logging.log',level=logging.DEBUG)

class riscv_instr():
    """ Class for a riscv instruction; data parsed from the CSV file will fill different fields of an instruction """
    def __init__(self):
        self.pc = 0 # Program counter (PC) of the instruction
        self.instr = None
        self.gpr = None # destination operand of the instruction
        self.csr = None
        self.binary = 0 # Instruction binary
        self.mode = None # Instruction mode
        self.trace = "None" # String representation of the instruction
        self.operands = "None"  # Instruction operands (sources as well as destination(s))
        self.pad = None # Not used 

class riscv_instr_cov_test():
    """ Main class for applying the functional coverage test """
    def __init__(self, argv):
        self.trace_csv = []
        self.trace = {}
        self.csv_dir = argv.csv_dir
        self.entry_cnt, self.total_entry_cnt, self.skipped_cnt, self.unexpected_illegal_instr_cnt = 0, 0, 0, 0

    def run_phase(self):
        self.trace_csv = os.listdir(self.csv_dir)
        self.trace_csv = list(filter(lambda f: f.endswith('.csv'), self.trace_csv))
        logging.info("{} CSV trace files to be processed...\n".format(len(self.trace_csv)))
        expect_illegal_instr = False
        for csv_file in self.trace_csv:
            with open("{}/{}".format(self.csv_dir, csv_file)) as trace_file:
                self.entry_cnt = 0
                header = []
                entry = []
                csv_reader = csv.reader(trace_file, delimiter=',')
                line_count = 0
                # Get the header line
                for row in csv_reader:
                    if line_count == 0:
                        header = row
                        logging.info("Header: {}".format(header))
                    else:
                        entry = row
                        if len(entry) != len(header):
                            logging.info("Skipping malformed entry[{}]: [{}]".format(self.entry_cnt, entry))
                            self.skipped_cnt += 1
                        else:
                            self.trace["csv_entry"] = row
                            for idx in range(len(header)):
                                if "illegal" in entry[idx]:
                                    expect_illegal_instr = True
                                self.trace[header[idx]] = entry[idx]
                                if header[idx] != "pad":
                                    logging.info("{} = {}".format(header[idx], entry[idx])) 
                            self.post_process_trace()
                            if self.trace["instr"] in ["li", "ret", "la"]:
                                pass
                            if "amo" in self.trace["instr"] or \
                               "lr" in self.trace["instr"] or \
                               "sc" in self.trace["instr"]:
                                # TODO: Enable functional coverage for AMO test
                                pass
                            if not self.sample():
                                if not expect_illegal_instr:
                                    logging.error("Found unexpected illegal instr: {} [{}]".format(self.trace["instr"], entry))
                                    self.unexpected_illegal_instr_cnt += 1
                            # TODO: call sample here to do the functional coverage, and move assign_trace_info into it
                            #self.sample(instruction)
                        self.entry_cnt += 1
                    line_count += 1
                logging.info("[{}]: {} instruction processed".format(csv_file, self.entry_cnt))
                self.total_entry_cnt += self.entry_cnt
        logging.info("Finished processing {} trace CSV, {} instructions".format(len(self.trace_csv), self.total_entry_cnt))
        if self.skipped_cnt > 0 or self.unexpected_illegal_instr_cnt > 0:
            logging.error("{} instruction skipped, {} illegal instructions".format(self.skipped_cnt), self.unexpected_illegal_instr_cnt)

    def post_process_trace(self):
        pass

    def sample(self):
        instr_name, binary = "", ""
        get_val(self.trace["binary"], binary, hexa=1)
        if binary[-2:] != "11": #TODO: and RV32C in supported_isa 
            #TODO: sample compressed instruction
            pass
        if binary[-2:] == "11":
            #TODO: sampling
            pass
        #TODO: buch of if statements to check if the instruction name is valid and is a member of registered ones
        instr_name = self.trace["instr"]
        instruction = riscv_instr()
        #TODO: check the instruction group...
        self.assign_trace_info_to_instr(instruction)
        #TODO: instruction.pre_sample() and sample(instruction)
        return True

    def assign_trace_info_to_instr(self, instruction):
        operands, gpr_update, pair = {}, {}, {}
        instruction.pc = get_val(self.trace["pc"], instruction.pc, hexa=1)
        instruction.binary = get_val(self.trace["binary"], instruction.binary, hexa=1)
        instruction.instr = self.trace["instr"]
        instruction.gpr = self.trace["gpr"]
        instruction.csr = self.trace["csr"]
        instruction.mode = self.trace["mode"]
        instruction.trace = self.trace["instr_str"]
        instruction.operands = self.trace["operand"]
        instruction.pad = self.trace["pad"]
        #TODO: instr.update_src_regs(instr.operands)
        #TODO: instr.update_dst_regs()

def parse_args():
    parse = argparse.ArgumentParser()
    parse.add_argument("--csv_dir", help="directory consists of the CSV files", type=str, default = ".")
    args = parse.parse_args()
    return args

def main():
    parse = argparse.ArgumentParser()
    parse.add_argument("--csv_dir", help="directory consists of the CSV files", type=str, default = ".")
    args = parse.parse_args()
    cov_test = riscv_instr_cov_test(args)
    cov_test.run_phase()

if __name__ == "__main__":
    main()
