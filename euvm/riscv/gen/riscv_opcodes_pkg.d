module riscv.gen.riscv_opcodes_pkg;

enum riscv_instr_name_t: short {
    ADD,
    ADD16,
    ADD32,
    ADD8,
    ADD_UW,
    ADDI,
    ADDIW,
    ADDW,
    AMOADD_D,
    AMOADD_W,
    AMOAND_D,
    AMOAND_W,
    AMOMAX_D,
    AMOMAX_W,
    AMOMAXU_D,
    AMOMAXU_W,
    AMOMIN_D,
    AMOMIN_W,
    AMOMINU_D,
    AMOMINU_W,
    AMOOR_D,
    AMOOR_W,
    AMOSWAP_D,
    AMOSWAP_W,
    AMOXOR_D,
    AMOXOR_W,
    AND,
    ANDI,
    ANDN,
    AUIPC,
    AVE,
    BCLR,
    BCLRI,
    BCOMPRESS,
    BCOMPRESSW,
    BDECOMPRESS,
    BDECOMPRESSW,
    BEQ,
    BEXT,
    BEXTI,
    BFP,
    BFPW,
    BGE,
    BGEU,
    BINV,
    BINVI,
    BLT,
    BLTU,
    BMATFLIP,
    BMATOR,
    BMATXOR,
    BNE,
    BSET,
    BSETI,
    C_ADD,
    C_ADDI,
    C_ADDI16SP,
    C_ADDI4SPN,
    C_ADDIW,
    C_ADDW,
    C_AND,
    C_ANDI,
    C_BEQZ,
    C_BNEZ,
    C_EBREAK,
    C_FLD,
    C_FLDSP,
    C_FLW,
    C_FLWSP,
    C_FSD,
    C_FSDSP,
    C_FSW,
    C_FSWSP,
    C_J,
    C_JAL,
    C_JALR,
    C_JR,
    C_LD,
    C_LDSP,
    C_LI,
    C_LQ,
    C_LQSP,
    C_LUI,
    C_LW,
    C_LWSP,
    C_MV,
    C_NOP,
    C_OR,
    C_SD,
    C_SDSP,
    C_SLLI,
    C_SLLI64,
    C_SQ,
    C_SQSP,
    C_SRAI,
    C_SRAI64,
    C_SRLI,
    C_SRLI64,
    C_SUB,
    C_SUBW,
    C_SW,
    C_SWSP,
    C_XOR,
    CLMUL,
    CLMULH,
    CLMULR,
    CLROV,
    CLRS16,
    CLRS32,
    CLRS8,
    CLZ,
    CLZ16,
    CLZ32,
    CLZ8,
    CLZW,
    CMIX,
    CMOV,
    CMPEQ16,
    CMPEQ8,
    CPOP,
    CPOPW,
    CRAS16,
    CRAS32,
    CRC32_B,
    CRC32_D,
    CRC32_H,
    CRC32_W,
    CRC32C_B,
    CRC32C_D,
    CRC32C_H,
    CRC32C_W,
    CRSA16,
    CRSA32,
    CSRRC,
    CSRRCI,
    CSRRS,
    CSRRSI,
    CSRRW,
    CSRRWI,
    CTZ,
    CTZW,
    DIV,
    DIVU,
    DIVUW,
    DIVW,
    DRET,
    EBREAK,
    ECALL,
    FADD_D,
    FADD_S,
    FCLASS_D,
    FCLASS_S,
    FCVT_D_L,
    FCVT_D_LU,
    FCVT_D_S,
    FCVT_D_W,
    FCVT_D_WU,
    FCVT_L_D,
    FCVT_L_S,
    FCVT_LU_D,
    FCVT_LU_S,
    FCVT_S_D,
    FCVT_S_L,
    FCVT_S_LU,
    FCVT_S_W,
    FCVT_S_WU,
    FCVT_W_D,
    FCVT_W_S,
    FCVT_WU_D,
    FCVT_WU_S,
    FDIV_D,
    FDIV_S,
    FENCE,
    FENCE_I,
    FENCE_TSO,
    FEQ_D,
    FEQ_S,
    FLD,
    FLE_D,
    FLE_S,
    FLT_D,
    FLT_S,
    FLW,
    FMADD_D,
    FMADD_S,
    FMAX_D,
    FMAX_S,
    FMIN_D,
    FMIN_S,
    FMSUB_D,
    FMSUB_S,
    FMUL_D,
    FMUL_S,
    FMV_D_X,
    FMV_S_X,
    FMV_W_X,
    FMV_X_D,
    FMV_X_S,
    FMV_X_W,
    FNMADD_D,
    FNMADD_S,
    FNMSUB_D,
    FNMSUB_S,
    FRCSR,
    FRFLAGS,
    FRRM,
    FSCSR,
    FSD,
    FSFLAGS,
    FSFLAGSI,
    FSGNJ_D,
    FSGNJ_S,
    FSGNJN_D,
    FSGNJN_S,
    FSGNJX_D,
    FSGNJX_S,
    FSL,
    FSLW,
    FSQRT_D,
    FSQRT_S,
    FSR,
    FSRI,
    FSRIW,
    FSRM,
    FSRMI,
    FSRW,
    FSUB_D,
    FSUB_S,
    FSW,
    GORC,
    GORCI,
    GORCIW,
    GORCW,
    GREV,
    GREVI,
    GREVIW,
    GREVW,
    INSB,
    JAL,
    JALR,
    KABS16,
    KABS32,
    KABS8,
    KABSW,
    KADD16,
    KADD32,
    KADD8,
    KADDH,
    KADDW,
    KCRAS16,
    KCRAS32,
    KCRSA16,
    KCRSA32,
    KDMABB,
    KDMABB16,
    KDMABT,
    KDMABT16,
    KDMATT,
    KDMATT16,
    KDMBB,
    KDMBB16,
    KDMBT,
    KDMBT16,
    KDMTT,
    KDMTT16,
    KHM16,
    KHM8,
    KHMBB,
    KHMBB16,
    KHMBT,
    KHMBT16,
    KHMTT,
    KHMTT16,
    KHMX16,
    KHMX8,
    KMABB,
    KMABB32,
    KMABT,
    KMABT32,
    KMADA,
    KMADRS,
    KMADRS32,
    KMADS,
    KMADS32,
    KMATT,
    KMATT32,
    KMAXDA,
    KMAXDA32,
    KMAXDS,
    KMAXDS32,
    KMDA,
    KMDA32,
    KMMAC,
    KMMAC_U,
    KMMAWB,
    KMMAWB2,
    KMMAWB2_U,
    KMMAWB_U,
    KMMAWT,
    KMMAWT2,
    KMMAWT2_U,
    KMMAWT_U,
    KMMSB,
    KMMSB_U,
    KMMWB2,
    KMMWB2_U,
    KMMWT2,
    KMMWT2_U,
    KMSDA,
    KMSDA32,
    KMSXDA,
    KMSXDA32,
    KMXDA,
    KMXDA32,
    KSLL16,
    KSLL32,
    KSLL8,
    KSLLI16,
    KSLLI32,
    KSLLI8,
    KSLLIW,
    KSLLW,
    KSLRA16,
    KSLRA16_U,
    KSLRA32,
    KSLRA32_U,
    KSLRA8,
    KSLRA8_U,
    KSLRAW,
    KSLRAW_U,
    KSTAS16,
    KSTAS32,
    KSTSA16,
    KSTSA32,
    KSUB16,
    KSUB32,
    KSUB8,
    KSUBH,
    KSUBW,
    KWMMUL,
    KWMMUL_U,
    LB,
    LBU,
    LD,
    LH,
    LHU,
    LR_D,
    LR_W,
    LUI,
    LW,
    LWU,
    MADDR32,
    MAX,
    MAXU,
    MIN,
    MINU,
    MRET,
    MSUBR32,
    MUL,
    MULH,
    MULHSU,
    MULHU,
    MULW,
    NOP,
    OR,
    ORC_B,
    ORI,
    ORN,
    PACK,
    PACKH,
    PACKU,
    PACKUW,
    PACKW,
    PAUSE,
    PBSAD,
    PBSADA,
    PKBB16,
    PKBT16,
    PKBT32,
    PKTB16,
    PKTB32,
    PKTT16,
    RADD16,
    RADD32,
    RADD8,
    RADDW,
    RCRAS16,
    RCRAS32,
    RCRSA16,
    RCRSA32,
    RDCYCLE,
    RDCYCLEH,
    RDINSTRET,
    RDINSTRETH,
    RDOV,
    RDTIME,
    RDTIMEH,
    REM,
    REMU,
    REMUW,
    REMW,
    REV8,
    ROL,
    ROLW,
    ROR,
    RORI,
    RORIW,
    RORW,
    RSTAS16,
    RSTAS32,
    RSTSA16,
    RSTSA32,
    RSUB16,
    RSUB32,
    RSUB8,
    RSUBW,
    SB,
    SBREAK,
    SC_D,
    SC_W,
    SCALL,
    SCLIP16,
    SCLIP32,
    SCLIP8,
    SCMPLE16,
    SCMPLE8,
    SCMPLT16,
    SCMPLT8,
    SD,
    SEXT_B,
    SEXT_H,
    SFENCE_VMA,
    SH,
    SH1ADD,
    SH1ADD_UW,
    SH2ADD,
    SH2ADD_UW,
    SH3ADD,
    SH3ADD_UW,
    SHFL,
    SHFLI,
    SHFLW,
    SLL,
    SLL16,
    SLL32,
    SLL8,
    SLLI,
    SLLI16,
    SLLI32,
    SLLI8,
    SLLI_UW,
    SLLIW,
    SLLW,
    SLO,
    SLOI,
    SLOIW,
    SLOW,
    SLT,
    SLTI,
    SLTIU,
    SLTU,
    SMAQA,
    SMAQA_SU,
    SMAX16,
    SMAX32,
    SMAX8,
    SMBB16,
    SMBT16,
    SMBT32,
    SMDRS,
    SMDRS32,
    SMDS,
    SMDS32,
    SMIN16,
    SMIN32,
    SMIN8,
    SMMUL,
    SMMUL_U,
    SMMWB,
    SMMWB_U,
    SMMWT,
    SMMWT_U,
    SMTT16,
    SMTT32,
    SMXDS,
    SMXDS32,
    SRA,
    SRA16,
    SRA16_U,
    SRA32,
    SRA32_U,
    SRA8,
    SRA8_U,
    SRA_U,
    SRAI,
    SRAI16,
    SRAI16_U,
    SRAI32,
    SRAI32_U,
    SRAI8,
    SRAI8_U,
    SRAI_U,
    SRAIW,
    SRAIW_U,
    SRAW,
    SRET,
    SRL,
    SRL16,
    SRL16_U,
    SRL32,
    SRL32_U,
    SRL8,
    SRL8_U,
    SRLI,
    SRLI16,
    SRLI16_U,
    SRLI32,
    SRLI32_U,
    SRLI8,
    SRLI8_U,
    SRLIW,
    SRLW,
    SRO,
    SROI,
    SROIW,
    SROW,
    STAS16,
    STAS32,
    STSA16,
    STSA32,
    SUB,
    SUB16,
    SUB32,
    SUB8,
    SUBW,
    SUNPKD810,
    SUNPKD820,
    SUNPKD830,
    SUNPKD831,
    SUNPKD832,
    SW,
    UCLIP16,
    UCLIP32,
    UCLIP8,
    UCMPLE16,
    UCMPLE8,
    UCMPLT16,
    UCMPLT8,
    UKADD16,
    UKADD32,
    UKADD8,
    UKADDH,
    UKADDW,
    UKCRAS16,
    UKCRAS32,
    UKCRSA16,
    UKCRSA32,
    UKSTAS16,
    UKSTAS32,
    UKSTSA16,
    UKSTSA32,
    UKSUB16,
    UKSUB32,
    UKSUB8,
    UKSUBH,
    UKSUBW,
    UMAQA,
    UMAX16,
    UMAX32,
    UMAX8,
    UMIN16,
    UMIN32,
    UMIN8,
    UNSHFL,
    UNSHFLI,
    UNSHFLW,
    UNZIP16,
    UNZIP8,
    URADD16,
    URADD32,
    URADD8,
    URADDW,
    URCRAS16,
    URCRAS32,
    URCRSA16,
    URCRSA32,
    URSTAS16,
    URSTAS32,
    URSTSA16,
    URSTSA32,
    URSUB16,
    URSUB32,
    URSUB8,
    URSUBW,
    VAADD_VV,
    VAADD_VX,
    VAADDU_VV,
    VAADDU_VX,
    VADC_VIM,
    VADC_VVM,
    VADC_VXM,
    VADD_VI,
    VADD_VV,
    VADD_VX,
    VAESDF_VS,
    VAESDF_VV,
    VAESDM_VS,
    VAESDM_VV,
    VAESEF_VS,
    VAESEF_VV,
    VAESEM_VS,
    VAESEM_VV,
    VAESKF1_VI,
    VAESKF2_VI,
    VAESZ_VS,
    VAND_VI,
    VAND_VV,
    VAND_VX,
    VANDN_VV,
    VANDN_VX,
    VASUB_VV,
    VASUB_VX,
    VASUBU_VV,
    VASUBU_VX,
    VBREV8_V,
    VBREV_V,
    VCLMUL_VV,
    VCLMUL_VX,
    VCLMULH_VV,
    VCLMULH_VX,
    VCLZ_V,
    VCOMPRESS_VM,
    VCPOP_M,
    VCPOP_V,
    VCTZ_V,
    VDIV_VV,
    VDIV_VX,
    VDIVU_VV,
    VDIVU_VX,
    VFADD_VF,
    VFADD_VV,
    VFCLASS_V,
    VFCVT_F_X_V,
    VFCVT_F_XU_V,
    VFCVT_RTZ_X_F_V,
    VFCVT_RTZ_XU_F_V,
    VFCVT_X_F_V,
    VFCVT_XU_F_V,
    VFDIV_VF,
    VFDIV_VV,
    VFIRST_M,
    VFMACC_VF,
    VFMACC_VV,
    VFMADD_VF,
    VFMADD_VV,
    VFMAX_VF,
    VFMAX_VV,
    VFMERGE_VFM,
    VFMIN_VF,
    VFMIN_VV,
    VFMSAC_VF,
    VFMSAC_VV,
    VFMSUB_VF,
    VFMSUB_VV,
    VFMUL_VF,
    VFMUL_VV,
    VFMV_F_S,
    VFMV_S_F,
    VFMV_V_F,
    VFNCVT_F_F_W,
    VFNCVT_F_X_W,
    VFNCVT_F_XU_W,
    VFNCVT_ROD_F_F_W,
    VFNCVT_RTZ_X_F_W,
    VFNCVT_RTZ_XU_F_W,
    VFNCVT_X_F_W,
    VFNCVT_XU_F_W,
    VFNMACC_VF,
    VFNMACC_VV,
    VFNMADD_VF,
    VFNMADD_VV,
    VFNMSAC_VF,
    VFNMSAC_VV,
    VFNMSUB_VF,
    VFNMSUB_VV,
    VFRDIV_VF,
    VFREC7_V,
    VFREDMAX_VS,
    VFREDMIN_VS,
    VFREDOSUM_VS,
    VFREDSUM_VS,
    VFREDUSUM_VS,
    VFRSQRT7_V,
    VFRSUB_VF,
    VFSGNJ_VF,
    VFSGNJ_VV,
    VFSGNJN_VF,
    VFSGNJN_VV,
    VFSGNJX_VF,
    VFSGNJX_VV,
    VFSLIDE1DOWN_VF,
    VFSLIDE1UP_VF,
    VFSQRT_V,
    VFSUB_VF,
    VFSUB_VV,
    VFWADD_VF,
    VFWADD_VV,
    VFWADD_WF,
    VFWADD_WV,
    VFWCVT_F_F_V,
    VFWCVT_F_X_V,
    VFWCVT_F_XU_V,
    VFWCVT_RTZ_X_F_V,
    VFWCVT_RTZ_XU_F_V,
    VFWCVT_X_F_V,
    VFWCVT_XU_F_V,
    VFWMACC_VF,
    VFWMACC_VV,
    VFWMSAC_VF,
    VFWMSAC_VV,
    VFWMUL_VF,
    VFWMUL_VV,
    VFWNMACC_VF,
    VFWNMACC_VV,
    VFWNMSAC_VF,
    VFWNMSAC_VV,
    VFWREDOSUM_VS,
    VFWREDSUM_VS,
    VFWREDUSUM_VS,
    VFWSUB_VF,
    VFWSUB_VV,
    VFWSUB_WF,
    VFWSUB_WV,
    VGHSH_VV,
    VGMUL_VV,
    VID_V,
    VIOTA_M,
    VL1R_V,
    VL1RE16_V,
    VL1RE32_V,
    VL1RE64_V,
    VL1RE8_V,
    VL2R_V,
    VL2RE16_V,
    VL2RE32_V,
    VL2RE64_V,
    VL2RE8_V,
    VL4R_V,
    VL4RE16_V,
    VL4RE32_V,
    VL4RE64_V,
    VL4RE8_V,
    VL8R_V,
    VL8RE16_V,
    VL8RE32_V,
    VL8RE64_V,
    VL8RE8_V,
    VLE1024_V,
    VLE1024FF_V,
    VLE128_V,
    VLE128FF_V,
    VLE16_V,
    VLE16FF_V,
    VLE1_V,
    VLE256_V,
    VLE256FF_V,
    VLE32_V,
    VLE32FF_V,
    VLE512_V,
    VLE512FF_V,
    VLE64_V,
    VLE64FF_V,
    VLE8_V,
    VLE8FF_V,
    VLM_V,
    VLOXEI1024_V,
    VLOXEI128_V,
    VLOXEI16_V,
    VLOXEI256_V,
    VLOXEI32_V,
    VLOXEI512_V,
    VLOXEI64_V,
    VLOXEI8_V,
    VLSE1024_V,
    VLSE128_V,
    VLSE16_V,
    VLSE256_V,
    VLSE32_V,
    VLSE512_V,
    VLSE64_V,
    VLSE8_V,
    VLUXEI1024_V,
    VLUXEI128_V,
    VLUXEI16_V,
    VLUXEI256_V,
    VLUXEI32_V,
    VLUXEI512_V,
    VLUXEI64_V,
    VLUXEI8_V,
    VMACC_VV,
    VMACC_VX,
    VMADC_VI,
    VMADC_VIM,
    VMADC_VV,
    VMADC_VVM,
    VMADC_VX,
    VMADC_VXM,
    VMADD_VV,
    VMADD_VX,
    VMAND_MM,
    VMANDN_MM,
    VMANDNOT_MM,
    VMAX_VV,
    VMAX_VX,
    VMAXU_VV,
    VMAXU_VX,
    VMERGE_VIM,
    VMERGE_VVM,
    VMERGE_VXM,
    VMFEQ_VF,
    VMFEQ_VV,
    VMFGE_VF,
    VMFGT_VF,
    VMFLE_VF,
    VMFLE_VV,
    VMFLT_VF,
    VMFLT_VV,
    VMFNE_VF,
    VMFNE_VV,
    VMIN_VV,
    VMIN_VX,
    VMINU_VV,
    VMINU_VX,
    VMNAND_MM,
    VMNOR_MM,
    VMOR_MM,
    VMORN_MM,
    VMORNOT_MM,
    VMSBC_VV,
    VMSBC_VVM,
    VMSBC_VX,
    VMSBC_VXM,
    VMSBF_M,
    VMSEQ_VI,
    VMSEQ_VV,
    VMSEQ_VX,
    VMSGT_VI,
    VMSGT_VX,
    VMSGTU_VI,
    VMSGTU_VX,
    VMSIF_M,
    VMSLE_VI,
    VMSLE_VV,
    VMSLE_VX,
    VMSLEU_VI,
    VMSLEU_VV,
    VMSLEU_VX,
    VMSLT_VV,
    VMSLT_VX,
    VMSLTU_VV,
    VMSLTU_VX,
    VMSNE_VI,
    VMSNE_VV,
    VMSNE_VX,
    VMSOF_M,
    VMUL_VV,
    VMUL_VX,
    VMULH_VV,
    VMULH_VX,
    VMULHSU_VV,
    VMULHSU_VX,
    VMULHU_VV,
    VMULHU_VX,
    VMV1R_V,
    VMV2R_V,
    VMV4R_V,
    VMV8R_V,
    VMV_S_X,
    VMV_V_I,
    VMV_V_V,
    VMV_V_X,
    VMV_X_S,
    VMXNOR_MM,
    VMXOR_MM,
    VNCLIP_WI,
    VNCLIP_WV,
    VNCLIP_WX,
    VNCLIPU_WI,
    VNCLIPU_WV,
    VNCLIPU_WX,
    VNMSAC_VV,
    VNMSAC_VX,
    VNMSUB_VV,
    VNMSUB_VX,
    VNSRA_WI,
    VNSRA_WV,
    VNSRA_WX,
    VNSRL_WI,
    VNSRL_WV,
    VNSRL_WX,
    VOR_VI,
    VOR_VV,
    VOR_VX,
    VPOPC_M,
    VREDAND_VS,
    VREDMAX_VS,
    VREDMAXU_VS,
    VREDMIN_VS,
    VREDMINU_VS,
    VREDOR_VS,
    VREDSUM_VS,
    VREDXOR_VS,
    VREM_VV,
    VREM_VX,
    VREMU_VV,
    VREMU_VX,
    VREV8_V,
    VRGATHER_VI,
    VRGATHER_VV,
    VRGATHER_VX,
    VRGATHEREI16_VV,
    VROL_VV,
    VROL_VX,
    VROR_VI,
    VROR_VV,
    VROR_VX,
    VRSUB_VI,
    VRSUB_VX,
    VS1R_V,
    VS2R_V,
    VS4R_V,
    VS8R_V,
    VSADD_VI,
    VSADD_VV,
    VSADD_VX,
    VSADDU_VI,
    VSADDU_VV,
    VSADDU_VX,
    VSBC_VVM,
    VSBC_VXM,
    VSE1024_V,
    VSE128_V,
    VSE16_V,
    VSE1_V,
    VSE256_V,
    VSE32_V,
    VSE512_V,
    VSE64_V,
    VSE8_V,
    VSETIVLI,
    VSETVL,
    VSETVLI,
    VSEXT_VF2,
    VSEXT_VF4,
    VSEXT_VF8,
    VSHA2CH_VV,
    VSHA2CL_VV,
    VSHA2MS_VV,
    VSLIDE1DOWN_VX,
    VSLIDE1UP_VX,
    VSLIDEDOWN_VI,
    VSLIDEDOWN_VX,
    VSLIDEUP_VI,
    VSLIDEUP_VX,
    VSLL_VI,
    VSLL_VV,
    VSLL_VX,
    VSM3C_VI,
    VSM3ME_VV,
    VSM4K_VI,
    VSM4R_VS,
    VSM4R_VV,
    VSM_V,
    VSMUL_VV,
    VSMUL_VX,
    VSOXEI1024_V,
    VSOXEI128_V,
    VSOXEI16_V,
    VSOXEI256_V,
    VSOXEI32_V,
    VSOXEI512_V,
    VSOXEI64_V,
    VSOXEI8_V,
    VSRA_VI,
    VSRA_VV,
    VSRA_VX,
    VSRL_VI,
    VSRL_VV,
    VSRL_VX,
    VSSE1024_V,
    VSSE128_V,
    VSSE16_V,
    VSSE256_V,
    VSSE32_V,
    VSSE512_V,
    VSSE64_V,
    VSSE8_V,
    VSSRA_VI,
    VSSRA_VV,
    VSSRA_VX,
    VSSRL_VI,
    VSSRL_VV,
    VSSRL_VX,
    VSSUB_VV,
    VSSUB_VX,
    VSSUBU_VV,
    VSSUBU_VX,
    VSUB_VV,
    VSUB_VX,
    VSUXEI1024_V,
    VSUXEI128_V,
    VSUXEI16_V,
    VSUXEI256_V,
    VSUXEI32_V,
    VSUXEI512_V,
    VSUXEI64_V,
    VSUXEI8_V,
    VWADD_VV,
    VWADD_VX,
    VWADD_WV,
    VWADD_WX,
    VWADDU_VV,
    VWADDU_VX,
    VWADDU_WV,
    VWADDU_WX,
    VWMACC_VV,
    VWMACC_VX,
    VWMACCSU_VV,
    VWMACCSU_VX,
    VWMACCU_VV,
    VWMACCU_VX,
    VWMACCUS_VX,
    VWMUL_VV,
    VWMUL_VX,
    VWMULSU_VV,
    VWMULSU_VX,
    VWMULU_VV,
    VWMULU_VX,
    VWREDSUM_VS,
    VWREDSUMU_VS,
    VWSLL_VI,
    VWSLL_VV,
    VWSLL_VX,
    VWSUB_VV,
    VWSUB_VX,
    VWSUB_WV,
    VWSUB_WX,
    VWSUBU_VV,
    VWSUBU_VX,
    VWSUBU_WV,
    VWSUBU_WX,
    VXOR_VI,
    VXOR_VV,
    VXOR_VX,
    VZEXT_VF2,
    VZEXT_VF4,
    VZEXT_VF8,
    WFI,
    XNOR,
    XOR,
    XORI,
    XPERM16,
    XPERM32,
    XPERM4,
    XPERM8,
    ZEXT_H,
    ZUNPKD810,
    ZUNPKD820,
    ZUNPKD830,
    ZUNPKD831,
    ZUNPKD832,
    INVALID_INSTR
}


  enum riscv_opcodes_imm_t: byte {
    imm20,
    jimm20,
    imm12,
    imm12hi,
    bimm12hi,
    imm12lo,
    bimm12lo,
    imm2,
    imm3,
    imm4,
    imm5,
    imm6,
    zimm
  }

  enum riscv_opcodes_v_imm_t: byte {
    simm5,
    zimm5,
    zimm10,
    zimm11,
    zimm6hi,
    zimm6lo
  }

  enum riscv_opcodes_c_imm_t: byte {
    c_nzuimm10,
    c_uimm7lo,
    c_uimm7hi,
    c_uimm8lo,
    c_uimm8hi,
    c_uimm9lo,
    c_uimm9hi,
    c_nzimm6lo,
    c_nzimm6hi,
    c_imm6lo,
    c_imm6hi,
    c_nzimm10hi,
    c_nzimm10lo,
    c_nzimm18hi,
    c_nzimm18lo,
    c_imm12,
    c_bimm9lo,
    c_bimm9hi,
    c_nzuimm5,
    c_nzuimm6lo,
    c_nzuimm6hi,
    c_uimm8splo,
    c_uimm8sphi,
    c_uimm8sp_s,
    c_uimm10splo,
    c_uimm10sphi,
    c_uimm9splo,
    c_uimm9sphi,
    c_uimm10sp_s,
    c_uimm9sp_s,
    c_uimm2,
    c_uimm1,
    c_spimm
  }

  enum riscv_opcodes_var_t: byte {
    rd,
    rt,
    rs1,
    rs2,
    rs3,
    aqrl,
    aq,
    rl,
    fm,
    pred,
    succ,
    rm,
    funct3,
    funct2,
    csr,
    shamtq,
    shamtw,
    shamtw4,
    shamtd,
    bs,
    rnum,
    rc,
    opcode,
    funct7
  }

  enum riscv_opcodes_v_var_t: byte {
    vd,
    vs3,
    vs1,
    vs2,
    vm,
    wd,
    amoop,
    nf
  }
 
  enum riscv_opcodes_c_var_t: byte {
    c_rlist,
    c_index,
    rs1_p,
    rs2_p,
    rd_p,
    rd_rs1_n0,
    rd_rs1_p,
    rd_rs1,
    rd_n2,
    rd_n0,
    rs1_n0,
    c_rs2_n0,
    c_rs1_n0,
    c_rs2,
    c_sreg1,
    c_sreg2
  }


enum riscv_extention_t: short {
  rv_s,
  rv_system,
  rv_sdext,
  rv_i,
  rv32_i,
  rv64_i,
  rv_c,
  rv32_c,
  rv_c_d,
  rv64_c,
  rv128_c,
  rv_zba,
  rv64_zba,
  rv_zbb,
  rv64_zbb,
  rv_zbc,
  rv_zbe,
  rv64_zbe,
  rv_zbf,
  rv64_zbf,
  rv64_zbm,
  rv_zbp,
  rv64_zbp,
  rv_zbr,
  rv64_zbr,
  rv_zbs,
  rv64_zbs,
  rv_zbt,
  rv64_zbt,
  rv64_zks,
  rv_b,
  rv64_b,
  rv_m,
  rv64_m,
  rv_f,
  rv32_c_f,
  rv64_f,
  rv_d,
  rv32_c_d,
  rv64_d,
  rv_a,
  rv64_a,
  rv_v,
  rv_v_aliases,
  rv_zicsr,
  rv_zifencei,
  rv_zvknha,
  rv_zvknhb,
  rv_zpn,
  rv32_zpn,
  rv64_zpn,
  rv_zvkg,
  rv_zvkn,
  rv_zvks
};
	struct riscv_instr_var_params_s {
	  riscv_instr_var_t _arg;
	  ubyte             _lsb;
	  ubyte             _msb;
	}
	
	struct riscv_instr_param_s {
	  riscv_instr_name_t _name;
	  riscv_instr_name_t _orig_name;
	  uint _mask;
	  uint _match;
	  riscv_instr_var_t[] _var_list;
	  riscv_extention_t[] _ext_list;
	  ulong _imms;
	  ulong _c_imms;
	  ulong _v_imms;
	  ulong _vars;
	  ulong _c_vars;
	  ulong _v_vars;
	}

      
enum riscv_instr_var_t: short {
  rd,
  rt,
  rs1,
  rs2,
  rs3,
  aqrl,
  aq,
  rl,
  fm,
  pred,
  succ,
  rm,
  funct3,
  funct2,
  imm20,
  jimm20,
  imm12,
  csr,
  imm12hi,
  bimm12hi,
  imm12lo,
  bimm12lo,
  zimm,
  shamtq,
  shamtw,
  shamtw4,
  shamtd,
  bs,
  rnum,
  rc,
  imm2,
  imm3,
  imm4,
  imm5,
  imm6,
  opcode,
  funct7,
  vd,
  vs3,
  vs1,
  vs2,
  vm,
  wd,
  amoop,
  nf,
  simm5,
  zimm5,
  zimm10,
  zimm11,
  zimm6hi,
  zimm6lo,
  c_nzuimm10,
  c_uimm7lo,
  c_uimm7hi,
  c_uimm8lo,
  c_uimm8hi,
  c_uimm9lo,
  c_uimm9hi,
  c_nzimm6lo,
  c_nzimm6hi,
  c_imm6lo,
  c_imm6hi,
  c_nzimm10hi,
  c_nzimm10lo,
  c_nzimm18hi,
  c_nzimm18lo,
  c_imm12,
  c_bimm9lo,
  c_bimm9hi,
  c_nzuimm5,
  c_nzuimm6lo,
  c_nzuimm6hi,
  c_uimm8splo,
  c_uimm8sphi,
  c_uimm8sp_s,
  c_uimm10splo,
  c_uimm10sphi,
  c_uimm9splo,
  c_uimm9sphi,
  c_uimm10sp_s,
  c_uimm9sp_s,
  c_uimm2,
  c_uimm1,
  c_rlist,
  c_spimm,
  c_index,
  rs1_p,
  rs2_p,
  rd_p,
  rd_rs1_n0,
  rd_rs1_p,
  rd_rs1,
  rd_n2,
  rd_n0,
  rs1_n0,
  c_rs2_n0,
  c_rs1_n0,
  c_rs2,
  c_sreg1,
  c_sreg2,
}

enum riscv_instr_var_params_s[] riscv_instr_var_params = [
  riscv_instr_var_params_s(riscv_instr_var_t.rd, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.rt, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.rs1, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.rs2, 20, 25),
  riscv_instr_var_params_s(riscv_instr_var_t.rs3, 27, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.aqrl, 25, 27),
  riscv_instr_var_params_s(riscv_instr_var_t.aq, 26, 27),
  riscv_instr_var_params_s(riscv_instr_var_t.rl, 25, 26),
  riscv_instr_var_params_s(riscv_instr_var_t.fm, 28, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.pred, 24, 28),
  riscv_instr_var_params_s(riscv_instr_var_t.succ, 20, 24),
  riscv_instr_var_params_s(riscv_instr_var_t.rm, 12, 15),
  riscv_instr_var_params_s(riscv_instr_var_t.funct3, 12, 15),
  riscv_instr_var_params_s(riscv_instr_var_t.funct2, 25, 27),
  riscv_instr_var_params_s(riscv_instr_var_t.imm20, 12, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.jimm20, 12, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.imm12, 20, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.csr, 20, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.imm12hi, 25, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.bimm12hi, 25, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.imm12lo, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.bimm12lo, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.zimm, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.shamtq, 20, 27),
  riscv_instr_var_params_s(riscv_instr_var_t.shamtw, 20, 25),
  riscv_instr_var_params_s(riscv_instr_var_t.shamtw4, 20, 24),
  riscv_instr_var_params_s(riscv_instr_var_t.shamtd, 20, 26),
  riscv_instr_var_params_s(riscv_instr_var_t.bs, 30, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.rnum, 20, 24),
  riscv_instr_var_params_s(riscv_instr_var_t.rc, 25, 30),
  riscv_instr_var_params_s(riscv_instr_var_t.imm2, 20, 22),
  riscv_instr_var_params_s(riscv_instr_var_t.imm3, 20, 23),
  riscv_instr_var_params_s(riscv_instr_var_t.imm4, 20, 24),
  riscv_instr_var_params_s(riscv_instr_var_t.imm5, 20, 25),
  riscv_instr_var_params_s(riscv_instr_var_t.imm6, 20, 26),
  riscv_instr_var_params_s(riscv_instr_var_t.opcode, 0, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.funct7, 25, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.vd, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.vs3, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.vs1, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.vs2, 20, 25),
  riscv_instr_var_params_s(riscv_instr_var_t.vm, 25, 26),
  riscv_instr_var_params_s(riscv_instr_var_t.wd, 26, 27),
  riscv_instr_var_params_s(riscv_instr_var_t.amoop, 27, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.nf, 29, 32),
  riscv_instr_var_params_s(riscv_instr_var_t.simm5, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.zimm5, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.zimm10, 20, 30),
  riscv_instr_var_params_s(riscv_instr_var_t.zimm11, 20, 31),
  riscv_instr_var_params_s(riscv_instr_var_t.zimm6hi, 26, 27),
  riscv_instr_var_params_s(riscv_instr_var_t.zimm6lo, 15, 20),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzuimm10, 5, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm7lo, 5, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm7hi, 10, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm8lo, 5, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm8hi, 10, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm9lo, 5, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm9hi, 10, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzimm6lo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzimm6hi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_imm6lo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_imm6hi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzimm10hi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzimm10lo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzimm18hi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzimm18lo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_imm12, 2, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_bimm9lo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_bimm9hi, 10, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzuimm5, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzuimm6lo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_nzuimm6hi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm8splo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm8sphi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm8sp_s, 7, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm10splo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm10sphi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm9splo, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm9sphi, 12, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm10sp_s, 7, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm9sp_s, 7, 13),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm2, 5, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_uimm1, 5, 6),
  riscv_instr_var_params_s(riscv_instr_var_t.c_rlist, 4, 8),
  riscv_instr_var_params_s(riscv_instr_var_t.c_spimm, 2, 4),
  riscv_instr_var_params_s(riscv_instr_var_t.c_index, 2, 10),
  riscv_instr_var_params_s(riscv_instr_var_t.rs1_p, 7, 10),
  riscv_instr_var_params_s(riscv_instr_var_t.rs2_p, 2, 5),
  riscv_instr_var_params_s(riscv_instr_var_t.rd_p, 2, 5),
  riscv_instr_var_params_s(riscv_instr_var_t.rd_rs1_n0, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.rd_rs1_p, 7, 10),
  riscv_instr_var_params_s(riscv_instr_var_t.rd_rs1, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.rd_n2, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.rd_n0, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.rs1_n0, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.c_rs2_n0, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_rs1_n0, 7, 12),
  riscv_instr_var_params_s(riscv_instr_var_t.c_rs2, 2, 7),
  riscv_instr_var_params_s(riscv_instr_var_t.c_sreg1, 7, 10),
  riscv_instr_var_params_s(riscv_instr_var_t.c_sreg2, 2, 5),
];

enum riscv_instr_params = 
  [  riscv_instr_param_s(
     riscv_instr_name_t.ADD, // instr_name
     riscv_instr_name_t.ADD, // orig_name
     0xfe00707f, // mask
     0x33, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADD
  riscv_instr_param_s(
     riscv_instr_name_t.ADD16, // instr_name
     riscv_instr_name_t.ADD16, // orig_name
     0xfe00707f, // mask
     0x40000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADD16
  riscv_instr_param_s(
     riscv_instr_name_t.ADD32, // instr_name
     riscv_instr_name_t.ADD32, // orig_name
     0xfe00707f, // mask
     0x40002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADD32
  riscv_instr_param_s(
     riscv_instr_name_t.ADD8, // instr_name
     riscv_instr_name_t.ADD8, // orig_name
     0xfe00707f, // mask
     0x48000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADD8
  riscv_instr_param_s(
     riscv_instr_name_t.ADD_UW, // instr_name
     riscv_instr_name_t.ADD_UW, // orig_name
     0xfe00707f, // mask
     0x800003b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADD_UW
  riscv_instr_param_s(
     riscv_instr_name_t.ADDI, // instr_name
     riscv_instr_name_t.ADDI, // orig_name
     0x707f, // mask
     0x13, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADDI
  riscv_instr_param_s(
     riscv_instr_name_t.ADDIW, // instr_name
     riscv_instr_name_t.ADDIW, // orig_name
     0x707f, // mask
     0x1b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADDIW
  riscv_instr_param_s(
     riscv_instr_name_t.ADDW, // instr_name
     riscv_instr_name_t.ADDW, // orig_name
     0xfe00707f, // mask
     0x3b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ADDW
  riscv_instr_param_s(
     riscv_instr_name_t.AMOADD_D, // instr_name
     riscv_instr_name_t.AMOADD_D, // orig_name
     0xf800707f, // mask
     0x302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOADD_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOADD_W, // instr_name
     riscv_instr_name_t.AMOADD_W, // orig_name
     0xf800707f, // mask
     0x202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOADD_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOAND_D, // instr_name
     riscv_instr_name_t.AMOAND_D, // orig_name
     0xf800707f, // mask
     0x6000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOAND_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOAND_W, // instr_name
     riscv_instr_name_t.AMOAND_W, // orig_name
     0xf800707f, // mask
     0x6000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOAND_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMAX_D, // instr_name
     riscv_instr_name_t.AMOMAX_D, // orig_name
     0xf800707f, // mask
     0xa000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMAX_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMAX_W, // instr_name
     riscv_instr_name_t.AMOMAX_W, // orig_name
     0xf800707f, // mask
     0xa000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMAX_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMAXU_D, // instr_name
     riscv_instr_name_t.AMOMAXU_D, // orig_name
     0xf800707f, // mask
     0xe000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMAXU_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMAXU_W, // instr_name
     riscv_instr_name_t.AMOMAXU_W, // orig_name
     0xf800707f, // mask
     0xe000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMAXU_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMIN_D, // instr_name
     riscv_instr_name_t.AMOMIN_D, // orig_name
     0xf800707f, // mask
     0x8000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMIN_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMIN_W, // instr_name
     riscv_instr_name_t.AMOMIN_W, // orig_name
     0xf800707f, // mask
     0x8000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMIN_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMINU_D, // instr_name
     riscv_instr_name_t.AMOMINU_D, // orig_name
     0xf800707f, // mask
     0xc000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMINU_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOMINU_W, // instr_name
     riscv_instr_name_t.AMOMINU_W, // orig_name
     0xf800707f, // mask
     0xc000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOMINU_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOOR_D, // instr_name
     riscv_instr_name_t.AMOOR_D, // orig_name
     0xf800707f, // mask
     0x4000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOOR_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOOR_W, // instr_name
     riscv_instr_name_t.AMOOR_W, // orig_name
     0xf800707f, // mask
     0x4000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOOR_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOSWAP_D, // instr_name
     riscv_instr_name_t.AMOSWAP_D, // orig_name
     0xf800707f, // mask
     0x800302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOSWAP_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOSWAP_W, // instr_name
     riscv_instr_name_t.AMOSWAP_W, // orig_name
     0xf800707f, // mask
     0x800202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOSWAP_W
  riscv_instr_param_s(
     riscv_instr_name_t.AMOXOR_D, // instr_name
     riscv_instr_name_t.AMOXOR_D, // orig_name
     0xf800707f, // mask
     0x2000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOXOR_D
  riscv_instr_param_s(
     riscv_instr_name_t.AMOXOR_W, // instr_name
     riscv_instr_name_t.AMOXOR_W, // orig_name
     0xf800707f, // mask
     0x2000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AMOXOR_W
  riscv_instr_param_s(
     riscv_instr_name_t.AND, // instr_name
     riscv_instr_name_t.AND, // orig_name
     0xfe00707f, // mask
     0x7033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AND
  riscv_instr_param_s(
     riscv_instr_name_t.ANDI, // instr_name
     riscv_instr_name_t.ANDI, // orig_name
     0x707f, // mask
     0x7013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ANDI
  riscv_instr_param_s(
     riscv_instr_name_t.ANDN, // instr_name
     riscv_instr_name_t.ANDN, // orig_name
     0xfe00707f, // mask
     0x40007033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ANDN
  riscv_instr_param_s(
     riscv_instr_name_t.AUIPC, // instr_name
     riscv_instr_name_t.AUIPC, // orig_name
     0x7f, // mask
     0x17, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.imm20], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AUIPC
  riscv_instr_param_s(
     riscv_instr_name_t.AVE, // instr_name
     riscv_instr_name_t.AVE, // orig_name
     0xfe00707f, // mask
     0xe0000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // AVE
  riscv_instr_param_s(
     riscv_instr_name_t.BCLR, // instr_name
     riscv_instr_name_t.BCLR, // orig_name
     0xfe00707f, // mask
     0x48001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BCLR
  riscv_instr_param_s(
     riscv_instr_name_t.BCLRI, // instr_name
     riscv_instr_name_t.BCLRI, // orig_name
     0xfc00707f, // mask
     0x48001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BCLRI
  riscv_instr_param_s(
     riscv_instr_name_t.BCOMPRESS, // instr_name
     riscv_instr_name_t.BCOMPRESS, // orig_name
     0xfe00707f, // mask
     0x8006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbe], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BCOMPRESS
  riscv_instr_param_s(
     riscv_instr_name_t.BCOMPRESSW, // instr_name
     riscv_instr_name_t.BCOMPRESSW, // orig_name
     0xfe00707f, // mask
     0x800603b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbe], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BCOMPRESSW
  riscv_instr_param_s(
     riscv_instr_name_t.BDECOMPRESS, // instr_name
     riscv_instr_name_t.BDECOMPRESS, // orig_name
     0xfe00707f, // mask
     0x48006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbe], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BDECOMPRESS
  riscv_instr_param_s(
     riscv_instr_name_t.BDECOMPRESSW, // instr_name
     riscv_instr_name_t.BDECOMPRESSW, // orig_name
     0xfe00707f, // mask
     0x4800603b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbe], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BDECOMPRESSW
  riscv_instr_param_s(
     riscv_instr_name_t.BEQ, // instr_name
     riscv_instr_name_t.BEQ, // orig_name
     0x707f, // mask
     0x63, // match
     [riscv_instr_var_t.bimm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BEQ
  riscv_instr_param_s(
     riscv_instr_name_t.BEXT, // instr_name
     riscv_instr_name_t.BEXT, // orig_name
     0xfe00707f, // mask
     0x48005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BEXT
  riscv_instr_param_s(
     riscv_instr_name_t.BEXTI, // instr_name
     riscv_instr_name_t.BEXTI, // orig_name
     0xfc00707f, // mask
     0x48005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BEXTI
  riscv_instr_param_s(
     riscv_instr_name_t.BFP, // instr_name
     riscv_instr_name_t.BFP, // orig_name
     0xfe00707f, // mask
     0x48007033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbf], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BFP
  riscv_instr_param_s(
     riscv_instr_name_t.BFPW, // instr_name
     riscv_instr_name_t.BFPW, // orig_name
     0xfe00707f, // mask
     0x4800703b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbf], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BFPW
  riscv_instr_param_s(
     riscv_instr_name_t.BGE, // instr_name
     riscv_instr_name_t.BGE, // orig_name
     0x707f, // mask
     0x5063, // match
     [riscv_instr_var_t.bimm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BGE
  riscv_instr_param_s(
     riscv_instr_name_t.BGEU, // instr_name
     riscv_instr_name_t.BGEU, // orig_name
     0x707f, // mask
     0x7063, // match
     [riscv_instr_var_t.bimm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BGEU
  riscv_instr_param_s(
     riscv_instr_name_t.BINV, // instr_name
     riscv_instr_name_t.BINV, // orig_name
     0xfe00707f, // mask
     0x68001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BINV
  riscv_instr_param_s(
     riscv_instr_name_t.BINVI, // instr_name
     riscv_instr_name_t.BINVI, // orig_name
     0xfc00707f, // mask
     0x68001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BINVI
  riscv_instr_param_s(
     riscv_instr_name_t.BLT, // instr_name
     riscv_instr_name_t.BLT, // orig_name
     0x707f, // mask
     0x4063, // match
     [riscv_instr_var_t.bimm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BLT
  riscv_instr_param_s(
     riscv_instr_name_t.BLTU, // instr_name
     riscv_instr_name_t.BLTU, // orig_name
     0x707f, // mask
     0x6063, // match
     [riscv_instr_var_t.bimm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BLTU
  riscv_instr_param_s(
     riscv_instr_name_t.BMATFLIP, // instr_name
     riscv_instr_name_t.BMATFLIP, // orig_name
     0xfff0707f, // mask
     0x60301013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbm], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BMATFLIP
  riscv_instr_param_s(
     riscv_instr_name_t.BMATOR, // instr_name
     riscv_instr_name_t.BMATOR, // orig_name
     0xfe00707f, // mask
     0x8003033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbm], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BMATOR
  riscv_instr_param_s(
     riscv_instr_name_t.BMATXOR, // instr_name
     riscv_instr_name_t.BMATXOR, // orig_name
     0xfe00707f, // mask
     0x48003033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbm], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BMATXOR
  riscv_instr_param_s(
     riscv_instr_name_t.BNE, // instr_name
     riscv_instr_name_t.BNE, // orig_name
     0x707f, // mask
     0x1063, // match
     [riscv_instr_var_t.bimm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.bimm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1010000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BNE
  riscv_instr_param_s(
     riscv_instr_name_t.BSET, // instr_name
     riscv_instr_name_t.BSET, // orig_name
     0xfe00707f, // mask
     0x28001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BSET
  riscv_instr_param_s(
     riscv_instr_name_t.BSETI, // instr_name
     riscv_instr_name_t.BSETI, // orig_name
     0xfc00707f, // mask
     0x28001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbs], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // BSETI
  riscv_instr_param_s(
     riscv_instr_name_t.C_ADD, // instr_name
     riscv_instr_name_t.C_ADD, // orig_name
     0xf003, // mask
     0x9002, // match
     [riscv_instr_var_t.rd_rs1, riscv_instr_var_t.c_rs2_n0], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100010000000, // _c_vars
     0b0, // _v_vars
   ), // C_ADD
  riscv_instr_param_s(
     riscv_instr_name_t.C_ADDI, // instr_name
     riscv_instr_name_t.C_ADDI, // orig_name
     0xe003, // mask
     0x1, // match
     [riscv_instr_var_t.rd_rs1_n0, riscv_instr_var_t.c_nzimm6lo, riscv_instr_var_t.c_nzimm6hi], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // C_ADDI
  riscv_instr_param_s(
     riscv_instr_name_t.C_ADDI16SP, // instr_name
     riscv_instr_name_t.C_ADDI16SP, // orig_name
     0xef83, // mask
     0x6101, // match
     [riscv_instr_var_t.c_nzimm10hi, riscv_instr_var_t.c_nzimm10lo], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b1100000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_ADDI16SP
  riscv_instr_param_s(
     riscv_instr_name_t.C_ADDI4SPN, // instr_name
     riscv_instr_name_t.C_ADDI4SPN, // orig_name
     0xe003, // mask
     0x0, // match
     [riscv_instr_var_t.rd_p, riscv_instr_var_t.c_nzuimm10], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b1, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000, // _c_vars
     0b0, // _v_vars
   ), // C_ADDI4SPN
  riscv_instr_param_s(
     riscv_instr_name_t.C_ADDIW, // instr_name
     riscv_instr_name_t.C_ADDIW, // orig_name
     0xe003, // mask
     0x2001, // match
     [riscv_instr_var_t.rd_rs1_n0, riscv_instr_var_t.c_imm6lo, riscv_instr_var_t.c_imm6hi], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b11000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // C_ADDIW
  riscv_instr_param_s(
     riscv_instr_name_t.C_ADDW, // instr_name
     riscv_instr_name_t.C_ADDW, // orig_name
     0xfc63, // mask
     0x9c21, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.rs2_p], // variables
     [riscv_extention_t.rv64_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // C_ADDW
  riscv_instr_param_s(
     riscv_instr_name_t.C_AND, // instr_name
     riscv_instr_name_t.C_AND, // orig_name
     0xfc63, // mask
     0x8c61, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // C_AND
  riscv_instr_param_s(
     riscv_instr_name_t.C_ANDI, // instr_name
     riscv_instr_name_t.C_ANDI, // orig_name
     0xec03, // mask
     0x8801, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.c_imm6hi, riscv_instr_var_t.c_imm6lo], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b11000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // C_ANDI
  riscv_instr_param_s(
     riscv_instr_name_t.C_BEQZ, // instr_name
     riscv_instr_name_t.C_BEQZ, // orig_name
     0xe003, // mask
     0xc001, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_bimm9lo, riscv_instr_var_t.c_bimm9hi], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100, // _c_vars
     0b0, // _v_vars
   ), // C_BEQZ
  riscv_instr_param_s(
     riscv_instr_name_t.C_BNEZ, // instr_name
     riscv_instr_name_t.C_BNEZ, // orig_name
     0xe003, // mask
     0xe001, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_bimm9lo, riscv_instr_var_t.c_bimm9hi], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100, // _c_vars
     0b0, // _v_vars
   ), // C_BNEZ
  riscv_instr_param_s(
     riscv_instr_name_t.C_EBREAK, // instr_name
     riscv_instr_name_t.C_EBREAK, // orig_name
     0xffff, // mask
     0x9002, // match
     [], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_EBREAK
  riscv_instr_param_s(
     riscv_instr_name_t.C_FLD, // instr_name
     riscv_instr_name_t.C_FLD, // orig_name
     0xe003, // mask
     0x2000, // match
     [riscv_instr_var_t.rd_p, riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_uimm8lo, riscv_instr_var_t.c_uimm8hi], // variables
     [riscv_extention_t.rv_c_d], // extentions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // C_FLD
  riscv_instr_param_s(
     riscv_instr_name_t.C_FLDSP, // instr_name
     riscv_instr_name_t.C_FLDSP, // orig_name
     0xe003, // mask
     0x2002, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.c_uimm9sphi, riscv_instr_var_t.c_uimm9splo], // variables
     [riscv_extention_t.rv_c_d], // extentions
     0b0, // _imms
     0b1100000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_FLDSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_FLW, // instr_name
     riscv_instr_name_t.C_FLW, // orig_name
     0xe003, // mask
     0x6000, // match
     [riscv_instr_var_t.rd_p, riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_uimm7lo, riscv_instr_var_t.c_uimm7hi], // variables
     [riscv_extention_t.rv32_c_f], // extentions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // C_FLW
  riscv_instr_param_s(
     riscv_instr_name_t.C_FLWSP, // instr_name
     riscv_instr_name_t.C_FLWSP, // orig_name
     0xe003, // mask
     0x6002, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.c_uimm8sphi, riscv_instr_var_t.c_uimm8splo], // variables
     [riscv_extention_t.rv32_c_f], // extentions
     0b0, // _imms
     0b11000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_FLWSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_FSD, // instr_name
     riscv_instr_name_t.C_FSD, // orig_name
     0xe003, // mask
     0xa000, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.rs2_p, riscv_instr_var_t.c_uimm8lo, riscv_instr_var_t.c_uimm8hi], // variables
     [riscv_extention_t.rv_c_d], // extentions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // C_FSD
  riscv_instr_param_s(
     riscv_instr_name_t.C_FSDSP, // instr_name
     riscv_instr_name_t.C_FSDSP, // orig_name
     0xe003, // mask
     0xa002, // match
     [riscv_instr_var_t.c_rs2, riscv_instr_var_t.c_uimm9sp_s], // variables
     [riscv_extention_t.rv_c_d], // extentions
     0b0, // _imms
     0b100000000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // C_FSDSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_FSW, // instr_name
     riscv_instr_name_t.C_FSW, // orig_name
     0xe003, // mask
     0xe000, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.rs2_p, riscv_instr_var_t.c_uimm7lo, riscv_instr_var_t.c_uimm7hi], // variables
     [riscv_extention_t.rv32_c_f], // extentions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // C_FSW
  riscv_instr_param_s(
     riscv_instr_name_t.C_FSWSP, // instr_name
     riscv_instr_name_t.C_FSWSP, // orig_name
     0xe003, // mask
     0xe002, // match
     [riscv_instr_var_t.c_rs2, riscv_instr_var_t.c_uimm8sp_s], // variables
     [riscv_extention_t.rv32_c_f], // extentions
     0b0, // _imms
     0b100000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // C_FSWSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_J, // instr_name
     riscv_instr_name_t.C_J, // orig_name
     0xe003, // mask
     0xa001, // match
     [riscv_instr_var_t.c_imm12], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b1000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_J
  riscv_instr_param_s(
     riscv_instr_name_t.C_JAL, // instr_name
     riscv_instr_name_t.C_JAL, // orig_name
     0xe003, // mask
     0x2001, // match
     [riscv_instr_var_t.c_imm12], // variables
     [riscv_extention_t.rv32_c], // extentions
     0b0, // _imms
     0b1000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_JAL
  riscv_instr_param_s(
     riscv_instr_name_t.C_JALR, // instr_name
     riscv_instr_name_t.C_JALR, // orig_name
     0xf07f, // mask
     0x9002, // match
     [riscv_instr_var_t.c_rs1_n0], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000000000, // _c_vars
     0b0, // _v_vars
   ), // C_JALR
  riscv_instr_param_s(
     riscv_instr_name_t.C_JR, // instr_name
     riscv_instr_name_t.C_JR, // orig_name
     0xf07f, // mask
     0x8002, // match
     [riscv_instr_var_t.rs1_n0], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000, // _c_vars
     0b0, // _v_vars
   ), // C_JR
  riscv_instr_param_s(
     riscv_instr_name_t.C_LD, // instr_name
     riscv_instr_name_t.C_LD, // orig_name
     0xe003, // mask
     0x6000, // match
     [riscv_instr_var_t.rd_p, riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_uimm8lo, riscv_instr_var_t.c_uimm8hi], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // C_LD
  riscv_instr_param_s(
     riscv_instr_name_t.C_LDSP, // instr_name
     riscv_instr_name_t.C_LDSP, // orig_name
     0xe003, // mask
     0x6002, // match
     [riscv_instr_var_t.rd_n0, riscv_instr_var_t.c_uimm9sphi, riscv_instr_var_t.c_uimm9splo], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b1100000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000000, // _c_vars
     0b0, // _v_vars
   ), // C_LDSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_LI, // instr_name
     riscv_instr_name_t.C_LI, // orig_name
     0xe003, // mask
     0x4001, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.c_imm6lo, riscv_instr_var_t.c_imm6hi], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b11000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_LI
  riscv_instr_param_s(
     riscv_instr_name_t.C_LQ, // instr_name
     riscv_instr_name_t.C_LQ, // orig_name
     0xe003, // mask
     0x2000, // match
     [riscv_instr_var_t.rd_p, riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_uimm9lo, riscv_instr_var_t.c_uimm9hi], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b1100000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // C_LQ
  riscv_instr_param_s(
     riscv_instr_name_t.C_LQSP, // instr_name
     riscv_instr_name_t.C_LQSP, // orig_name
     0xe003, // mask
     0x2002, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.c_uimm10sphi, riscv_instr_var_t.c_uimm10splo], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b11000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_LQSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_LUI, // instr_name
     riscv_instr_name_t.C_LUI, // orig_name
     0xe003, // mask
     0x6001, // match
     [riscv_instr_var_t.rd_n2, riscv_instr_var_t.c_nzimm18hi, riscv_instr_var_t.c_nzimm18lo], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000000, // _c_vars
     0b0, // _v_vars
   ), // C_LUI
  riscv_instr_param_s(
     riscv_instr_name_t.C_LW, // instr_name
     riscv_instr_name_t.C_LW, // orig_name
     0xe003, // mask
     0x4000, // match
     [riscv_instr_var_t.rd_p, riscv_instr_var_t.rs1_p, riscv_instr_var_t.c_uimm7lo, riscv_instr_var_t.c_uimm7hi], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10100, // _c_vars
     0b0, // _v_vars
   ), // C_LW
  riscv_instr_param_s(
     riscv_instr_name_t.C_LWSP, // instr_name
     riscv_instr_name_t.C_LWSP, // orig_name
     0xe003, // mask
     0x4002, // match
     [riscv_instr_var_t.rd_n0, riscv_instr_var_t.c_uimm8sphi, riscv_instr_var_t.c_uimm8splo], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b11000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000000, // _c_vars
     0b0, // _v_vars
   ), // C_LWSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_MV, // instr_name
     riscv_instr_name_t.C_MV, // orig_name
     0xf003, // mask
     0x8002, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.c_rs2_n0], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b100000000000, // _c_vars
     0b0, // _v_vars
   ), // C_MV
  riscv_instr_param_s(
     riscv_instr_name_t.C_NOP, // instr_name
     riscv_instr_name_t.C_NOP, // orig_name
     0xef83, // mask
     0x1, // match
     [riscv_instr_var_t.c_nzimm6hi, riscv_instr_var_t.c_nzimm6lo], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // C_NOP
  riscv_instr_param_s(
     riscv_instr_name_t.C_OR, // instr_name
     riscv_instr_name_t.C_OR, // orig_name
     0xfc63, // mask
     0x8c41, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // C_OR
  riscv_instr_param_s(
     riscv_instr_name_t.C_SD, // instr_name
     riscv_instr_name_t.C_SD, // orig_name
     0xe003, // mask
     0xe000, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.rs2_p, riscv_instr_var_t.c_uimm8hi, riscv_instr_var_t.c_uimm8lo], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b11000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // C_SD
  riscv_instr_param_s(
     riscv_instr_name_t.C_SDSP, // instr_name
     riscv_instr_name_t.C_SDSP, // orig_name
     0xe003, // mask
     0xe002, // match
     [riscv_instr_var_t.c_rs2, riscv_instr_var_t.c_uimm9sp_s], // variables
     [riscv_extention_t.rv64_c, riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b100000000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // C_SDSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_SLLI, // instr_name
     riscv_instr_name_t.C_SLLI, // orig_name
     0xe003, // mask
     0x2, // match
     [riscv_instr_var_t.rd_rs1_n0, riscv_instr_var_t.c_nzuimm6hi, riscv_instr_var_t.c_nzuimm6lo], // variables
     [riscv_extention_t.rv64_c], // extentions
     0b0, // _imms
     0b110000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // C_SLLI
  riscv_instr_param_s(
     riscv_instr_name_t.C_SLLI64, // instr_name
     riscv_instr_name_t.C_SLLI64, // orig_name
     0xf07f, // mask
     0x8002, // match
     [riscv_instr_var_t.rd_rs1_n0], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b100000, // _c_vars
     0b0, // _v_vars
   ), // C_SLLI64
  riscv_instr_param_s(
     riscv_instr_name_t.C_SQ, // instr_name
     riscv_instr_name_t.C_SQ, // orig_name
     0xe003, // mask
     0xa000, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.rs2_p, riscv_instr_var_t.c_uimm9hi, riscv_instr_var_t.c_uimm9lo], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b1100000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // C_SQ
  riscv_instr_param_s(
     riscv_instr_name_t.C_SQSP, // instr_name
     riscv_instr_name_t.C_SQSP, // orig_name
     0xe003, // mask
     0xa002, // match
     [riscv_instr_var_t.c_rs2, riscv_instr_var_t.c_uimm10sp_s], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b10000000000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // C_SQSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_SRAI, // instr_name
     riscv_instr_name_t.C_SRAI, // orig_name
     0xec03, // mask
     0x8401, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.c_nzuimm6lo, riscv_instr_var_t.c_nzuimm6hi], // variables
     [riscv_extention_t.rv64_c], // extentions
     0b0, // _imms
     0b110000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // C_SRAI
  riscv_instr_param_s(
     riscv_instr_name_t.C_SRAI64, // instr_name
     riscv_instr_name_t.C_SRAI64, // orig_name
     0xfc7f, // mask
     0x8401, // match
     [riscv_instr_var_t.rd_rs1_p], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // C_SRAI64
  riscv_instr_param_s(
     riscv_instr_name_t.C_SRLI, // instr_name
     riscv_instr_name_t.C_SRLI, // orig_name
     0xec03, // mask
     0x8001, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.c_nzuimm6lo, riscv_instr_var_t.c_nzuimm6hi], // variables
     [riscv_extention_t.rv64_c], // extentions
     0b0, // _imms
     0b110000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // C_SRLI
  riscv_instr_param_s(
     riscv_instr_name_t.C_SRLI64, // instr_name
     riscv_instr_name_t.C_SRLI64, // orig_name
     0xfc7f, // mask
     0x8001, // match
     [riscv_instr_var_t.rd_rs1_p], // variables
     [riscv_extention_t.rv128_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1000000, // _c_vars
     0b0, // _v_vars
   ), // C_SRLI64
  riscv_instr_param_s(
     riscv_instr_name_t.C_SUB, // instr_name
     riscv_instr_name_t.C_SUB, // orig_name
     0xfc63, // mask
     0x8c01, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // C_SUB
  riscv_instr_param_s(
     riscv_instr_name_t.C_SUBW, // instr_name
     riscv_instr_name_t.C_SUBW, // orig_name
     0xfc63, // mask
     0x9c01, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.rs2_p], // variables
     [riscv_extention_t.rv64_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // C_SUBW
  riscv_instr_param_s(
     riscv_instr_name_t.C_SW, // instr_name
     riscv_instr_name_t.C_SW, // orig_name
     0xe003, // mask
     0xc000, // match
     [riscv_instr_var_t.rs1_p, riscv_instr_var_t.rs2_p, riscv_instr_var_t.c_uimm7lo, riscv_instr_var_t.c_uimm7hi], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b110, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1100, // _c_vars
     0b0, // _v_vars
   ), // C_SW
  riscv_instr_param_s(
     riscv_instr_name_t.C_SWSP, // instr_name
     riscv_instr_name_t.C_SWSP, // orig_name
     0xe003, // mask
     0xc002, // match
     [riscv_instr_var_t.c_rs2, riscv_instr_var_t.c_uimm8sp_s], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b100000000000000000000000, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b10000000000000, // _c_vars
     0b0, // _v_vars
   ), // C_SWSP
  riscv_instr_param_s(
     riscv_instr_name_t.C_XOR, // instr_name
     riscv_instr_name_t.C_XOR, // orig_name
     0xfc63, // mask
     0x8c21, // match
     [riscv_instr_var_t.rd_rs1_p, riscv_instr_var_t.rs2_p], // variables
     [riscv_extention_t.rv_c], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b1001000, // _c_vars
     0b0, // _v_vars
   ), // C_XOR
  riscv_instr_param_s(
     riscv_instr_name_t.CLMUL, // instr_name
     riscv_instr_name_t.CLMUL, // orig_name
     0xfe00707f, // mask
     0xa001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbc, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLMUL
  riscv_instr_param_s(
     riscv_instr_name_t.CLMULH, // instr_name
     riscv_instr_name_t.CLMULH, // orig_name
     0xfe00707f, // mask
     0xa003033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbc, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLMULH
  riscv_instr_param_s(
     riscv_instr_name_t.CLMULR, // instr_name
     riscv_instr_name_t.CLMULR, // orig_name
     0xfe00707f, // mask
     0xa002033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbc], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLMULR
  riscv_instr_param_s(
     riscv_instr_name_t.CLROV, // instr_name
     riscv_instr_name_t.CSRRCI, // orig_name
     0xfffff07f, // mask
     0x90f073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLROV
  riscv_instr_param_s(
     riscv_instr_name_t.CLRS16, // instr_name
     riscv_instr_name_t.CLRS16, // orig_name
     0xfff0707f, // mask
     0xae800077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLRS16
  riscv_instr_param_s(
     riscv_instr_name_t.CLRS32, // instr_name
     riscv_instr_name_t.CLRS32, // orig_name
     0xfff0707f, // mask
     0xaf800077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLRS32
  riscv_instr_param_s(
     riscv_instr_name_t.CLRS8, // instr_name
     riscv_instr_name_t.CLRS8, // orig_name
     0xfff0707f, // mask
     0xae000077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLRS8
  riscv_instr_param_s(
     riscv_instr_name_t.CLZ, // instr_name
     riscv_instr_name_t.CLZ, // orig_name
     0xfff0707f, // mask
     0x60001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbb, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLZ
  riscv_instr_param_s(
     riscv_instr_name_t.CLZ16, // instr_name
     riscv_instr_name_t.CLZ16, // orig_name
     0xfff0707f, // mask
     0xae900077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLZ16
  riscv_instr_param_s(
     riscv_instr_name_t.CLZ32, // instr_name
     riscv_instr_name_t.CLZ32, // orig_name
     0xfff0707f, // mask
     0xaf900077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLZ32
  riscv_instr_param_s(
     riscv_instr_name_t.CLZ8, // instr_name
     riscv_instr_name_t.CLZ8, // orig_name
     0xfff0707f, // mask
     0xae100077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLZ8
  riscv_instr_param_s(
     riscv_instr_name_t.CLZW, // instr_name
     riscv_instr_name_t.CLZW, // orig_name
     0xfff0707f, // mask
     0x6000101b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CLZW
  riscv_instr_param_s(
     riscv_instr_name_t.CMIX, // instr_name
     riscv_instr_name_t.CMIX, // orig_name
     0x600707f, // mask
     0x6001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3], // variables
     [riscv_extention_t.rv_zbt, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CMIX
  riscv_instr_param_s(
     riscv_instr_name_t.CMOV, // instr_name
     riscv_instr_name_t.CMOV, // orig_name
     0x600707f, // mask
     0x6005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3], // variables
     [riscv_extention_t.rv_zbt], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CMOV
  riscv_instr_param_s(
     riscv_instr_name_t.CMPEQ16, // instr_name
     riscv_instr_name_t.CMPEQ16, // orig_name
     0xfe00707f, // mask
     0x4c000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CMPEQ16
  riscv_instr_param_s(
     riscv_instr_name_t.CMPEQ8, // instr_name
     riscv_instr_name_t.CMPEQ8, // orig_name
     0xfe00707f, // mask
     0x4e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CMPEQ8
  riscv_instr_param_s(
     riscv_instr_name_t.CPOP, // instr_name
     riscv_instr_name_t.CPOP, // orig_name
     0xfff0707f, // mask
     0x60201013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CPOP
  riscv_instr_param_s(
     riscv_instr_name_t.CPOPW, // instr_name
     riscv_instr_name_t.CPOPW, // orig_name
     0xfff0707f, // mask
     0x6020101b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CPOPW
  riscv_instr_param_s(
     riscv_instr_name_t.CRAS16, // instr_name
     riscv_instr_name_t.CRAS16, // orig_name
     0xfe00707f, // mask
     0x44000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRAS16
  riscv_instr_param_s(
     riscv_instr_name_t.CRAS32, // instr_name
     riscv_instr_name_t.CRAS32, // orig_name
     0xfe00707f, // mask
     0x44002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRAS32
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32_B, // instr_name
     riscv_instr_name_t.CRC32_B, // orig_name
     0xfff0707f, // mask
     0x61001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32_B
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32_D, // instr_name
     riscv_instr_name_t.CRC32_D, // orig_name
     0xfff0707f, // mask
     0x61301013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32_D
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32_H, // instr_name
     riscv_instr_name_t.CRC32_H, // orig_name
     0xfff0707f, // mask
     0x61101013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32_H
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32_W, // instr_name
     riscv_instr_name_t.CRC32_W, // orig_name
     0xfff0707f, // mask
     0x61201013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32_W
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_B, // instr_name
     riscv_instr_name_t.CRC32C_B, // orig_name
     0xfff0707f, // mask
     0x61801013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32C_B
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_D, // instr_name
     riscv_instr_name_t.CRC32C_D, // orig_name
     0xfff0707f, // mask
     0x61b01013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32C_D
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_H, // instr_name
     riscv_instr_name_t.CRC32C_H, // orig_name
     0xfff0707f, // mask
     0x61901013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32C_H
  riscv_instr_param_s(
     riscv_instr_name_t.CRC32C_W, // instr_name
     riscv_instr_name_t.CRC32C_W, // orig_name
     0xfff0707f, // mask
     0x61a01013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRC32C_W
  riscv_instr_param_s(
     riscv_instr_name_t.CRSA16, // instr_name
     riscv_instr_name_t.CRSA16, // orig_name
     0xfe00707f, // mask
     0x46000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRSA16
  riscv_instr_param_s(
     riscv_instr_name_t.CRSA32, // instr_name
     riscv_instr_name_t.CRSA32, // orig_name
     0xfe00707f, // mask
     0x46002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CRSA32
  riscv_instr_param_s(
     riscv_instr_name_t.CSRRC, // instr_name
     riscv_instr_name_t.CSRRC, // orig_name
     0x707f, // mask
     0x3073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.csr], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CSRRC
  riscv_instr_param_s(
     riscv_instr_name_t.CSRRCI, // instr_name
     riscv_instr_name_t.CSRRCI, // orig_name
     0x707f, // mask
     0x7073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.csr, riscv_instr_var_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000001, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CSRRCI
  riscv_instr_param_s(
     riscv_instr_name_t.CSRRS, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0x707f, // mask
     0x2073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.csr], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CSRRS
  riscv_instr_param_s(
     riscv_instr_name_t.CSRRSI, // instr_name
     riscv_instr_name_t.CSRRSI, // orig_name
     0x707f, // mask
     0x6073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.csr, riscv_instr_var_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000001, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CSRRSI
  riscv_instr_param_s(
     riscv_instr_name_t.CSRRW, // instr_name
     riscv_instr_name_t.CSRRW, // orig_name
     0x707f, // mask
     0x1073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.csr], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CSRRW
  riscv_instr_param_s(
     riscv_instr_name_t.CSRRWI, // instr_name
     riscv_instr_name_t.CSRRWI, // orig_name
     0x707f, // mask
     0x5073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.csr, riscv_instr_var_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000000001, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CSRRWI
  riscv_instr_param_s(
     riscv_instr_name_t.CTZ, // instr_name
     riscv_instr_name_t.CTZ, // orig_name
     0xfff0707f, // mask
     0x60101013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CTZ
  riscv_instr_param_s(
     riscv_instr_name_t.CTZW, // instr_name
     riscv_instr_name_t.CTZW, // orig_name
     0xfff0707f, // mask
     0x6010101b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // CTZW
  riscv_instr_param_s(
     riscv_instr_name_t.DIV, // instr_name
     riscv_instr_name_t.DIV, // orig_name
     0xfe00707f, // mask
     0x2004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // DIV
  riscv_instr_param_s(
     riscv_instr_name_t.DIVU, // instr_name
     riscv_instr_name_t.DIVU, // orig_name
     0xfe00707f, // mask
     0x2005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // DIVU
  riscv_instr_param_s(
     riscv_instr_name_t.DIVUW, // instr_name
     riscv_instr_name_t.DIVUW, // orig_name
     0xfe00707f, // mask
     0x200503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // DIVUW
  riscv_instr_param_s(
     riscv_instr_name_t.DIVW, // instr_name
     riscv_instr_name_t.DIVW, // orig_name
     0xfe00707f, // mask
     0x200403b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // DIVW
  riscv_instr_param_s(
     riscv_instr_name_t.DRET, // instr_name
     riscv_instr_name_t.DRET, // orig_name
     0xffffffff, // mask
     0x7b200073, // match
     [], // variables
     [riscv_extention_t.rv_sdext], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // DRET
  riscv_instr_param_s(
     riscv_instr_name_t.EBREAK, // instr_name
     riscv_instr_name_t.EBREAK, // orig_name
     0xffffffff, // mask
     0x100073, // match
     [], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // EBREAK
  riscv_instr_param_s(
     riscv_instr_name_t.ECALL, // instr_name
     riscv_instr_name_t.ECALL, // orig_name
     0xffffffff, // mask
     0x73, // match
     [], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ECALL
  riscv_instr_param_s(
     riscv_instr_name_t.FADD_D, // instr_name
     riscv_instr_name_t.FADD_D, // orig_name
     0xfe00007f, // mask
     0x2000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FADD_D
  riscv_instr_param_s(
     riscv_instr_name_t.FADD_S, // instr_name
     riscv_instr_name_t.FADD_S, // orig_name
     0xfe00007f, // mask
     0x53, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FADD_S
  riscv_instr_param_s(
     riscv_instr_name_t.FCLASS_D, // instr_name
     riscv_instr_name_t.FCLASS_D, // orig_name
     0xfff0707f, // mask
     0xe2001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCLASS_D
  riscv_instr_param_s(
     riscv_instr_name_t.FCLASS_S, // instr_name
     riscv_instr_name_t.FCLASS_S, // orig_name
     0xfff0707f, // mask
     0xe0001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCLASS_S
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_L, // instr_name
     riscv_instr_name_t.FCVT_D_L, // orig_name
     0xfff0007f, // mask
     0xd2200053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_D_L
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_LU, // instr_name
     riscv_instr_name_t.FCVT_D_LU, // orig_name
     0xfff0007f, // mask
     0xd2300053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_D_LU
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_S, // instr_name
     riscv_instr_name_t.FCVT_D_S, // orig_name
     0xfff0007f, // mask
     0x42000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_D_S
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_W, // instr_name
     riscv_instr_name_t.FCVT_D_W, // orig_name
     0xfff0007f, // mask
     0xd2000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_D_W
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_D_WU, // instr_name
     riscv_instr_name_t.FCVT_D_WU, // orig_name
     0xfff0007f, // mask
     0xd2100053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_D_WU
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_L_D, // instr_name
     riscv_instr_name_t.FCVT_L_D, // orig_name
     0xfff0007f, // mask
     0xc2200053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_L_D
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_L_S, // instr_name
     riscv_instr_name_t.FCVT_L_S, // orig_name
     0xfff0007f, // mask
     0xc0200053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_L_S
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_LU_D, // instr_name
     riscv_instr_name_t.FCVT_LU_D, // orig_name
     0xfff0007f, // mask
     0xc2300053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_LU_D
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_LU_S, // instr_name
     riscv_instr_name_t.FCVT_LU_S, // orig_name
     0xfff0007f, // mask
     0xc0300053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_LU_S
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_D, // instr_name
     riscv_instr_name_t.FCVT_S_D, // orig_name
     0xfff0007f, // mask
     0x40100053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_S_D
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_L, // instr_name
     riscv_instr_name_t.FCVT_S_L, // orig_name
     0xfff0007f, // mask
     0xd0200053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_S_L
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_LU, // instr_name
     riscv_instr_name_t.FCVT_S_LU, // orig_name
     0xfff0007f, // mask
     0xd0300053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv64_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_S_LU
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_W, // instr_name
     riscv_instr_name_t.FCVT_S_W, // orig_name
     0xfff0007f, // mask
     0xd0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_S_W
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_S_WU, // instr_name
     riscv_instr_name_t.FCVT_S_WU, // orig_name
     0xfff0007f, // mask
     0xd0100053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_S_WU
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_W_D, // instr_name
     riscv_instr_name_t.FCVT_W_D, // orig_name
     0xfff0007f, // mask
     0xc2000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_W_D
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_W_S, // instr_name
     riscv_instr_name_t.FCVT_W_S, // orig_name
     0xfff0007f, // mask
     0xc0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_W_S
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_WU_D, // instr_name
     riscv_instr_name_t.FCVT_WU_D, // orig_name
     0xfff0007f, // mask
     0xc2100053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_WU_D
  riscv_instr_param_s(
     riscv_instr_name_t.FCVT_WU_S, // instr_name
     riscv_instr_name_t.FCVT_WU_S, // orig_name
     0xfff0007f, // mask
     0xc0100053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FCVT_WU_S
  riscv_instr_param_s(
     riscv_instr_name_t.FDIV_D, // instr_name
     riscv_instr_name_t.FDIV_D, // orig_name
     0xfe00007f, // mask
     0x1a000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FDIV_D
  riscv_instr_param_s(
     riscv_instr_name_t.FDIV_S, // instr_name
     riscv_instr_name_t.FDIV_S, // orig_name
     0xfe00007f, // mask
     0x18000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FDIV_S
  riscv_instr_param_s(
     riscv_instr_name_t.FENCE, // instr_name
     riscv_instr_name_t.FENCE, // orig_name
     0x707f, // mask
     0xf, // match
     [riscv_instr_var_t.fm, riscv_instr_var_t.pred, riscv_instr_var_t.succ, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11100000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FENCE
  riscv_instr_param_s(
     riscv_instr_name_t.FENCE_I, // instr_name
     riscv_instr_name_t.FENCE_I, // orig_name
     0x707f, // mask
     0x100f, // match
     [riscv_instr_var_t.imm12, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zifencei], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FENCE_I
  riscv_instr_param_s(
     riscv_instr_name_t.FENCE_TSO, // instr_name
     riscv_instr_name_t.FENCE, // orig_name
     0xfff0707f, // mask
     0x8330000f, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FENCE_TSO
  riscv_instr_param_s(
     riscv_instr_name_t.FEQ_D, // instr_name
     riscv_instr_name_t.FEQ_D, // orig_name
     0xfe00707f, // mask
     0xa2002053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FEQ_D
  riscv_instr_param_s(
     riscv_instr_name_t.FEQ_S, // instr_name
     riscv_instr_name_t.FEQ_S, // orig_name
     0xfe00707f, // mask
     0xa0002053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FEQ_S
  riscv_instr_param_s(
     riscv_instr_name_t.FLD, // instr_name
     riscv_instr_name_t.FLD, // orig_name
     0x707f, // mask
     0x3007, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_d], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FLD
  riscv_instr_param_s(
     riscv_instr_name_t.FLE_D, // instr_name
     riscv_instr_name_t.FLE_D, // orig_name
     0xfe00707f, // mask
     0xa2000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FLE_D
  riscv_instr_param_s(
     riscv_instr_name_t.FLE_S, // instr_name
     riscv_instr_name_t.FLE_S, // orig_name
     0xfe00707f, // mask
     0xa0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FLE_S
  riscv_instr_param_s(
     riscv_instr_name_t.FLT_D, // instr_name
     riscv_instr_name_t.FLT_D, // orig_name
     0xfe00707f, // mask
     0xa2001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FLT_D
  riscv_instr_param_s(
     riscv_instr_name_t.FLT_S, // instr_name
     riscv_instr_name_t.FLT_S, // orig_name
     0xfe00707f, // mask
     0xa0001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FLT_S
  riscv_instr_param_s(
     riscv_instr_name_t.FLW, // instr_name
     riscv_instr_name_t.FLW, // orig_name
     0x707f, // mask
     0x2007, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_f], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FLW
  riscv_instr_param_s(
     riscv_instr_name_t.FMADD_D, // instr_name
     riscv_instr_name_t.FMADD_D, // orig_name
     0x600007f, // mask
     0x2000043, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMADD_D
  riscv_instr_param_s(
     riscv_instr_name_t.FMADD_S, // instr_name
     riscv_instr_name_t.FMADD_S, // orig_name
     0x600007f, // mask
     0x43, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMADD_S
  riscv_instr_param_s(
     riscv_instr_name_t.FMAX_D, // instr_name
     riscv_instr_name_t.FMAX_D, // orig_name
     0xfe00707f, // mask
     0x2a001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMAX_D
  riscv_instr_param_s(
     riscv_instr_name_t.FMAX_S, // instr_name
     riscv_instr_name_t.FMAX_S, // orig_name
     0xfe00707f, // mask
     0x28001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMAX_S
  riscv_instr_param_s(
     riscv_instr_name_t.FMIN_D, // instr_name
     riscv_instr_name_t.FMIN_D, // orig_name
     0xfe00707f, // mask
     0x2a000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMIN_D
  riscv_instr_param_s(
     riscv_instr_name_t.FMIN_S, // instr_name
     riscv_instr_name_t.FMIN_S, // orig_name
     0xfe00707f, // mask
     0x28000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMIN_S
  riscv_instr_param_s(
     riscv_instr_name_t.FMSUB_D, // instr_name
     riscv_instr_name_t.FMSUB_D, // orig_name
     0x600007f, // mask
     0x2000047, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMSUB_D
  riscv_instr_param_s(
     riscv_instr_name_t.FMSUB_S, // instr_name
     riscv_instr_name_t.FMSUB_S, // orig_name
     0x600007f, // mask
     0x47, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMSUB_S
  riscv_instr_param_s(
     riscv_instr_name_t.FMUL_D, // instr_name
     riscv_instr_name_t.FMUL_D, // orig_name
     0xfe00007f, // mask
     0x12000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMUL_D
  riscv_instr_param_s(
     riscv_instr_name_t.FMUL_S, // instr_name
     riscv_instr_name_t.FMUL_S, // orig_name
     0xfe00007f, // mask
     0x10000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMUL_S
  riscv_instr_param_s(
     riscv_instr_name_t.FMV_D_X, // instr_name
     riscv_instr_name_t.FMV_D_X, // orig_name
     0xfff0707f, // mask
     0xf2000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMV_D_X
  riscv_instr_param_s(
     riscv_instr_name_t.FMV_S_X, // instr_name
     riscv_instr_name_t.FMV_W_X, // orig_name
     0xfff0707f, // mask
     0xf0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMV_S_X
  riscv_instr_param_s(
     riscv_instr_name_t.FMV_W_X, // instr_name
     riscv_instr_name_t.FMV_W_X, // orig_name
     0xfff0707f, // mask
     0xf0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMV_W_X
  riscv_instr_param_s(
     riscv_instr_name_t.FMV_X_D, // instr_name
     riscv_instr_name_t.FMV_X_D, // orig_name
     0xfff0707f, // mask
     0xe2000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMV_X_D
  riscv_instr_param_s(
     riscv_instr_name_t.FMV_X_S, // instr_name
     riscv_instr_name_t.FMV_X_W, // orig_name
     0xfff0707f, // mask
     0xe0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMV_X_S
  riscv_instr_param_s(
     riscv_instr_name_t.FMV_X_W, // instr_name
     riscv_instr_name_t.FMV_X_W, // orig_name
     0xfff0707f, // mask
     0xe0000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FMV_X_W
  riscv_instr_param_s(
     riscv_instr_name_t.FNMADD_D, // instr_name
     riscv_instr_name_t.FNMADD_D, // orig_name
     0x600007f, // mask
     0x200004f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FNMADD_D
  riscv_instr_param_s(
     riscv_instr_name_t.FNMADD_S, // instr_name
     riscv_instr_name_t.FNMADD_S, // orig_name
     0x600007f, // mask
     0x4f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FNMADD_S
  riscv_instr_param_s(
     riscv_instr_name_t.FNMSUB_D, // instr_name
     riscv_instr_name_t.FNMSUB_D, // orig_name
     0x600007f, // mask
     0x200004b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FNMSUB_D
  riscv_instr_param_s(
     riscv_instr_name_t.FNMSUB_S, // instr_name
     riscv_instr_name_t.FNMSUB_S, // orig_name
     0x600007f, // mask
     0x4b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000011101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FNMSUB_S
  riscv_instr_param_s(
     riscv_instr_name_t.FRCSR, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0x302073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FRCSR
  riscv_instr_param_s(
     riscv_instr_name_t.FRFLAGS, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0x102073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FRFLAGS
  riscv_instr_param_s(
     riscv_instr_name_t.FRRM, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0x202073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FRRM
  riscv_instr_param_s(
     riscv_instr_name_t.FSCSR, // instr_name
     riscv_instr_name_t.CSRRW, // orig_name
     0xfff0707f, // mask
     0x301073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSCSR
  riscv_instr_param_s(
     riscv_instr_name_t.FSD, // instr_name
     riscv_instr_name_t.FSD, // orig_name
     0x707f, // mask
     0x3027, // match
     [riscv_instr_var_t.imm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.imm12lo], // variables
     [riscv_extention_t.rv_d], // extentions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSD
  riscv_instr_param_s(
     riscv_instr_name_t.FSFLAGS, // instr_name
     riscv_instr_name_t.CSRRW, // orig_name
     0xfff0707f, // mask
     0x101073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSFLAGS
  riscv_instr_param_s(
     riscv_instr_name_t.FSFLAGSI, // instr_name
     riscv_instr_name_t.CSRRWI, // orig_name
     0xfff0707f, // mask
     0x105073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSFLAGSI
  riscv_instr_param_s(
     riscv_instr_name_t.FSGNJ_D, // instr_name
     riscv_instr_name_t.FSGNJ_D, // orig_name
     0xfe00707f, // mask
     0x22000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSGNJ_D
  riscv_instr_param_s(
     riscv_instr_name_t.FSGNJ_S, // instr_name
     riscv_instr_name_t.FSGNJ_S, // orig_name
     0xfe00707f, // mask
     0x20000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSGNJ_S
  riscv_instr_param_s(
     riscv_instr_name_t.FSGNJN_D, // instr_name
     riscv_instr_name_t.FSGNJN_D, // orig_name
     0xfe00707f, // mask
     0x22001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSGNJN_D
  riscv_instr_param_s(
     riscv_instr_name_t.FSGNJN_S, // instr_name
     riscv_instr_name_t.FSGNJN_S, // orig_name
     0xfe00707f, // mask
     0x20001053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSGNJN_S
  riscv_instr_param_s(
     riscv_instr_name_t.FSGNJX_D, // instr_name
     riscv_instr_name_t.FSGNJX_D, // orig_name
     0xfe00707f, // mask
     0x22002053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSGNJX_D
  riscv_instr_param_s(
     riscv_instr_name_t.FSGNJX_S, // instr_name
     riscv_instr_name_t.FSGNJX_S, // orig_name
     0xfe00707f, // mask
     0x20002053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSGNJX_S
  riscv_instr_param_s(
     riscv_instr_name_t.FSL, // instr_name
     riscv_instr_name_t.FSL, // orig_name
     0x600707f, // mask
     0x4001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3], // variables
     [riscv_extention_t.rv_zbt], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSL
  riscv_instr_param_s(
     riscv_instr_name_t.FSLW, // instr_name
     riscv_instr_name_t.FSLW, // orig_name
     0x600707f, // mask
     0x400103b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3], // variables
     [riscv_extention_t.rv64_zbt], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSLW
  riscv_instr_param_s(
     riscv_instr_name_t.FSQRT_D, // instr_name
     riscv_instr_name_t.FSQRT_D, // orig_name
     0xfff0007f, // mask
     0x5a000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSQRT_D
  riscv_instr_param_s(
     riscv_instr_name_t.FSQRT_S, // instr_name
     riscv_instr_name_t.FSQRT_S, // orig_name
     0xfff0007f, // mask
     0x58000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSQRT_S
  riscv_instr_param_s(
     riscv_instr_name_t.FSR, // instr_name
     riscv_instr_name_t.FSR, // orig_name
     0x600707f, // mask
     0x4005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3], // variables
     [riscv_extention_t.rv_zbt, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSR
  riscv_instr_param_s(
     riscv_instr_name_t.FSRI, // instr_name
     riscv_instr_name_t.FSRI, // orig_name
     0x400707f, // mask
     0x4005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs3, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbt], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000010101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSRI
  riscv_instr_param_s(
     riscv_instr_name_t.FSRIW, // instr_name
     riscv_instr_name_t.FSRIW, // orig_name
     0x600707f, // mask
     0x400501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs3, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_zbt], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000010101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSRIW
  riscv_instr_param_s(
     riscv_instr_name_t.FSRM, // instr_name
     riscv_instr_name_t.CSRRW, // orig_name
     0xfff0707f, // mask
     0x201073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSRM
  riscv_instr_param_s(
     riscv_instr_name_t.FSRMI, // instr_name
     riscv_instr_name_t.CSRRWI, // orig_name
     0xfff0707f, // mask
     0x205073, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.zimm], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSRMI
  riscv_instr_param_s(
     riscv_instr_name_t.FSRW, // instr_name
     riscv_instr_name_t.FSRW, // orig_name
     0x600707f, // mask
     0x400503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rs3], // variables
     [riscv_extention_t.rv64_zbt, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSRW
  riscv_instr_param_s(
     riscv_instr_name_t.FSUB_D, // instr_name
     riscv_instr_name_t.FSUB_D, // orig_name
     0xfe00007f, // mask
     0xa000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_d], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSUB_D
  riscv_instr_param_s(
     riscv_instr_name_t.FSUB_S, // instr_name
     riscv_instr_name_t.FSUB_S, // orig_name
     0xfe00007f, // mask
     0x8000053, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.rm], // variables
     [riscv_extention_t.rv_f], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100000001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSUB_S
  riscv_instr_param_s(
     riscv_instr_name_t.FSW, // instr_name
     riscv_instr_name_t.FSW, // orig_name
     0x707f, // mask
     0x2027, // match
     [riscv_instr_var_t.imm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.imm12lo], // variables
     [riscv_extention_t.rv_f], // extentions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // FSW
  riscv_instr_param_s(
     riscv_instr_name_t.GORC, // instr_name
     riscv_instr_name_t.GORC, // orig_name
     0xfe00707f, // mask
     0x28005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GORC
  riscv_instr_param_s(
     riscv_instr_name_t.GORCI, // instr_name
     riscv_instr_name_t.GORCI, // orig_name
     0xfc00707f, // mask
     0x28005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GORCI
  riscv_instr_param_s(
     riscv_instr_name_t.GORCIW, // instr_name
     riscv_instr_name_t.GORCIW, // orig_name
     0xfe00707f, // mask
     0x2800501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GORCIW
  riscv_instr_param_s(
     riscv_instr_name_t.GORCW, // instr_name
     riscv_instr_name_t.GORCW, // orig_name
     0xfe00707f, // mask
     0x2800503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GORCW
  riscv_instr_param_s(
     riscv_instr_name_t.GREV, // instr_name
     riscv_instr_name_t.GREV, // orig_name
     0xfe00707f, // mask
     0x68005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GREV
  riscv_instr_param_s(
     riscv_instr_name_t.GREVI, // instr_name
     riscv_instr_name_t.GREVI, // orig_name
     0xfc00707f, // mask
     0x68005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GREVI
  riscv_instr_param_s(
     riscv_instr_name_t.GREVIW, // instr_name
     riscv_instr_name_t.GREVIW, // orig_name
     0xfe00707f, // mask
     0x6800501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GREVIW
  riscv_instr_param_s(
     riscv_instr_name_t.GREVW, // instr_name
     riscv_instr_name_t.GREVW, // orig_name
     0xfe00707f, // mask
     0x6800503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // GREVW
  riscv_instr_param_s(
     riscv_instr_name_t.INSB, // instr_name
     riscv_instr_name_t.INSB, // orig_name
     0xff80707f, // mask
     0xac000077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // INSB
  riscv_instr_param_s(
     riscv_instr_name_t.JAL, // instr_name
     riscv_instr_name_t.JAL, // orig_name
     0x7f, // mask
     0x6f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.jimm20], // variables
     [riscv_extention_t.rv_i], // extentions
     0b10, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // JAL
  riscv_instr_param_s(
     riscv_instr_name_t.JALR, // instr_name
     riscv_instr_name_t.JALR, // orig_name
     0x707f, // mask
     0x67, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // JALR
  riscv_instr_param_s(
     riscv_instr_name_t.KABS16, // instr_name
     riscv_instr_name_t.KABS16, // orig_name
     0xfff0707f, // mask
     0xad100077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KABS16
  riscv_instr_param_s(
     riscv_instr_name_t.KABS32, // instr_name
     riscv_instr_name_t.KABS32, // orig_name
     0xfff0707f, // mask
     0xad200077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KABS32
  riscv_instr_param_s(
     riscv_instr_name_t.KABS8, // instr_name
     riscv_instr_name_t.KABS8, // orig_name
     0xfff0707f, // mask
     0xad000077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KABS8
  riscv_instr_param_s(
     riscv_instr_name_t.KABSW, // instr_name
     riscv_instr_name_t.KABSW, // orig_name
     0xfff0707f, // mask
     0xad400077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KABSW
  riscv_instr_param_s(
     riscv_instr_name_t.KADD16, // instr_name
     riscv_instr_name_t.KADD16, // orig_name
     0xfe00707f, // mask
     0x10000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KADD16
  riscv_instr_param_s(
     riscv_instr_name_t.KADD32, // instr_name
     riscv_instr_name_t.KADD32, // orig_name
     0xfe00707f, // mask
     0x10002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KADD32
  riscv_instr_param_s(
     riscv_instr_name_t.KADD8, // instr_name
     riscv_instr_name_t.KADD8, // orig_name
     0xfe00707f, // mask
     0x18000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KADD8
  riscv_instr_param_s(
     riscv_instr_name_t.KADDH, // instr_name
     riscv_instr_name_t.KADDH, // orig_name
     0xfe00707f, // mask
     0x4001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KADDH
  riscv_instr_param_s(
     riscv_instr_name_t.KADDW, // instr_name
     riscv_instr_name_t.KADDW, // orig_name
     0xfe00707f, // mask
     0x1077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KADDW
  riscv_instr_param_s(
     riscv_instr_name_t.KCRAS16, // instr_name
     riscv_instr_name_t.KCRAS16, // orig_name
     0xfe00707f, // mask
     0x14000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KCRAS16
  riscv_instr_param_s(
     riscv_instr_name_t.KCRAS32, // instr_name
     riscv_instr_name_t.KCRAS32, // orig_name
     0xfe00707f, // mask
     0x14002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KCRAS32
  riscv_instr_param_s(
     riscv_instr_name_t.KCRSA16, // instr_name
     riscv_instr_name_t.KCRSA16, // orig_name
     0xfe00707f, // mask
     0x16000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KCRSA16
  riscv_instr_param_s(
     riscv_instr_name_t.KCRSA32, // instr_name
     riscv_instr_name_t.KCRSA32, // orig_name
     0xfe00707f, // mask
     0x16002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KCRSA32
  riscv_instr_param_s(
     riscv_instr_name_t.KDMABB, // instr_name
     riscv_instr_name_t.KDMABB, // orig_name
     0xfe00707f, // mask
     0xd2001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMABB
  riscv_instr_param_s(
     riscv_instr_name_t.KDMABB16, // instr_name
     riscv_instr_name_t.KDMABB16, // orig_name
     0xfe00707f, // mask
     0xd8001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMABB16
  riscv_instr_param_s(
     riscv_instr_name_t.KDMABT, // instr_name
     riscv_instr_name_t.KDMABT, // orig_name
     0xfe00707f, // mask
     0xe2001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMABT
  riscv_instr_param_s(
     riscv_instr_name_t.KDMABT16, // instr_name
     riscv_instr_name_t.KDMABT16, // orig_name
     0xfe00707f, // mask
     0xe8001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMABT16
  riscv_instr_param_s(
     riscv_instr_name_t.KDMATT, // instr_name
     riscv_instr_name_t.KDMATT, // orig_name
     0xfe00707f, // mask
     0xf2001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMATT
  riscv_instr_param_s(
     riscv_instr_name_t.KDMATT16, // instr_name
     riscv_instr_name_t.KDMATT16, // orig_name
     0xfe00707f, // mask
     0xf8001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMATT16
  riscv_instr_param_s(
     riscv_instr_name_t.KDMBB, // instr_name
     riscv_instr_name_t.KDMBB, // orig_name
     0xfe00707f, // mask
     0xa001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMBB
  riscv_instr_param_s(
     riscv_instr_name_t.KDMBB16, // instr_name
     riscv_instr_name_t.KDMBB16, // orig_name
     0xfe00707f, // mask
     0xda001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMBB16
  riscv_instr_param_s(
     riscv_instr_name_t.KDMBT, // instr_name
     riscv_instr_name_t.KDMBT, // orig_name
     0xfe00707f, // mask
     0x1a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMBT
  riscv_instr_param_s(
     riscv_instr_name_t.KDMBT16, // instr_name
     riscv_instr_name_t.KDMBT16, // orig_name
     0xfe00707f, // mask
     0xea001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMBT16
  riscv_instr_param_s(
     riscv_instr_name_t.KDMTT, // instr_name
     riscv_instr_name_t.KDMTT, // orig_name
     0xfe00707f, // mask
     0x2a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMTT
  riscv_instr_param_s(
     riscv_instr_name_t.KDMTT16, // instr_name
     riscv_instr_name_t.KDMTT16, // orig_name
     0xfe00707f, // mask
     0xfa001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KDMTT16
  riscv_instr_param_s(
     riscv_instr_name_t.KHM16, // instr_name
     riscv_instr_name_t.KHM16, // orig_name
     0xfe00707f, // mask
     0x86000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHM16
  riscv_instr_param_s(
     riscv_instr_name_t.KHM8, // instr_name
     riscv_instr_name_t.KHM8, // orig_name
     0xfe00707f, // mask
     0x8e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHM8
  riscv_instr_param_s(
     riscv_instr_name_t.KHMBB, // instr_name
     riscv_instr_name_t.KHMBB, // orig_name
     0xfe00707f, // mask
     0xc001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMBB
  riscv_instr_param_s(
     riscv_instr_name_t.KHMBB16, // instr_name
     riscv_instr_name_t.KHMBB16, // orig_name
     0xfe00707f, // mask
     0xdc001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMBB16
  riscv_instr_param_s(
     riscv_instr_name_t.KHMBT, // instr_name
     riscv_instr_name_t.KHMBT, // orig_name
     0xfe00707f, // mask
     0x1c001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMBT
  riscv_instr_param_s(
     riscv_instr_name_t.KHMBT16, // instr_name
     riscv_instr_name_t.KHMBT16, // orig_name
     0xfe00707f, // mask
     0xec001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMBT16
  riscv_instr_param_s(
     riscv_instr_name_t.KHMTT, // instr_name
     riscv_instr_name_t.KHMTT, // orig_name
     0xfe00707f, // mask
     0x2c001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMTT
  riscv_instr_param_s(
     riscv_instr_name_t.KHMTT16, // instr_name
     riscv_instr_name_t.KHMTT16, // orig_name
     0xfe00707f, // mask
     0xfc001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMTT16
  riscv_instr_param_s(
     riscv_instr_name_t.KHMX16, // instr_name
     riscv_instr_name_t.KHMX16, // orig_name
     0xfe00707f, // mask
     0x96000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMX16
  riscv_instr_param_s(
     riscv_instr_name_t.KHMX8, // instr_name
     riscv_instr_name_t.KHMX8, // orig_name
     0xfe00707f, // mask
     0x9e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KHMX8
  riscv_instr_param_s(
     riscv_instr_name_t.KMABB, // instr_name
     riscv_instr_name_t.KMABB, // orig_name
     0xfe00707f, // mask
     0x5a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMABB
  riscv_instr_param_s(
     riscv_instr_name_t.KMABB32, // instr_name
     riscv_instr_name_t.KMABB32, // orig_name
     0xfe00707f, // mask
     0x5a002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMABB32
  riscv_instr_param_s(
     riscv_instr_name_t.KMABT, // instr_name
     riscv_instr_name_t.KMABT, // orig_name
     0xfe00707f, // mask
     0x6a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMABT
  riscv_instr_param_s(
     riscv_instr_name_t.KMABT32, // instr_name
     riscv_instr_name_t.KMABT32, // orig_name
     0xfe00707f, // mask
     0x6a002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMABT32
  riscv_instr_param_s(
     riscv_instr_name_t.KMADA, // instr_name
     riscv_instr_name_t.KMADA, // orig_name
     0xfe00707f, // mask
     0x48001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMADA
  riscv_instr_param_s(
     riscv_instr_name_t.KMADRS, // instr_name
     riscv_instr_name_t.KMADRS, // orig_name
     0xfe00707f, // mask
     0x6c001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMADRS
  riscv_instr_param_s(
     riscv_instr_name_t.KMADRS32, // instr_name
     riscv_instr_name_t.KMADRS32, // orig_name
     0xfe00707f, // mask
     0x6c002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMADRS32
  riscv_instr_param_s(
     riscv_instr_name_t.KMADS, // instr_name
     riscv_instr_name_t.KMADS, // orig_name
     0xfe00707f, // mask
     0x5c001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMADS
  riscv_instr_param_s(
     riscv_instr_name_t.KMADS32, // instr_name
     riscv_instr_name_t.KMADS32, // orig_name
     0xfe00707f, // mask
     0x5c002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMADS32
  riscv_instr_param_s(
     riscv_instr_name_t.KMATT, // instr_name
     riscv_instr_name_t.KMATT, // orig_name
     0xfe00707f, // mask
     0x7a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMATT
  riscv_instr_param_s(
     riscv_instr_name_t.KMATT32, // instr_name
     riscv_instr_name_t.KMATT32, // orig_name
     0xfe00707f, // mask
     0x7a002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMATT32
  riscv_instr_param_s(
     riscv_instr_name_t.KMAXDA, // instr_name
     riscv_instr_name_t.KMAXDA, // orig_name
     0xfe00707f, // mask
     0x4a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMAXDA
  riscv_instr_param_s(
     riscv_instr_name_t.KMAXDA32, // instr_name
     riscv_instr_name_t.KMAXDA32, // orig_name
     0xfe00707f, // mask
     0x4a002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMAXDA32
  riscv_instr_param_s(
     riscv_instr_name_t.KMAXDS, // instr_name
     riscv_instr_name_t.KMAXDS, // orig_name
     0xfe00707f, // mask
     0x7c001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMAXDS
  riscv_instr_param_s(
     riscv_instr_name_t.KMAXDS32, // instr_name
     riscv_instr_name_t.KMAXDS32, // orig_name
     0xfe00707f, // mask
     0x7c002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMAXDS32
  riscv_instr_param_s(
     riscv_instr_name_t.KMDA, // instr_name
     riscv_instr_name_t.KMDA, // orig_name
     0xfe00707f, // mask
     0x38001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMDA
  riscv_instr_param_s(
     riscv_instr_name_t.KMDA32, // instr_name
     riscv_instr_name_t.KMDA32, // orig_name
     0xfe00707f, // mask
     0x38002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMDA32
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAC, // instr_name
     riscv_instr_name_t.KMMAC, // orig_name
     0xfe00707f, // mask
     0x60001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAC
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAC_U, // instr_name
     riscv_instr_name_t.KMMAC_U, // orig_name
     0xfe00707f, // mask
     0x70001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAC_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWB, // instr_name
     riscv_instr_name_t.KMMAWB, // orig_name
     0xfe00707f, // mask
     0x46001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWB
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWB2, // instr_name
     riscv_instr_name_t.KMMAWB2, // orig_name
     0xfe00707f, // mask
     0xce001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWB2
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWB2_U, // instr_name
     riscv_instr_name_t.KMMAWB2_U, // orig_name
     0xfe00707f, // mask
     0xde001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWB2_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWB_U, // instr_name
     riscv_instr_name_t.KMMAWB_U, // orig_name
     0xfe00707f, // mask
     0x56001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWB_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWT, // instr_name
     riscv_instr_name_t.KMMAWT, // orig_name
     0xfe00707f, // mask
     0x66001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWT
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWT2, // instr_name
     riscv_instr_name_t.KMMAWT2, // orig_name
     0xfe00707f, // mask
     0xee001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWT2
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWT2_U, // instr_name
     riscv_instr_name_t.KMMAWT2_U, // orig_name
     0xfe00707f, // mask
     0xfe001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWT2_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMAWT_U, // instr_name
     riscv_instr_name_t.KMMAWT_U, // orig_name
     0xfe00707f, // mask
     0x76001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMAWT_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMSB, // instr_name
     riscv_instr_name_t.KMMSB, // orig_name
     0xfe00707f, // mask
     0x42001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMSB
  riscv_instr_param_s(
     riscv_instr_name_t.KMMSB_U, // instr_name
     riscv_instr_name_t.KMMSB_U, // orig_name
     0xfe00707f, // mask
     0x52001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMSB_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMWB2, // instr_name
     riscv_instr_name_t.KMMWB2, // orig_name
     0xfe00707f, // mask
     0x8e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMWB2
  riscv_instr_param_s(
     riscv_instr_name_t.KMMWB2_U, // instr_name
     riscv_instr_name_t.KMMWB2_U, // orig_name
     0xfe00707f, // mask
     0x9e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMWB2_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMMWT2, // instr_name
     riscv_instr_name_t.KMMWT2, // orig_name
     0xfe00707f, // mask
     0xae001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMWT2
  riscv_instr_param_s(
     riscv_instr_name_t.KMMWT2_U, // instr_name
     riscv_instr_name_t.KMMWT2_U, // orig_name
     0xfe00707f, // mask
     0xbe001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMMWT2_U
  riscv_instr_param_s(
     riscv_instr_name_t.KMSDA, // instr_name
     riscv_instr_name_t.KMSDA, // orig_name
     0xfe00707f, // mask
     0x4c001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMSDA
  riscv_instr_param_s(
     riscv_instr_name_t.KMSDA32, // instr_name
     riscv_instr_name_t.KMSDA32, // orig_name
     0xfe00707f, // mask
     0x4c002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMSDA32
  riscv_instr_param_s(
     riscv_instr_name_t.KMSXDA, // instr_name
     riscv_instr_name_t.KMSXDA, // orig_name
     0xfe00707f, // mask
     0x4e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMSXDA
  riscv_instr_param_s(
     riscv_instr_name_t.KMSXDA32, // instr_name
     riscv_instr_name_t.KMSXDA32, // orig_name
     0xfe00707f, // mask
     0x4e002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMSXDA32
  riscv_instr_param_s(
     riscv_instr_name_t.KMXDA, // instr_name
     riscv_instr_name_t.KMXDA, // orig_name
     0xfe00707f, // mask
     0x3a001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMXDA
  riscv_instr_param_s(
     riscv_instr_name_t.KMXDA32, // instr_name
     riscv_instr_name_t.KMXDA32, // orig_name
     0xfe00707f, // mask
     0x3a002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KMXDA32
  riscv_instr_param_s(
     riscv_instr_name_t.KSLL16, // instr_name
     riscv_instr_name_t.KSLL16, // orig_name
     0xfe00707f, // mask
     0x64000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLL16
  riscv_instr_param_s(
     riscv_instr_name_t.KSLL32, // instr_name
     riscv_instr_name_t.KSLL32, // orig_name
     0xfe00707f, // mask
     0x64002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLL32
  riscv_instr_param_s(
     riscv_instr_name_t.KSLL8, // instr_name
     riscv_instr_name_t.KSLL8, // orig_name
     0xfe00707f, // mask
     0x6c000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLL8
  riscv_instr_param_s(
     riscv_instr_name_t.KSLLI16, // instr_name
     riscv_instr_name_t.KSLLI16, // orig_name
     0xff00707f, // mask
     0x75000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLLI16
  riscv_instr_param_s(
     riscv_instr_name_t.KSLLI32, // instr_name
     riscv_instr_name_t.KSLLI32, // orig_name
     0xfe00707f, // mask
     0x84002077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLLI32
  riscv_instr_param_s(
     riscv_instr_name_t.KSLLI8, // instr_name
     riscv_instr_name_t.KSLLI8, // orig_name
     0xff80707f, // mask
     0x7c800077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLLI8
  riscv_instr_param_s(
     riscv_instr_name_t.KSLLIW, // instr_name
     riscv_instr_name_t.KSLLIW, // orig_name
     0xfe00707f, // mask
     0x36001077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLLIW
  riscv_instr_param_s(
     riscv_instr_name_t.KSLLW, // instr_name
     riscv_instr_name_t.KSLLW, // orig_name
     0xfe00707f, // mask
     0x26001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLLW
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRA16, // instr_name
     riscv_instr_name_t.KSLRA16, // orig_name
     0xfe00707f, // mask
     0x56000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRA16
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRA16_U, // instr_name
     riscv_instr_name_t.KSLRA16_U, // orig_name
     0xfe00707f, // mask
     0x66000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRA16_U
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRA32, // instr_name
     riscv_instr_name_t.KSLRA32, // orig_name
     0xfe00707f, // mask
     0x56002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRA32
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRA32_U, // instr_name
     riscv_instr_name_t.KSLRA32_U, // orig_name
     0xfe00707f, // mask
     0x66002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRA32_U
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRA8, // instr_name
     riscv_instr_name_t.KSLRA8, // orig_name
     0xfe00707f, // mask
     0x5e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRA8
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRA8_U, // instr_name
     riscv_instr_name_t.KSLRA8_U, // orig_name
     0xfe00707f, // mask
     0x6e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRA8_U
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRAW, // instr_name
     riscv_instr_name_t.KSLRAW, // orig_name
     0xfe00707f, // mask
     0x6e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRAW
  riscv_instr_param_s(
     riscv_instr_name_t.KSLRAW_U, // instr_name
     riscv_instr_name_t.KSLRAW_U, // orig_name
     0xfe00707f, // mask
     0x7e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSLRAW_U
  riscv_instr_param_s(
     riscv_instr_name_t.KSTAS16, // instr_name
     riscv_instr_name_t.KSTAS16, // orig_name
     0xfe00707f, // mask
     0xc4002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSTAS16
  riscv_instr_param_s(
     riscv_instr_name_t.KSTAS32, // instr_name
     riscv_instr_name_t.KSTAS32, // orig_name
     0xfe00707f, // mask
     0xc0002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSTAS32
  riscv_instr_param_s(
     riscv_instr_name_t.KSTSA16, // instr_name
     riscv_instr_name_t.KSTSA16, // orig_name
     0xfe00707f, // mask
     0xc6002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSTSA16
  riscv_instr_param_s(
     riscv_instr_name_t.KSTSA32, // instr_name
     riscv_instr_name_t.KSTSA32, // orig_name
     0xfe00707f, // mask
     0xc2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSTSA32
  riscv_instr_param_s(
     riscv_instr_name_t.KSUB16, // instr_name
     riscv_instr_name_t.KSUB16, // orig_name
     0xfe00707f, // mask
     0x12000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSUB16
  riscv_instr_param_s(
     riscv_instr_name_t.KSUB32, // instr_name
     riscv_instr_name_t.KSUB32, // orig_name
     0xfe00707f, // mask
     0x12002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSUB32
  riscv_instr_param_s(
     riscv_instr_name_t.KSUB8, // instr_name
     riscv_instr_name_t.KSUB8, // orig_name
     0xfe00707f, // mask
     0x1a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSUB8
  riscv_instr_param_s(
     riscv_instr_name_t.KSUBH, // instr_name
     riscv_instr_name_t.KSUBH, // orig_name
     0xfe00707f, // mask
     0x6001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSUBH
  riscv_instr_param_s(
     riscv_instr_name_t.KSUBW, // instr_name
     riscv_instr_name_t.KSUBW, // orig_name
     0xfe00707f, // mask
     0x2001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KSUBW
  riscv_instr_param_s(
     riscv_instr_name_t.KWMMUL, // instr_name
     riscv_instr_name_t.KWMMUL, // orig_name
     0xfe00707f, // mask
     0x62001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KWMMUL
  riscv_instr_param_s(
     riscv_instr_name_t.KWMMUL_U, // instr_name
     riscv_instr_name_t.KWMMUL_U, // orig_name
     0xfe00707f, // mask
     0x72001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // KWMMUL_U
  riscv_instr_param_s(
     riscv_instr_name_t.LB, // instr_name
     riscv_instr_name_t.LB, // orig_name
     0x707f, // mask
     0x3, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LB
  riscv_instr_param_s(
     riscv_instr_name_t.LBU, // instr_name
     riscv_instr_name_t.LBU, // orig_name
     0x707f, // mask
     0x4003, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LBU
  riscv_instr_param_s(
     riscv_instr_name_t.LD, // instr_name
     riscv_instr_name_t.LD, // orig_name
     0x707f, // mask
     0x3003, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LD
  riscv_instr_param_s(
     riscv_instr_name_t.LH, // instr_name
     riscv_instr_name_t.LH, // orig_name
     0x707f, // mask
     0x1003, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LH
  riscv_instr_param_s(
     riscv_instr_name_t.LHU, // instr_name
     riscv_instr_name_t.LHU, // orig_name
     0x707f, // mask
     0x5003, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LHU
  riscv_instr_param_s(
     riscv_instr_name_t.LR_D, // instr_name
     riscv_instr_name_t.LR_D, // orig_name
     0xf9f0707f, // mask
     0x1000302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LR_D
  riscv_instr_param_s(
     riscv_instr_name_t.LR_W, // instr_name
     riscv_instr_name_t.LR_W, // orig_name
     0xf9f0707f, // mask
     0x1000202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LR_W
  riscv_instr_param_s(
     riscv_instr_name_t.LUI, // instr_name
     riscv_instr_name_t.LUI, // orig_name
     0x7f, // mask
     0x37, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.imm20], // variables
     [riscv_extention_t.rv_i], // extentions
     0b1, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LUI
  riscv_instr_param_s(
     riscv_instr_name_t.LW, // instr_name
     riscv_instr_name_t.LW, // orig_name
     0x707f, // mask
     0x2003, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LW
  riscv_instr_param_s(
     riscv_instr_name_t.LWU, // instr_name
     riscv_instr_name_t.LWU, // orig_name
     0x707f, // mask
     0x6003, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // LWU
  riscv_instr_param_s(
     riscv_instr_name_t.MADDR32, // instr_name
     riscv_instr_name_t.MADDR32, // orig_name
     0xfe00707f, // mask
     0xc4001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MADDR32
  riscv_instr_param_s(
     riscv_instr_name_t.MAX, // instr_name
     riscv_instr_name_t.MAX, // orig_name
     0xfe00707f, // mask
     0xa006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MAX
  riscv_instr_param_s(
     riscv_instr_name_t.MAXU, // instr_name
     riscv_instr_name_t.MAXU, // orig_name
     0xfe00707f, // mask
     0xa007033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MAXU
  riscv_instr_param_s(
     riscv_instr_name_t.MIN, // instr_name
     riscv_instr_name_t.MIN, // orig_name
     0xfe00707f, // mask
     0xa004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MIN
  riscv_instr_param_s(
     riscv_instr_name_t.MINU, // instr_name
     riscv_instr_name_t.MINU, // orig_name
     0xfe00707f, // mask
     0xa005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MINU
  riscv_instr_param_s(
     riscv_instr_name_t.MRET, // instr_name
     riscv_instr_name_t.MRET, // orig_name
     0xffffffff, // mask
     0x30200073, // match
     [], // variables
     [riscv_extention_t.rv_system], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MRET
  riscv_instr_param_s(
     riscv_instr_name_t.MSUBR32, // instr_name
     riscv_instr_name_t.MSUBR32, // orig_name
     0xfe00707f, // mask
     0xc6001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MSUBR32
  riscv_instr_param_s(
     riscv_instr_name_t.MUL, // instr_name
     riscv_instr_name_t.MUL, // orig_name
     0xfe00707f, // mask
     0x2000033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MUL
  riscv_instr_param_s(
     riscv_instr_name_t.MULH, // instr_name
     riscv_instr_name_t.MULH, // orig_name
     0xfe00707f, // mask
     0x2001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m, riscv_extention_t.rv32_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MULH
  riscv_instr_param_s(
     riscv_instr_name_t.MULHSU, // instr_name
     riscv_instr_name_t.MULHSU, // orig_name
     0xfe00707f, // mask
     0x2002033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MULHSU
  riscv_instr_param_s(
     riscv_instr_name_t.MULHU, // instr_name
     riscv_instr_name_t.MULHU, // orig_name
     0xfe00707f, // mask
     0x2003033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MULHU
  riscv_instr_param_s(
     riscv_instr_name_t.MULW, // instr_name
     riscv_instr_name_t.MULW, // orig_name
     0xfe00707f, // mask
     0x200003b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // MULW
  riscv_instr_param_s(
     riscv_instr_name_t.NOP, // instr_name
     riscv_instr_name_t.ADDI, // orig_name
     0xffffffff, // mask
     0x13, // match
     [], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // NOP
  riscv_instr_param_s(
     riscv_instr_name_t.OR, // instr_name
     riscv_instr_name_t.OR, // orig_name
     0xfe00707f, // mask
     0x6033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // OR
  riscv_instr_param_s(
     riscv_instr_name_t.ORC_B, // instr_name
     riscv_instr_name_t.GORCI, // orig_name
     0xfff0707f, // mask
     0x28705013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ORC_B
  riscv_instr_param_s(
     riscv_instr_name_t.ORI, // instr_name
     riscv_instr_name_t.ORI, // orig_name
     0x707f, // mask
     0x6013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ORI
  riscv_instr_param_s(
     riscv_instr_name_t.ORN, // instr_name
     riscv_instr_name_t.ORN, // orig_name
     0xfe00707f, // mask
     0x40006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ORN
  riscv_instr_param_s(
     riscv_instr_name_t.PACK, // instr_name
     riscv_instr_name_t.PACK, // orig_name
     0xfe00707f, // mask
     0x8004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbe, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zbf, riscv_extention_t.rv64_zbm, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PACK
  riscv_instr_param_s(
     riscv_instr_name_t.PACKH, // instr_name
     riscv_instr_name_t.PACKH, // orig_name
     0xfe00707f, // mask
     0x8007033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbe, riscv_extention_t.rv_zbp, riscv_extention_t.rv_zbf, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PACKH
  riscv_instr_param_s(
     riscv_instr_name_t.PACKU, // instr_name
     riscv_instr_name_t.PACKU, // orig_name
     0xfe00707f, // mask
     0x48004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp, riscv_extention_t.rv64_zbm], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PACKU
  riscv_instr_param_s(
     riscv_instr_name_t.PACKUW, // instr_name
     riscv_instr_name_t.PACKUW, // orig_name
     0xfe00707f, // mask
     0x4800403b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PACKUW
  riscv_instr_param_s(
     riscv_instr_name_t.PACKW, // instr_name
     riscv_instr_name_t.PACKW, // orig_name
     0xfe00707f, // mask
     0x800403b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbe, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zbf, riscv_extention_t.rv64_zks, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PACKW
  riscv_instr_param_s(
     riscv_instr_name_t.PAUSE, // instr_name
     riscv_instr_name_t.FENCE, // orig_name
     0xffffffff, // mask
     0x100000f, // match
     [], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PAUSE
  riscv_instr_param_s(
     riscv_instr_name_t.PBSAD, // instr_name
     riscv_instr_name_t.PBSAD, // orig_name
     0xfe00707f, // mask
     0xfc000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PBSAD
  riscv_instr_param_s(
     riscv_instr_name_t.PBSADA, // instr_name
     riscv_instr_name_t.PBSADA, // orig_name
     0xfe00707f, // mask
     0xfe000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PBSADA
  riscv_instr_param_s(
     riscv_instr_name_t.PKBB16, // instr_name
     riscv_instr_name_t.PKBB16, // orig_name
     0xfe00707f, // mask
     0xe001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PKBB16
  riscv_instr_param_s(
     riscv_instr_name_t.PKBT16, // instr_name
     riscv_instr_name_t.PKBT16, // orig_name
     0xfe00707f, // mask
     0x1e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PKBT16
  riscv_instr_param_s(
     riscv_instr_name_t.PKBT32, // instr_name
     riscv_instr_name_t.PKBT32, // orig_name
     0xfe00707f, // mask
     0x1e002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PKBT32
  riscv_instr_param_s(
     riscv_instr_name_t.PKTB16, // instr_name
     riscv_instr_name_t.PKTB16, // orig_name
     0xfe00707f, // mask
     0x3e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PKTB16
  riscv_instr_param_s(
     riscv_instr_name_t.PKTB32, // instr_name
     riscv_instr_name_t.PKTB32, // orig_name
     0xfe00707f, // mask
     0x3e002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PKTB32
  riscv_instr_param_s(
     riscv_instr_name_t.PKTT16, // instr_name
     riscv_instr_name_t.PKTT16, // orig_name
     0xfe00707f, // mask
     0x2e001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // PKTT16
  riscv_instr_param_s(
     riscv_instr_name_t.RADD16, // instr_name
     riscv_instr_name_t.RADD16, // orig_name
     0xfe00707f, // mask
     0x77, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RADD16
  riscv_instr_param_s(
     riscv_instr_name_t.RADD32, // instr_name
     riscv_instr_name_t.RADD32, // orig_name
     0xfe00707f, // mask
     0x2077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RADD32
  riscv_instr_param_s(
     riscv_instr_name_t.RADD8, // instr_name
     riscv_instr_name_t.RADD8, // orig_name
     0xfe00707f, // mask
     0x8000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RADD8
  riscv_instr_param_s(
     riscv_instr_name_t.RADDW, // instr_name
     riscv_instr_name_t.RADDW, // orig_name
     0xfe00707f, // mask
     0x20001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RADDW
  riscv_instr_param_s(
     riscv_instr_name_t.RCRAS16, // instr_name
     riscv_instr_name_t.RCRAS16, // orig_name
     0xfe00707f, // mask
     0x4000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RCRAS16
  riscv_instr_param_s(
     riscv_instr_name_t.RCRAS32, // instr_name
     riscv_instr_name_t.RCRAS32, // orig_name
     0xfe00707f, // mask
     0x4002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RCRAS32
  riscv_instr_param_s(
     riscv_instr_name_t.RCRSA16, // instr_name
     riscv_instr_name_t.RCRSA16, // orig_name
     0xfe00707f, // mask
     0x6000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RCRSA16
  riscv_instr_param_s(
     riscv_instr_name_t.RCRSA32, // instr_name
     riscv_instr_name_t.RCRSA32, // orig_name
     0xfe00707f, // mask
     0x6002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RCRSA32
  riscv_instr_param_s(
     riscv_instr_name_t.RDCYCLE, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0xc0002073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDCYCLE
  riscv_instr_param_s(
     riscv_instr_name_t.RDCYCLEH, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0xc8002073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDCYCLEH
  riscv_instr_param_s(
     riscv_instr_name_t.RDINSTRET, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0xc0202073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDINSTRET
  riscv_instr_param_s(
     riscv_instr_name_t.RDINSTRETH, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0xc8202073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDINSTRETH
  riscv_instr_param_s(
     riscv_instr_name_t.RDOV, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0x902073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDOV
  riscv_instr_param_s(
     riscv_instr_name_t.RDTIME, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0xc0102073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDTIME
  riscv_instr_param_s(
     riscv_instr_name_t.RDTIMEH, // instr_name
     riscv_instr_name_t.CSRRS, // orig_name
     0xfffff07f, // mask
     0xc8102073, // match
     [riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zicsr], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RDTIMEH
  riscv_instr_param_s(
     riscv_instr_name_t.REM, // instr_name
     riscv_instr_name_t.REM, // orig_name
     0xfe00707f, // mask
     0x2006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // REM
  riscv_instr_param_s(
     riscv_instr_name_t.REMU, // instr_name
     riscv_instr_name_t.REMU, // orig_name
     0xfe00707f, // mask
     0x2007033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // REMU
  riscv_instr_param_s(
     riscv_instr_name_t.REMUW, // instr_name
     riscv_instr_name_t.REMUW, // orig_name
     0xfe00707f, // mask
     0x200703b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // REMUW
  riscv_instr_param_s(
     riscv_instr_name_t.REMW, // instr_name
     riscv_instr_name_t.REMW, // orig_name
     0xfe00707f, // mask
     0x200603b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_m], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // REMW
  riscv_instr_param_s(
     riscv_instr_name_t.REV8, // instr_name
     riscv_instr_name_t.GREVI, // orig_name
     0xfff0707f, // mask
     0x6b805013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zks], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // REV8
  riscv_instr_param_s(
     riscv_instr_name_t.ROL, // instr_name
     riscv_instr_name_t.ROL, // orig_name
     0xfe00707f, // mask
     0x60001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ROL
  riscv_instr_param_s(
     riscv_instr_name_t.ROLW, // instr_name
     riscv_instr_name_t.ROLW, // orig_name
     0xfe00707f, // mask
     0x6000103b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ROLW
  riscv_instr_param_s(
     riscv_instr_name_t.ROR, // instr_name
     riscv_instr_name_t.ROR, // orig_name
     0xfe00707f, // mask
     0x60005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ROR
  riscv_instr_param_s(
     riscv_instr_name_t.RORI, // instr_name
     riscv_instr_name_t.RORI, // orig_name
     0xfc00707f, // mask
     0x60005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RORI
  riscv_instr_param_s(
     riscv_instr_name_t.RORIW, // instr_name
     riscv_instr_name_t.RORIW, // orig_name
     0xfe00707f, // mask
     0x6000501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RORIW
  riscv_instr_param_s(
     riscv_instr_name_t.RORW, // instr_name
     riscv_instr_name_t.RORW, // orig_name
     0xfe00707f, // mask
     0x6000503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbb, riscv_extention_t.rv64_zbp, riscv_extention_t.rv64_zks, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RORW
  riscv_instr_param_s(
     riscv_instr_name_t.RSTAS16, // instr_name
     riscv_instr_name_t.RSTAS16, // orig_name
     0xfe00707f, // mask
     0xb4002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSTAS16
  riscv_instr_param_s(
     riscv_instr_name_t.RSTAS32, // instr_name
     riscv_instr_name_t.RSTAS32, // orig_name
     0xfe00707f, // mask
     0xb0002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSTAS32
  riscv_instr_param_s(
     riscv_instr_name_t.RSTSA16, // instr_name
     riscv_instr_name_t.VSHA2MS_VV, // orig_name
     0xfe00707f, // mask
     0xb6002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSTSA16
  riscv_instr_param_s(
     riscv_instr_name_t.RSTSA32, // instr_name
     riscv_instr_name_t.VGHSH_VV, // orig_name
     0xfe00707f, // mask
     0xb2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSTSA32
  riscv_instr_param_s(
     riscv_instr_name_t.RSUB16, // instr_name
     riscv_instr_name_t.RSUB16, // orig_name
     0xfe00707f, // mask
     0x2000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSUB16
  riscv_instr_param_s(
     riscv_instr_name_t.RSUB32, // instr_name
     riscv_instr_name_t.RSUB32, // orig_name
     0xfe00707f, // mask
     0x2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSUB32
  riscv_instr_param_s(
     riscv_instr_name_t.RSUB8, // instr_name
     riscv_instr_name_t.RSUB8, // orig_name
     0xfe00707f, // mask
     0xa000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSUB8
  riscv_instr_param_s(
     riscv_instr_name_t.RSUBW, // instr_name
     riscv_instr_name_t.RSUBW, // orig_name
     0xfe00707f, // mask
     0x22001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // RSUBW
  riscv_instr_param_s(
     riscv_instr_name_t.SB, // instr_name
     riscv_instr_name_t.SB, // orig_name
     0x707f, // mask
     0x23, // match
     [riscv_instr_var_t.imm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.imm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SB
  riscv_instr_param_s(
     riscv_instr_name_t.SBREAK, // instr_name
     riscv_instr_name_t.EBREAK, // orig_name
     0xffffffff, // mask
     0x100073, // match
     [], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SBREAK
  riscv_instr_param_s(
     riscv_instr_name_t.SC_D, // instr_name
     riscv_instr_name_t.SC_D, // orig_name
     0xf800707f, // mask
     0x1800302f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv64_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SC_D
  riscv_instr_param_s(
     riscv_instr_name_t.SC_W, // instr_name
     riscv_instr_name_t.SC_W, // orig_name
     0xf800707f, // mask
     0x1800202f, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.aq, riscv_instr_var_t.rl], // variables
     [riscv_extention_t.rv_a], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b11001101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SC_W
  riscv_instr_param_s(
     riscv_instr_name_t.SCALL, // instr_name
     riscv_instr_name_t.ECALL, // orig_name
     0xffffffff, // mask
     0x73, // match
     [], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCALL
  riscv_instr_param_s(
     riscv_instr_name_t.SCLIP16, // instr_name
     riscv_instr_name_t.SCLIP16, // orig_name
     0xff00707f, // mask
     0x84000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCLIP16
  riscv_instr_param_s(
     riscv_instr_name_t.SCLIP32, // instr_name
     riscv_instr_name_t.SCLIP32, // orig_name
     0xfe00707f, // mask
     0xe4000077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCLIP32
  riscv_instr_param_s(
     riscv_instr_name_t.SCLIP8, // instr_name
     riscv_instr_name_t.SCLIP8, // orig_name
     0xff80707f, // mask
     0x8c000077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCLIP8
  riscv_instr_param_s(
     riscv_instr_name_t.SCMPLE16, // instr_name
     riscv_instr_name_t.SCMPLE16, // orig_name
     0xfe00707f, // mask
     0x1c000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCMPLE16
  riscv_instr_param_s(
     riscv_instr_name_t.SCMPLE8, // instr_name
     riscv_instr_name_t.SCMPLE8, // orig_name
     0xfe00707f, // mask
     0x1e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCMPLE8
  riscv_instr_param_s(
     riscv_instr_name_t.SCMPLT16, // instr_name
     riscv_instr_name_t.SCMPLT16, // orig_name
     0xfe00707f, // mask
     0xc000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCMPLT16
  riscv_instr_param_s(
     riscv_instr_name_t.SCMPLT8, // instr_name
     riscv_instr_name_t.SCMPLT8, // orig_name
     0xfe00707f, // mask
     0xe000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SCMPLT8
  riscv_instr_param_s(
     riscv_instr_name_t.SD, // instr_name
     riscv_instr_name_t.SD, // orig_name
     0x707f, // mask
     0x3023, // match
     [riscv_instr_var_t.imm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.imm12lo], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SD
  riscv_instr_param_s(
     riscv_instr_name_t.SEXT_B, // instr_name
     riscv_instr_name_t.SEXT_B, // orig_name
     0xfff0707f, // mask
     0x60401013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SEXT_B
  riscv_instr_param_s(
     riscv_instr_name_t.SEXT_H, // instr_name
     riscv_instr_name_t.SEXT_H, // orig_name
     0xfff0707f, // mask
     0x60501013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SEXT_H
  riscv_instr_param_s(
     riscv_instr_name_t.SFENCE_VMA, // instr_name
     riscv_instr_name_t.SFENCE_VMA, // orig_name
     0xfe007fff, // mask
     0x12000073, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_s], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SFENCE_VMA
  riscv_instr_param_s(
     riscv_instr_name_t.SH, // instr_name
     riscv_instr_name_t.SH, // orig_name
     0x707f, // mask
     0x1023, // match
     [riscv_instr_var_t.imm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.imm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH
  riscv_instr_param_s(
     riscv_instr_name_t.SH1ADD, // instr_name
     riscv_instr_name_t.SH1ADD, // orig_name
     0xfe00707f, // mask
     0x20002033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH1ADD
  riscv_instr_param_s(
     riscv_instr_name_t.SH1ADD_UW, // instr_name
     riscv_instr_name_t.SH1ADD_UW, // orig_name
     0xfe00707f, // mask
     0x2000203b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH1ADD_UW
  riscv_instr_param_s(
     riscv_instr_name_t.SH2ADD, // instr_name
     riscv_instr_name_t.SH2ADD, // orig_name
     0xfe00707f, // mask
     0x20004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH2ADD
  riscv_instr_param_s(
     riscv_instr_name_t.SH2ADD_UW, // instr_name
     riscv_instr_name_t.SH2ADD_UW, // orig_name
     0xfe00707f, // mask
     0x2000403b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH2ADD_UW
  riscv_instr_param_s(
     riscv_instr_name_t.SH3ADD, // instr_name
     riscv_instr_name_t.SH3ADD, // orig_name
     0xfe00707f, // mask
     0x20006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH3ADD
  riscv_instr_param_s(
     riscv_instr_name_t.SH3ADD_UW, // instr_name
     riscv_instr_name_t.SH3ADD_UW, // orig_name
     0xfe00707f, // mask
     0x2000603b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SH3ADD_UW
  riscv_instr_param_s(
     riscv_instr_name_t.SHFL, // instr_name
     riscv_instr_name_t.SHFL, // orig_name
     0xfe00707f, // mask
     0x8001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SHFL
  riscv_instr_param_s(
     riscv_instr_name_t.SHFLI, // instr_name
     riscv_instr_name_t.SHFLI, // orig_name
     0xfe00707f, // mask
     0x8001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SHFLI
  riscv_instr_param_s(
     riscv_instr_name_t.SHFLW, // instr_name
     riscv_instr_name_t.SHFLW, // orig_name
     0xfe00707f, // mask
     0x800103b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SHFLW
  riscv_instr_param_s(
     riscv_instr_name_t.SLL, // instr_name
     riscv_instr_name_t.SLL, // orig_name
     0xfe00707f, // mask
     0x1033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLL
  riscv_instr_param_s(
     riscv_instr_name_t.SLL16, // instr_name
     riscv_instr_name_t.SLL16, // orig_name
     0xfe00707f, // mask
     0x54000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLL16
  riscv_instr_param_s(
     riscv_instr_name_t.SLL32, // instr_name
     riscv_instr_name_t.SLL32, // orig_name
     0xfe00707f, // mask
     0x54002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLL32
  riscv_instr_param_s(
     riscv_instr_name_t.SLL8, // instr_name
     riscv_instr_name_t.SLL8, // orig_name
     0xfe00707f, // mask
     0x5c000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLL8
  riscv_instr_param_s(
     riscv_instr_name_t.SLLI, // instr_name
     riscv_instr_name_t.SLLI, // orig_name
     0xfc00707f, // mask
     0x1013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLI
  riscv_instr_param_s(
     riscv_instr_name_t.SLLI16, // instr_name
     riscv_instr_name_t.SLLI16, // orig_name
     0xff00707f, // mask
     0x74000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLI16
  riscv_instr_param_s(
     riscv_instr_name_t.SLLI32, // instr_name
     riscv_instr_name_t.SLLI32, // orig_name
     0xfe00707f, // mask
     0x74002077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLI32
  riscv_instr_param_s(
     riscv_instr_name_t.SLLI8, // instr_name
     riscv_instr_name_t.SLLI8, // orig_name
     0xff80707f, // mask
     0x7c000077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLI8
  riscv_instr_param_s(
     riscv_instr_name_t.SLLI_UW, // instr_name
     riscv_instr_name_t.SLLI_UW, // orig_name
     0xfc00707f, // mask
     0x800101b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_zba], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLI_UW
  riscv_instr_param_s(
     riscv_instr_name_t.SLLIW, // instr_name
     riscv_instr_name_t.SLLIW, // orig_name
     0xfe00707f, // mask
     0x101b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLIW
  riscv_instr_param_s(
     riscv_instr_name_t.SLLW, // instr_name
     riscv_instr_name_t.SLLW, // orig_name
     0xfe00707f, // mask
     0x103b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLLW
  riscv_instr_param_s(
     riscv_instr_name_t.SLO, // instr_name
     riscv_instr_name_t.SLO, // orig_name
     0xfe00707f, // mask
     0x20001033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLO
  riscv_instr_param_s(
     riscv_instr_name_t.SLOI, // instr_name
     riscv_instr_name_t.SLOI, // orig_name
     0xfc00707f, // mask
     0x20001013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLOI
  riscv_instr_param_s(
     riscv_instr_name_t.SLOIW, // instr_name
     riscv_instr_name_t.SLOIW, // orig_name
     0xfe00707f, // mask
     0x2000101b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLOIW
  riscv_instr_param_s(
     riscv_instr_name_t.SLOW, // instr_name
     riscv_instr_name_t.SLOW, // orig_name
     0xfe00707f, // mask
     0x2000103b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLOW
  riscv_instr_param_s(
     riscv_instr_name_t.SLT, // instr_name
     riscv_instr_name_t.SLT, // orig_name
     0xfe00707f, // mask
     0x2033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLT
  riscv_instr_param_s(
     riscv_instr_name_t.SLTI, // instr_name
     riscv_instr_name_t.SLTI, // orig_name
     0x707f, // mask
     0x2013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLTI
  riscv_instr_param_s(
     riscv_instr_name_t.SLTIU, // instr_name
     riscv_instr_name_t.SLTIU, // orig_name
     0x707f, // mask
     0x3013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLTIU
  riscv_instr_param_s(
     riscv_instr_name_t.SLTU, // instr_name
     riscv_instr_name_t.SLTU, // orig_name
     0xfe00707f, // mask
     0x3033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SLTU
  riscv_instr_param_s(
     riscv_instr_name_t.SMAQA, // instr_name
     riscv_instr_name_t.SMAQA, // orig_name
     0xfe00707f, // mask
     0xc8000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMAQA
  riscv_instr_param_s(
     riscv_instr_name_t.SMAQA_SU, // instr_name
     riscv_instr_name_t.SMAQA_SU, // orig_name
     0xfe00707f, // mask
     0xca000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMAQA_SU
  riscv_instr_param_s(
     riscv_instr_name_t.SMAX16, // instr_name
     riscv_instr_name_t.SMAX16, // orig_name
     0xfe00707f, // mask
     0x82000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMAX16
  riscv_instr_param_s(
     riscv_instr_name_t.SMAX32, // instr_name
     riscv_instr_name_t.SMAX32, // orig_name
     0xfe00707f, // mask
     0x92002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMAX32
  riscv_instr_param_s(
     riscv_instr_name_t.SMAX8, // instr_name
     riscv_instr_name_t.SMAX8, // orig_name
     0xfe00707f, // mask
     0x8a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMAX8
  riscv_instr_param_s(
     riscv_instr_name_t.SMBB16, // instr_name
     riscv_instr_name_t.SMBB16, // orig_name
     0xfe00707f, // mask
     0x8001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMBB16
  riscv_instr_param_s(
     riscv_instr_name_t.SMBT16, // instr_name
     riscv_instr_name_t.SMBT16, // orig_name
     0xfe00707f, // mask
     0x18001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMBT16
  riscv_instr_param_s(
     riscv_instr_name_t.SMBT32, // instr_name
     riscv_instr_name_t.SMBT32, // orig_name
     0xfe00707f, // mask
     0x18002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMBT32
  riscv_instr_param_s(
     riscv_instr_name_t.SMDRS, // instr_name
     riscv_instr_name_t.SMDRS, // orig_name
     0xfe00707f, // mask
     0x68001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMDRS
  riscv_instr_param_s(
     riscv_instr_name_t.SMDRS32, // instr_name
     riscv_instr_name_t.SMDRS32, // orig_name
     0xfe00707f, // mask
     0x68002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMDRS32
  riscv_instr_param_s(
     riscv_instr_name_t.SMDS, // instr_name
     riscv_instr_name_t.SMDS, // orig_name
     0xfe00707f, // mask
     0x58001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMDS
  riscv_instr_param_s(
     riscv_instr_name_t.SMDS32, // instr_name
     riscv_instr_name_t.SMDS32, // orig_name
     0xfe00707f, // mask
     0x58002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMDS32
  riscv_instr_param_s(
     riscv_instr_name_t.SMIN16, // instr_name
     riscv_instr_name_t.SMIN16, // orig_name
     0xfe00707f, // mask
     0x80000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMIN16
  riscv_instr_param_s(
     riscv_instr_name_t.SMIN32, // instr_name
     riscv_instr_name_t.SMIN32, // orig_name
     0xfe00707f, // mask
     0x90002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMIN32
  riscv_instr_param_s(
     riscv_instr_name_t.SMIN8, // instr_name
     riscv_instr_name_t.SMIN8, // orig_name
     0xfe00707f, // mask
     0x88000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMIN8
  riscv_instr_param_s(
     riscv_instr_name_t.SMMUL, // instr_name
     riscv_instr_name_t.SMMUL, // orig_name
     0xfe00707f, // mask
     0x40001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMMUL
  riscv_instr_param_s(
     riscv_instr_name_t.SMMUL_U, // instr_name
     riscv_instr_name_t.SMMUL_U, // orig_name
     0xfe00707f, // mask
     0x50001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMMUL_U
  riscv_instr_param_s(
     riscv_instr_name_t.SMMWB, // instr_name
     riscv_instr_name_t.SMMWB, // orig_name
     0xfe00707f, // mask
     0x44001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMMWB
  riscv_instr_param_s(
     riscv_instr_name_t.SMMWB_U, // instr_name
     riscv_instr_name_t.SMMWB_U, // orig_name
     0xfe00707f, // mask
     0x54001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMMWB_U
  riscv_instr_param_s(
     riscv_instr_name_t.SMMWT, // instr_name
     riscv_instr_name_t.SMMWT, // orig_name
     0xfe00707f, // mask
     0x64001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMMWT
  riscv_instr_param_s(
     riscv_instr_name_t.SMMWT_U, // instr_name
     riscv_instr_name_t.SMMWT_U, // orig_name
     0xfe00707f, // mask
     0x74001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMMWT_U
  riscv_instr_param_s(
     riscv_instr_name_t.SMTT16, // instr_name
     riscv_instr_name_t.SMTT16, // orig_name
     0xfe00707f, // mask
     0x28001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMTT16
  riscv_instr_param_s(
     riscv_instr_name_t.SMTT32, // instr_name
     riscv_instr_name_t.SMTT32, // orig_name
     0xfe00707f, // mask
     0x28002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMTT32
  riscv_instr_param_s(
     riscv_instr_name_t.SMXDS, // instr_name
     riscv_instr_name_t.SMXDS, // orig_name
     0xfe00707f, // mask
     0x78001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMXDS
  riscv_instr_param_s(
     riscv_instr_name_t.SMXDS32, // instr_name
     riscv_instr_name_t.SMXDS32, // orig_name
     0xfe00707f, // mask
     0x78002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SMXDS32
  riscv_instr_param_s(
     riscv_instr_name_t.SRA, // instr_name
     riscv_instr_name_t.SRA, // orig_name
     0xfe00707f, // mask
     0x40005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA
  riscv_instr_param_s(
     riscv_instr_name_t.SRA16, // instr_name
     riscv_instr_name_t.SRA16, // orig_name
     0xfe00707f, // mask
     0x50000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA16
  riscv_instr_param_s(
     riscv_instr_name_t.SRA16_U, // instr_name
     riscv_instr_name_t.SRA16_U, // orig_name
     0xfe00707f, // mask
     0x60000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA16_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRA32, // instr_name
     riscv_instr_name_t.SRA32, // orig_name
     0xfe00707f, // mask
     0x50002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA32
  riscv_instr_param_s(
     riscv_instr_name_t.SRA32_U, // instr_name
     riscv_instr_name_t.SRA32_U, // orig_name
     0xfe00707f, // mask
     0x60002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA32_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRA8, // instr_name
     riscv_instr_name_t.SRA8, // orig_name
     0xfe00707f, // mask
     0x58000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA8
  riscv_instr_param_s(
     riscv_instr_name_t.SRA8_U, // instr_name
     riscv_instr_name_t.SRA8_U, // orig_name
     0xfe00707f, // mask
     0x68000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA8_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRA_U, // instr_name
     riscv_instr_name_t.SRA_U, // orig_name
     0xfe00707f, // mask
     0x24001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRA_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI, // instr_name
     riscv_instr_name_t.SRAI, // orig_name
     0xfc00707f, // mask
     0x40005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI16, // instr_name
     riscv_instr_name_t.SRAI16, // orig_name
     0xff00707f, // mask
     0x70000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI16
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI16_U, // instr_name
     riscv_instr_name_t.SRAI16_U, // orig_name
     0xff00707f, // mask
     0x71000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI16_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI32, // instr_name
     riscv_instr_name_t.SRAI32, // orig_name
     0xfe00707f, // mask
     0x70002077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI32
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI32_U, // instr_name
     riscv_instr_name_t.SRAI32_U, // orig_name
     0xfe00707f, // mask
     0x80002077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI32_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI8, // instr_name
     riscv_instr_name_t.SRAI8, // orig_name
     0xff80707f, // mask
     0x78000077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI8
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI8_U, // instr_name
     riscv_instr_name_t.SRAI8_U, // orig_name
     0xff80707f, // mask
     0x78800077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI8_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRAI_U, // instr_name
     riscv_instr_name_t.SRAI_U, // orig_name
     0xfc00707f, // mask
     0xd4001077, // match
     [riscv_instr_var_t.imm6, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b100000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAI_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRAIW, // instr_name
     riscv_instr_name_t.SRAIW, // orig_name
     0xfe00707f, // mask
     0x4000501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAIW
  riscv_instr_param_s(
     riscv_instr_name_t.SRAIW_U, // instr_name
     riscv_instr_name_t.SRAIW_U, // orig_name
     0xfe00707f, // mask
     0x34001077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAIW_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRAW, // instr_name
     riscv_instr_name_t.SRAW, // orig_name
     0xfe00707f, // mask
     0x4000503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRAW
  riscv_instr_param_s(
     riscv_instr_name_t.SRET, // instr_name
     riscv_instr_name_t.SRET, // orig_name
     0xffffffff, // mask
     0x10200073, // match
     [], // variables
     [riscv_extention_t.rv_s], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRET
  riscv_instr_param_s(
     riscv_instr_name_t.SRL, // instr_name
     riscv_instr_name_t.SRL, // orig_name
     0xfe00707f, // mask
     0x5033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL
  riscv_instr_param_s(
     riscv_instr_name_t.SRL16, // instr_name
     riscv_instr_name_t.SRL16, // orig_name
     0xfe00707f, // mask
     0x52000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL16
  riscv_instr_param_s(
     riscv_instr_name_t.SRL16_U, // instr_name
     riscv_instr_name_t.SRL16_U, // orig_name
     0xfe00707f, // mask
     0x62000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL16_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRL32, // instr_name
     riscv_instr_name_t.SRL32, // orig_name
     0xfe00707f, // mask
     0x52002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL32
  riscv_instr_param_s(
     riscv_instr_name_t.SRL32_U, // instr_name
     riscv_instr_name_t.SRL32_U, // orig_name
     0xfe00707f, // mask
     0x62002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL32_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRL8, // instr_name
     riscv_instr_name_t.SRL8, // orig_name
     0xfe00707f, // mask
     0x5a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL8
  riscv_instr_param_s(
     riscv_instr_name_t.SRL8_U, // instr_name
     riscv_instr_name_t.SRL8_U, // orig_name
     0xfe00707f, // mask
     0x6a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRL8_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI, // instr_name
     riscv_instr_name_t.SRLI, // orig_name
     0xfc00707f, // mask
     0x5013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI16, // instr_name
     riscv_instr_name_t.SRLI16, // orig_name
     0xff00707f, // mask
     0x72000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI16
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI16_U, // instr_name
     riscv_instr_name_t.SRLI16_U, // orig_name
     0xff00707f, // mask
     0x73000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI16_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI32, // instr_name
     riscv_instr_name_t.SRLI32, // orig_name
     0xfe00707f, // mask
     0x72002077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI32
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI32_U, // instr_name
     riscv_instr_name_t.VSM3ME_VV, // orig_name
     0xfe00707f, // mask
     0x82002077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI32_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI8, // instr_name
     riscv_instr_name_t.SRLI8, // orig_name
     0xff80707f, // mask
     0x7a000077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI8
  riscv_instr_param_s(
     riscv_instr_name_t.SRLI8_U, // instr_name
     riscv_instr_name_t.SRLI8_U, // orig_name
     0xff80707f, // mask
     0x7a800077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLI8_U
  riscv_instr_param_s(
     riscv_instr_name_t.SRLIW, // instr_name
     riscv_instr_name_t.SRLIW, // orig_name
     0xfe00707f, // mask
     0x501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLIW
  riscv_instr_param_s(
     riscv_instr_name_t.SRLW, // instr_name
     riscv_instr_name_t.SRLW, // orig_name
     0xfe00707f, // mask
     0x503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRLW
  riscv_instr_param_s(
     riscv_instr_name_t.SRO, // instr_name
     riscv_instr_name_t.SRO, // orig_name
     0xfe00707f, // mask
     0x20005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SRO
  riscv_instr_param_s(
     riscv_instr_name_t.SROI, // instr_name
     riscv_instr_name_t.SROI, // orig_name
     0xfc00707f, // mask
     0x20005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtd], // variables
     [riscv_extention_t.rv_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1000000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SROI
  riscv_instr_param_s(
     riscv_instr_name_t.SROIW, // instr_name
     riscv_instr_name_t.SROIW, // orig_name
     0xfe00707f, // mask
     0x2000501b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SROIW
  riscv_instr_param_s(
     riscv_instr_name_t.SROW, // instr_name
     riscv_instr_name_t.SROW, // orig_name
     0xfe00707f, // mask
     0x2000503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_b], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SROW
  riscv_instr_param_s(
     riscv_instr_name_t.STAS16, // instr_name
     riscv_instr_name_t.STAS16, // orig_name
     0xfe00707f, // mask
     0xf4002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // STAS16
  riscv_instr_param_s(
     riscv_instr_name_t.STAS32, // instr_name
     riscv_instr_name_t.STAS32, // orig_name
     0xfe00707f, // mask
     0xf0002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // STAS32
  riscv_instr_param_s(
     riscv_instr_name_t.STSA16, // instr_name
     riscv_instr_name_t.STSA16, // orig_name
     0xfe00707f, // mask
     0xf6002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // STSA16
  riscv_instr_param_s(
     riscv_instr_name_t.STSA32, // instr_name
     riscv_instr_name_t.STSA32, // orig_name
     0xfe00707f, // mask
     0xf2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // STSA32
  riscv_instr_param_s(
     riscv_instr_name_t.SUB, // instr_name
     riscv_instr_name_t.SUB, // orig_name
     0xfe00707f, // mask
     0x40000033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUB
  riscv_instr_param_s(
     riscv_instr_name_t.SUB16, // instr_name
     riscv_instr_name_t.SUB16, // orig_name
     0xfe00707f, // mask
     0x42000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUB16
  riscv_instr_param_s(
     riscv_instr_name_t.SUB32, // instr_name
     riscv_instr_name_t.SUB32, // orig_name
     0xfe00707f, // mask
     0x42002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUB32
  riscv_instr_param_s(
     riscv_instr_name_t.SUB8, // instr_name
     riscv_instr_name_t.SUB8, // orig_name
     0xfe00707f, // mask
     0x4a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUB8
  riscv_instr_param_s(
     riscv_instr_name_t.SUBW, // instr_name
     riscv_instr_name_t.SUBW, // orig_name
     0xfe00707f, // mask
     0x4000003b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUBW
  riscv_instr_param_s(
     riscv_instr_name_t.SUNPKD810, // instr_name
     riscv_instr_name_t.SUNPKD810, // orig_name
     0xfff0707f, // mask
     0xac800077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUNPKD810
  riscv_instr_param_s(
     riscv_instr_name_t.SUNPKD820, // instr_name
     riscv_instr_name_t.SUNPKD820, // orig_name
     0xfff0707f, // mask
     0xac900077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUNPKD820
  riscv_instr_param_s(
     riscv_instr_name_t.SUNPKD830, // instr_name
     riscv_instr_name_t.SUNPKD830, // orig_name
     0xfff0707f, // mask
     0xaca00077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUNPKD830
  riscv_instr_param_s(
     riscv_instr_name_t.SUNPKD831, // instr_name
     riscv_instr_name_t.SUNPKD831, // orig_name
     0xfff0707f, // mask
     0xacb00077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUNPKD831
  riscv_instr_param_s(
     riscv_instr_name_t.SUNPKD832, // instr_name
     riscv_instr_name_t.SUNPKD832, // orig_name
     0xfff0707f, // mask
     0xad300077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SUNPKD832
  riscv_instr_param_s(
     riscv_instr_name_t.SW, // instr_name
     riscv_instr_name_t.SW, // orig_name
     0x707f, // mask
     0x2023, // match
     [riscv_instr_var_t.imm12hi, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2, riscv_instr_var_t.imm12lo], // variables
     [riscv_extention_t.rv_i], // extentions
     0b101000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // SW
  riscv_instr_param_s(
     riscv_instr_name_t.UCLIP16, // instr_name
     riscv_instr_name_t.UCLIP16, // orig_name
     0xff00707f, // mask
     0x85000077, // match
     [riscv_instr_var_t.imm4, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b1000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCLIP16
  riscv_instr_param_s(
     riscv_instr_name_t.UCLIP32, // instr_name
     riscv_instr_name_t.UCLIP32, // orig_name
     0xfe00707f, // mask
     0xf4000077, // match
     [riscv_instr_var_t.imm5, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b10000000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCLIP32
  riscv_instr_param_s(
     riscv_instr_name_t.UCLIP8, // instr_name
     riscv_instr_name_t.UCLIP8, // orig_name
     0xff80707f, // mask
     0x8d000077, // match
     [riscv_instr_var_t.imm3, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b100000000, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCLIP8
  riscv_instr_param_s(
     riscv_instr_name_t.UCMPLE16, // instr_name
     riscv_instr_name_t.UCMPLE16, // orig_name
     0xfe00707f, // mask
     0x3c000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCMPLE16
  riscv_instr_param_s(
     riscv_instr_name_t.UCMPLE8, // instr_name
     riscv_instr_name_t.UCMPLE8, // orig_name
     0xfe00707f, // mask
     0x3e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCMPLE8
  riscv_instr_param_s(
     riscv_instr_name_t.UCMPLT16, // instr_name
     riscv_instr_name_t.UCMPLT16, // orig_name
     0xfe00707f, // mask
     0x2c000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCMPLT16
  riscv_instr_param_s(
     riscv_instr_name_t.UCMPLT8, // instr_name
     riscv_instr_name_t.UCMPLT8, // orig_name
     0xfe00707f, // mask
     0x2e000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UCMPLT8
  riscv_instr_param_s(
     riscv_instr_name_t.UKADD16, // instr_name
     riscv_instr_name_t.UKADD16, // orig_name
     0xfe00707f, // mask
     0x30000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKADD16
  riscv_instr_param_s(
     riscv_instr_name_t.UKADD32, // instr_name
     riscv_instr_name_t.UKADD32, // orig_name
     0xfe00707f, // mask
     0x30002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKADD32
  riscv_instr_param_s(
     riscv_instr_name_t.UKADD8, // instr_name
     riscv_instr_name_t.UKADD8, // orig_name
     0xfe00707f, // mask
     0x38000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKADD8
  riscv_instr_param_s(
     riscv_instr_name_t.UKADDH, // instr_name
     riscv_instr_name_t.UKADDH, // orig_name
     0xfe00707f, // mask
     0x14001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKADDH
  riscv_instr_param_s(
     riscv_instr_name_t.UKADDW, // instr_name
     riscv_instr_name_t.UKADDW, // orig_name
     0xfe00707f, // mask
     0x10001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKADDW
  riscv_instr_param_s(
     riscv_instr_name_t.UKCRAS16, // instr_name
     riscv_instr_name_t.UKCRAS16, // orig_name
     0xfe00707f, // mask
     0x34000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKCRAS16
  riscv_instr_param_s(
     riscv_instr_name_t.UKCRAS32, // instr_name
     riscv_instr_name_t.UKCRAS32, // orig_name
     0xfe00707f, // mask
     0x34002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKCRAS32
  riscv_instr_param_s(
     riscv_instr_name_t.UKCRSA16, // instr_name
     riscv_instr_name_t.UKCRSA16, // orig_name
     0xfe00707f, // mask
     0x36000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKCRSA16
  riscv_instr_param_s(
     riscv_instr_name_t.UKCRSA32, // instr_name
     riscv_instr_name_t.UKCRSA32, // orig_name
     0xfe00707f, // mask
     0x36002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKCRSA32
  riscv_instr_param_s(
     riscv_instr_name_t.UKSTAS16, // instr_name
     riscv_instr_name_t.UKSTAS16, // orig_name
     0xfe00707f, // mask
     0xe4002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSTAS16
  riscv_instr_param_s(
     riscv_instr_name_t.UKSTAS32, // instr_name
     riscv_instr_name_t.UKSTAS32, // orig_name
     0xfe00707f, // mask
     0xe0002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSTAS32
  riscv_instr_param_s(
     riscv_instr_name_t.UKSTSA16, // instr_name
     riscv_instr_name_t.UKSTSA16, // orig_name
     0xfe00707f, // mask
     0xe6002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSTSA16
  riscv_instr_param_s(
     riscv_instr_name_t.UKSTSA32, // instr_name
     riscv_instr_name_t.UKSTSA32, // orig_name
     0xfe00707f, // mask
     0xe2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSTSA32
  riscv_instr_param_s(
     riscv_instr_name_t.UKSUB16, // instr_name
     riscv_instr_name_t.UKSUB16, // orig_name
     0xfe00707f, // mask
     0x32000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSUB16
  riscv_instr_param_s(
     riscv_instr_name_t.UKSUB32, // instr_name
     riscv_instr_name_t.UKSUB32, // orig_name
     0xfe00707f, // mask
     0x32002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSUB32
  riscv_instr_param_s(
     riscv_instr_name_t.UKSUB8, // instr_name
     riscv_instr_name_t.UKSUB8, // orig_name
     0xfe00707f, // mask
     0x3a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSUB8
  riscv_instr_param_s(
     riscv_instr_name_t.UKSUBH, // instr_name
     riscv_instr_name_t.UKSUBH, // orig_name
     0xfe00707f, // mask
     0x16001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSUBH
  riscv_instr_param_s(
     riscv_instr_name_t.UKSUBW, // instr_name
     riscv_instr_name_t.UKSUBW, // orig_name
     0xfe00707f, // mask
     0x12001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UKSUBW
  riscv_instr_param_s(
     riscv_instr_name_t.UMAQA, // instr_name
     riscv_instr_name_t.UMAQA, // orig_name
     0xfe00707f, // mask
     0xcc000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMAQA
  riscv_instr_param_s(
     riscv_instr_name_t.UMAX16, // instr_name
     riscv_instr_name_t.UMAX16, // orig_name
     0xfe00707f, // mask
     0x92000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMAX16
  riscv_instr_param_s(
     riscv_instr_name_t.UMAX32, // instr_name
     riscv_instr_name_t.VAESDF_VV, // orig_name
     0xfe00707f, // mask
     0xa2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMAX32
  riscv_instr_param_s(
     riscv_instr_name_t.UMAX8, // instr_name
     riscv_instr_name_t.UMAX8, // orig_name
     0xfe00707f, // mask
     0x9a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMAX8
  riscv_instr_param_s(
     riscv_instr_name_t.UMIN16, // instr_name
     riscv_instr_name_t.UMIN16, // orig_name
     0xfe00707f, // mask
     0x90000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMIN16
  riscv_instr_param_s(
     riscv_instr_name_t.UMIN32, // instr_name
     riscv_instr_name_t.UMIN32, // orig_name
     0xfe00707f, // mask
     0xa0002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMIN32
  riscv_instr_param_s(
     riscv_instr_name_t.UMIN8, // instr_name
     riscv_instr_name_t.UMIN8, // orig_name
     0xfe00707f, // mask
     0x98000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UMIN8
  riscv_instr_param_s(
     riscv_instr_name_t.UNSHFL, // instr_name
     riscv_instr_name_t.UNSHFL, // orig_name
     0xfe00707f, // mask
     0x8005033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UNSHFL
  riscv_instr_param_s(
     riscv_instr_name_t.UNSHFLI, // instr_name
     riscv_instr_name_t.UNSHFLI, // orig_name
     0xfe00707f, // mask
     0x8005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.shamtw], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b10000000000000101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UNSHFLI
  riscv_instr_param_s(
     riscv_instr_name_t.UNSHFLW, // instr_name
     riscv_instr_name_t.UNSHFLW, // orig_name
     0xfe00707f, // mask
     0x800503b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UNSHFLW
  riscv_instr_param_s(
     riscv_instr_name_t.UNZIP16, // instr_name
     riscv_instr_name_t.UNSHFLI, // orig_name
     0xfff0707f, // mask
     0x9005013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbm], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UNZIP16
  riscv_instr_param_s(
     riscv_instr_name_t.UNZIP8, // instr_name
     riscv_instr_name_t.UNSHFLI, // orig_name
     0xfff0707f, // mask
     0x9805013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbm], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // UNZIP8
  riscv_instr_param_s(
     riscv_instr_name_t.URADD16, // instr_name
     riscv_instr_name_t.URADD16, // orig_name
     0xfe00707f, // mask
     0x20000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URADD16
  riscv_instr_param_s(
     riscv_instr_name_t.URADD32, // instr_name
     riscv_instr_name_t.URADD32, // orig_name
     0xfe00707f, // mask
     0x20002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URADD32
  riscv_instr_param_s(
     riscv_instr_name_t.URADD8, // instr_name
     riscv_instr_name_t.URADD8, // orig_name
     0xfe00707f, // mask
     0x28000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URADD8
  riscv_instr_param_s(
     riscv_instr_name_t.URADDW, // instr_name
     riscv_instr_name_t.URADDW, // orig_name
     0xfe00707f, // mask
     0x30001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URADDW
  riscv_instr_param_s(
     riscv_instr_name_t.URCRAS16, // instr_name
     riscv_instr_name_t.URCRAS16, // orig_name
     0xfe00707f, // mask
     0x24000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URCRAS16
  riscv_instr_param_s(
     riscv_instr_name_t.URCRAS32, // instr_name
     riscv_instr_name_t.URCRAS32, // orig_name
     0xfe00707f, // mask
     0x24002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URCRAS32
  riscv_instr_param_s(
     riscv_instr_name_t.URCRSA16, // instr_name
     riscv_instr_name_t.URCRSA16, // orig_name
     0xfe00707f, // mask
     0x26000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URCRSA16
  riscv_instr_param_s(
     riscv_instr_name_t.URCRSA32, // instr_name
     riscv_instr_name_t.URCRSA32, // orig_name
     0xfe00707f, // mask
     0x26002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URCRSA32
  riscv_instr_param_s(
     riscv_instr_name_t.URSTAS16, // instr_name
     riscv_instr_name_t.URSTAS16, // orig_name
     0xfe00707f, // mask
     0xd4002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSTAS16
  riscv_instr_param_s(
     riscv_instr_name_t.URSTAS32, // instr_name
     riscv_instr_name_t.URSTAS32, // orig_name
     0xfe00707f, // mask
     0xd0002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSTAS32
  riscv_instr_param_s(
     riscv_instr_name_t.URSTSA16, // instr_name
     riscv_instr_name_t.URSTSA16, // orig_name
     0xfe00707f, // mask
     0xd6002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSTSA16
  riscv_instr_param_s(
     riscv_instr_name_t.URSTSA32, // instr_name
     riscv_instr_name_t.URSTSA32, // orig_name
     0xfe00707f, // mask
     0xd2002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSTSA32
  riscv_instr_param_s(
     riscv_instr_name_t.URSUB16, // instr_name
     riscv_instr_name_t.URSUB16, // orig_name
     0xfe00707f, // mask
     0x22000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSUB16
  riscv_instr_param_s(
     riscv_instr_name_t.URSUB32, // instr_name
     riscv_instr_name_t.URSUB32, // orig_name
     0xfe00707f, // mask
     0x22002077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv64_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSUB32
  riscv_instr_param_s(
     riscv_instr_name_t.URSUB8, // instr_name
     riscv_instr_name_t.URSUB8, // orig_name
     0xfe00707f, // mask
     0x2a000077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSUB8
  riscv_instr_param_s(
     riscv_instr_name_t.URSUBW, // instr_name
     riscv_instr_name_t.URSUBW, // orig_name
     0xfe00707f, // mask
     0x32001077, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // URSUBW
  riscv_instr_param_s(
     riscv_instr_name_t.VAADD_VV, // instr_name
     riscv_instr_name_t.VAADD_VV, // orig_name
     0xfc00707f, // mask
     0x24002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VAADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAADD_VX, // instr_name
     riscv_instr_name_t.VAADD_VX, // orig_name
     0xfc00707f, // mask
     0x24006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VAADD_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VAADDU_VV, // instr_name
     riscv_instr_name_t.VAADDU_VV, // orig_name
     0xfc00707f, // mask
     0x20002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VAADDU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAADDU_VX, // instr_name
     riscv_instr_name_t.VAADDU_VX, // orig_name
     0xfc00707f, // mask
     0x20006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VAADDU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VADC_VIM, // instr_name
     riscv_instr_name_t.VADC_VIM, // orig_name
     0xfe00707f, // mask
     0x40003057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VADC_VIM
  riscv_instr_param_s(
     riscv_instr_name_t.VADC_VVM, // instr_name
     riscv_instr_name_t.VADC_VVM, // orig_name
     0xfe00707f, // mask
     0x40000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VADC_VVM
  riscv_instr_param_s(
     riscv_instr_name_t.VADC_VXM, // instr_name
     riscv_instr_name_t.VADC_VXM, // orig_name
     0xfe00707f, // mask
     0x40004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VADC_VXM
  riscv_instr_param_s(
     riscv_instr_name_t.VADD_VI, // instr_name
     riscv_instr_name_t.VADD_VI, // orig_name
     0xfc00707f, // mask
     0x3057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VADD_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VADD_VV, // instr_name
     riscv_instr_name_t.VADD_VV, // orig_name
     0xfc00707f, // mask
     0x57, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VADD_VX, // instr_name
     riscv_instr_name_t.VADD_VX, // orig_name
     0xfc00707f, // mask
     0x4057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VADD_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VAESDF_VS, // instr_name
     riscv_instr_name_t.VAESDF_VS, // orig_name
     0xfe0ff07f, // mask
     0xa600a077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESDF_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VAESDF_VV, // instr_name
     riscv_instr_name_t.VAESDF_VV, // orig_name
     0xfe0ff07f, // mask
     0xa200a077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESDF_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAESDM_VS, // instr_name
     riscv_instr_name_t.VAESDM_VS, // orig_name
     0xfe0ff07f, // mask
     0xa6002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESDM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VAESDM_VV, // instr_name
     riscv_instr_name_t.VAESDM_VV, // orig_name
     0xfe0ff07f, // mask
     0xa2002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESDM_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAESEF_VS, // instr_name
     riscv_instr_name_t.VAESEF_VS, // orig_name
     0xfe0ff07f, // mask
     0xa601a077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESEF_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VAESEF_VV, // instr_name
     riscv_instr_name_t.VAESEF_VV, // orig_name
     0xfe0ff07f, // mask
     0xa201a077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESEF_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAESEM_VS, // instr_name
     riscv_instr_name_t.VAESEM_VS, // orig_name
     0xfe0ff07f, // mask
     0xa6012077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESEM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VAESEM_VV, // instr_name
     riscv_instr_name_t.VAESEM_VV, // orig_name
     0xfe0ff07f, // mask
     0xa2012077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESEM_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAESKF1_VI, // instr_name
     riscv_instr_name_t.VAESKF1_VI, // orig_name
     0xfe00707f, // mask
     0x8a002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.zimm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b10, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESKF1_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VAESKF2_VI, // instr_name
     riscv_instr_name_t.VAESKF2_VI, // orig_name
     0xfe00707f, // mask
     0xaa002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.zimm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b10, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESKF2_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VAESZ_VS, // instr_name
     riscv_instr_name_t.VAESZ_VS, // orig_name
     0xfe0ff07f, // mask
     0xa603a077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VAESZ_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VAND_VI, // instr_name
     riscv_instr_name_t.VAND_VI, // orig_name
     0xfc00707f, // mask
     0x24003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VAND_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VAND_VV, // instr_name
     riscv_instr_name_t.VAND_VV, // orig_name
     0xfc00707f, // mask
     0x24000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VAND_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VAND_VX, // instr_name
     riscv_instr_name_t.VAND_VX, // orig_name
     0xfc00707f, // mask
     0x24004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VAND_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VANDN_VV, // instr_name
     riscv_instr_name_t.VANDN_VV, // orig_name
     0xfc00707f, // mask
     0x4000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VANDN_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VANDN_VX, // instr_name
     riscv_instr_name_t.VANDN_VX, // orig_name
     0xfc00707f, // mask
     0x4004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VANDN_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VASUB_VV, // instr_name
     riscv_instr_name_t.VASUB_VV, // orig_name
     0xfc00707f, // mask
     0x2c002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VASUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VASUB_VX, // instr_name
     riscv_instr_name_t.VASUB_VX, // orig_name
     0xfc00707f, // mask
     0x2c006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VASUB_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VASUBU_VV, // instr_name
     riscv_instr_name_t.VASUBU_VV, // orig_name
     0xfc00707f, // mask
     0x28002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VASUBU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VASUBU_VX, // instr_name
     riscv_instr_name_t.VASUBU_VX, // orig_name
     0xfc00707f, // mask
     0x28006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VASUBU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VBREV8_V, // instr_name
     riscv_instr_name_t.VBREV8_V, // orig_name
     0xfc0ff07f, // mask
     0x48042057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VBREV8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VBREV_V, // instr_name
     riscv_instr_name_t.VBREV_V, // orig_name
     0xfc0ff07f, // mask
     0x48052057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VBREV_V
  riscv_instr_param_s(
     riscv_instr_name_t.VCLMUL_VV, // instr_name
     riscv_instr_name_t.VCLMUL_VV, // orig_name
     0xfc00707f, // mask
     0x30002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VCLMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VCLMUL_VX, // instr_name
     riscv_instr_name_t.VCLMUL_VX, // orig_name
     0xfc00707f, // mask
     0x30006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VCLMUL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VCLMULH_VV, // instr_name
     riscv_instr_name_t.VCLMULH_VV, // orig_name
     0xfc00707f, // mask
     0x34002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VCLMULH_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VCLMULH_VX, // instr_name
     riscv_instr_name_t.VCLMULH_VX, // orig_name
     0xfc00707f, // mask
     0x34006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VCLMULH_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VCLZ_V, // instr_name
     riscv_instr_name_t.VCLZ_V, // orig_name
     0xfc0ff07f, // mask
     0x48062057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VCLZ_V
  riscv_instr_param_s(
     riscv_instr_name_t.VCOMPRESS_VM, // instr_name
     riscv_instr_name_t.VCOMPRESS_VM, // orig_name
     0xfe00707f, // mask
     0x5e002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VCOMPRESS_VM
  riscv_instr_param_s(
     riscv_instr_name_t.VCPOP_M, // instr_name
     riscv_instr_name_t.VCPOP_M, // orig_name
     0xfc0ff07f, // mask
     0x40082057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b11000, // _v_vars
   ), // VCPOP_M
  riscv_instr_param_s(
     riscv_instr_name_t.VCPOP_V, // instr_name
     riscv_instr_name_t.VCPOP_V, // orig_name
     0xfc0ff07f, // mask
     0x48072057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VCPOP_V
  riscv_instr_param_s(
     riscv_instr_name_t.VCTZ_V, // instr_name
     riscv_instr_name_t.VCTZ_V, // orig_name
     0xfc0ff07f, // mask
     0x4806a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VCTZ_V
  riscv_instr_param_s(
     riscv_instr_name_t.VDIV_VV, // instr_name
     riscv_instr_name_t.VDIV_VV, // orig_name
     0xfc00707f, // mask
     0x84002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VDIV_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VDIV_VX, // instr_name
     riscv_instr_name_t.VDIV_VX, // orig_name
     0xfc00707f, // mask
     0x84006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VDIV_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VDIVU_VV, // instr_name
     riscv_instr_name_t.VDIVU_VV, // orig_name
     0xfc00707f, // mask
     0x80002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VDIVU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VDIVU_VX, // instr_name
     riscv_instr_name_t.VDIVU_VX, // orig_name
     0xfc00707f, // mask
     0x80006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VDIVU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VFADD_VF, // instr_name
     riscv_instr_name_t.VFADD_VF, // orig_name
     0xfc00707f, // mask
     0x5057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFADD_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFADD_VV, // instr_name
     riscv_instr_name_t.VFADD_VV, // orig_name
     0xfc00707f, // mask
     0x1057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFCLASS_V, // instr_name
     riscv_instr_name_t.VFCLASS_V, // orig_name
     0xfc0ff07f, // mask
     0x4c081057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCLASS_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_F_X_V, // instr_name
     riscv_instr_name_t.VFCVT_F_X_V, // orig_name
     0xfc0ff07f, // mask
     0x48019057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCVT_F_X_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_F_XU_V, // instr_name
     riscv_instr_name_t.VFCVT_F_XU_V, // orig_name
     0xfc0ff07f, // mask
     0x48011057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCVT_F_XU_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_RTZ_X_F_V, // instr_name
     riscv_instr_name_t.VFCVT_RTZ_X_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48039057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCVT_RTZ_X_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_RTZ_XU_F_V, // instr_name
     riscv_instr_name_t.VFCVT_RTZ_XU_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48031057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCVT_RTZ_XU_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_X_F_V, // instr_name
     riscv_instr_name_t.VFCVT_X_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48009057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCVT_X_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFCVT_XU_F_V, // instr_name
     riscv_instr_name_t.VFCVT_XU_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFCVT_XU_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFDIV_VF, // instr_name
     riscv_instr_name_t.VFDIV_VF, // orig_name
     0xfc00707f, // mask
     0x80005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFDIV_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFDIV_VV, // instr_name
     riscv_instr_name_t.VFDIV_VV, // orig_name
     0xfc00707f, // mask
     0x80001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFDIV_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFIRST_M, // instr_name
     riscv_instr_name_t.VFIRST_M, // orig_name
     0xfc0ff07f, // mask
     0x4008a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b11000, // _v_vars
   ), // VFIRST_M
  riscv_instr_param_s(
     riscv_instr_name_t.VFMACC_VF, // instr_name
     riscv_instr_name_t.VFMACC_VF, // orig_name
     0xfc00707f, // mask
     0xb0005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMACC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMACC_VV, // instr_name
     riscv_instr_name_t.VFMACC_VV, // orig_name
     0xfc00707f, // mask
     0xb0001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMACC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMADD_VF, // instr_name
     riscv_instr_name_t.VFMADD_VF, // orig_name
     0xfc00707f, // mask
     0xa0005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMADD_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMADD_VV, // instr_name
     riscv_instr_name_t.VFMADD_VV, // orig_name
     0xfc00707f, // mask
     0xa0001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMAX_VF, // instr_name
     riscv_instr_name_t.VFMAX_VF, // orig_name
     0xfc00707f, // mask
     0x18005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMAX_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMAX_VV, // instr_name
     riscv_instr_name_t.VFMAX_VV, // orig_name
     0xfc00707f, // mask
     0x18001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMAX_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMERGE_VFM, // instr_name
     riscv_instr_name_t.VFMERGE_VFM, // orig_name
     0xfe00707f, // mask
     0x5c005057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VFMERGE_VFM
  riscv_instr_param_s(
     riscv_instr_name_t.VFMIN_VF, // instr_name
     riscv_instr_name_t.VFMIN_VF, // orig_name
     0xfc00707f, // mask
     0x10005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMIN_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMIN_VV, // instr_name
     riscv_instr_name_t.VFMIN_VV, // orig_name
     0xfc00707f, // mask
     0x10001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMIN_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMSAC_VF, // instr_name
     riscv_instr_name_t.VFMSAC_VF, // orig_name
     0xfc00707f, // mask
     0xb8005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMSAC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMSAC_VV, // instr_name
     riscv_instr_name_t.VFMSAC_VV, // orig_name
     0xfc00707f, // mask
     0xb8001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMSAC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMSUB_VF, // instr_name
     riscv_instr_name_t.VFMSUB_VF, // orig_name
     0xfc00707f, // mask
     0xa8005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMSUB_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMSUB_VV, // instr_name
     riscv_instr_name_t.VFMSUB_VV, // orig_name
     0xfc00707f, // mask
     0xa8001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMUL_VF, // instr_name
     riscv_instr_name_t.VFMUL_VF, // orig_name
     0xfc00707f, // mask
     0x90005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFMUL_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFMUL_VV, // instr_name
     riscv_instr_name_t.VFMUL_VV, // orig_name
     0xfc00707f, // mask
     0x90001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFMV_F_S, // instr_name
     riscv_instr_name_t.VFMV_F_S, // orig_name
     0xfe0ff07f, // mask
     0x42001057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b1000, // _v_vars
   ), // VFMV_F_S
  riscv_instr_param_s(
     riscv_instr_name_t.VFMV_S_F, // instr_name
     riscv_instr_name_t.VFMV_S_F, // orig_name
     0xfff0707f, // mask
     0x42005057, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VFMV_S_F
  riscv_instr_param_s(
     riscv_instr_name_t.VFMV_V_F, // instr_name
     riscv_instr_name_t.VFMV_V_F, // orig_name
     0xfff0707f, // mask
     0x5e005057, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VFMV_V_F
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_F_F_W, // instr_name
     riscv_instr_name_t.VFNCVT_F_F_W, // orig_name
     0xfc0ff07f, // mask
     0x480a1057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_F_F_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_F_X_W, // instr_name
     riscv_instr_name_t.VFNCVT_F_X_W, // orig_name
     0xfc0ff07f, // mask
     0x48099057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_F_X_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_F_XU_W, // instr_name
     riscv_instr_name_t.VFNCVT_F_XU_W, // orig_name
     0xfc0ff07f, // mask
     0x48091057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_F_XU_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_ROD_F_F_W, // instr_name
     riscv_instr_name_t.VFNCVT_ROD_F_F_W, // orig_name
     0xfc0ff07f, // mask
     0x480a9057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_ROD_F_F_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_RTZ_X_F_W, // instr_name
     riscv_instr_name_t.VFNCVT_RTZ_X_F_W, // orig_name
     0xfc0ff07f, // mask
     0x480b9057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_RTZ_X_F_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_RTZ_XU_F_W, // instr_name
     riscv_instr_name_t.VFNCVT_RTZ_XU_F_W, // orig_name
     0xfc0ff07f, // mask
     0x480b1057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_RTZ_XU_F_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_X_F_W, // instr_name
     riscv_instr_name_t.VFNCVT_X_F_W, // orig_name
     0xfc0ff07f, // mask
     0x48089057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_X_F_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNCVT_XU_F_W, // instr_name
     riscv_instr_name_t.VFNCVT_XU_F_W, // orig_name
     0xfc0ff07f, // mask
     0x48081057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNCVT_XU_F_W
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMACC_VF, // instr_name
     riscv_instr_name_t.VFNMACC_VF, // orig_name
     0xfc00707f, // mask
     0xb4005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNMACC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMACC_VV, // instr_name
     riscv_instr_name_t.VFNMACC_VV, // orig_name
     0xfc00707f, // mask
     0xb4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFNMACC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMADD_VF, // instr_name
     riscv_instr_name_t.VFNMADD_VF, // orig_name
     0xfc00707f, // mask
     0xa4005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNMADD_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMADD_VV, // instr_name
     riscv_instr_name_t.VFNMADD_VV, // orig_name
     0xfc00707f, // mask
     0xa4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFNMADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMSAC_VF, // instr_name
     riscv_instr_name_t.VFNMSAC_VF, // orig_name
     0xfc00707f, // mask
     0xbc005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNMSAC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMSAC_VV, // instr_name
     riscv_instr_name_t.VFNMSAC_VV, // orig_name
     0xfc00707f, // mask
     0xbc001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFNMSAC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMSUB_VF, // instr_name
     riscv_instr_name_t.VFNMSUB_VF, // orig_name
     0xfc00707f, // mask
     0xac005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFNMSUB_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFNMSUB_VV, // instr_name
     riscv_instr_name_t.VFNMSUB_VV, // orig_name
     0xfc00707f, // mask
     0xac001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFNMSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFRDIV_VF, // instr_name
     riscv_instr_name_t.VFRDIV_VF, // orig_name
     0xfc00707f, // mask
     0x84005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFRDIV_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFREC7_V, // instr_name
     riscv_instr_name_t.VFREC7_V, // orig_name
     0xfc0ff07f, // mask
     0x4c029057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFREC7_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFREDMAX_VS, // instr_name
     riscv_instr_name_t.VFREDMAX_VS, // orig_name
     0xfc00707f, // mask
     0x1c001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFREDMAX_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFREDMIN_VS, // instr_name
     riscv_instr_name_t.VFREDMIN_VS, // orig_name
     0xfc00707f, // mask
     0x14001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFREDMIN_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFREDOSUM_VS, // instr_name
     riscv_instr_name_t.VFREDOSUM_VS, // orig_name
     0xfc00707f, // mask
     0xc001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFREDOSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFREDSUM_VS, // instr_name
     riscv_instr_name_t.VFREDUSUM_VS, // orig_name
     0xfc00707f, // mask
     0x4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFREDSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFREDUSUM_VS, // instr_name
     riscv_instr_name_t.VFREDUSUM_VS, // orig_name
     0xfc00707f, // mask
     0x4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFREDUSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFRSQRT7_V, // instr_name
     riscv_instr_name_t.VFRSQRT7_V, // orig_name
     0xfc0ff07f, // mask
     0x4c021057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFRSQRT7_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFRSUB_VF, // instr_name
     riscv_instr_name_t.VFRSUB_VF, // orig_name
     0xfc00707f, // mask
     0x9c005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFRSUB_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJ_VF, // instr_name
     riscv_instr_name_t.VFSGNJ_VF, // orig_name
     0xfc00707f, // mask
     0x20005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSGNJ_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJ_VV, // instr_name
     riscv_instr_name_t.VFSGNJ_VV, // orig_name
     0xfc00707f, // mask
     0x20001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFSGNJ_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJN_VF, // instr_name
     riscv_instr_name_t.VFSGNJN_VF, // orig_name
     0xfc00707f, // mask
     0x24005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSGNJN_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJN_VV, // instr_name
     riscv_instr_name_t.VFSGNJN_VV, // orig_name
     0xfc00707f, // mask
     0x24001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFSGNJN_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJX_VF, // instr_name
     riscv_instr_name_t.VFSGNJX_VF, // orig_name
     0xfc00707f, // mask
     0x28005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSGNJX_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSGNJX_VV, // instr_name
     riscv_instr_name_t.VFSGNJX_VV, // orig_name
     0xfc00707f, // mask
     0x28001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFSGNJX_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFSLIDE1DOWN_VF, // instr_name
     riscv_instr_name_t.VFSLIDE1DOWN_VF, // orig_name
     0xfc00707f, // mask
     0x3c005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSLIDE1DOWN_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSLIDE1UP_VF, // instr_name
     riscv_instr_name_t.VFSLIDE1UP_VF, // orig_name
     0xfc00707f, // mask
     0x38005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSLIDE1UP_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSQRT_V, // instr_name
     riscv_instr_name_t.VFSQRT_V, // orig_name
     0xfc0ff07f, // mask
     0x4c001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSQRT_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFSUB_VF, // instr_name
     riscv_instr_name_t.VFSUB_VF, // orig_name
     0xfc00707f, // mask
     0x8005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFSUB_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFSUB_VV, // instr_name
     riscv_instr_name_t.VFSUB_VV, // orig_name
     0xfc00707f, // mask
     0x8001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWADD_VF, // instr_name
     riscv_instr_name_t.VFWADD_VF, // orig_name
     0xfc00707f, // mask
     0xc0005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWADD_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWADD_VV, // instr_name
     riscv_instr_name_t.VFWADD_VV, // orig_name
     0xfc00707f, // mask
     0xc0001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWADD_WF, // instr_name
     riscv_instr_name_t.VFWADD_WF, // orig_name
     0xfc00707f, // mask
     0xd0005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWADD_WF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWADD_WV, // instr_name
     riscv_instr_name_t.VFWADD_WV, // orig_name
     0xfc00707f, // mask
     0xd0001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWADD_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_F_F_V, // instr_name
     riscv_instr_name_t.VFWCVT_F_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48061057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_F_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_F_X_V, // instr_name
     riscv_instr_name_t.VFWCVT_F_X_V, // orig_name
     0xfc0ff07f, // mask
     0x48059057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_F_X_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_F_XU_V, // instr_name
     riscv_instr_name_t.VFWCVT_F_XU_V, // orig_name
     0xfc0ff07f, // mask
     0x48051057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_F_XU_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_RTZ_X_F_V, // instr_name
     riscv_instr_name_t.VFWCVT_RTZ_X_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48079057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_RTZ_X_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_RTZ_XU_F_V, // instr_name
     riscv_instr_name_t.VFWCVT_RTZ_XU_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48071057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_RTZ_XU_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_X_F_V, // instr_name
     riscv_instr_name_t.VFWCVT_X_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48049057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_X_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWCVT_XU_F_V, // instr_name
     riscv_instr_name_t.VFWCVT_XU_F_V, // orig_name
     0xfc0ff07f, // mask
     0x48041057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWCVT_XU_F_V
  riscv_instr_param_s(
     riscv_instr_name_t.VFWMACC_VF, // instr_name
     riscv_instr_name_t.VFWMACC_VF, // orig_name
     0xfc00707f, // mask
     0xf0005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWMACC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWMACC_VV, // instr_name
     riscv_instr_name_t.VFWMACC_VV, // orig_name
     0xfc00707f, // mask
     0xf0001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWMACC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWMSAC_VF, // instr_name
     riscv_instr_name_t.VFWMSAC_VF, // orig_name
     0xfc00707f, // mask
     0xf8005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWMSAC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWMSAC_VV, // instr_name
     riscv_instr_name_t.VFWMSAC_VV, // orig_name
     0xfc00707f, // mask
     0xf8001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWMSAC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWMUL_VF, // instr_name
     riscv_instr_name_t.VFWMUL_VF, // orig_name
     0xfc00707f, // mask
     0xe0005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWMUL_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWMUL_VV, // instr_name
     riscv_instr_name_t.VFWMUL_VV, // orig_name
     0xfc00707f, // mask
     0xe0001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWNMACC_VF, // instr_name
     riscv_instr_name_t.VFWNMACC_VF, // orig_name
     0xfc00707f, // mask
     0xf4005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWNMACC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWNMACC_VV, // instr_name
     riscv_instr_name_t.VFWNMACC_VV, // orig_name
     0xfc00707f, // mask
     0xf4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWNMACC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWNMSAC_VF, // instr_name
     riscv_instr_name_t.VFWNMSAC_VF, // orig_name
     0xfc00707f, // mask
     0xfc005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWNMSAC_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWNMSAC_VV, // instr_name
     riscv_instr_name_t.VFWNMSAC_VV, // orig_name
     0xfc00707f, // mask
     0xfc001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWNMSAC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWREDOSUM_VS, // instr_name
     riscv_instr_name_t.VFWREDOSUM_VS, // orig_name
     0xfc00707f, // mask
     0xcc001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWREDOSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFWREDSUM_VS, // instr_name
     riscv_instr_name_t.VFWREDUSUM_VS, // orig_name
     0xfc00707f, // mask
     0xc4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWREDSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFWREDUSUM_VS, // instr_name
     riscv_instr_name_t.VFWREDUSUM_VS, // orig_name
     0xfc00707f, // mask
     0xc4001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWREDUSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VFWSUB_VF, // instr_name
     riscv_instr_name_t.VFWSUB_VF, // orig_name
     0xfc00707f, // mask
     0xc8005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWSUB_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWSUB_VV, // instr_name
     riscv_instr_name_t.VFWSUB_VV, // orig_name
     0xfc00707f, // mask
     0xc8001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VFWSUB_WF, // instr_name
     riscv_instr_name_t.VFWSUB_WF, // orig_name
     0xfc00707f, // mask
     0xd8005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VFWSUB_WF
  riscv_instr_param_s(
     riscv_instr_name_t.VFWSUB_WV, // instr_name
     riscv_instr_name_t.VFWSUB_WV, // orig_name
     0xfc00707f, // mask
     0xd8001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VFWSUB_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VGHSH_VV, // instr_name
     riscv_instr_name_t.VGHSH_VV, // orig_name
     0xfe00707f, // mask
     0xb2002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkg], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VGHSH_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VGMUL_VV, // instr_name
     riscv_instr_name_t.VGMUL_VV, // orig_name
     0xfe0ff07f, // mask
     0xa208a077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvkg], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VGMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VID_V, // instr_name
     riscv_instr_name_t.VID_V, // orig_name
     0xfdfff07f, // mask
     0x5008a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b10001, // _v_vars
   ), // VID_V
  riscv_instr_param_s(
     riscv_instr_name_t.VIOTA_M, // instr_name
     riscv_instr_name_t.VIOTA_M, // orig_name
     0xfc0ff07f, // mask
     0x50082057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VIOTA_M
  riscv_instr_param_s(
     riscv_instr_name_t.VL1R_V, // instr_name
     riscv_instr_name_t.VL1RE8_V, // orig_name
     0xfff0707f, // mask
     0x2800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL1R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL1RE16_V, // instr_name
     riscv_instr_name_t.VL1RE16_V, // orig_name
     0xfff0707f, // mask
     0x2805007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL1RE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL1RE32_V, // instr_name
     riscv_instr_name_t.VL1RE32_V, // orig_name
     0xfff0707f, // mask
     0x2806007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL1RE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL1RE64_V, // instr_name
     riscv_instr_name_t.VL1RE64_V, // orig_name
     0xfff0707f, // mask
     0x2807007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL1RE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL1RE8_V, // instr_name
     riscv_instr_name_t.VL1RE8_V, // orig_name
     0xfff0707f, // mask
     0x2800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL1RE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL2R_V, // instr_name
     riscv_instr_name_t.VL2RE8_V, // orig_name
     0xfff0707f, // mask
     0x22800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL2R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL2RE16_V, // instr_name
     riscv_instr_name_t.VL2RE16_V, // orig_name
     0xfff0707f, // mask
     0x22805007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL2RE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL2RE32_V, // instr_name
     riscv_instr_name_t.VL2RE32_V, // orig_name
     0xfff0707f, // mask
     0x22806007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL2RE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL2RE64_V, // instr_name
     riscv_instr_name_t.VL2RE64_V, // orig_name
     0xfff0707f, // mask
     0x22807007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL2RE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL2RE8_V, // instr_name
     riscv_instr_name_t.VL2RE8_V, // orig_name
     0xfff0707f, // mask
     0x22800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL2RE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL4R_V, // instr_name
     riscv_instr_name_t.VL4RE8_V, // orig_name
     0xfff0707f, // mask
     0x62800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL4R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL4RE16_V, // instr_name
     riscv_instr_name_t.VL4RE16_V, // orig_name
     0xfff0707f, // mask
     0x62805007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL4RE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL4RE32_V, // instr_name
     riscv_instr_name_t.VL4RE32_V, // orig_name
     0xfff0707f, // mask
     0x62806007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL4RE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL4RE64_V, // instr_name
     riscv_instr_name_t.VL4RE64_V, // orig_name
     0xfff0707f, // mask
     0x62807007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL4RE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL4RE8_V, // instr_name
     riscv_instr_name_t.VL4RE8_V, // orig_name
     0xfff0707f, // mask
     0x62800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL4RE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL8R_V, // instr_name
     riscv_instr_name_t.VL8RE8_V, // orig_name
     0xfff0707f, // mask
     0xe2800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL8R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL8RE16_V, // instr_name
     riscv_instr_name_t.VL8RE16_V, // orig_name
     0xfff0707f, // mask
     0xe2805007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL8RE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL8RE32_V, // instr_name
     riscv_instr_name_t.VL8RE32_V, // orig_name
     0xfff0707f, // mask
     0xe2806007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL8RE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL8RE64_V, // instr_name
     riscv_instr_name_t.VL8RE64_V, // orig_name
     0xfff0707f, // mask
     0xe2807007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL8RE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VL8RE8_V, // instr_name
     riscv_instr_name_t.VL8RE8_V, // orig_name
     0xfff0707f, // mask
     0xe2800007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VL8RE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE1024_V, // instr_name
     riscv_instr_name_t.VLE1024_V, // orig_name
     0x1df0707f, // mask
     0x10007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE1024FF_V, // instr_name
     riscv_instr_name_t.VLE1024FF_V, // orig_name
     0x1df0707f, // mask
     0x11007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE1024FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE128_V, // instr_name
     riscv_instr_name_t.VLE128_V, // orig_name
     0x1df0707f, // mask
     0x10000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE128FF_V, // instr_name
     riscv_instr_name_t.VLE128FF_V, // orig_name
     0x1df0707f, // mask
     0x11000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE128FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE16_V, // instr_name
     riscv_instr_name_t.VLE16_V, // orig_name
     0x1df0707f, // mask
     0x5007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE16FF_V, // instr_name
     riscv_instr_name_t.VLE16FF_V, // orig_name
     0x1df0707f, // mask
     0x1005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE16FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE1_V, // instr_name
     riscv_instr_name_t.VLM_V, // orig_name
     0xfff0707f, // mask
     0x2b00007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VLE1_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE256_V, // instr_name
     riscv_instr_name_t.VLE256_V, // orig_name
     0x1df0707f, // mask
     0x10005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE256FF_V, // instr_name
     riscv_instr_name_t.VLE256FF_V, // orig_name
     0x1df0707f, // mask
     0x11005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE256FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE32_V, // instr_name
     riscv_instr_name_t.VLE32_V, // orig_name
     0x1df0707f, // mask
     0x6007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE32FF_V, // instr_name
     riscv_instr_name_t.VLE32FF_V, // orig_name
     0x1df0707f, // mask
     0x1006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE32FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE512_V, // instr_name
     riscv_instr_name_t.VLE512_V, // orig_name
     0x1df0707f, // mask
     0x10006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE512FF_V, // instr_name
     riscv_instr_name_t.VLE512FF_V, // orig_name
     0x1df0707f, // mask
     0x11006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE512FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE64_V, // instr_name
     riscv_instr_name_t.VLE64_V, // orig_name
     0x1df0707f, // mask
     0x7007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE64FF_V, // instr_name
     riscv_instr_name_t.VLE64FF_V, // orig_name
     0x1df0707f, // mask
     0x1007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE64FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE8_V, // instr_name
     riscv_instr_name_t.VLE8_V, // orig_name
     0x1df0707f, // mask
     0x7, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLE8FF_V, // instr_name
     riscv_instr_name_t.VLE8FF_V, // orig_name
     0x1df0707f, // mask
     0x1000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLE8FF_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLM_V, // instr_name
     riscv_instr_name_t.VLM_V, // orig_name
     0xfff0707f, // mask
     0x2b00007, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VLM_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI1024_V, // instr_name
     riscv_instr_name_t.VLOXEI1024_V, // orig_name
     0x1c00707f, // mask
     0x1c007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI128_V, // instr_name
     riscv_instr_name_t.VLOXEI128_V, // orig_name
     0x1c00707f, // mask
     0x1c000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI16_V, // instr_name
     riscv_instr_name_t.VLOXEI16_V, // orig_name
     0x1c00707f, // mask
     0xc005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI256_V, // instr_name
     riscv_instr_name_t.VLOXEI256_V, // orig_name
     0x1c00707f, // mask
     0x1c005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI32_V, // instr_name
     riscv_instr_name_t.VLOXEI32_V, // orig_name
     0x1c00707f, // mask
     0xc006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI512_V, // instr_name
     riscv_instr_name_t.VLOXEI512_V, // orig_name
     0x1c00707f, // mask
     0x1c006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI64_V, // instr_name
     riscv_instr_name_t.VLOXEI64_V, // orig_name
     0x1c00707f, // mask
     0xc007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLOXEI8_V, // instr_name
     riscv_instr_name_t.VLOXEI8_V, // orig_name
     0x1c00707f, // mask
     0xc000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLOXEI8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE1024_V, // instr_name
     riscv_instr_name_t.VLSE1024_V, // orig_name
     0x1c00707f, // mask
     0x18007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE128_V, // instr_name
     riscv_instr_name_t.VLSE128_V, // orig_name
     0x1c00707f, // mask
     0x18000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE16_V, // instr_name
     riscv_instr_name_t.VLSE16_V, // orig_name
     0x1c00707f, // mask
     0x8005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE256_V, // instr_name
     riscv_instr_name_t.VLSE256_V, // orig_name
     0x1c00707f, // mask
     0x18005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE32_V, // instr_name
     riscv_instr_name_t.VLSE32_V, // orig_name
     0x1c00707f, // mask
     0x8006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE512_V, // instr_name
     riscv_instr_name_t.VLSE512_V, // orig_name
     0x1c00707f, // mask
     0x18006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE64_V, // instr_name
     riscv_instr_name_t.VLSE64_V, // orig_name
     0x1c00707f, // mask
     0x8007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLSE8_V, // instr_name
     riscv_instr_name_t.VLSE8_V, // orig_name
     0x1c00707f, // mask
     0x8000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010001, // _v_vars
   ), // VLSE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI1024_V, // instr_name
     riscv_instr_name_t.VLUXEI1024_V, // orig_name
     0x1c00707f, // mask
     0x14007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI128_V, // instr_name
     riscv_instr_name_t.VLUXEI128_V, // orig_name
     0x1c00707f, // mask
     0x14000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI16_V, // instr_name
     riscv_instr_name_t.VLUXEI16_V, // orig_name
     0x1c00707f, // mask
     0x4005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI256_V, // instr_name
     riscv_instr_name_t.VLUXEI256_V, // orig_name
     0x1c00707f, // mask
     0x14005007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI32_V, // instr_name
     riscv_instr_name_t.VLUXEI32_V, // orig_name
     0x1c00707f, // mask
     0x4006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI512_V, // instr_name
     riscv_instr_name_t.VLUXEI512_V, // orig_name
     0x1c00707f, // mask
     0x14006007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI64_V, // instr_name
     riscv_instr_name_t.VLUXEI64_V, // orig_name
     0x1c00707f, // mask
     0x4007007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VLUXEI8_V, // instr_name
     riscv_instr_name_t.VLUXEI8_V, // orig_name
     0x1c00707f, // mask
     0x4000007, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011001, // _v_vars
   ), // VLUXEI8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VMACC_VV, // instr_name
     riscv_instr_name_t.VMACC_VV, // orig_name
     0xfc00707f, // mask
     0xb4002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMACC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMACC_VX, // instr_name
     riscv_instr_name_t.VMACC_VX, // orig_name
     0xfc00707f, // mask
     0xb4006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMACC_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VI, // instr_name
     riscv_instr_name_t.VMADC_VI, // orig_name
     0xfe00707f, // mask
     0x46003057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMADC_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VIM, // instr_name
     riscv_instr_name_t.VMADC_VIM, // orig_name
     0xfe00707f, // mask
     0x44003057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMADC_VIM
  riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VV, // instr_name
     riscv_instr_name_t.VMADC_VV, // orig_name
     0xfe00707f, // mask
     0x46000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMADC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VVM, // instr_name
     riscv_instr_name_t.VMADC_VVM, // orig_name
     0xfe00707f, // mask
     0x44000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMADC_VVM
  riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VX, // instr_name
     riscv_instr_name_t.VMADC_VX, // orig_name
     0xfe00707f, // mask
     0x46004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMADC_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMADC_VXM, // instr_name
     riscv_instr_name_t.VMADC_VXM, // orig_name
     0xfe00707f, // mask
     0x44004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMADC_VXM
  riscv_instr_param_s(
     riscv_instr_name_t.VMADD_VV, // instr_name
     riscv_instr_name_t.VMADD_VV, // orig_name
     0xfc00707f, // mask
     0xa4002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMADD_VX, // instr_name
     riscv_instr_name_t.VMADD_VX, // orig_name
     0xfc00707f, // mask
     0xa4006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMADD_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMAND_MM, // instr_name
     riscv_instr_name_t.VMAND_MM, // orig_name
     0xfe00707f, // mask
     0x66002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMAND_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMANDN_MM, // instr_name
     riscv_instr_name_t.VMANDN_MM, // orig_name
     0xfe00707f, // mask
     0x62002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMANDN_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMANDNOT_MM, // instr_name
     riscv_instr_name_t.VMANDN_MM, // orig_name
     0xfc00707f, // mask
     0x60002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMANDNOT_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMAX_VV, // instr_name
     riscv_instr_name_t.VMAX_VV, // orig_name
     0xfc00707f, // mask
     0x1c000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMAX_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMAX_VX, // instr_name
     riscv_instr_name_t.VMAX_VX, // orig_name
     0xfc00707f, // mask
     0x1c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMAX_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMAXU_VV, // instr_name
     riscv_instr_name_t.VMAXU_VV, // orig_name
     0xfc00707f, // mask
     0x18000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMAXU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMAXU_VX, // instr_name
     riscv_instr_name_t.VMAXU_VX, // orig_name
     0xfc00707f, // mask
     0x18004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMAXU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMERGE_VIM, // instr_name
     riscv_instr_name_t.VMERGE_VIM, // orig_name
     0xfe00707f, // mask
     0x5c003057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMERGE_VIM
  riscv_instr_param_s(
     riscv_instr_name_t.VMERGE_VVM, // instr_name
     riscv_instr_name_t.VMERGE_VVM, // orig_name
     0xfe00707f, // mask
     0x5c000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMERGE_VVM
  riscv_instr_param_s(
     riscv_instr_name_t.VMERGE_VXM, // instr_name
     riscv_instr_name_t.VMERGE_VXM, // orig_name
     0xfe00707f, // mask
     0x5c004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMERGE_VXM
  riscv_instr_param_s(
     riscv_instr_name_t.VMFEQ_VF, // instr_name
     riscv_instr_name_t.VMFEQ_VF, // orig_name
     0xfc00707f, // mask
     0x60005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMFEQ_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VMFEQ_VV, // instr_name
     riscv_instr_name_t.VMFEQ_VV, // orig_name
     0xfc00707f, // mask
     0x60001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMFEQ_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMFGE_VF, // instr_name
     riscv_instr_name_t.VMFGE_VF, // orig_name
     0xfc00707f, // mask
     0x7c005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMFGE_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VMFGT_VF, // instr_name
     riscv_instr_name_t.VMFGT_VF, // orig_name
     0xfc00707f, // mask
     0x74005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMFGT_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VMFLE_VF, // instr_name
     riscv_instr_name_t.VMFLE_VF, // orig_name
     0xfc00707f, // mask
     0x64005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMFLE_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VMFLE_VV, // instr_name
     riscv_instr_name_t.VMFLE_VV, // orig_name
     0xfc00707f, // mask
     0x64001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMFLE_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMFLT_VF, // instr_name
     riscv_instr_name_t.VMFLT_VF, // orig_name
     0xfc00707f, // mask
     0x6c005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMFLT_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VMFLT_VV, // instr_name
     riscv_instr_name_t.VMFLT_VV, // orig_name
     0xfc00707f, // mask
     0x6c001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMFLT_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMFNE_VF, // instr_name
     riscv_instr_name_t.VMFNE_VF, // orig_name
     0xfc00707f, // mask
     0x70005057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMFNE_VF
  riscv_instr_param_s(
     riscv_instr_name_t.VMFNE_VV, // instr_name
     riscv_instr_name_t.VMFNE_VV, // orig_name
     0xfc00707f, // mask
     0x70001057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMFNE_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMIN_VV, // instr_name
     riscv_instr_name_t.VMIN_VV, // orig_name
     0xfc00707f, // mask
     0x14000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMIN_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMIN_VX, // instr_name
     riscv_instr_name_t.VMIN_VX, // orig_name
     0xfc00707f, // mask
     0x14004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMIN_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMINU_VV, // instr_name
     riscv_instr_name_t.VMINU_VV, // orig_name
     0xfc00707f, // mask
     0x10000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMINU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMINU_VX, // instr_name
     riscv_instr_name_t.VMINU_VX, // orig_name
     0xfc00707f, // mask
     0x10004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMINU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMNAND_MM, // instr_name
     riscv_instr_name_t.VMNAND_MM, // orig_name
     0xfe00707f, // mask
     0x76002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMNAND_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMNOR_MM, // instr_name
     riscv_instr_name_t.VMNOR_MM, // orig_name
     0xfe00707f, // mask
     0x7a002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMNOR_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMOR_MM, // instr_name
     riscv_instr_name_t.VMOR_MM, // orig_name
     0xfe00707f, // mask
     0x6a002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMOR_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMORN_MM, // instr_name
     riscv_instr_name_t.VMORN_MM, // orig_name
     0xfe00707f, // mask
     0x72002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMORN_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMORNOT_MM, // instr_name
     riscv_instr_name_t.VMORN_MM, // orig_name
     0xfc00707f, // mask
     0x70002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMORNOT_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VV, // instr_name
     riscv_instr_name_t.VMSBC_VV, // orig_name
     0xfe00707f, // mask
     0x4e000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMSBC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VVM, // instr_name
     riscv_instr_name_t.VMSBC_VVM, // orig_name
     0xfe00707f, // mask
     0x4c000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMSBC_VVM
  riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VX, // instr_name
     riscv_instr_name_t.VMSBC_VX, // orig_name
     0xfe00707f, // mask
     0x4e004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMSBC_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSBC_VXM, // instr_name
     riscv_instr_name_t.VMSBC_VXM, // orig_name
     0xfe00707f, // mask
     0x4c004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMSBC_VXM
  riscv_instr_param_s(
     riscv_instr_name_t.VMSBF_M, // instr_name
     riscv_instr_name_t.VMSBF_M, // orig_name
     0xfc0ff07f, // mask
     0x5000a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSBF_M
  riscv_instr_param_s(
     riscv_instr_name_t.VMSEQ_VI, // instr_name
     riscv_instr_name_t.VMSEQ_VI, // orig_name
     0xfc00707f, // mask
     0x60003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSEQ_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMSEQ_VV, // instr_name
     riscv_instr_name_t.VMSEQ_VV, // orig_name
     0xfc00707f, // mask
     0x60000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMSEQ_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSEQ_VX, // instr_name
     riscv_instr_name_t.VMSEQ_VX, // orig_name
     0xfc00707f, // mask
     0x60004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSEQ_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSGT_VI, // instr_name
     riscv_instr_name_t.VMSGT_VI, // orig_name
     0xfc00707f, // mask
     0x7c003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSGT_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMSGT_VX, // instr_name
     riscv_instr_name_t.VMSGT_VX, // orig_name
     0xfc00707f, // mask
     0x7c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSGT_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSGTU_VI, // instr_name
     riscv_instr_name_t.VMSGTU_VI, // orig_name
     0xfc00707f, // mask
     0x78003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSGTU_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMSGTU_VX, // instr_name
     riscv_instr_name_t.VMSGTU_VX, // orig_name
     0xfc00707f, // mask
     0x78004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSGTU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSIF_M, // instr_name
     riscv_instr_name_t.VMSIF_M, // orig_name
     0xfc0ff07f, // mask
     0x5001a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSIF_M
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLE_VI, // instr_name
     riscv_instr_name_t.VMSLE_VI, // orig_name
     0xfc00707f, // mask
     0x74003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSLE_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLE_VV, // instr_name
     riscv_instr_name_t.VMSLE_VV, // orig_name
     0xfc00707f, // mask
     0x74000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMSLE_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLE_VX, // instr_name
     riscv_instr_name_t.VMSLE_VX, // orig_name
     0xfc00707f, // mask
     0x74004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSLE_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLEU_VI, // instr_name
     riscv_instr_name_t.VMSLEU_VI, // orig_name
     0xfc00707f, // mask
     0x70003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSLEU_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLEU_VV, // instr_name
     riscv_instr_name_t.VMSLEU_VV, // orig_name
     0xfc00707f, // mask
     0x70000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMSLEU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLEU_VX, // instr_name
     riscv_instr_name_t.VMSLEU_VX, // orig_name
     0xfc00707f, // mask
     0x70004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSLEU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLT_VV, // instr_name
     riscv_instr_name_t.VMSLT_VV, // orig_name
     0xfc00707f, // mask
     0x6c000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMSLT_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLT_VX, // instr_name
     riscv_instr_name_t.VMSLT_VX, // orig_name
     0xfc00707f, // mask
     0x6c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSLT_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLTU_VV, // instr_name
     riscv_instr_name_t.VMSLTU_VV, // orig_name
     0xfc00707f, // mask
     0x68000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMSLTU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSLTU_VX, // instr_name
     riscv_instr_name_t.VMSLTU_VX, // orig_name
     0xfc00707f, // mask
     0x68004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSLTU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSNE_VI, // instr_name
     riscv_instr_name_t.VMSNE_VI, // orig_name
     0xfc00707f, // mask
     0x64003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSNE_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VMSNE_VV, // instr_name
     riscv_instr_name_t.VMSNE_VV, // orig_name
     0xfc00707f, // mask
     0x64000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMSNE_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMSNE_VX, // instr_name
     riscv_instr_name_t.VMSNE_VX, // orig_name
     0xfc00707f, // mask
     0x64004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSNE_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMSOF_M, // instr_name
     riscv_instr_name_t.VMSOF_M, // orig_name
     0xfc0ff07f, // mask
     0x50012057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMSOF_M
  riscv_instr_param_s(
     riscv_instr_name_t.VMUL_VV, // instr_name
     riscv_instr_name_t.VMUL_VV, // orig_name
     0xfc00707f, // mask
     0x94002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMUL_VX, // instr_name
     riscv_instr_name_t.VMUL_VX, // orig_name
     0xfc00707f, // mask
     0x94006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMUL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMULH_VV, // instr_name
     riscv_instr_name_t.VMULH_VV, // orig_name
     0xfc00707f, // mask
     0x9c002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMULH_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMULH_VX, // instr_name
     riscv_instr_name_t.VMULH_VX, // orig_name
     0xfc00707f, // mask
     0x9c006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMULH_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMULHSU_VV, // instr_name
     riscv_instr_name_t.VMULHSU_VV, // orig_name
     0xfc00707f, // mask
     0x98002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMULHSU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMULHSU_VX, // instr_name
     riscv_instr_name_t.VMULHSU_VX, // orig_name
     0xfc00707f, // mask
     0x98006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMULHSU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMULHU_VV, // instr_name
     riscv_instr_name_t.VMULHU_VV, // orig_name
     0xfc00707f, // mask
     0x90002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VMULHU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VMULHU_VX, // instr_name
     riscv_instr_name_t.VMULHU_VX, // orig_name
     0xfc00707f, // mask
     0x90006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VMULHU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VMV1R_V, // instr_name
     riscv_instr_name_t.VMV1R_V, // orig_name
     0xfe0ff07f, // mask
     0x9e003057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMV1R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VMV2R_V, // instr_name
     riscv_instr_name_t.VMV2R_V, // orig_name
     0xfe0ff07f, // mask
     0x9e00b057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMV2R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VMV4R_V, // instr_name
     riscv_instr_name_t.VMV4R_V, // orig_name
     0xfe0ff07f, // mask
     0x9e01b057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMV4R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VMV8R_V, // instr_name
     riscv_instr_name_t.VMV8R_V, // orig_name
     0xfe0ff07f, // mask
     0x9e03b057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VMV8R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VMV_S_X, // instr_name
     riscv_instr_name_t.VMV_S_X, // orig_name
     0xfff0707f, // mask
     0x42006057, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VMV_S_X
  riscv_instr_param_s(
     riscv_instr_name_t.VMV_V_I, // instr_name
     riscv_instr_name_t.VMV_V_I, // orig_name
     0xfff0707f, // mask
     0x5e003057, // match
     [riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VMV_V_I
  riscv_instr_param_s(
     riscv_instr_name_t.VMV_V_V, // instr_name
     riscv_instr_name_t.VMV_V_V, // orig_name
     0xfff0707f, // mask
     0x5e000057, // match
     [riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b101, // _v_vars
   ), // VMV_V_V
  riscv_instr_param_s(
     riscv_instr_name_t.VMV_V_X, // instr_name
     riscv_instr_name_t.VMV_V_X, // orig_name
     0xfff0707f, // mask
     0x5e004057, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1, // _v_vars
   ), // VMV_V_X
  riscv_instr_param_s(
     riscv_instr_name_t.VMV_X_S, // instr_name
     riscv_instr_name_t.VMV_X_S, // orig_name
     0xfe0ff07f, // mask
     0x42002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b1000, // _v_vars
   ), // VMV_X_S
  riscv_instr_param_s(
     riscv_instr_name_t.VMXNOR_MM, // instr_name
     riscv_instr_name_t.VMXNOR_MM, // orig_name
     0xfe00707f, // mask
     0x7e002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMXNOR_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VMXOR_MM, // instr_name
     riscv_instr_name_t.VMXOR_MM, // orig_name
     0xfe00707f, // mask
     0x6e002057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VMXOR_MM
  riscv_instr_param_s(
     riscv_instr_name_t.VNCLIP_WI, // instr_name
     riscv_instr_name_t.VNCLIP_WI, // orig_name
     0xfc00707f, // mask
     0xbc003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNCLIP_WI
  riscv_instr_param_s(
     riscv_instr_name_t.VNCLIP_WV, // instr_name
     riscv_instr_name_t.VNCLIP_WV, // orig_name
     0xfc00707f, // mask
     0xbc000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VNCLIP_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VNCLIP_WX, // instr_name
     riscv_instr_name_t.VNCLIP_WX, // orig_name
     0xfc00707f, // mask
     0xbc004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNCLIP_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VNCLIPU_WI, // instr_name
     riscv_instr_name_t.VNCLIPU_WI, // orig_name
     0xfc00707f, // mask
     0xb8003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNCLIPU_WI
  riscv_instr_param_s(
     riscv_instr_name_t.VNCLIPU_WV, // instr_name
     riscv_instr_name_t.VNCLIPU_WV, // orig_name
     0xfc00707f, // mask
     0xb8000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VNCLIPU_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VNCLIPU_WX, // instr_name
     riscv_instr_name_t.VNCLIPU_WX, // orig_name
     0xfc00707f, // mask
     0xb8004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNCLIPU_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VNMSAC_VV, // instr_name
     riscv_instr_name_t.VNMSAC_VV, // orig_name
     0xfc00707f, // mask
     0xbc002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VNMSAC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VNMSAC_VX, // instr_name
     riscv_instr_name_t.VNMSAC_VX, // orig_name
     0xfc00707f, // mask
     0xbc006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNMSAC_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VNMSUB_VV, // instr_name
     riscv_instr_name_t.VNMSUB_VV, // orig_name
     0xfc00707f, // mask
     0xac002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VNMSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VNMSUB_VX, // instr_name
     riscv_instr_name_t.VNMSUB_VX, // orig_name
     0xfc00707f, // mask
     0xac006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNMSUB_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VNSRA_WI, // instr_name
     riscv_instr_name_t.VNSRA_WI, // orig_name
     0xfc00707f, // mask
     0xb4003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNSRA_WI
  riscv_instr_param_s(
     riscv_instr_name_t.VNSRA_WV, // instr_name
     riscv_instr_name_t.VNSRA_WV, // orig_name
     0xfc00707f, // mask
     0xb4000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VNSRA_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VNSRA_WX, // instr_name
     riscv_instr_name_t.VNSRA_WX, // orig_name
     0xfc00707f, // mask
     0xb4004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNSRA_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VNSRL_WI, // instr_name
     riscv_instr_name_t.VNSRL_WI, // orig_name
     0xfc00707f, // mask
     0xb0003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNSRL_WI
  riscv_instr_param_s(
     riscv_instr_name_t.VNSRL_WV, // instr_name
     riscv_instr_name_t.VNSRL_WV, // orig_name
     0xfc00707f, // mask
     0xb0000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VNSRL_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VNSRL_WX, // instr_name
     riscv_instr_name_t.VNSRL_WX, // orig_name
     0xfc00707f, // mask
     0xb0004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VNSRL_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VOR_VI, // instr_name
     riscv_instr_name_t.VOR_VI, // orig_name
     0xfc00707f, // mask
     0x28003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VOR_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VOR_VV, // instr_name
     riscv_instr_name_t.VOR_VV, // orig_name
     0xfc00707f, // mask
     0x28000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VOR_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VOR_VX, // instr_name
     riscv_instr_name_t.VOR_VX, // orig_name
     0xfc00707f, // mask
     0x28004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VOR_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VPOPC_M, // instr_name
     riscv_instr_name_t.VCPOP_M, // orig_name
     0xfc0ff07f, // mask
     0x40082057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b11000, // _v_vars
   ), // VPOPC_M
  riscv_instr_param_s(
     riscv_instr_name_t.VREDAND_VS, // instr_name
     riscv_instr_name_t.VREDAND_VS, // orig_name
     0xfc00707f, // mask
     0x4002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDAND_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDMAX_VS, // instr_name
     riscv_instr_name_t.VREDMAX_VS, // orig_name
     0xfc00707f, // mask
     0x1c002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDMAX_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDMAXU_VS, // instr_name
     riscv_instr_name_t.VREDMAXU_VS, // orig_name
     0xfc00707f, // mask
     0x18002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDMAXU_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDMIN_VS, // instr_name
     riscv_instr_name_t.VREDMIN_VS, // orig_name
     0xfc00707f, // mask
     0x14002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDMIN_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDMINU_VS, // instr_name
     riscv_instr_name_t.VREDMINU_VS, // orig_name
     0xfc00707f, // mask
     0x10002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDMINU_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDOR_VS, // instr_name
     riscv_instr_name_t.VREDOR_VS, // orig_name
     0xfc00707f, // mask
     0x8002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDOR_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDSUM_VS, // instr_name
     riscv_instr_name_t.VREDSUM_VS, // orig_name
     0xfc00707f, // mask
     0x2057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREDXOR_VS, // instr_name
     riscv_instr_name_t.VREDXOR_VS, // orig_name
     0xfc00707f, // mask
     0xc002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREDXOR_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VREM_VV, // instr_name
     riscv_instr_name_t.VREM_VV, // orig_name
     0xfc00707f, // mask
     0x8c002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREM_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VREM_VX, // instr_name
     riscv_instr_name_t.VREM_VX, // orig_name
     0xfc00707f, // mask
     0x8c006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VREM_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VREMU_VV, // instr_name
     riscv_instr_name_t.VREMU_VV, // orig_name
     0xfc00707f, // mask
     0x88002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VREMU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VREMU_VX, // instr_name
     riscv_instr_name_t.VREMU_VX, // orig_name
     0xfc00707f, // mask
     0x88006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VREMU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VREV8_V, // instr_name
     riscv_instr_name_t.VREV8_V, // orig_name
     0xfc0ff07f, // mask
     0x4804a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VREV8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VRGATHER_VI, // instr_name
     riscv_instr_name_t.VRGATHER_VI, // orig_name
     0xfc00707f, // mask
     0x30003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VRGATHER_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VRGATHER_VV, // instr_name
     riscv_instr_name_t.VRGATHER_VV, // orig_name
     0xfc00707f, // mask
     0x30000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VRGATHER_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VRGATHER_VX, // instr_name
     riscv_instr_name_t.VRGATHER_VX, // orig_name
     0xfc00707f, // mask
     0x30004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VRGATHER_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VRGATHEREI16_VV, // instr_name
     riscv_instr_name_t.VRGATHEREI16_VV, // orig_name
     0xfc00707f, // mask
     0x38000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VRGATHEREI16_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VROL_VV, // instr_name
     riscv_instr_name_t.VROL_VV, // orig_name
     0xfc00707f, // mask
     0x54000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VROL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VROL_VX, // instr_name
     riscv_instr_name_t.VROL_VX, // orig_name
     0xfc00707f, // mask
     0x54004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VROL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VROR_VI, // instr_name
     riscv_instr_name_t.VROR_VI, // orig_name
     0xf800707f, // mask
     0x50003057, // match
     [riscv_instr_var_t.zimm6hi, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.zimm6lo, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b110000, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VROR_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VROR_VV, // instr_name
     riscv_instr_name_t.VROR_VV, // orig_name
     0xfc00707f, // mask
     0x50000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VROR_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VROR_VX, // instr_name
     riscv_instr_name_t.VROR_VX, // orig_name
     0xfc00707f, // mask
     0x50004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VROR_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VRSUB_VI, // instr_name
     riscv_instr_name_t.VRSUB_VI, // orig_name
     0xfc00707f, // mask
     0xc003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VRSUB_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VRSUB_VX, // instr_name
     riscv_instr_name_t.VRSUB_VX, // orig_name
     0xfc00707f, // mask
     0xc004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VRSUB_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VS1R_V, // instr_name
     riscv_instr_name_t.VS1R_V, // orig_name
     0xfff0707f, // mask
     0x2800027, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10, // _v_vars
   ), // VS1R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VS2R_V, // instr_name
     riscv_instr_name_t.VS2R_V, // orig_name
     0xfff0707f, // mask
     0x22800027, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10, // _v_vars
   ), // VS2R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VS4R_V, // instr_name
     riscv_instr_name_t.VS4R_V, // orig_name
     0xfff0707f, // mask
     0x62800027, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10, // _v_vars
   ), // VS4R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VS8R_V, // instr_name
     riscv_instr_name_t.VS8R_V, // orig_name
     0xfff0707f, // mask
     0xe2800027, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10, // _v_vars
   ), // VS8R_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSADD_VI, // instr_name
     riscv_instr_name_t.VSADD_VI, // orig_name
     0xfc00707f, // mask
     0x84003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSADD_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSADD_VV, // instr_name
     riscv_instr_name_t.VSADD_VV, // orig_name
     0xfc00707f, // mask
     0x84000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSADD_VX, // instr_name
     riscv_instr_name_t.VSADD_VX, // orig_name
     0xfc00707f, // mask
     0x84004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSADD_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSADDU_VI, // instr_name
     riscv_instr_name_t.VSADDU_VI, // orig_name
     0xfc00707f, // mask
     0x80003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSADDU_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSADDU_VV, // instr_name
     riscv_instr_name_t.VSADDU_VV, // orig_name
     0xfc00707f, // mask
     0x80000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSADDU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSADDU_VX, // instr_name
     riscv_instr_name_t.VSADDU_VX, // orig_name
     0xfc00707f, // mask
     0x80004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSADDU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSBC_VVM, // instr_name
     riscv_instr_name_t.VSBC_VVM, // orig_name
     0xfe00707f, // mask
     0x48000057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VSBC_VVM
  riscv_instr_param_s(
     riscv_instr_name_t.VSBC_VXM, // instr_name
     riscv_instr_name_t.VSBC_VXM, // orig_name
     0xfe00707f, // mask
     0x48004057, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VSBC_VXM
  riscv_instr_param_s(
     riscv_instr_name_t.VSE1024_V, // instr_name
     riscv_instr_name_t.VSE1024_V, // orig_name
     0x1df0707f, // mask
     0x10007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE128_V, // instr_name
     riscv_instr_name_t.VSE128_V, // orig_name
     0x1df0707f, // mask
     0x10000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE16_V, // instr_name
     riscv_instr_name_t.VSE16_V, // orig_name
     0x1df0707f, // mask
     0x5027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE1_V, // instr_name
     riscv_instr_name_t.VSM_V, // orig_name
     0xfff0707f, // mask
     0x2b00027, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v_aliases], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10, // _v_vars
   ), // VSE1_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE256_V, // instr_name
     riscv_instr_name_t.VSE256_V, // orig_name
     0x1df0707f, // mask
     0x10005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE32_V, // instr_name
     riscv_instr_name_t.VSE32_V, // orig_name
     0x1df0707f, // mask
     0x6027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE512_V, // instr_name
     riscv_instr_name_t.VSE512_V, // orig_name
     0x1df0707f, // mask
     0x10006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE64_V, // instr_name
     riscv_instr_name_t.VSE64_V, // orig_name
     0x1df0707f, // mask
     0x7027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSE8_V, // instr_name
     riscv_instr_name_t.VSE8_V, // orig_name
     0x1df0707f, // mask
     0x27, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSETIVLI, // instr_name
     riscv_instr_name_t.VSETIVLI, // orig_name
     0xc000707f, // mask
     0xc0007057, // match
     [riscv_instr_var_t.zimm10, riscv_instr_var_t.zimm, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b1000000000000, // _imms
     0b0, // _c_imms
     0b100, // _v_imms
     0b1, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // VSETIVLI
  riscv_instr_param_s(
     riscv_instr_name_t.VSETVL, // instr_name
     riscv_instr_name_t.VSETVL, // orig_name
     0xfe00707f, // mask
     0x80007057, // match
     [riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // VSETVL
  riscv_instr_param_s(
     riscv_instr_name_t.VSETVLI, // instr_name
     riscv_instr_name_t.VSETVLI, // orig_name
     0x8000707f, // mask
     0x7057, // match
     [riscv_instr_var_t.zimm11, riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1000, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // VSETVLI
  riscv_instr_param_s(
     riscv_instr_name_t.VSEXT_VF2, // instr_name
     riscv_instr_name_t.VSEXT_VF2, // orig_name
     0xfc0ff07f, // mask
     0x4803a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSEXT_VF2
  riscv_instr_param_s(
     riscv_instr_name_t.VSEXT_VF4, // instr_name
     riscv_instr_name_t.VSEXT_VF4, // orig_name
     0xfc0ff07f, // mask
     0x4802a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSEXT_VF4
  riscv_instr_param_s(
     riscv_instr_name_t.VSEXT_VF8, // instr_name
     riscv_instr_name_t.VSEXT_VF8, // orig_name
     0xfc0ff07f, // mask
     0x4801a057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSEXT_VF8
  riscv_instr_param_s(
     riscv_instr_name_t.VSHA2CH_VV, // instr_name
     riscv_instr_name_t.VSHA2CH_VV, // orig_name
     0xfe00707f, // mask
     0xba002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvknha, riscv_extention_t.rv_zvknhb, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VSHA2CH_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSHA2CL_VV, // instr_name
     riscv_instr_name_t.VSHA2CL_VV, // orig_name
     0xfe00707f, // mask
     0xbe002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvknha, riscv_extention_t.rv_zvknhb, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VSHA2CL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSHA2MS_VV, // instr_name
     riscv_instr_name_t.VSHA2MS_VV, // orig_name
     0xfe00707f, // mask
     0xb6002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvknha, riscv_extention_t.rv_zvknhb, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VSHA2MS_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSLIDE1DOWN_VX, // instr_name
     riscv_instr_name_t.VSLIDE1DOWN_VX, // orig_name
     0xfc00707f, // mask
     0x3c006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLIDE1DOWN_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSLIDE1UP_VX, // instr_name
     riscv_instr_name_t.VSLIDE1UP_VX, // orig_name
     0xfc00707f, // mask
     0x38006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLIDE1UP_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEDOWN_VI, // instr_name
     riscv_instr_name_t.VSLIDEDOWN_VI, // orig_name
     0xfc00707f, // mask
     0x3c003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLIDEDOWN_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEDOWN_VX, // instr_name
     riscv_instr_name_t.VSLIDEDOWN_VX, // orig_name
     0xfc00707f, // mask
     0x3c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLIDEDOWN_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEUP_VI, // instr_name
     riscv_instr_name_t.VSLIDEUP_VI, // orig_name
     0xfc00707f, // mask
     0x38003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLIDEUP_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSLIDEUP_VX, // instr_name
     riscv_instr_name_t.VSLIDEUP_VX, // orig_name
     0xfc00707f, // mask
     0x38004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLIDEUP_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSLL_VI, // instr_name
     riscv_instr_name_t.VSLL_VI, // orig_name
     0xfc00707f, // mask
     0x94003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLL_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSLL_VV, // instr_name
     riscv_instr_name_t.VSLL_VV, // orig_name
     0xfc00707f, // mask
     0x94000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSLL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSLL_VX, // instr_name
     riscv_instr_name_t.VSLL_VX, // orig_name
     0xfc00707f, // mask
     0x94004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSLL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSM3C_VI, // instr_name
     riscv_instr_name_t.VSM3C_VI, // orig_name
     0xfe00707f, // mask
     0xae002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.zimm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b10, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VSM3C_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSM3ME_VV, // instr_name
     riscv_instr_name_t.VSM3ME_VV, // orig_name
     0xfe00707f, // mask
     0x82002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1101, // _v_vars
   ), // VSM3ME_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSM4K_VI, // instr_name
     riscv_instr_name_t.VSM4K_VI, // orig_name
     0xfe00707f, // mask
     0x86002077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.zimm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b10, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VSM4K_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSM4R_VS, // instr_name
     riscv_instr_name_t.VSM4R_VS, // orig_name
     0xfe0ff07f, // mask
     0xa6082077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VSM4R_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VSM4R_VV, // instr_name
     riscv_instr_name_t.VSM4R_VV, // orig_name
     0xfe0ff07f, // mask
     0xa2082077, // match
     [riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b1001, // _v_vars
   ), // VSM4R_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSM_V, // instr_name
     riscv_instr_name_t.VSM_V, // orig_name
     0xfff0707f, // mask
     0x2b00027, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10, // _v_vars
   ), // VSM_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSMUL_VV, // instr_name
     riscv_instr_name_t.VSMUL_VV, // orig_name
     0xfc00707f, // mask
     0x9c000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSMUL_VX, // instr_name
     riscv_instr_name_t.VSMUL_VX, // orig_name
     0xfc00707f, // mask
     0x9c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSMUL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI1024_V, // instr_name
     riscv_instr_name_t.VSOXEI1024_V, // orig_name
     0x1c00707f, // mask
     0x1c007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI128_V, // instr_name
     riscv_instr_name_t.VSOXEI128_V, // orig_name
     0x1c00707f, // mask
     0x1c000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI16_V, // instr_name
     riscv_instr_name_t.VSOXEI16_V, // orig_name
     0x1c00707f, // mask
     0xc005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI256_V, // instr_name
     riscv_instr_name_t.VSOXEI256_V, // orig_name
     0x1c00707f, // mask
     0x1c005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI32_V, // instr_name
     riscv_instr_name_t.VSOXEI32_V, // orig_name
     0x1c00707f, // mask
     0xc006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI512_V, // instr_name
     riscv_instr_name_t.VSOXEI512_V, // orig_name
     0x1c00707f, // mask
     0x1c006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI64_V, // instr_name
     riscv_instr_name_t.VSOXEI64_V, // orig_name
     0x1c00707f, // mask
     0xc007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSOXEI8_V, // instr_name
     riscv_instr_name_t.VSOXEI8_V, // orig_name
     0x1c00707f, // mask
     0xc000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSOXEI8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSRA_VI, // instr_name
     riscv_instr_name_t.VSRA_VI, // orig_name
     0xfc00707f, // mask
     0xa4003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSRA_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSRA_VV, // instr_name
     riscv_instr_name_t.VSRA_VV, // orig_name
     0xfc00707f, // mask
     0xa4000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSRA_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSRA_VX, // instr_name
     riscv_instr_name_t.VSRA_VX, // orig_name
     0xfc00707f, // mask
     0xa4004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSRA_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSRL_VI, // instr_name
     riscv_instr_name_t.VSRL_VI, // orig_name
     0xfc00707f, // mask
     0xa0003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSRL_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSRL_VV, // instr_name
     riscv_instr_name_t.VSRL_VV, // orig_name
     0xfc00707f, // mask
     0xa0000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSRL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSRL_VX, // instr_name
     riscv_instr_name_t.VSRL_VX, // orig_name
     0xfc00707f, // mask
     0xa0004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSRL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE1024_V, // instr_name
     riscv_instr_name_t.VSSE1024_V, // orig_name
     0x1c00707f, // mask
     0x18007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE128_V, // instr_name
     riscv_instr_name_t.VSSE128_V, // orig_name
     0x1c00707f, // mask
     0x18000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE16_V, // instr_name
     riscv_instr_name_t.VSSE16_V, // orig_name
     0x1c00707f, // mask
     0x8005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE256_V, // instr_name
     riscv_instr_name_t.VSSE256_V, // orig_name
     0x1c00707f, // mask
     0x18005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE32_V, // instr_name
     riscv_instr_name_t.VSSE32_V, // orig_name
     0x1c00707f, // mask
     0x8006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE512_V, // instr_name
     riscv_instr_name_t.VSSE512_V, // orig_name
     0x1c00707f, // mask
     0x18006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE64_V, // instr_name
     riscv_instr_name_t.VSSE64_V, // orig_name
     0x1c00707f, // mask
     0x8007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSE8_V, // instr_name
     riscv_instr_name_t.VSSE8_V, // orig_name
     0x1c00707f, // mask
     0x8000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.rs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1100, // _vars
     0b0, // _c_vars
     0b10010010, // _v_vars
   ), // VSSE8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSSRA_VI, // instr_name
     riscv_instr_name_t.VSSRA_VI, // orig_name
     0xfc00707f, // mask
     0xac003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSSRA_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSSRA_VV, // instr_name
     riscv_instr_name_t.VSSRA_VV, // orig_name
     0xfc00707f, // mask
     0xac000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSSRA_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSSRA_VX, // instr_name
     riscv_instr_name_t.VSSRA_VX, // orig_name
     0xfc00707f, // mask
     0xac004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSSRA_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSSRL_VI, // instr_name
     riscv_instr_name_t.VSSRL_VI, // orig_name
     0xfc00707f, // mask
     0xa8003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSSRL_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VSSRL_VV, // instr_name
     riscv_instr_name_t.VSSRL_VV, // orig_name
     0xfc00707f, // mask
     0xa8000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSSRL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSSRL_VX, // instr_name
     riscv_instr_name_t.VSSRL_VX, // orig_name
     0xfc00707f, // mask
     0xa8004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSSRL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSSUB_VV, // instr_name
     riscv_instr_name_t.VSSUB_VV, // orig_name
     0xfc00707f, // mask
     0x8c000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSSUB_VX, // instr_name
     riscv_instr_name_t.VSSUB_VX, // orig_name
     0xfc00707f, // mask
     0x8c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSSUB_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSSUBU_VV, // instr_name
     riscv_instr_name_t.VSSUBU_VV, // orig_name
     0xfc00707f, // mask
     0x88000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSSUBU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSSUBU_VX, // instr_name
     riscv_instr_name_t.VSSUBU_VX, // orig_name
     0xfc00707f, // mask
     0x88004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSSUBU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSUB_VV, // instr_name
     riscv_instr_name_t.VSUB_VV, // orig_name
     0xfc00707f, // mask
     0x8000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VSUB_VX, // instr_name
     riscv_instr_name_t.VSUB_VX, // orig_name
     0xfc00707f, // mask
     0x8004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VSUB_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI1024_V, // instr_name
     riscv_instr_name_t.VSUXEI1024_V, // orig_name
     0x1c00707f, // mask
     0x14007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI1024_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI128_V, // instr_name
     riscv_instr_name_t.VSUXEI128_V, // orig_name
     0x1c00707f, // mask
     0x14000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI128_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI16_V, // instr_name
     riscv_instr_name_t.VSUXEI16_V, // orig_name
     0x1c00707f, // mask
     0x4005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI16_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI256_V, // instr_name
     riscv_instr_name_t.VSUXEI256_V, // orig_name
     0x1c00707f, // mask
     0x14005027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI256_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI32_V, // instr_name
     riscv_instr_name_t.VSUXEI32_V, // orig_name
     0x1c00707f, // mask
     0x4006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI32_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI512_V, // instr_name
     riscv_instr_name_t.VSUXEI512_V, // orig_name
     0x1c00707f, // mask
     0x14006027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI512_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI64_V, // instr_name
     riscv_instr_name_t.VSUXEI64_V, // orig_name
     0x1c00707f, // mask
     0x4007027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI64_V
  riscv_instr_param_s(
     riscv_instr_name_t.VSUXEI8_V, // instr_name
     riscv_instr_name_t.VSUXEI8_V, // orig_name
     0x1c00707f, // mask
     0x4000027, // match
     [riscv_instr_var_t.nf, riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vs3], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b10011010, // _v_vars
   ), // VSUXEI8_V
  riscv_instr_param_s(
     riscv_instr_name_t.VWADD_VV, // instr_name
     riscv_instr_name_t.VWADD_VV, // orig_name
     0xfc00707f, // mask
     0xc4002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWADD_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWADD_VX, // instr_name
     riscv_instr_name_t.VWADD_VX, // orig_name
     0xfc00707f, // mask
     0xc4006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWADD_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWADD_WV, // instr_name
     riscv_instr_name_t.VWADD_WV, // orig_name
     0xfc00707f, // mask
     0xd4002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWADD_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VWADD_WX, // instr_name
     riscv_instr_name_t.VWADD_WX, // orig_name
     0xfc00707f, // mask
     0xd4006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWADD_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_VV, // instr_name
     riscv_instr_name_t.VWADDU_VV, // orig_name
     0xfc00707f, // mask
     0xc0002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWADDU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_VX, // instr_name
     riscv_instr_name_t.VWADDU_VX, // orig_name
     0xfc00707f, // mask
     0xc0006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWADDU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_WV, // instr_name
     riscv_instr_name_t.VWADDU_WV, // orig_name
     0xfc00707f, // mask
     0xd0002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWADDU_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VWADDU_WX, // instr_name
     riscv_instr_name_t.VWADDU_WX, // orig_name
     0xfc00707f, // mask
     0xd0006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWADDU_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACC_VV, // instr_name
     riscv_instr_name_t.VWMACC_VV, // orig_name
     0xfc00707f, // mask
     0xf4002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWMACC_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACC_VX, // instr_name
     riscv_instr_name_t.VWMACC_VX, // orig_name
     0xfc00707f, // mask
     0xf4006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMACC_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACCSU_VV, // instr_name
     riscv_instr_name_t.VWMACCSU_VV, // orig_name
     0xfc00707f, // mask
     0xfc002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWMACCSU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACCSU_VX, // instr_name
     riscv_instr_name_t.VWMACCSU_VX, // orig_name
     0xfc00707f, // mask
     0xfc006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMACCSU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACCU_VV, // instr_name
     riscv_instr_name_t.VWMACCU_VV, // orig_name
     0xfc00707f, // mask
     0xf0002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWMACCU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACCU_VX, // instr_name
     riscv_instr_name_t.VWMACCU_VX, // orig_name
     0xfc00707f, // mask
     0xf0006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMACCU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMACCUS_VX, // instr_name
     riscv_instr_name_t.VWMACCUS_VX, // orig_name
     0xfc00707f, // mask
     0xf8006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMACCUS_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMUL_VV, // instr_name
     riscv_instr_name_t.VWMUL_VV, // orig_name
     0xfc00707f, // mask
     0xec002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWMUL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWMUL_VX, // instr_name
     riscv_instr_name_t.VWMUL_VX, // orig_name
     0xfc00707f, // mask
     0xec006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMUL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMULSU_VV, // instr_name
     riscv_instr_name_t.VWMULSU_VV, // orig_name
     0xfc00707f, // mask
     0xe8002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWMULSU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWMULSU_VX, // instr_name
     riscv_instr_name_t.VWMULSU_VX, // orig_name
     0xfc00707f, // mask
     0xe8006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMULSU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWMULU_VV, // instr_name
     riscv_instr_name_t.VWMULU_VV, // orig_name
     0xfc00707f, // mask
     0xe0002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWMULU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWMULU_VX, // instr_name
     riscv_instr_name_t.VWMULU_VX, // orig_name
     0xfc00707f, // mask
     0xe0006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWMULU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWREDSUM_VS, // instr_name
     riscv_instr_name_t.VWREDSUM_VS, // orig_name
     0xfc00707f, // mask
     0xc4000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWREDSUM_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VWREDSUMU_VS, // instr_name
     riscv_instr_name_t.VWREDSUMU_VS, // orig_name
     0xfc00707f, // mask
     0xc0000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWREDSUMU_VS
  riscv_instr_param_s(
     riscv_instr_name_t.VWSLL_VI, // instr_name
     riscv_instr_name_t.VWSLL_VI, // orig_name
     0xfc00707f, // mask
     0xd4003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.zimm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b10, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWSLL_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VWSLL_VV, // instr_name
     riscv_instr_name_t.VWSLL_VV, // orig_name
     0xfc00707f, // mask
     0xd4000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWSLL_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWSLL_VX, // instr_name
     riscv_instr_name_t.VWSLL_VX, // orig_name
     0xfc00707f, // mask
     0xd4004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_zvks, riscv_extention_t.rv_zvkn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWSLL_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_VV, // instr_name
     riscv_instr_name_t.VWSUB_VV, // orig_name
     0xfc00707f, // mask
     0xcc002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWSUB_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_VX, // instr_name
     riscv_instr_name_t.VWSUB_VX, // orig_name
     0xfc00707f, // mask
     0xcc006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWSUB_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_WV, // instr_name
     riscv_instr_name_t.VWSUB_WV, // orig_name
     0xfc00707f, // mask
     0xdc002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWSUB_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUB_WX, // instr_name
     riscv_instr_name_t.VWSUB_WX, // orig_name
     0xfc00707f, // mask
     0xdc006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWSUB_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_VV, // instr_name
     riscv_instr_name_t.VWSUBU_VV, // orig_name
     0xfc00707f, // mask
     0xc8002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWSUBU_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_VX, // instr_name
     riscv_instr_name_t.VWSUBU_VX, // orig_name
     0xfc00707f, // mask
     0xc8006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWSUBU_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_WV, // instr_name
     riscv_instr_name_t.VWSUBU_WV, // orig_name
     0xfc00707f, // mask
     0xd8002057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VWSUBU_WV
  riscv_instr_param_s(
     riscv_instr_name_t.VWSUBU_WX, // instr_name
     riscv_instr_name_t.VWSUBU_WX, // orig_name
     0xfc00707f, // mask
     0xd8006057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VWSUBU_WX
  riscv_instr_param_s(
     riscv_instr_name_t.VXOR_VI, // instr_name
     riscv_instr_name_t.VXOR_VI, // orig_name
     0xfc00707f, // mask
     0x2c003057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.simm5, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b1, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VXOR_VI
  riscv_instr_param_s(
     riscv_instr_name_t.VXOR_VV, // instr_name
     riscv_instr_name_t.VXOR_VV, // orig_name
     0xfc00707f, // mask
     0x2c000057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11101, // _v_vars
   ), // VXOR_VV
  riscv_instr_param_s(
     riscv_instr_name_t.VXOR_VX, // instr_name
     riscv_instr_name_t.VXOR_VX, // orig_name
     0xfc00707f, // mask
     0x2c004057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.rs1, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b100, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VXOR_VX
  riscv_instr_param_s(
     riscv_instr_name_t.VZEXT_VF2, // instr_name
     riscv_instr_name_t.VZEXT_VF2, // orig_name
     0xfc0ff07f, // mask
     0x48032057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VZEXT_VF2
  riscv_instr_param_s(
     riscv_instr_name_t.VZEXT_VF4, // instr_name
     riscv_instr_name_t.VZEXT_VF4, // orig_name
     0xfc0ff07f, // mask
     0x48022057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VZEXT_VF4
  riscv_instr_param_s(
     riscv_instr_name_t.VZEXT_VF8, // instr_name
     riscv_instr_name_t.VZEXT_VF8, // orig_name
     0xfc0ff07f, // mask
     0x48012057, // match
     [riscv_instr_var_t.vm, riscv_instr_var_t.vs2, riscv_instr_var_t.vd], // variables
     [riscv_extention_t.rv_v], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b11001, // _v_vars
   ), // VZEXT_VF8
  riscv_instr_param_s(
     riscv_instr_name_t.WFI, // instr_name
     riscv_instr_name_t.WFI, // orig_name
     0xffffffff, // mask
     0x10500073, // match
     [], // variables
     [riscv_extention_t.rv_system], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b0, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // WFI
  riscv_instr_param_s(
     riscv_instr_name_t.XNOR, // instr_name
     riscv_instr_name_t.XNOR, // orig_name
     0xfe00707f, // mask
     0x40004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbb, riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XNOR
  riscv_instr_param_s(
     riscv_instr_name_t.XOR, // instr_name
     riscv_instr_name_t.XOR, // orig_name
     0xfe00707f, // mask
     0x4033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_i], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XOR
  riscv_instr_param_s(
     riscv_instr_name_t.XORI, // instr_name
     riscv_instr_name_t.XORI, // orig_name
     0x707f, // mask
     0x4013, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.imm12], // variables
     [riscv_extention_t.rv_i], // extentions
     0b100, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XORI
  riscv_instr_param_s(
     riscv_instr_name_t.XPERM16, // instr_name
     riscv_instr_name_t.XPERM16, // orig_name
     0xfe00707f, // mask
     0x28006033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XPERM16
  riscv_instr_param_s(
     riscv_instr_name_t.XPERM32, // instr_name
     riscv_instr_name_t.XPERM32, // orig_name
     0xfe00707f, // mask
     0x28000033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv64_zbp], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XPERM32
  riscv_instr_param_s(
     riscv_instr_name_t.XPERM4, // instr_name
     riscv_instr_name_t.XPERM4, // orig_name
     0xfe00707f, // mask
     0x28002033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XPERM4
  riscv_instr_param_s(
     riscv_instr_name_t.XPERM8, // instr_name
     riscv_instr_name_t.XPERM8, // orig_name
     0xfe00707f, // mask
     0x28004033, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1, riscv_instr_var_t.rs2], // variables
     [riscv_extention_t.rv_zbp, ], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b1101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // XPERM8
  riscv_instr_param_s(
     riscv_instr_name_t.ZEXT_H, // instr_name
     riscv_instr_name_t.PACKW, // orig_name
     0xfff0707f, // mask
     0x800403b, // match
     [riscv_instr_var_t.rd, riscv_instr_var_t.rs1], // variables
     [riscv_extention_t.rv64_zbb], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ZEXT_H
  riscv_instr_param_s(
     riscv_instr_name_t.ZUNPKD810, // instr_name
     riscv_instr_name_t.ZUNPKD810, // orig_name
     0xfff0707f, // mask
     0xacc00077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ZUNPKD810
  riscv_instr_param_s(
     riscv_instr_name_t.ZUNPKD820, // instr_name
     riscv_instr_name_t.ZUNPKD820, // orig_name
     0xfff0707f, // mask
     0xacd00077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ZUNPKD820
  riscv_instr_param_s(
     riscv_instr_name_t.ZUNPKD830, // instr_name
     riscv_instr_name_t.ZUNPKD830, // orig_name
     0xfff0707f, // mask
     0xace00077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ZUNPKD830
  riscv_instr_param_s(
     riscv_instr_name_t.ZUNPKD831, // instr_name
     riscv_instr_name_t.ZUNPKD831, // orig_name
     0xfff0707f, // mask
     0xacf00077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ZUNPKD831
  riscv_instr_param_s(
     riscv_instr_name_t.ZUNPKD832, // instr_name
     riscv_instr_name_t.ZUNPKD832, // orig_name
     0xfff0707f, // mask
     0xad700077, // match
     [riscv_instr_var_t.rs1, riscv_instr_var_t.rd], // variables
     [riscv_extention_t.rv_zpn], // extentions
     0b0, // _imms
     0b0, // _c_imms
     0b0, // _v_imms
     0b101, // _vars
     0b0, // _c_vars
     0b0, // _v_vars
   ), // ZUNPKD832
];
