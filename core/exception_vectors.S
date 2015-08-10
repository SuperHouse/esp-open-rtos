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
   Additions Copyright (C) Superhouse Automation Pty Ltd
   BSD Licensed as described in the file LICENSE
*/
	.text
	.section .vecbase.text, "x"
        .align  256
        .global VecBase
        .type   VecBase, @function /* it's not really a function, but treat it like one */
VecBase:
	/* IMPORTANT: exception vector literals will go here, but we
	  can't have more than 4 otherwise we push DebugExceptionVector past
	  offset 0x10 relative to VecBase. There should be ways to avoid this,
	  and also keep the VecBase offsets easy to read, but this works for now.
	*/
	.literal_position
	.align 16
DebugExceptionVector:
	wsr.excsave2 a0
	call0 sdk_user_fatal_exception_handler
	rfi 2
	.align 16
NMIExceptionVector:
	wsr.excsave3 a0
	call0 CallNMIExceptionHandler
	rfi 3 /* CallNMIExceptionHandler should call rfi itself */
	.align 16
KernelExceptionVector:
	break 1, 0
	call0 sdk_user_fatal_exception_handler
	rfe
	.align 16
.L_EmptyVectorEntry:
	nop
	.align 16
UserExceptionVector:
	wsr.excsave1 a0
	call0 CallUserExceptionHandler
	rfe /* CallUserExceptionHandler should call rfe itself */
	.align 16
.L_EmptyVectorEntry2:
	nop
	.align 16
DoubleExceptionVector:
	break 1, 4
	call0 sdk_user_fatal_exception_handler
	.align 16
.L_UnusedResetVector:
	/* reset vector slot doesn't get used, as vecbase goes back to mask ROM on reset */
	nop

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

/* Some UserException causes, see table Table 4–64 in ISA reference */
#define CAUSE_SYSCALL 1
#define CAUSE_LOADSTORE 3
#define CAUSE_LVL1INT 4

        .type   CallUserExceptionHandler, @function
CallUserExceptionHandler:
	rsr.exccause a0
	beqi a0, CAUSE_SYSCALL, UserSyscallHandler
	beqi a0, CAUSE_LOADSTORE, UserLoadStoreExceptionHandler
	mov a0, sp
	addi sp, sp, -0x50
	s32i a0, sp, 0x10
	rsr.ps a0
	s32i a0, sp, 0x08
	rsr.epc1 a0
	s32i a0, sp, 0x04
	rsr.excsave1 a0 /* a0 was saved in UserExceptionVector */
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


	.section .bss
	.global LoadStoreErrorFlag
	.align 4
LoadStoreErrorFlag:
	.long 0
	.long 0
	.long 0
	.long 0

	.section .data
	.align 4
PRINT_ADDR:
	.string "0x%08lx '%c'\r\n"
PRINT_MULTI:
	.string "a3=0x%08lx a4=0x%08lx a5=0x%08lx a6=0x%08lx a7=0x%08lx\r\n"

	.text
	.section .vecbase.text
	.literal_position
	.align 4
	.global UserLoadStoreExceptionHandler
/* "Fix" LoadStoreException exceptions thatare l8/l16 from an Instruction region */
UserLoadStoreExceptionHandler:
	addi sp, sp, -0x40
	s32i a2, sp, 0x08
	rsr.excsave1 a2 /* a0 value */
	s32i a2, sp, 0x00
	addi a2, sp, 0x40
	s32i a2, sp, 0x04 /* original sp value */
	s32i a3, sp, 0x0c
	s32i a4, sp, 0x10
	s32i a5, sp, 0x14
	s32i a6, sp, 0x18
	s32i a7, sp, 0x1c
	s32i a8, sp, 0x20
	s32i a9, sp, 0x24
	s32i a10, sp, 0x28
	s32i a11, sp, 0x2c
	s32i a12, sp, 0x30
	s32i a13, sp, 0x34
	s32i a14, sp, 0x38
	s32i a15, sp, 0x3c

	/* Check the top nibble of the faulting address is 4, otherwise
	we can't help out here */
	rsr.excvaddr a2
	extui a2, a2, 28, 4
	bnei a2, 0x4, .Lcant_fix

	/* Load the instruction we failed to execute */
	rsr.epc1 a3
	movi	a4, ~3
	and	a2, a3, a4
	l32i a4, a2, 0
	l32i a5, a2, 4
	ssa8l a3
	src a4, a5, a4
	/* a4 is now the instruction that failed */

	/* example l8ui instr 040c72 */
	movi a2, 0x00F00F /* l8ui/l16ui opcode mask */
	and a3, a4, a2
	movi a8, 0xFF
	movi a5, 0x000002 /* l8ui opcode after masking */
	beq a3, a5, .Lcan_fix

	movi a8, 0xFFFF
	movi a5, 0x001002 /* l16ui opcode after masking */
	beq a3, a5, .Lcan_fix

.Lcant_fix:
	/* not an l8ui or an l16ui, or not in the instruction space, so bomb out
TODO: the exception dump will have some wrong values in it */
	movi a2, PRINT_ADDR
	movi a3, 0xafafafaf
	call0 printf
	call0 sdk_user_fatal_exception_handler
.Lcan_fix:
	/* verified an 8- or 16-bit read in an instruction address space.

	a4 holds instruction, a8 holds mask
	*/
	extui a2, a4, 4, 4 /* a2 is destination register 0-15 */
	slli a2, a2, 2 /* a2 is now offset of destination register, relative to stack pointer */

	rsr.sar a6
	rsr.excvaddr a3
	ssa8l a3 /* sar is the shift to extract a3's byte */
	movi	a4, ~3
	and	a4, a3, a4 /* a4 is word aligned read address */

	l32i a5, a4, 0 /* perform the actual read */
	srl a5, a5
	and a5, a5, a8 /* mask off bits we need for an l8/l16 */

	wsr.sar a6

	add a6, sp, a2
	s32i a5, a6, 0  /* overwrite correct value on register slot @ stack+a2 */

	/* Footer*/
	//Increment PC
	rsr.epc1 a2
	addi a3, a2, 0x3
	wsr.epc1 a3

	// Restore registers
	l32i a0, sp, 0x00
	l32i a2, sp, 0x08
	l32i a3, sp, 0x0c
	l32i a4, sp, 0x10
	l32i a5, sp, 0x14
	l32i a6, sp, 0x18
	l32i a7, sp, 0x1c
	l32i a8, sp, 0x20
	l32i a9, sp, 0x24
	l32i a10, sp, 0x28
	l32i a11, sp, 0x2c
	l32i a12, sp, 0x30
	l32i a13, sp, 0x34
	l32i a14, sp, 0x38
	l32i a15, sp, 0x3c
	l32i sp, sp, 0x04
	rfe

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

