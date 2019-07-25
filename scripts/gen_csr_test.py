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

Parse processor-specific CSR description YAML file and generate a directed CSR test
"""

import sys
import yaml
import argparse
import random
from bitstring import BitArray as bitarray
# To install the bitstring library:
#   1) sudo apt-get install python3-bitstring OR
#   2) pip install bitstring


"""
Parses the input YAML file, and outputs a directed CSR test sequence """
def get_csr_map(csr_file, isa_length):
  rv_string = "rv{}".format(str(isa_length))
  # dictionary that will be returned
  # contains mappings for each CSR of the form:
  # { csr_name : [csr_val_bitarray, csr_mask_bitarray] }
  csrs = {}
  with open(csr_file, "r") as c:
    csr_description = yaml.safe_load(c)
    # iterate through each CSR in the yaml description
    for csr_dict in csr_description:
      csr_name = csr_dict.get("csr")
      # check that correct xlen is being maintained
      assert(rv_string in csr_dict), "The {} CSR must be configured for rv{}".format(csr_name, str(rv))
      # if below code is reached, correct ISA info exists
      # initialize xlen length bitarray and mask
      csr_value = bitarray(uintbe=0, length=isa_length)
      csr_mask = bitarray(uintbe=0, length=isa_length)
      # dictionary of all csr field details:
      #   -field_name, description, type, reset_val, msb, lsb
      csr_field_list = csr_dict.get(rv_string)
      for csr_field_detail_dict in csr_field_list:
        # don't need field_name or description
        field_type = csr_field_detail_dict.get("type")
        field_val = csr_field_detail_dict.get("reset_val")
        field_msb = csr_field_detail_dict.get("msb")
        field_lsb = csr_field_detail_dict.get("lsb")
        field_size = field_msb - field_lsb
        # load initial values into CSR and set mask accordingly
        # avoid writes to WPRI fields, and set corresponding mask segments to 0
        if field_type != "WPRI":
          val_size = field_msb - field_lsb + 1
          val_bitarray = bitarray(uint=field_val, length=val_size)
          mask_bitarray = bitarray(uint=1, length=1) * val_size
          # splice these into the main bitarrays
          csr_value.overwrite(val_bitarray, isa_length - 1 - field_msb)
          csr_mask.overwrite(mask_bitarray, isa_length - 1 - field_msb)
      # add final updated csr mapping to output dict
      csrs.update({csr_name : [csr_value, csr_mask]})
  return csrs


"""
Will be called 3 times for each generated CSR instruction.
Returns the test RS1 values that will be used to exercise the CSR:
  0xa5a5..., 0x5a5a..., and a randomly generated number
"""
def get_rs1_val(iteration, isa_length):
  if iteration == 0:
    return bitarray(hex=f"0x{'a5'*int(isa_length/8)}")
  elif iteration == 1:
    return bitarray(hex=f"0x{'5a'*int(isa_length/8)}")
  elif iteration == 2:
    val = bitarray(uint=0, length=isa_length)
    # randomize each bit of val
    for i in range(32):
      bit = random.randint(0, 1)
      val.set(bit, i)
    return val


"""
CSR Write
"""
def csr_write(val, csr_val, csr_mask):
  if val.len != csr_mask.len:
    csr_val.overwrite(val & csr_mask, 0)


"""
CSR Read
"""
def csr_read(csr_val, csr_mask):
  return csr_val & csr_mask


"""
Predict the CSR reference value based on the CSR operation being performed
"""
def predict_csr_val(csr_op, rs1_val, csr_val, csr_mask):
  prediction = None
  # create a zero bitarray to zero extend immediates
  zero = bitarray(uint=0, length=csr_val.len - 5)
  if csr_op == 'csrrw':
    prediction = csr_read(csr_val, csr_mask)
    csr_write(rs1_val, csr_val, csr_mask)
  elif csr_op == 'csrrs':
    prediction = csr_read(csr_val, csr_mask)
    csr_write(rs1_val | prediction, csr_val, csr_mask)
  elif csr_op == 'csrrc':
    prediction = csr_read(csr_val, csr_mask)
    csr_write((~rs1_val) & prediction, csr_val, csr_mask)
  elif csr_op == 'csrrwi':
    prediction = csr_read(csr_val, csr_mask)
    zero.append(rs1_val[-5:])
    csr_write(zero, csr_val, csr_mask)
  elif csr_op == 'csrrsi':
    prediction = csr_read(csr_val, csr_mask)
    zero.append(rs1_val[-5:])
    csr_write(zero | prediction, csr_val, csr_mask)
  elif csr_op == 'csrrci':
    prediction = csr_read(csr_val, csr_mask)
    zero.append(rs1_val[-5:])
    csr_write((~zero) & prediction, csr_val, csr_mask)
  return f"0x{prediction.hex}"


"""
CSR Test Failure Label:
  For failures, write 1 to the gp register, testbench will poll and terminate
"""
def gen_csr_test_fail(test_file):
  test_file.write(f"csr_fail:\n")
  test_file.write(f"\tli gp, 1\n")
  test_file.write(f"\tj csr_fail\n")


"""
CSR Test Pass Label:
  For passes, write 0 to the gp register, testbench will poll and terminate
"""
def gen_csr_test_pass(test_file):
  test_file.write(f"csr_pass:\n")
  test_file.write(f"\tli gp, 1\n")
  test_file.write(f"\tj csr_pass\n")


"""
Uses the information in the csr map generated by get_csr_map() to generate csr instructions operating on randomized values to test functionality.
"""
def gen_csr_instr(csr_map, csr_instructions, isa_length, iterations, out):
  for i in range(iterations):
    # pick two GPRs at random to act as source and destination registers
    # for CSR operations
    source_reg, dest_reg = [f"x{i}" for i in random.sample(range(5, 15), 2)] #support risc-v E extension (16 registers)
    csr_list = list(csr_map.keys())
    with open(f"{out}/riscv_csr_test.{i}.S", "w") as csr_test_file:
      # Write test label
      csr_test_file.write(f"csr_test:\n")
      for csr in csr_list:
        last_csr = csr
        csr_val, csr_mask = csr_map.get(csr)
        for op in csr_instructions:
          for i in range(3):
            # hex string
            rand_rs1_val = get_rs1_val(i, isa_length)
            # I type CSR instruction
            first_li = ""
            if op[-1] == "i":
              imm = rand_rs1_val[-5:]
              csr_inst = f"\t{op} {dest_reg}, {csr}, 0b{imm.bin}\n"
            else:
              first_li = f"\tli {source_reg}, 0x{rand_rs1_val.hex}\n"
              csr_inst = f"\t{op} {dest_reg}, {csr}, {source_reg}\n"
              predict_li = f"\tli {source_reg}, {predict_csr_val(op, rand_rs1_val, csr_val, csr_mask)}\n"
            branch_check = f"\tbne {source_reg}, {dest_reg}, csr_fail\n"
            # write test sequence to test file
            csr_test_file.write(first_li)
            csr_test_file.write(csr_inst)
            csr_test_file.write(predict_li)
            csr_test_file.write(branch_check)
            # Need to hardcode in one last branch check, since the value last written to
            # CSR has not been tested at this point
            # Only if we have finished
            if csr == csr_list[-1] and op == csr_instructions[-1] and i == 2:
              final_csr_read = f"\tcsrr {dest_reg}, {csr_list[-1]}\n"
              csrrs_read_mask = bitarray(uint=0, length=isa_length)
              final_li = f"\tli {source_reg}, {predict_csr_val('csrrs', csrrs_read_mask, csr_val, csr_mask)}\n"
              final_branch_check = f"\tbne {source_reg}, {dest_reg}, csr_fail\n"
              # write to test file
              csr_test_file.write(final_csr_read)
              csr_test_file.write(final_li)
              csr_test_file.write(final_branch_check)
      # Add final signatures to test, indicating to testbench that test has ended
      gen_csr_test_pass(csr_test_file)
      gen_csr_test_fail(csr_test_file)


# Add argument options
parser = argparse.ArgumentParser()
parser.add_argument("--csr_file", type=str, help="The YAML file contating descriptions of all processor supported CSRs")
parser.add_argument("--rv", type=int, default=32, help="Specify the ISA width, e.g. 32 or 64 or 128")
parser.add_argument("--num_test", type=int, default=1, help="Specify how many tests to be generated")
parser.add_argument("--out", type=str, default="./", help="Specify output directory")
args = parser.parse_args()

# List all CSR Instructions
csr_ops = ['csrrw', 'csrrs', 'csrrc', 'csrrwi', 'csrrsi', 'csrrci']

# Generate the csr test file
gen_csr_instr(get_csr_map(args.csr_file, args.rv), csr_ops, args.rv, args.num_test, args.out)
