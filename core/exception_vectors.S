/* Xtensa Exception (ie interrupt) Vectors & low-level handler code
 *
 * Core exception handler code is placed in the .vecbase section, which gets
 * picked up specially in the linker script and placed at beginning of IRAM.
 *
 * The actual VecBase symbol should be the first thing in .vecbase (this is not
 * strictly important as it gets set by symbol lookup not by hardcoded address,
 * but having it at 0x40100000 means that the exception vectors have memorable
 * offsets, which match the default Boot ROM vector offsets. So convenient for
 * human understanding.
 *
 * Part of esp-open-rtos
 * Original vector contents Copyright (C) 2014-2015 Espressif Systems
 * Additions Copyright (C) Superhouse Automation Pty Ltd and Angus Gratton
 * BSD Licensed as described in the file LICENSE
 */

#include "led_debug.s"

/* Some UserException causes, see table Table 4–64 in ISA reference */

#define CAUSE_SYSCALL 1
#define CAUSE_LOADSTORE 3
#define CAUSE_LVL1INT 4

        .section .bss

/* Stack space for NMI handler

   NMI handler stack high water mark measured at 0x134 bytes. Any use
   of the NMI timer callback will add stack overhead as well.

   The NMI handler does a basic check for stack overflow
*/
        .balign 16
NMIHandlerStack:
        .skip 0x200
.NMIHandlerStackTop:

        .balign 16
LoadStoreErrorHandlerStack:
        .word   0       # a0
        .word   0       # (unused)
        .word   0       # a2
        .word   0       # a3
        .word   0       # a4
        .word   0       # a5
        .word   0       # a6

        .balign 4
        .global debug_saved_ctx
debug_saved_ctx:
        .word   0       # a0
        .word   0       # a1
        .word   0       # a2
        .word   0       # a3
        .word   0       # a4

/***************************** Exception Vectors *****************************/

        .section .vecbase.text, "x"

/* Note: Exception vectors must be aligned on a 256-byte (0x100) boundary or
 * they will not function properly.  (This is taken care of in the linker
 * script by ensuring .vecbase.text is aligned properly, and putting VecBase
 * right at the beginning of .vecbase.text) */
        .org    0
VecBase:
        .global VecBase
        /* IMPORTANT: exception vector literals will go here, but we
         * can't have more than 4 otherwise we push DebugExceptionVector past
         * offset 0x10 relative to VecBase. There should be ways to avoid this,
         * and also keep the VecBase offsets easy to read, but this works for
         * now. */
        .literal_position

        .org    VecBase + 0x10
DebugExceptionVector:
        .type   DebugExceptionVector, @function
        j       DebugExceptionHandler

        .org    VecBase + 0x20
NMIExceptionVector:
        .type   NMIExceptionVector, @function
        j   NMIExceptionHandler

        .org    VecBase + 0x30
KernelExceptionVector:
        .type   KernelExceptionVector, @function

        break   1, 0
        mov     a2, a1
        movi    a3, 0
        call0   fatal_exception_handler
        rfe

        .org    VecBase + 0x50
UserExceptionVector:
        .type   UserExceptionVector, @function

        wsr     a1, excsave1
        rsr     a1, exccause
        beqi    a1, CAUSE_LOADSTORE, LoadStoreErrorHandler
        j       UserExceptionHandler

        .org    VecBase + 0x70
DoubleExceptionVector:
        .type   DoubleExceptionVector, @function

        break   1, 4
        mov     a2, a1
        movi    a3, 0
        call0   fatal_exception_handler

/* Reset vector at offset 0x80 is unused, as vecbase gets reset to mask ROM
 * vectors on chip reset. */

/*************************** LoadStoreError Handler **************************/

        .section .vecbase.text, "x"

/* Xtensa "Load/Store Exception" handler:
 * Completes L8/L16 load instructions from Instruction address space, for which
 * the architecture only supports 32-bit reads.
 *
 * Called from UserExceptionVector if EXCCAUSE is LoadStoreErrorCause
 *
 * Accesses can be assumed aligned here as unaligned accesses would have generate
 * an unaligned exception (9) before getting here.
 *
 * Fast path (no branches) is for L8UI from low registers 0, 2-5, and the fast
 * store path is S8I for low registers 0, 2-7.
 */
        .literal_position

        .balign 4
LoadStoreErrorHandler:
        .type   LoadStoreErrorHandler, @function

        /* Registers are saved in the address corresponding to their register
         * number times 4.  This allows a quick and easy mapping later on when
         * needing to store the value to a particular register number. */
        movi    sp, LoadStoreErrorHandlerStack
        s32i    a0, sp, 0
        s32i    a2, sp, 0x08
        s32i    a3, sp, 0x0c
        s32i    a4, sp, 0x10
        rsr     a0, sar         # Save SAR in a0 to restore later

        # led_on  a2, a3

        /* Examine the opcode which generated the exception */
        /* Note: Instructions are in this order to avoid pipeline stalls. */
        rsr     a2, epc1
        movi    a3, ~3
        ssa8l   a2              # sar is now correct shift for aligned read
        and     a2, a2, a3      # a2 now 4-byte aligned address of instruction
        l32i    a4, a2, 0
        l32i    a2, a2, 4
        movi    a3, 0x00700F    # opcode mask for l8ui/l16si/l16ui
        src     a2, a2, a4      # a2 now instruction that failed
        and     a3, a2, a3      # a3 is masked instruction
        bnei    a3, 0x000002, .LSE_check_l16

        /* Note: At this point, opcode could technically be one of two things:
         *   xx0xx2 (L8UI)
         *   xx8xx2 (Reserved (invalid) opcode)
         * It is assumed that we'll never get to this point from an illegal
         * opcode, so we don't bother to check for that case and presume this
         * is always an L8UI. */

        movi    a4, ~3
        rsr     a3, excvaddr    # read faulting address
        and     a4, a3, a4      # a4 now word aligned read address

        l32i    a4, a4, 0       # perform the actual read
        ssa8l   a3              # sar is now shift to extract a3's byte
        srl     a3, a4          # shift right correct distance
        extui   a4, a3, 0, 8    # mask off bits we need for an l8

.LSE_post_fetch:
        /* We jump back here after either the L8UI or the L16*I routines do the
         * necessary work to read the value from memory.
         * At this point, a2 holds the faulting instruction and a4 holds the
         * correctly read value.

         * Restore original SAR value (saved in a0) and update EPC so we'll
         * return back to the instruction following the one we just emulated */

        /* Note: Instructions are in this order to avoid pipeline stalls */
        rsr     a3, epc1
        wsr     a0, sar
        addi    a3, a3, 0x3
        wsr     a3, epc1

        # led_off  a0, a3

        /* Stupid opcode tricks: The jumptable we use later on needs 16 bytes
         * per entry (so we can avoid a second jump by just doing a RFE inside
         * each entry).  Unfortunately, however, Xtensa doesn't have an addx16
         * operation to make that easy for us.  Luckily, all of the faulting
         * opcodes we're processing are guaranteed to have bit 3 be zero, which
         * means if we just shift the register bits of the opcode down by 3
         * instead of 4, we will get the register number multiplied by 2.  This
         * combined with an addx8 will give us an effective addx16 without
         * needing any extra shift operations. */
        extui   a2, a2, 3, 5    # a2 is now destination register 0-15 times 2

        bgei    a2, 10, .LSE_assign_reg     # a5..a15 use jumptable
        beqi    a2, 2, .LSE_assign_a1       # a1 uses a special routine

        /* We're storing into a0 or a2..a4, which are all saved in our "stack"
         * area.  Calculate the correct address and stick the value in there,
         * then just do our normal restore and RFE (no jumps required, which
         * actually makes a0..a4 substantially faster). */
        addx2   a2, a2, sp
        s32i    a4, a2, 0

        /* Restore all regs and return */
        l32i    a0, sp, 0
        l32i    a2, sp, 0x08
        l32i    a3, sp, 0x0c
        l32i    a4, sp, 0x10
        rsr     a1, excsave1    # restore a1 saved by UserExceptionVector
        rfe

        .balign 4
.LSE_check_l16:
        /* At this point, a2 contains the opcode, a3 is masked opcode */
        movi    a4, 0x001002    # l16si or l16ui opcode after masking
        bne     a3, a4, .LSE_check_s8i

        /* Note: At this point, the opcode could be one of two things:
         *   xx1xx2 (L16UI)
         *   xx9xx2 (L16SI)
         * Both of these we can handle. */

        movi    a4, ~3
        rsr     a3, excvaddr    # read faulting address
        and     a4, a3, a4      # a4 now word aligned read address

        l32i    a4, a4, 0       # perform the actual read
        ssa8l   a3              # sar is now shift to extract a3's bytes
        srl     a3, a4          # shift right correct distance
        extui   a4, a3, 0, 16   # mask off bits we need for an l16

        bbci    a2, 15, .LSE_post_fetch  # Not a signed op
        bbci    a4, 15, .LSE_post_fetch  # Value does not need sign-extension

        movi    a3, 0xFFFF0000
        or      a4, a3, a4      # set 32-bit sign bits
        j       .LSE_post_fetch

        .balign 4
.LSE_check_s8i:
        /* At this point, a2 contains the opcode */
        movi    a3, 0x00F00F    # opcode mask for s8i/s16i
        s32i    a5, sp, 0x14    # Save a5, needed for store op
        and     a3, a2, a3      # a3 is masked instruction
        movi    a4, 0x004002    # s8i opcode after masking
        s32i    a6, sp, 0x18    # Save a6, needed for store op
        bne     a3, a4, .LSE_check_s16i

        /* Note: At this point, the opcode is s8i */
        movi    a5, 0x000000ff  # source mask
.LSE_store:
        /* We jump here for either S8I or S16I to get the address and load
         * and mask the current contents. */
        movi    a4, ~3
        rsr     a3, excvaddr    # read faulting address
        and     a4, a3, a4      # a4 now word aligned address
        ssa8b   a3              # sar is now left shift amount
        sll     a3, a5
        movi    a6, 0xffffffff
        xor     a6, a6, a3      # a6 now has the word mask
        l32i    a3, a4, 0       # read the current word
        and     a3, a3, a6      # a3 now has the masked word
        extui   a2, a2, 4, 4    # a2 is now source register 0-15

        /* At this point, a2 contains the source register 0-15, a3 contains the
         * masked memory contents, a4 contains the address, a5 contains the source
         * mask, and sar contains the left shift amount. */
        bgei    a2, 7, .LSE_load_reg        # a7..a15 use jumptable
        beqi    a2, 1, .LSE_load_a1         # a1 uses a special routine

        /* We're loading from a0 or a2..a6, which are all saved in our "stack"
         * area.  Calculate the correct address and load the value there. */
        addx4   a2, a2, sp
        l32i    a2, a2, 0

.LSE_store_apply:
        and     a2, a2, a5         # mask the source
        sll     a2, a2             # shift the source
        or      a3, a3, a2         # combine with the masked memory contents
        s32i    a3, a4, 0          # write back to memory

        /* Note: Instructions are in this order to avoid pipeline stalls */
        rsr     a3, epc1
        wsr     a0, sar
        addi    a3, a3, 0x3
        wsr     a3, epc1

        # led_off  a2, a3

        /* Restore all regs and return */
        l32i    a0, sp, 0
        l32i    a2, sp, 0x08
        l32i    a3, sp, 0x0c
        l32i    a4, sp, 0x10
        l32i    a5, sp, 0x14
        l32i    a6, sp, 0x18
        rsr     a1, excsave1    # restore a1 saved by UserExceptionVector
        rfe

        .balign 4
.LSE_check_s16i:
        /* At this point, a2 contains the opcode */
        movi    a4, 0x005002    # s16i opcode after masking
        bne     a3, a4, .LSE_wrong_opcode
        /* Note: At this point, the opcode is s16i */
        movi    a5, 0x0000ffff  # source mask
        j       .LSE_store

        .balign 4
.LSE_assign_reg:
        /* At this point, a2 contains the register number times 2, a4 is the
         * read value. */

        /* Calculate the jumptable address, and restore all regs except a2 and
         * a4 so we have less to do after jumping. */
        /* Note: Instructions are in this order to avoid pipeline stalls. */
        movi    a3, .LSE_jumptable_base
        l32i    a0, sp, 0
        addx8   a2, a2, a3      # a2 is now the address to jump to
        l32i    a3, sp, 0x0c

        jx      a2

        .balign 4
.LSE_jumptable:
        /* The first 5 entries (80 bytes) of this table are unused (registers
         * a0..a4 are handled separately above).  Rather than have a whole bunch
         * of wasted space, we just pretend that the table starts 80 bytes
         * earlier in memory. */
        .set    .LSE_jumptable_base, .LSE_jumptable - (16 * 5)

        .org    .LSE_jumptable_base + (16 * 5)
        mov     a5, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 6)
        mov     a6, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 7)
        mov     a7, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 8)
        mov     a8, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 9)
        mov     a9, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 10)
        mov     a10, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 11)
        mov     a11, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 12)
        mov     a12, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 13)
        mov     a13, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 14)
        mov     a14, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .org    .LSE_jumptable_base + (16 * 15)
        mov     a15, a4
        l32i    a2, sp, 0x08
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .balign 4
.LSE_assign_a1:
        /* a1 is saved in excsave1, so just update that with the value, */
        wsr     a4, excsave1
        /* Then restore all regs and return */
        l32i    a0, sp, 0
        l32i    a2, sp, 0x08
        l32i    a3, sp, 0x0c
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        rfe

        .balign 4
.LSE_load_reg:
        /* Calculate the jumptable address. */
        movi    a6, .LSE_store_jumptable_base
        addx8   a2, a2, a6      # a2 is now the address to jump to
        jx      a2

        .balign 4
.LSE_store_jumptable:
        /* The first 7 entries (56 bytes) of this table are unused (registers
         * a0..a6 are handled separately above).  Rather than have a whole bunch
         * of wasted space, we just pretend that the table starts 56 bytes
         * earlier in memory. */
        .set    .LSE_store_jumptable_base, .LSE_store_jumptable - (8 * 7)

        mov     a2, a7
        j       .LSE_store_apply
        .balign 4
        mov     a2, a8
        j       .LSE_store_apply
        .balign 4
        mov     a2, a9
        j       .LSE_store_apply
        .balign 4
        mov     a2, a10
        j       .LSE_store_apply
        .balign 4
        mov     a2, a11
        j       .LSE_store_apply
        .balign 4
        mov     a2, a12
        j       .LSE_store_apply
        .balign 4
        mov     a2, a13
        j       .LSE_store_apply
        .balign 4
        mov     a2, a14
        j       .LSE_store_apply
        .balign 4
        mov     a2, a15
        j       .LSE_store_apply
        .balign 4

.LSE_load_a1:
        /* a1 is saved in excsave1, so just read the value, */
        rsr     a2, excsave1
        j       .LSE_store_apply

        .balign 4
.LSE_wrong_opcode:
        /* If we got here it's not an opcode we can try to fix, so bomb out.
         * Restore registers so any dump the fatal exception routine produces
         * will have correct values */
        wsr     a0, sar
        l32i    a0, sp, 0
        /*l32i    a2, sp, 0x08*/
        l32i    a3, sp, 0x0c
        l32i    a4, sp, 0x10
        rsr     a1, excsave1
        mov     a2, a1
        movi    a3, 0
        call0   fatal_exception_handler

/*************************** Debug exception handler *************************/

        .section .vecbase.text, "x"
        .literal_position
        .balign 4

DebugExceptionHandler:
        wsr     a0, excsave2
        // Save context in case an actual debugger is running
        movi    a0, debug_saved_ctx
        // Save a1 - a4 as we are going to use them later
        s32i    a1, a0, 0x04
        s32i    a2, a0, 0x08
        s32i    a3, a0, 0x0C
        s32i    a4, a0, 0x10
        // Save a0
        rsr     a4, excsave2
        s32i    a4, a0, 0x00
        // Default handler is fatal_exception_handler(uint32_t * sp, bool registers_saved_on_stack)
        // sp
        mov     a2, a1
        // registers_saved_on_stack
        movi    a3, 0
        call0   debug_exception_handler
        rfi     2

/****************************** call_user_start ******************************/

        .section .vecbase.text, "x"

/* This is the first entrypoint called from the ROM after loading the image
 * into IRAM.  It just sets up the VECBASE register to point at our own
 * exception vectors and then calls sdk_user_start() */

        .literal_position

        .balign 4
call_user_start:
        .global call_user_start
        .type   call_user_start, @function

        movi    a2, VecBase
        wsr     a2, vecbase
        call0   sdk_user_start

/*************************** NMI Exception Handler ***************************/

#define NMI_STACK_CANARY 0xABBABABA

        .section .vecbase.text, "x"

        .literal_position
        .balign  16
NMIExceptionHandler:
        .type   NMIExceptionHandler, @function

        wsr     sp, excsave3        # excsave3 holds user stack
        movi    sp, .NMIHandlerStackTop - 0x40
        s32i    a0, sp, 0x00
        s32i    a2, sp, 0x04
        s32i    a3, sp, 0x08
        s32i    a4, sp, 0x0c
        s32i    a5, sp, 0x10
        s32i    a6, sp, 0x14
        s32i    a7, sp, 0x18
        s32i    a8, sp, 0x1c
        s32i    a9, sp, 0x20
        s32i    a10, sp, 0x24
        s32i    a11, sp, 0x28
        rsr     a0, epc1
        s32i    a0, sp, 0x2c
        rsr     a0, exccause
        s32i    a0, sp, 0x30
        rsr     a0, excsave1
        s32i    a0, sp, 0x34
        rsr     a0, excvaddr
        s32i    a0, sp, 0x38
        rsr     a0, sar
        s32i    a0, sp, 0x3c
        movi    a0, 0x23        # Override PS for NMI handler
        wsr     a0, ps
        rsync

        /* mark the stack overflow point before we call the actual NMI handler */
        movi    a0, NMIHandlerStack
        movi    a2, NMI_STACK_CANARY
        s32i    a2, a0, 0x00

        call0   sdk_wDev_ProcessFiq

        /* verify we didn't overflow */
        movi    a0, NMIHandlerStack
        l32i    a3, a0, 0
        movi    a2, NMI_STACK_CANARY
        bne     a3, a2, .NMIFatalStackOverflow

        l32i    a0, sp, 0x3c
        wsr     a0, sar
        l32i    a0, sp, 0x38
        wsr     a0, excvaddr
        l32i    a0, sp, 0x34
        wsr     a0, excsave1
        l32i    a0, sp, 0x30
        wsr     a0, exccause
        l32i    a0, sp, 0x2c
        wsr     a0, epc1
        l32i    a11, sp, 0x28
        l32i    a10, sp, 0x24
        l32i    a9, sp, 0x20
        l32i    a8, sp, 0x1c
        l32i    a7, sp, 0x18
        l32i    a6, sp, 0x14
        l32i    a5, sp, 0x10
        l32i    a4, sp, 0x0c
        l32i    a3, sp, 0x08
        movi    a0, 0x33              # Reset PS
        wsr     a0, ps
        rsync
        /* set dport nmi status to 1 (wDev_ProcessFiq clears bit 0 and verifies it
         * stays cleared, see
         * http://esp8266-re.foogod.com/wiki/WDev_ProcessFiq_%28IoT_RTOS_SDK_0.9.9%29)
         */
        movi    a0, 0x3ff00000
        movi    a2, 0x1
        s32i    a2, a0, 0
        l32i    a2, sp, 0x04
        l32i    a0, sp, 0x00
        movi    a1, 0x0
        xsr     a1, excsave3       # Load stack back from excsave3, clear excsave3
        rfi     3

        .section .rodata

.NMIStackOverflowErrorMsg:
        .string "\nFATAL: NMI Stack Overflow\n"

        .section .vecbase.text, "x"

.NMIFatalStackOverflow:
        movi a2, .NMIStackOverflowErrorMsg
        call0 printf
.NMIInfiniteLoop:
        j .NMIInfiniteLoop /* TODO: replace with call to abort() */

/*********************** General UserException Handler ***********************/

        .section .vecbase.text, "x"

/* Called by UserExceptionVector if EXCCAUSE is anything other than
 * LoadStoreCause. */

        .literal_position
        .balign  4
UserExceptionHandler:
        .type   UserExceptionHandler, @function
        // save a0, a1 to debug_saved_ctx before stack pointer is affected
        // excsave1 contains a1
        // a1 was changed earlier
        movi    a1, debug_saved_ctx
        // store a0
        s32i    a0, a1, 0x00
        xsr     a0, excsave1
        // store a1
        s32i    a0, a1, 0x04
        mov     sp, a0
        addi    sp, sp, -0x50
        s32i    a0, sp, 0x10
        rsr     a0, ps
        s32i    a0, sp, 0x08
        rsr     a0, epc1
        s32i    a0, sp, 0x04
        rsr     a0, excsave1
        s32i    a0, sp, 0x0c
        movi    a0, _xt_user_exit
        s32i    a0, sp, 0x0
        call0   sdk__xt_int_enter
        movi    a0, 0x23
        wsr     a0, ps
        rsync
        rsr     a2, exccause
        /* Any UserException cause other than a level 1 interrupt is fatal */
        bnei    a2, CAUSE_LVL1INT, .LUserFailOtherExceptionCause
.LUserHandleInterrupt:
        rsil    a0, 1
        rsr     a2, intenable
        rsr     a3, interrupt
        movi    a4, 0x3fff
        and     a2, a2, a3
        and     a2, a2, a4       # a2 = 0x3FFF & INTENABLE & INTERRUPT
        call0   _xt_isr_handler
        call0   sdk__xt_int_exit # once finished, jumps to _xt_user_exit via stack

        .literal_position
.LUserFailOtherExceptionCause:
        break   1, 1
        addi    a2, a1, 0x50 /* UserExceptionHandler pushes stack down 0x50 */
        movi    a3, 1
        call0   fatal_exception_handler

/* _xt_user_exit is pushed onto the stack as part of the user exception handler,
   restores same set registers which were saved there and returns from exception */
_xt_user_exit:
        .global _xt_user_exit
        .type _xt_user_exit, @function
        l32i    a0, sp, 0x8
        wsr     a0, ps
        l32i    a0, sp, 0x4
        wsr     a0, epc1
        l32i    a0, sp, 0xc
        l32i    sp, sp, 0x10
        rsync
        rfe
