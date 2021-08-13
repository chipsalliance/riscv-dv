MTRIPLE = -m64
CC = gcc
DEBUG = NONE # CSTSOLVER
DFLAGS = $(MTRIPLE) -g -preview=intpromote -w -d-debug=$(DEBUG) -O3  # -release -boundscheck=off  -d-version=CHECK_COMPILE
DBGDFLAGS = $(MTRIPLE) -preview=intpromote -w -d-debug=$(DEBUG) -g

LDC2 = ldc2
PICOBJDIR = picobj-ldc
OBJDIR = obj-ldc

PICDBGOBJDIR = picobj-dbg-ldc
DBGOBJDIR = obj-dbg-ldc

PHOBOS = phobos2-ldc-shared



GEN_FILES = riscv/gen/package.d riscv/gen/riscv_amo_instr_lib.d		\
	    riscv/gen/riscv_core_setting.d				\
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
	    riscv/gen/riscv_defines.d

ISA_FILES = riscv/gen/isa/package.d riscv/gen/isa/riscv_amo_instr.d	\
            riscv/gen/isa/riscv_compressed_instr.d			\
            riscv/gen/isa/riscv_floating_point_instr.d			\
            riscv/gen/isa/riscv_instr.d riscv/gen/isa/riscv_b_instr.d	\
            riscv/gen/isa/riscv_vector_instr.d				\
            riscv/gen/isa/riscv_instr_register.d			\
            riscv/gen/isa/rv128c_instr.d riscv/gen/isa/rv32a_instr.d	\
            riscv/gen/isa/rv32b_instr.d riscv/gen/isa/rv32c_instr.d	\
            riscv/gen/isa/rv32dc_instr.d riscv/gen/isa/rv32d_instr.d	\
            riscv/gen/isa/rv32fc_instr.d riscv/gen/isa/rv32f_instr.d	\
            riscv/gen/isa/rv32i_instr.d riscv/gen/isa/rv32m_instr.d	\
            riscv/gen/isa/rv32v_instr.d riscv/gen/isa/rv64a_instr.d	\
            riscv/gen/isa/rv64b_instr.d riscv/gen/isa/rv64c_instr.d	\
            riscv/gen/isa/rv64d_instr.d riscv/gen/isa/rv64f_instr.d	\
            riscv/gen/isa/rv64i_instr.d riscv/gen/isa/rv64m_instr.d	\
            riscv/gen/isa/custom/riscv_custom_instr.d			\
            riscv/gen/isa/custom/riscv_custom_instr_enum.d

TEST_FILES = riscv/test/riscv_instr_base_test.d

GEN_OBJS  = $(GEN_FILES:.d=.o)
ISA_OBJS  = $(ISA_FILES:.d=.o)

all: riscv-libs

riscv-libs: riscv-lib-static riscv-lib-shared

riscv-lib-shared: libriscv-dv-ldc-shared.so

riscv-lib-static: libriscv-dv-ldc.a

$(PICOBJDIR)/%.o: ../%.d
	$(LDC2) -c $(DFLAGS) -relocation-model=pic -of$@ -I.. $^

libriscv-dv-ldc-shared.so: $(addprefix $(PICOBJDIR)/,$(GEN_OBJS)) \
			   $(addprefix $(PICOBJDIR)/,$(ISA_OBJS))
	CC=$(CC) $(LDC2) -shared $(DFLAGS) -relocation-model=pic -of$@ -I.. $^ -L-luvm-ldc-shared -L-lesdl-ldc-shared -L-lphobos2-ldc-shared -L-ldruntime-ldc-shared -L-lz3

libriscv-dv-ldc.a: $(addprefix $(PICOBJDIR)/,$(GEN_OBJS)) \
	           $(addprefix $(PICOBJDIR)/,$(ISA_OBJS))
	CC=$(CC) ar rcs $@ $^

TAGS: $(addprefix ../,$(GEN_FILES)) \
      $(addprefix ../,$(ISA_FILES)) \
      $(addprefix ../,$(TEST_FILES))
	dscanner --etags $^ > $@

# riscv_instr_base_test: ../riscv/test/riscv_instr_base_test.d $(addprefix ../,$(GEN_FILES)) $(addprefix ../,$(ISA_FILES))
# 	$(LDC2) -link-defaultlib-shared $(DFLAGS) -of$@ -I.. -L-luvm-ldc-debug-shared -L-lesdl-ldc-debug-shared -L-lphobos2-ldc-debug-shared -L-lz3 -L-ldl $^

# riscv_instr_base_test: ../riscv/test/riscv_instr_base_test.d libriscv-dv-ldc.a
# 	$(LDC2) -link-defaultlib-shared $(DFLAGS) -of$@ -I.. -L-luvm-ldc-debug-shared -L-lesdl-ldc-debug-shared -L-lphobos2-ldc-debug-shared -L-lz3 -L-ldl $^

riscv_instr_base_test: ../riscv/test/riscv_instr_base_test.d libriscv-dv-ldc.a
	$(LDC2) -link-defaultlib-shared $(DFLAGS) -of$@ -I.. -L-luvm-ldc-debug-shared -L-lesdl-ldc-debug-shared -L-lphobos2-ldc-shared -L-lz3 -L-ldl $^

run: riscv_instr_base_test
	./riscv_instr_base_test +UVM_VERBOSITY=DEBUG +UVM_TESTNAME=riscv.test.riscv_instr_base_test.riscv_instr_base_test +num_of_tests=2 +start_idx=0 +asm_file_name=out_2021-08-10/asm_test/riscv_rand_instr_test +instr_cnt=10000 +num_of_sub_program=5 \
	+directed_instr_0=riscv.gen.riscv_load_store_instr_lib.riscv_load_store_rand_instr_stream,4 \
	+directed_instr_1=riscv.gen.riscv_load_store_instr_lib.riscv_hazard_instr_stream,4 \
	+directed_instr_2=riscv.gen.riscv_load_store_instr_lib.riscv_load_store_hazard_instr_stream,4 \
	+directed_instr_3=riscv.gen.riscv_load_store_instr_lib.riscv_multi_page_load_store_instr_stream,4 \
	+directed_instr_4=riscv.gen.riscv_load_store_instr_lib.riscv_mem_region_stress_test,4 \
	+directed_instr_5=riscv.gen.riscv_directed_instr_lib.riscv_jal_instr,4 \
	+directed_instr_6=riscv.gen.riscv_loop_instr.riscv_loop_instr,4 \
	+pmp_num_regions=5

