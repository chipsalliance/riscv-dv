/*
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//-----------------------------------------------------------------------------
// Processor feature configuration
//-----------------------------------------------------------------------------
// XLEN
parameter int XLEN = 32;

// Parameter for SATP mode, set to BARE if address translation is not supported
parameter satp_mode_t SATP_MODE = SV32; 

// Supported Privileged mode
//privileged_mode_t supported_privileged_mode[] = {MACHINE_MODE};

privileged_mode_t supported_privileged_mode[] = {USER_MODE, SUPERVISOR_MODE, MACHINE_MODE};

// Unsupported instructions
riscv_instr_name_t unsupported_instr[];

// ISA supported by the processor
riscv_instr_group_t supported_isa[$] = {RV32I, RV32M, RV32C, RV32A, RV32F, RV32D, RV32X, RV32ZBA,RV32ZBB, RV32ZBKB, RV32ZBC, RV32ZBKC, RV32ZBKX, RV32ZBS, RV32ZCB, RV32ZFH, RV32ZFA};
// Interrupt mode support
mtvec_mode_t supported_interrupt_mode[$] = {DIRECT, VECTORED};

// The number of interrupt vectors to be generated, only used if VECTORED interrupt mode is
// supported
int max_interrupt_vector_num = 16;

// Physical memory protection support
bit support_pmp = 1; //edit

// Enhanced physical memory protection support
bit support_epmp = 1;

// Debug mode support
bit support_debug_mode = 1; //edit

// Support delegate trap to user mode
bit support_umode_trap = 0;

// Support sfence.vma instruction
bit support_sfence = 1;

// Support unaligned load/store
bit support_unaligned_load_store = 1'b0;//1'b1; //1-Not supported by NOEL-V

// GPR setting
parameter int NUM_FLOAT_GPR = 32;
parameter int NUM_GPR = 32;
parameter int NUM_VEC_GPR = 32;

// ----------------------------------------------------------------------------
// Vector extension configuration
// ----------------------------------------------------------------------------

// Parameter for vector extension
parameter int VECTOR_EXTENSION_ENABLE = 0;

parameter int VLEN = 512;

// Maximum size of a single vector element
parameter int ELEN = 32;

// Minimum size of a sub-element, which must be at most 8-bits.
parameter int SELEN = 8;

// Maximum size of a single vector element (encoded in vsew format)
parameter int VELEN = 0;//int'($ln(ELEN)/$ln(2)) - 3;

// Maxium LMUL supported by the core
parameter int MAX_LMUL = 8;

// ----------------------------------------------------------------------------
// Multi-harts configuration
// ----------------------------------------------------------------------------

// Number of harts
parameter int NUM_HARTS = 1;

// ----------------------------------------------------------------------------
// Previleged CSR implementation
// ----------------------------------------------------------------------------

// Implemented previlieged CSR list
`ifdef DSIM
privileged_reg_t implemented_csr[] = {
`else
const privileged_reg_t implemented_csr[] = {
`endif
    // User mode CSR
    USTATUS,    // User status
    UIE,        // User interrupt-enable register
    UTVEC,      // User trap-handler base address
    USCRATCH,   // Scratch register for user trap handlers
    UEPC,       // User exception program counter
    UCAUSE,     // User trap cause
    UTVAL,      // User bad address or instruction
    UIP,        // User interrupt pending
    // Supervisor mode CSR
    SSTATUS,    // Supervisor status
    SEDELEG,    // Supervisor exception delegation register
    SIDELEG,    // Supervisor interrupt delegation register
    SIE,        // Supervisor interrupt-enable register
    STVEC,      // Supervisor trap-handler base address
    SCOUNTEREN, // Supervisor counter enable
    SSCRATCH,   // Scratch register for supervisor trap handlers
    SEPC,       // Supervisor exception program counter
    SCAUSE,     // Supervisor trap cause
    STVAL,      // Supervisor bad address or instruction
    SIP,        // Supervisor interrupt pending
    SATP,       // Supervisor address translation and protection
    // Machine mode mode CSR
    MVENDORID,  // Vendor ID
    MARCHID,    // Architecture ID
    MIMPID,     // Implementation ID
    MHARTID,    // Hardware thread ID
    MSTATUS,    // Machine status
    MISA,       // ISA and extensions
    MEDELEG,    // Machine exception delegation register
    MIDELEG,    // Machine interrupt delegation register
    MIE,        // Machine interrupt-enable register
    MTVEC,      // Machine trap-handler base address
    MCOUNTEREN, // Machine counter enable
    MSCRATCH,   // Scratch register for machine trap handlers
    MEPC,       // Machine exception program counter
    MCAUSE,     // Machine trap cause
    MTVAL,      // Machine bad address or instruction
    MIP,        // Machine interrupt pending
    // Floating point CSR
    FCSR        // Floating point control and status
};

// Implementation-specific custom CSRs
bit[11:0] custom_csr[] = {
  12'h720,  // Does not exist! //CSR_MHPMEVENT0H
  12'h723, //CSR_MHPMEVENT3H
  12'h724, //CSR_MHPMEVENT4H
  12'h725, //CSR_MHPMEVENT5H
  12'h726, //CSR_MHPMEVENT6H
  12'h727, //CSR_MHPMEVENT7H
  12'h728, //CSR_MHPMEVENT8H
  12'h729, //CSR_MHPMEVENT9H
  12'h72a, //CSR_MHPMEVENT10H
  12'h72b, //CSR_MHPMEVENT11H
  12'h72c, //CSR_MHPMEVENT12H
  12'h72d, //CSR_MHPMEVENT13H
  12'h72e, //CSR_MHPMEVENT14H
  12'h72f, //CSR_MHPMEVENT15H
  12'h730, //CSR_MHPMEVENT16H
  12'h731, //CSR_MHPMEVENT17H
  12'h732, //CSR_MHPMEVENT18H
  12'h733, //CSR_MHPMEVENT19H
  12'h734, //CSR_MHPMEVENT20H
  12'h735, //CSR_MHPMEVENT21H
  12'h736, //CSR_MHPMEVENT22H
  12'h737, //CSR_MHPMEVENT23H
  12'h738, //CSR_MHPMEVENT24H
  12'h739, //CSR_MHPMEVENT25H
  12'h73a, //CSR_MHPMEVENT26H
  12'h73b, //CSR_MHPMEVENT27H
  12'h73c, //CSR_MHPMEVENT28H
  12'h73d, //CSR_MHPMEVENT29H
  12'h73e, //CSR_MHPMEVENT30H
  12'h73f, //CSR_MHPMEVENT31H
  // Debug/Trace Registers
  12'h7a0, //CSR_TSELECT
  12'h7a1, //CSR_TDATA1
  12'h7a2, //CSR_TDATA2
  12'h7a3, //CSR_TDATA3
  12'h7a4, //CSR_TINFO
  12'h7a5, //CSR_TCONTROL
  12'h7a8, //CSR_MCONTEXT
  12'h7aa, //CSR_SCONTEXT
  // Custom Read/Write Registers
  12'h7c0, //CSR_FEATURES
  12'h7c1, //CSR_CCTRL
  12'h7c2, //CSR_TCMICTRL
  12'h7c3, //CSR_TCMDCTRL
  12'h7c4, //CSR_FT
  12'h7c5, //CSR_EINJECT
  12'h7c6, //CSR_DFEATURES
  12'h7d0, //CSR_FEATURESH
  12'h7d1, //CSR_CCTRLH
  12'h7d2, //CSR_TCMICTRLH
  12'h7d3, //CSR_TCMDCTRLH
  12'h7d4, //CSR_FTH
  12'h7d5, //CSR_EINJECTH
  12'h7d6, //CSR_DFEATURESH
  // Custom Read-only Registers
  12'hfc0, //CSR_CAPABILITY
  12'hfd0, //CSR_CAPABILITYH
  //GRLIB_INTERNAL_BEGIN
  // Custom Read/Write Unprivileged Registers
  12'h800, //CSR_TRACE_CTRL
  12'h803, //CSR_TFILT_OPS
  12'h804, //CSR_TFILT_OPMASK
  12'h805, //CSR_TFILT_OP
  12'h806, //CSR_TFILT_OPAMASK
  12'h807, //CSR_TFILT_OPADDR
  12'h808, //CSR_TFILT_RWAMASK
  12'h809, //CSR_TFILT_RWADDR
  12'h80a, //CSR_TFILT_RESMASK
  12'h80b, //CSR_TFILT_RESULT
  12'h80c, //CSR_TFILT_TVMASK
  12'h80d, //CSR_TFILT_TVAL
  12'h80e, //CSR_TFILT_EXC
  12'h80f, //CSR_IRQTEST
  12'h810 //CSR_FFLAGS_I
};

// ----------------------------------------------------------------------------
// Supported interrupt/exception setting, used for functional coverage
// ----------------------------------------------------------------------------

`ifdef DSIM
interrupt_cause_t implemented_interrupt[] = {
`else
const interrupt_cause_t implemented_interrupt[] = {
`endif
    U_SOFTWARE_INTR,
    S_SOFTWARE_INTR,
    M_SOFTWARE_INTR,
    U_TIMER_INTR,
    S_TIMER_INTR,
    M_TIMER_INTR,
    U_EXTERNAL_INTR,
    S_EXTERNAL_INTR,
    M_EXTERNAL_INTR
};

`ifdef DSIM
exception_cause_t implemented_exception[] = {
`else
const exception_cause_t implemented_exception[] = {
`endif
    INSTRUCTION_ACCESS_FAULT,
    ILLEGAL_INSTRUCTION,
    BREAKPOINT,
    LOAD_ADDRESS_MISALIGNED,
    LOAD_ACCESS_FAULT,
    STORE_AMO_ADDRESS_MISALIGNED,
    STORE_AMO_ACCESS_FAULT,
    ECALL_UMODE,
    ECALL_SMODE,
    ECALL_MMODE,
    INSTRUCTION_PAGE_FAULT,
    LOAD_PAGE_FAULT,
    STORE_AMO_PAGE_FAULT
};
