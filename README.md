# RISCV-DV

RISCV-DV is a SV/UVM based open-source instruction generator for RISC-V
processor verification. It currently supports the following features:

- Supported instruction set: RV32IMC, RV64IMC
- Supported privileged mode: machine mode, supervisor mode, user mode
- Page table randomization and exception
- Privileged CSR setup randomization
- Trap/interrupt handling
- Test suite to stress test MMU
- Support sub-programs and random program calls
- Random forward/backward branch instructions
- Support mix directed instruciton with random instruction stream

## Getting Started

### Prerequisites

To be able to run the instruction generator, you need to have an RTL simulator
which supports Systemverilog and UVM 1.2. This generator has been verified with
Synopsys VCS and Cadence Incisive/Xcelium simulator. Please make sure the EDA
tool environment is properly setup before running the generator.

### Running the generator

A simple script "run" is provided for you to run a single test or a regression.
Here is the command to run a single test:

```
./run -test riscv_instr_base_test
```
You can specify the simulator by "-tool" option

```
./run -test riscv_instr_base_test -tool irun
```
The complete test list can be found in testlist. To run a full regression, you
can just specify the test name to "all".

```
./run -test all
```
The script will run each test in the test list sequentially with the iteration
count specified in the "testlist". All the generated RISC-V assembly will be
listed when the regression is done. If it is successful, you should see the
following output:

```
===========================================================
                Generated RISC-V assembly tests
 ----------------------------------------------------------
./out_2018-11-20/asm_tests/riscv_arithmetic_basic_test.0.S
./out_2018-11-20/asm_tests/riscv_machine_mode_rand_test.0.S
./out_2018-11-20/asm_tests/riscv_mmu_stress_test.0.S
./out_2018-11-20/asm_tests/riscv_mmu_stress_test.1.S
./out_2018-11-20/asm_tests/riscv_no_fence_test.0.S
./out_2018-11-20/asm_tests/riscv_page_table_exception_test.0.S
./out_2018-11-20/asm_tests/riscv_page_table_exception_test.1.S
./out_2018-11-20/asm_tests/riscv_privileged_mode_rand_test.0.S
./out_2018-11-20/asm_tests/riscv_privileged_mode_rand_test.1.S
./out_2018-11-20/asm_tests/riscv_rand_instr_test.0.S
./out_2018-11-20/asm_tests/riscv_rand_instr_test.1.S
./out_2018-11-20/asm_tests/riscv_rand_jump_test.0.S
./out_2018-11-20/asm_tests/riscv_sfence_exception_test.0.S
```
Here's a few more examples of run command:
```
// Run a single test 10 times
./run -test riscv_page_table_exception_test -n 10

// Run a test with a specified seed
./run -test riscv_page_table_exception_test -seed 123
```

### Use the generated test in your RTL and ISS simulation

You need to use the RISC-V gcc/llvm compiler to compile the assembly tests to an ELF
file and feed into your TB. We currently don't provide a reference TB for the
co-simulation as it could be quite different based on the processor and ISS
implementation. A reference script "iss_sim" is provided to compile the program
with the RISC-V gcc compiler and simulate with spike.
```
./run -test all; ./iss_sim
```

The default ISS is spike. Thanks for the great support from Imperas Software Ltd.,
we have added the support for [riscv-ovpsim](https://github.com/riscv/riscv-ovpsim).
You can use -iss to run with different ISS.
```
./iss_sim -iss spike  # Use spike as ISS
./iss_sim -iss ovpsim # Use riscv-ovpsim as ISS
```

## Configure the generator

The default configuration for the instruction generator is for RV64IMC RISC-V
processors with address translation capability. You might want to configure the
generator according the feature of your processor.

XLEN and SATP mode can be configured in src/riscv_instr_pkg.sv

```
// Bit width of RISC-V GPR
parameter int XLEN = 64;

// Parameter for SATP mode, set to BARE if address translation is not supported
parameter satp_mode_t SATP_MODE = SV39;
```

The other important configurations are in src/riscv_instr_gen_config.sv. Please
refer to the comment in this class to properly setup these configurations.

```
// Supported Privileged mode
privileged_mode_t supported_privileged_mode[] = {USER_MODE,
                                                 SUPERVISOR_MODE,
                                                 MACHINE_MODE};

// Unsupported instructions
riscv_instr_name_t unsupported_instr[] = {};

// ISA supported by the processor
riscv_instr_group_t supported_isa[] = {RV32I, RV32M, RV64I, RV64M};

...
```

## Adding new test

Please refer to src/src/riscv_load_store_instr_lib.sv for an example on how to
add a new instruction stream. After the new instruction stream is created, you
can refer to test/riscv_instr_test_lib.sv to see how an instruction stream can
be mixed with existing random instruction stream.

```
virtual function void apply_directed_instr();
  asm_gen.add_directed_instr_stream("my_new_instr_stream_class_name", 10);
endfunction
```

## Supporting model

Please file an issue under this repository for any bug report / integration
issue / feature request. We are looking forward to knowing your experience of
using this flow and how we can make it better together.

## External contributions

We definitely welcome external contributions. We hope it could be a
collaborative effort to build a strong open source RISC-V processor
verification platform. Free feel to submit your pull request for review.
Please refer to CONTRIBUTING.md for license related questions.

## Future release plan

We have some work in progress which will be part of future releases:

-   Privileged CSR test suite.
-   Illegal instruction support.
-   Coverage model.

## Disclaimer

This is not an officially supported Google product.
