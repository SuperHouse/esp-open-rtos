/* Xtensa Exception (ie interrupt) Vectors & low-level handler code

   Core exception handler code is placed in the .vecbase section,
   which gets picked up specially in the linker script and placed
   at beginning of IRAM.

   The actual VecBase symbol should be the first thing in .vecbase
   (this is not strictly important as it gets set by symbol lookup not
   by hardcoded address, but having it at 0x40100000 means that the
   exception vectors have memorable offsets, which match the default
   Boot ROM vector offsets. So convenient for human understanding.

   Part of esp-open-rtos
   Original vector contents Copyright (C) 2014-2015 Espressif Systems
   Additions Copyright (C) Superhouse Automation Pty Ltd and Angus Gratton
   BSD Licensed as described in the file LICENSE
*/

/* Some UserException causes, see table Table 4–64 in ISA reference */
#define CAUSE_SYSCALL 1
#define CAUSE_LOADSTORE 3
#define CAUSE_LVL1INT 4

	.text
	.section .vecbase.text, "x"
        .global VecBase
        .type   VecBase, @function /* it's not really a function, but treat it like one */
	.org 0
VecBase:
	/* IMPORTANT: exception vector literals will go here, but we
	  can't have more than 4 otherwise we push DebugExceptionVector past
	  offset 0x10 relative to VecBase. There should be ways to avoid this,
	  and also keep the VecBase offsets easy to read, but this works for now.
	*/
	.literal_position
	.org 0x10
DebugExceptionVector:
	wsr.excsave2 a0
	call0 sdk_user_fatal_exception_handler
	rfi 2

	.org 0x20
NMIExceptionVector:
	wsr.excsave3 a0
	call0 CallNMIExceptionHandler
	rfi 3 /* CallNMIExceptionHandler should call rfi itself */

	.org 0x30
KernelExceptionVector:
	break 1, 0
	call0 sdk_user_fatal_exception_handler
	rfe

	.org 0x50
UserExceptionVector:
	wsr.excsave1 a0
	rsr.exccause a0
	beqi a0, CAUSE_SYSCALL, UserSyscallHandler
	beqi a0, CAUSE_LOADSTORE, UserExceptionLoadStoreHandler
	j UserExceptionHandler

	.org 0x70
DoubleExceptionVector:
	break 1, 4
	rsr.exccause a0
	beqi a0, CAUSE_LOADSTORE, DoubleExceptionLoadStoreHandler
	call0 sdk_user_fatal_exception_handler

/* Reset vector would go here at offset 0x80 but should be unused,
   as vecbase goes back to mask ROM vectors on reset */

/***** end of exception vectors  *****/

	.section .bss
NMIHandlerStack: /* stack space for NMI handler */
	.skip 4*0x100
NMIRegisterSaved: /* register space for saving NMI registers */
	.skip 4*(0x16 + 6)

/* this symbol is _Pri_3_HandlerAddress in the RTOS SDK, appears totally
	unused (stays zero at all times) */
	.global NMIHandlerAddress
NMIHandlerAddress:
	.long 0

/* Save register relative to a0 */
.macro SAVE_REG register, regnum
	s32i \register, a0, (0x20 + 4 * \regnum)
.endm

/* Load register relative to sp */
.macro LOAD_REG register, regnum
	l32i \register, sp, (0x20 + 4 * \regnum)
.endm

	.text
	.section .vecbase.text
	.literal_position
        .align  4
	.global call_user_start
        .type   call_user_start, @function
call_user_start:
	movi a2, VecBase
	wsr.vecbase a2
	call0 sdk_user_start

	.literal_position
        .align  16
        .type   CallNMIExceptionHandler, @function
CallNMIExceptionHandler:
	movi a0, NMIRegisterSaved
	SAVE_REG a2, 2
	movi a2, NMIHandlerAddress
	l32i a2, a2, 0
	SAVE_REG sp, 1
	SAVE_REG a3, 3
	xsr.excsave3 a2 /* excsave3 is now NMIHandlerAddress, a2 is former a0 */
	SAVE_REG a4, 4
	SAVE_REG a2, 0
	rsr.epc1 a3
	rsr.exccause a4
	SAVE_REG a3, -5
	SAVE_REG a4, -4
	rsr.excvaddr a3
	SAVE_REG a3, -3
	rsr.excsave1 a3
	SAVE_REG a3, -2
	SAVE_REG a5, 5
	SAVE_REG a6, 6
	SAVE_REG a7, 7
	SAVE_REG a8, 8
	SAVE_REG a9, 9
	SAVE_REG a10, 10
	SAVE_REG a11, 11
	SAVE_REG a12, 12
	SAVE_REG a13, 13
	SAVE_REG a14, 14
	SAVE_REG a15, 15
	movi sp, NMIRegisterSaved /* also top of NMIHandlerStack */
	movi a0, 0
	movi a2, 0x23 /* argument for handler */
	wsr.ps a2
	rsync
	rsr.sar a14
	s32i a14, sp, 0 /* this is also NMIRegisterSaved+0 */
	call0 sdk_wDev_ProcessFiq
	l32i a15, sp, 0
	wsr.sar a15
	movi a2, 0x33
	wsr.ps a2
	rsync
	LOAD_REG a4, 4
	LOAD_REG a5, 5
	LOAD_REG a6, 6
	LOAD_REG a7, 7
	LOAD_REG a8, 8
	LOAD_REG a9, 9
	LOAD_REG a10, 10
	LOAD_REG a11, 11
	LOAD_REG a12, 12
	LOAD_REG a13, 13
	LOAD_REG a14, 14
	LOAD_REG a15, 15
	LOAD_REG a2, -5
	LOAD_REG a3, -4
	wsr.epc1 a2
	wsr.exccause a3
	LOAD_REG a2, -3
	LOAD_REG a3, -2
	wsr.excvaddr a2
	wsr.excsave1 a3
	LOAD_REG a0, 0
	/* set dport nmi status bit 0 (wDev_ProcessFiq clears & verifies this bit stays cleared,
	   see http://esp8266-re.foogod.com/wiki/WDev_ProcessFiq_%28IoT_RTOS_SDK_0.9.9%29)  */
	movi a2, 0x3ff00000
	movi a3, 0x1
	s32i a3, a2, 0
	LOAD_REG a2, 2
	LOAD_REG a3, 3
	LOAD_REG a1, 1
	rfi 0x3

        .type   UserExceptionHandler, @function
UserExceptionHandler:
	mov a0, sp /* a0 was saved in UserExceptionVector */
	addi sp, sp, -0x50
	s32i a0, sp, 0x10
	rsr.ps a0
	s32i a0, sp, 0x08
	rsr.epc1 a0
	s32i a0, sp, 0x04
	rsr.excsave1 a0
	s32i a0, sp, 0x0c
	movi a0, _xt_user_exit
	s32i a0, sp, 0x0
	call0 sdk__xt_int_enter
	movi a0, 0x23
	wsr.ps a0
	rsync
	rsr.exccause a2
	beqi a2, CAUSE_LVL1INT, UserHandleInterrupt
	/* Any UserException cause other than level 1 interrupt triggers a panic */
UserFailOtherExceptionCause:
	break 1, 1
	call0 sdk_user_fatal_exception_handler
UserHandleInterrupt:
	rsil a0, 1
	rsr.intenable a2
	rsr.interrupt a3
	movi a4, 0x3fff
	and a2, a2, a3
	and a2, a2, a4 /* a2 = 0x3FFF & INTENABLE & INTERRUPT */
UserHandleTimer:
	movi a3, 0xffbf
	and a3, a2, a3 /* a3 = a2 & 0xFFBF, ie remove 0x40 from a2 if set */
	bnez a3, UserTimerDone /* bits other than 0x40 are set */
	movi a3, 0x40
	sub a12, a2, a3 /* a12 - a2 - 0x40 - I think a12 _must_ be zero here? */
	call0 sdk__xt_timer_int /* tick timer interrupt */
	mov a2, a12 /* restore a2 from a12, ie zero */
	beqz a2, UserIntDone
UserTimerDone:
	call0 _xt_isr_handler
	bnez a2, UserHandleTimer
UserIntDone:
	beqz a2, UserIntExit
	break 1, 1 /* non-zero remnant in a2 means fail */
	call0 sdk_user_fatal_exception_handler
UserIntExit:
	call0 sdk__xt_int_exit /* calls rfi */

/* As far as I can tell, the syscall handler is basically a no-op */
UserSyscallHandler:
	addi sp, sp, -0x10
	s32i a2, sp, 0x08
	s32i a3, sp, 0x0c
	rsr.epc1 a2
	addi a3, a2, 0x3
	wsr.epc1 a3
	l32i a2, sp, 0x8
	l32i a3, sp, 0xc
	addi sp, sp, 0x10
	movi a0, 0x7f
	movnez a2, a0, a2
	rsr.excsave1 a0
	rfe

	.text
	.section .vecbase.text
	.literal_position
	.align 4

/* "Fix" LoadStoreException exceptions that are l8/l16 from an Instruction region,
   DoubleException exception variant (ie load happened in a level1 exception handler). */
DoubleExceptionLoadStoreHandler:
	addi sp, sp, -0x18
	s32i a2, sp, 0x08
	rsr.epc2 a2
	j InnerLoadStoreExceptionHandler

	.text
	.section .vecbase.text
	.literal_position
	.align 4

/* "Fix" LoadStoreException exceptions that are l8/l16 from an Instruction region,
   normal exception variant. */
UserExceptionLoadStoreHandler:
	addi sp, sp, -0x18
	s32i a2, sp, 0x08
	rsr.epc1 a2
/* Inner UserLoadStoreExceptionHandler handlers. Works for both level1 & level 2 interrupt level.
 *
 * Called from level-specific handler above which sets up stack and loads epcX into a2.
 */
InnerLoadStoreExceptionHandler:
	s32i a3, sp, 0x0c
	s32i a4, sp, 0x10
	s32i a5, sp, 0x14
	rsr.sar a0 // save sar in a0

	/* Examine the instruction we failed to execute (in a2) */
	ssa8l a2 // sar is now correct shift for aligned read
	movi	a3, ~3
	and a2, a2, a3 // a2 now 4-byte aligned address of instruction
	l32i a3, a2, 0
	l32i a4, a2, 4
	src a2, a4, a3 // a2 now instruction that failed

	/* Check if a2 matches l8ui, l16ui or l16si opcodes */
	movi a3, 0x00F00F /* opcode mask */
	and a3, a2, a3
	beqi a3, 0x000002, .Lcan_fix_8bit  /* l8ui opcode after masking */

	movi a4, 0x001002 /* l16ui opcode after masking */
	beq a3, a4, .Lcan_fix_16bit

	movi a4, 0x009002 /* l16si opcode after masking */
	beq a3, a4, .Lcan_fix_16bit_signed
.Lcant_fix:
	/* not an opcode we can try to fix, so bomb out
           TODO: the exception dump will have some wrong values in it */
	call0 sdk_user_fatal_exception_handler

.Lcan_fix_16bit_signed:
	movi a5, 0x7FFF
	j .Lcan_fix
.Lcan_fix_16bit:
	movi a5, 0xFFFF
	j .Lcan_fix
.Lcan_fix_8bit:
	movi a5, 0xFF
.Lcan_fix:
	/* verified an 8- or 16-bit read
	a2 holds instruction, a5 holds mask to apply to read value
	*/

	rsr.excvaddr a3 // read faulting address
	ssa8l a3 /* sar is now shift to extract a3's byte */
	movi	a4, ~3
	and	a3, a3, a4 /* a3 now word aligned read address */

	l32i a3, a3, 0  /* perform the actual read */
	srl a3, a3	/* shift right correct distance */
	and a4, a3, a5  /* mask off bits we need for an l8/l16 */

	bbci a5, 14, .Lafter_extend_sign /* 8-bit, no sign extension */
	bbsi a5, 15, .Lafter_extend_sign /* 16-bit unsigned, no sign extension */
	bbci a3, 15, .Lafter_extend_sign /* sign bit not set, no sign extension */
	movi a3, (1<<31)
	or a4, a3, a4 /* set 32-bit sign bit */
.Lafter_extend_sign:
	/* a2 holds instruction, a4 holds the correctly read value */
	extui a2, a2, 4, 4 /* a2 now destination register 0-15 */

	/* test if a4 needs to be written directly to a register (ie not a working register) */
	bgei a2, 6, .Lwrite_value_direct_reg
	/* test if a4 needs to be written to a0 */
	beqz a2, .Lwrite_value_a0_reg

	/* otherwise, a4 can be written to a saved working register 'slot' on the stack */
	addx4 a5, a2, sp
	s32i a4, a5, 0

.Lafter_write_value:
	/* test PS.INTLEVEL (1=User, 2=Double) to see which interrupt level we restore from
	*/
	rsr.ps a2
	bbsi a2, 1, .Lincrement_PC_intlevel2
.Lincrement_PC_intlevel1:
	rsr.epc1 a2
	addi a3, a2, 0x3
	wsr.epc1 a3
	wsr.sar a0 // restore saved sar
	rsr.excsave1 a0 // restore a0 saved in exception vector
.Lafter_increment_PC:
	// Restore registers
	l32i a2, sp, 0x08
	l32i a3, sp, 0x0c
	l32i a4, sp, 0x10
	l32i a5, sp, 0x14
	addi sp, sp, 0x18
	rfe

.Lincrement_PC_intlevel2:
	rsr.epc2 a2
	addi a3, a2, 0x3
	wsr.epc2 a3
	wsr.sar a0 // restore saved sar
	rsr.excsave2 a0 // restore a0 saved in exception vector
	j .Lafter_increment_PC

.Lextend_sign: /* apply 16-bit sign extension if necessary
	          a3 holds raw value, a4 holds masked */
	bbci a3, 15, .Lafter_extend_sign /* sign bit not set, do nothing */
	movi a3, (1<<31)
	or a4, a3, a4 /* set sign bit */
	j .Lafter_extend_sign

.Lwrite_value_direct_reg:
	/* Directly update register index a2, in range 6-15, using value in a4 */
	addi a2, a2, -6
	slli a2, a2, 3 /* offset from a6, x8 */
	movi a3, .Ldirect_reg_jumptable
	add a2, a2, a3
	jx a2
	.align 8
.Ldirect_reg_jumptable:
	mov a6, a4
	j .Lafter_write_value
	.align 8
	mov a7, a4
	j .Lafter_write_value
	.align 8
	mov a8, a4
	j .Lafter_write_value
	.align 8
	mov a9, a4
	j .Lafter_write_value
	.align 8
	mov a10, a4
	j .Lafter_write_value
	.align 8
	mov a11, a4
	j .Lafter_write_value
	.align 8
	mov a12, a4
	j .Lafter_write_value
	.align 8
	mov a13, a4
	j .Lafter_write_value
	.align 8
	mov a14, a4
	j .Lafter_write_value
	.align 8
	mov a15, a4
	j .Lafter_write_value

.Lwrite_value_a0_reg:
	/* a0 is saved in excsave1,so just update this with value
           TODO: This won't work with interrupt level 2
	*/
	wsr.excsave1 a4
	j .Lafter_write_value

/* End of InnerUserLoadStoreExceptionHandler */

	.global _xt_user_exit
	.type _xt_user_exit, @function
_xt_user_exit:
	l32i a0, sp, 0x8
	wsr.ps a0
	l32i a0, sp, 0x4
	wsr.epc1 a0
	l32i a0, sp, 0xc
	l32i sp, sp, 0x10
	rsync
	rfe

