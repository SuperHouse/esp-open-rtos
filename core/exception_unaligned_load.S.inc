/* Xtensa Exception unaligned load handler

   Completes l8/l16 load instructions from Instruction address space,
   that the architecture require to be 4 byte aligned word reads.

   Called from either UserExceptionVector or DoubleExceptionVector
   depending on where the exception happened.

   Fast path (no branches) is for l8ui.

   Part of esp-open-rtos
   Copyright (C) Angus Gratton
   BSD Licensed as described in the file LICENSE
*/
       .text
       .section .vecbase.text, "x"
       .literal_position

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

	/* Check if a2 matches l16ui, l16si or l8ui opcode */
	movi a3, 0x00700F /* opcode mask */
	and a3, a2, a3

	movi a4, 0x001002 /* l16si or l16ui opcode after masking */
	beq a3, a4, .Lcan_fix_16bit

	bnei a3, 0x000002, .Lcant_fix  /* no l8ui opcode, then can't fix */
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

	bbsi a5, 14, .Lmaybe_extend_sign
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


	.literal_position
/* "Fix" LoadStoreException exceptions that are l8/l16 from an Instruction region,
   DoubleException exception variant (ie load happened in a level1 exception handler). */
DoubleExceptionLoadStoreHandler:
	addi sp, sp, -0x18
	s32i a2, sp, 0x08
	rsr.epc2 a2
	j InnerLoadStoreExceptionHandler

/* Load mask for an l16si/16ui instruction that needs loading

   First test for a signed vs unsigned load.

   a2 is the instruction, need to load a5 with the mask to use */
.Lcan_fix_16bit:
	bbsi a2, 15, .Lcan_fix_16bit_signed
	movi a5, 0xFFFF
	j .Lcan_fix
.Lcan_fix_16bit_signed:
	movi a5, 0x7FFF
	j .Lcan_fix

/* not an opcode we can try to fix, so bomb out
   TODO: the exception dump will have some wrong values in it */
.Lcant_fix:
	call0 sdk_user_fatal_exception_handler

/* increment PC for a DoubleException */
.Lincrement_PC_intlevel2:
	rsr.epc2 a2
	addi a3, a2, 0x3
	wsr.epc2 a3
	wsr.sar a0 // restore saved sar
	rsr.excsave2 a0 // restore a0 saved in exception vector
	j .Lafter_increment_PC

.Lmaybe_extend_sign: /* apply 16-bit sign extension if necessary
	                a3 holds raw value, a4 holds masked */
	bbsi a5, 15, .Lafter_extend_sign /* 16-bit unsigned, no sign extension */
	bbci a3, 15, .Lafter_extend_sign /* sign bit not set, no sign extension */
	movi a3, 0xFFFF0000
	or a4, a3, a4 /* set 32-bit sign bits */
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
