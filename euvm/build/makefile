# Runtime Paramters
INSTRCOUNT = 100000
VERBOSITY = NONE
RANDSEED = 1

# Compile Paramters
MTRIPLE = -m64
TARGET = RV64IMC
CC = gcc
DEBUG = NONE
DFLAGS = $(MTRIPLE) -d-version=$(TARGET) -w -d-debug=$(DEBUG) -O3  -release -boundscheck=off # --lowmem # -d-version=CHECK_COMPILE
DBGDFLAGS = $(MTRIPLE) -d-version=$(TARGET) -w -d-debug=$(DEBUG) -g
LDC2 = ldc2
PICOBJDIR = picobj-ldc
DBGPICOBJDIR = picobj-dbg-ldc

OBJDIR = obj-ldc

PICDBGOBJDIR = picobj-dbg-ldc
DBGOBJDIR = obj-dbg-ldc

PHOBOS = phobos2-ldc-shared

DATE = $(shell date '+%Y-%m-%d')

GEN_FILES = riscv/gen/package.d riscv/gen/riscv_amo_instr_lib.d		\
	    riscv/gen/riscv_data_page_gen.d				\
	    riscv/gen/riscv_directed_instr_lib.d			\
	    riscv/gen/riscv_instr_gen_config.d				\
	    riscv/gen/riscv_instr_pkg.d					\
	    riscv/gen/riscv_instr_registry.d				\
	    riscv/gen/riscv_instr_sequence.d				\
	    riscv/gen/riscv_instr_stream.d				\
	    riscv/gen/riscv_loop_instr.d riscv/gen/riscv_page_table.d	\
	    riscv/gen/riscv_page_table_entry.d				\
	    riscv/gen/riscv_page_table_exception_cfg.d			\
	    riscv/gen/riscv_page_table_list.d				\
	    riscv/gen/riscv_privileged_common_seq.d			\
	    riscv/gen/riscv_pseudo_instr.d				\
	    riscv/gen/riscv_signature_pkg.d				\
	    riscv/gen/riscv_vector_cfg.d riscv/gen/riscv_pmp_cfg.d	\
	    riscv/gen/riscv_load_store_instr_lib.d			\
	    riscv/gen/riscv_callstack_gen.d				\
	    riscv/gen/riscv_asm_program_gen.d riscv/gen/riscv_reg.d	\
	    riscv/gen/riscv_illegal_instr.d				\
	    riscv/gen/riscv_debug_rom_gen.d				\
	    riscv/gen/riscv_privil_reg.d				\
	    riscv/gen/riscv_custom_instr_enum.d				\
	    riscv/gen/riscv_defines.d					\
	    riscv/gen/target/rv32imcb/riscv_core_setting.d		\
	    riscv/gen/target/package.d					\
	    riscv/gen/target/rv64gcv/riscv_core_setting.d		\
	    riscv/gen/target/rv64gc/riscv_core_setting.d		\
	    riscv/gen/target/rv64imcb/riscv_core_setting.d		\
	    riscv/gen/target/rv32imafdc/riscv_core_setting.d		\
	    riscv/gen/target/ml/riscv_core_setting.d			\
	    riscv/gen/target/multi_harts/riscv_core_setting.d		\
	    riscv/gen/target/rv32imc_sv32/riscv_core_setting.d		\
	    riscv/gen/target/rv32i/riscv_core_setting.d			\
	    riscv/gen/target/rv64imc/riscv_core_setting.d		\
	    riscv/gen/target/rv32imc/riscv_core_setting.d


ISA_FILES = riscv/gen/isa/package.d riscv/gen/isa/riscv_amo_instr.d	\
            riscv/gen/isa/riscv_compressed_instr.d			\
            riscv/gen/isa/riscv_floating_point_instr.d			\
            riscv/gen/isa/riscv_instr.d riscv/gen/isa/riscv_b_instr.d	\
            riscv/gen/isa/riscv_vector_instr.d				\
            riscv/gen/isa/riscv_instr_register.d			\
            riscv/gen/isa/riscv_zba_instr.d				\
            riscv/gen/isa/riscv_zbb_instr.d				\
            riscv/gen/isa/riscv_zbc_instr.d				\
            riscv/gen/isa/riscv_zbs_instr.d				\
            riscv/gen/isa/rv32zba_instr.d				\
            riscv/gen/isa/rv128c_instr.d riscv/gen/isa/rv32a_instr.d	\
            riscv/gen/isa/rv32b_instr.d riscv/gen/isa/rv32c_instr.d	\
            riscv/gen/isa/rv32dc_instr.d riscv/gen/isa/rv32d_instr.d	\
            riscv/gen/isa/rv32fc_instr.d riscv/gen/isa/rv32f_instr.d	\
            riscv/gen/isa/rv32i_instr.d riscv/gen/isa/rv32m_instr.d	\
            riscv/gen/isa/rv32v_instr.d riscv/gen/isa/rv64a_instr.d	\
            riscv/gen/isa/rv64b_instr.d riscv/gen/isa/rv64c_instr.d	\
            riscv/gen/isa/rv64d_instr.d riscv/gen/isa/rv64f_instr.d	\
            riscv/gen/isa/rv64i_instr.d riscv/gen/isa/rv64m_instr.d	\
            riscv/gen/isa/rv32zba_instr.d				\
            riscv/gen/isa/rv32zbb_instr.d				\
            riscv/gen/isa/rv32zbc_instr.d				\
            riscv/gen/isa/rv32zbs_instr.d				\
            riscv/gen/isa/rv64zba_instr.d				\
            riscv/gen/isa/rv64zbb_instr.d				\
            riscv/gen/isa/custom/riscv_custom_instr.d			\
            riscv/gen/isa/custom/riscv_custom_instr_enum.d

TEST_FILES = riscv/test/riscv_instr_base_test.d                         \
	     riscv/test/riscv_instr_test_lib.d                          \
	     riscv/test/riscv_instr_test.d

GEN_OBJS  = $(GEN_FILES:.d=.o)
ISA_OBJS  = $(ISA_FILES:.d=.o)
TEST_OBJS = $(TEST_FILES:.d=.o)

all: riscv-libs riscv_instr_gen

clean:
	rm -rf picobj-ldc picobj-dbg-ldc riscv_instr_gen riscv_instr_gen_debug libriscv-dv-ldc-shared.so libriscv-dv-ldc.a libriscv-dv-ldc-debug-shared.so libriscv-dv-ldc-debug.a riscv_instr_gen_debug.o riscv_instr_gen.o

riscv-libs: riscv-lib-static riscv-lib-shared

riscv-lib-shared: libriscv-dv-ldc-shared.so

riscv-lib-static: libriscv-dv-ldc.a

$(PICOBJDIR)/%.o: ../%.d
	$(LDC2) -c $(DFLAGS) -relocation-model=pic -of$@ -I.. $^

$(DBGPICOBJDIR)/%.o: ../%.d
	$(LDC2) -c $(DBGDFLAGS) -relocation-model=pic -of$@ -I.. $^

libriscv-dv-ldc-shared.so: $(addprefix $(PICOBJDIR)/,$(GEN_OBJS)) \
			   $(addprefix $(PICOBJDIR)/,$(ISA_OBJS)) \
			   $(addprefix $(PICOBJDIR)/,$(TEST_OBJS))
	CC=$(CC) $(LDC2) -shared $(DFLAGS) -relocation-model=pic -of$@ -I.. $^ -L-luvm-ldc-shared -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -L-lz3

libriscv-dv-ldc-debug-shared.so: $(addprefix $(DBGPICOBJDIR)/,$(GEN_OBJS)) \
			         $(addprefix $(DBGPICOBJDIR)/,$(ISA_OBJS)) \
			         $(addprefix $(DBGPICOBJDIR)/,$(TEST_OBJS))
	CC=$(CC) $(LDC2) -shared $(DBGDFLAGS) -relocation-model=pic -of$@ -I.. $^ -L-luvm-ldc-shared -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -L-lz3

libriscv-dv-ldc-shared-alt.so: $(addprefix ../,$(GEN_FILES)) \
			       $(addprefix ../,$(ISA_FILES)) \
			       $(addprefix $(PICOBJDIR)/,$(TEST_OBJS))
	CC=$(CC) $(LDC2) -shared $(DFLAGS) -relocation-model=pic -of$@ -I.. $^ -L-luvm-ldc-shared -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -L-lz3

libriscv-dv-ldc.a: $(addprefix $(PICOBJDIR)/,$(GEN_OBJS)) \
	           $(addprefix $(PICOBJDIR)/,$(ISA_OBJS)) \
		   $(addprefix $(PICOBJDIR)/,$(TEST_OBJS))
	CC=$(CC) ar rcs $@ $^

TAGS: $(addprefix ../,$(GEN_FILES)) \
      $(addprefix ../,$(ISA_FILES)) \
      $(addprefix ../,$(TEST_FILES))
	dscanner --etags $^ > $@

riscv_instr_gen: ../riscv/test/riscv_instr_gen.d libriscv-dv-ldc-shared.so
	$(LDC2) -link-defaultlib-shared $(DFLAGS) -of$@ -I.. -L--no-as-needed -L-R./ -L-L./ $< -L-lriscv-dv-ldc-shared -L-luvm-ldc-shared -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-lz3 -L-ldl 

riscv_instr_gen_debug: ../riscv/test/riscv_instr_gen.d libriscv-dv-ldc-debug-shared.so
	$(LDC2) -link-defaultlib-shared $(DBGDFLAGS) -of$@ -I.. -L--no-as-needed -L-R./ -L-L./ $< -L-lriscv-dv-ldc-debug-shared -L-luvm-ldc-debug-shared -L-lesdl-ldc-debug-shared -L-lphobos2-ldc-shared -L-lz3 -L-ldl

run: riscv_instr_gen
	./riscv_instr_gen +UVM_VERBOSITY=$(VERBOSITY) +random_seed=$(RANDSEED) +UVM_TESTNAME=riscv.test.riscv_instr_base_test.riscv_instr_base_test +num_of_tests=1 +start_idx=0 +asm_file_name=out_$(DATE)/asm_test/riscv_rand_instr_test +instr_cnt=$(INSTRCOUNT) +num_of_sub_program=5 \
	+directed_instr_0=riscv.gen.riscv_load_store_instr_lib.riscv_load_store_rand_instr_stream,4 \
	+directed_instr_1=riscv.gen.riscv_load_store_instr_lib.riscv_hazard_instr_stream,4 \
	+directed_instr_2=riscv.gen.riscv_load_store_instr_lib.riscv_load_store_hazard_instr_stream,4 \
	+directed_instr_3=riscv.gen.riscv_load_store_instr_lib.riscv_multi_page_load_store_instr_stream,4 \
	+directed_instr_4=riscv.gen.riscv_load_store_instr_lib.riscv_mem_region_stress_test,4 \
	+directed_instr_5=riscv.gen.riscv_directed_instr_lib.riscv_jal_instr,4 \
	+directed_instr_6=riscv.gen.riscv_loop_instr.riscv_loop_instr,4

run_debug: riscv_instr_gen_debug
	./riscv_instr_gen_debug +UVM_VERBOSITY=$(VERBOSITY) +random_seed=$(RANDSEED) +UVM_TESTNAME=riscv.test.riscv_instr_base_test.riscv_instr_base_test +num_of_tests=1 +start_idx=0 +asm_file_name=out_2021-08-10/asm_test/riscv_rand_instr_test +instr_cnt=$(INSTRCOUNT) +num_of_sub_program=5 \
	+directed_instr_0=riscv.gen.riscv_load_store_instr_lib.riscv_load_store_rand_instr_stream,4 \
	+directed_instr_1=riscv.gen.riscv_load_store_instr_lib.riscv_hazard_instr_stream,4 \
	+directed_instr_2=riscv.gen.riscv_load_store_instr_lib.riscv_load_store_hazard_instr_stream,4 \
	+directed_instr_3=riscv.gen.riscv_load_store_instr_lib.riscv_multi_page_load_store_instr_stream,4 \
	+directed_instr_4=riscv.gen.riscv_load_store_instr_lib.riscv_mem_region_stress_test,4 \
	+directed_instr_5=riscv.gen.riscv_directed_instr_lib.riscv_jal_instr,4 \
	+directed_instr_6=riscv.gen.riscv_loop_instr.riscv_loop_instr,4

run_riscv_arithmetic_basic_test: riscv_instr_gen
	./riscv_instr_gen +UVM_VERBOSITY=$(VERBOSITY) +random_seed=$(RANDSEED) +UVM_TESTNAME=riscv.test.riscv_instr_base_test.riscv_instr_base_test +num_of_tests=1 +start_idx=0 +asm_file_name=out_2021-08-10/asm_test/riscv_arithmetic_basic_test +instr_cnt=$(INSTRCOUNT) +num_of_sub_program=0 +directed_instr_0=riscv.gen.riscv_directed_instr_lib.riscv_int_numeric_corner_stream,4 +no_fence=true +no_data_page=true +no_branch_jump=true +boot_mode=m +no_csr_instr=true 

run_riscv_arithmetic_only_test: riscv_instr_gen
	./riscv_instr_gen +UVM_VERBOSITY=$(VERBOSITY) +random_seed=$(RANDSEED) +UVM_TESTNAME=riscv.test.riscv_instr_base_test.riscv_instr_base_test +num_of_tests=1 +start_idx=0 +asm_file_name=out_2021-08-10/asm_test/riscv_arithmetic_basic_test +instr_cnt=$(INSTRCOUNT) +no_fence=true +no_data_page=true +num_of_sub_program=0 +no_branch_jump=true +boot_mode=m +no_csr_instr=true 
