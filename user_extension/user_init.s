# Add custom initialization assembly code here
# This file will be included at the very beginning of the program
.equ PLIC_BASE, 0xF8000000
.equ PLIC_CLAIM_0, 0x200004

.equ PLIC_CLAIM_1, 0x201004
.equ MTIMER_CMP_0, 0xE0004000

.equ START_PA, 0x00000000


# Set up RW page for the PLIC to not fail load and store in S-mode
# otherwise an interrupt can not be cleared.
