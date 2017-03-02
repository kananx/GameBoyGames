	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"main.c"
	.text
	.align	2
	.type	drawBlock.part.5, %function
drawBlock.part.5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldrh	ip, [r0, #36]
	ldr	lr, [r0]
	sub	sp, sp, #8
	add	r2, r0, #16
	ldr	r1, [r0, #4]
	ldmia	r2, {r2, r3}
	mov	r0, lr
	str	ip, [sp]
	ldr	r4, .L3
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	drawRect
	.size	drawBlock.part.5, .-drawBlock.part.5
	.align	2
	.type	eraseBlock.part.6, %function
eraseBlock.part.6:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	stmfd	sp!, {r4, lr}
	add	r2, r0, #16
	sub	sp, sp, #8
	ldmia	r2, {r2, r3}
	ldmia	r0, {r0, r1}
	ldr	r4, .L7
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	drawRect
	.size	eraseBlock.part.6, .-eraseBlock.part.6
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldr	r3, [r3]
	tst	r3, #8
	stmfd	sp!, {r4, lr}
	beq	.L10
	ldr	r2, .L22+4
	ldr	r0, [r2]
	ands	r0, r0, #8
	beq	.L20
.L10:
	tst	r3, #4
	beq	.L9
	ldr	r3, .L22+4
	ldr	r3, [r3]
	ands	r4, r3, #4
	beq	.L21
.L9:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	ldr	r3, .L22+8
	mov	r0, #992
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+12
	str	r4, [r3]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L20:
	ldr	r3, .L22+8
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L22+12
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	pause, .-pause
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L32
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L32+4
	ldr	r0, [r3]
	stmfd	sp!, {r4, lr}
	ands	r4, r0, #8
	beq	.L31
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	mov	r0, r4
	ldr	r3, .L32+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+12
	str	r4, [r3]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L42+4
	ldr	r3, [r3]
	stmfd	sp!, {r4, lr}
	ands	r4, r3, #8
	beq	.L41
	ldmfd	sp!, {r4, lr}
	bx	lr
.L41:
	ldr	r3, .L42+8
	ldr	r0, .L42+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+16
	str	r4, [r3]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	oldButtons
	.word	buttons
	.word	drawBackgroundImage3
	.word	openbgBitmap
	.word	state
	.size	lose, .-lose
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #0
	stmfd	sp!, {r4, lr}
	ldr	r0, .L46
	ldr	r2, .L46+4
	strh	r0, [r3]	@ movhi
	ldr	r0, .L46+8
	ldr	r3, .L46+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	1027
	.word	state
	.word	openbgBitmap
	.word	drawBackgroundImage3
	.size	initialize, .-initialize
	.align	2
	.global	initializeGame
	.type	initializeGame, %function
initializeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, #0
	sub	sp, sp, #48
	mov	r3, #240
	mov	r1, r4
	mov	r0, r4
	mov	r2, #160
	ldr	r5, .L58
	str	r4, [sp]
	mov	lr, pc
	bx	r5
	mov	r5, #110
	mov	r0, #5
	mov	r8, #20
	mov	r6, #155
	mov	r1, #60
	mov	r2, #10
	mov	lr, #1
	mvn	ip, #64512
	ldr	r3, .L58+4
	str	r5, [r3, #4]
	ldr	r5, .L58+8
	str	r8, [r3, #16]
	str	r6, [r3]
	str	r0, [r3, #20]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	strh	r5, [r3, #24]	@ movhi
	strb	r4, [r3, #26]
	ldr	r3, .L58+12
	str	r0, [r3, #16]
	ldr	r0, .L58+16
	mov	r7, r1
	str	r4, [r3]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	lr, [r3, #32]
	strh	ip, [r3, #36]	@ movhi
	str	r1, [r3, #4]
	str	r2, [r3, #20]
	str	r2, [r0]
	add	r5, r3, #44
	add	r8, r3, #404
	add	r6, sp, #8
	b	.L50
.L56:
	ldr	r7, [r5, #-40]
.L50:
	mov	ip, r6
	mov	r4, r6
	sub	lr, r5, #44
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	add	r7, r7, #11
	stmia	ip, {r0, r1}
	str	r7, [sp, #12]
	ldmia	r4!, {r0, r1, r2, r3}
	sub	lr, r5, #4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	add	r5, r5, #40
	ldmia	ip, {r0, r1}
	cmp	r5, r8
	stmia	lr, {r0, r1}
	bne	.L56
	mov	r0, #60
	mov	r5, #6
	mov	r1, #0
	mov	r2, #10
	mov	r4, #5
	mov	lr, #1
	mov	ip, #992
	ldr	r3, .L58+20
	mov	r7, r0
	str	r0, [r3, #4]
	ldr	r0, .L58+24
	str	r5, [r3]
	str	r4, [r3, #16]
	str	lr, [r3, #32]
	strh	ip, [r3, #36]	@ movhi
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r0]
	add	r5, r3, #44
	add	r8, r3, #404
	b	.L52
.L57:
	ldr	r7, [r5, #-40]
.L52:
	mov	ip, r6
	mov	r4, r6
	sub	lr, r5, #44
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr, {r0, r1}
	add	r7, r7, #11
	stmia	ip, {r0, r1}
	str	r7, [sp, #12]
	ldmia	r4!, {r0, r1, r2, r3}
	sub	lr, r5, #4
	stmia	lr!, {r0, r1, r2, r3}
	ldmia	r4!, {r0, r1, r2, r3}
	stmia	lr!, {r0, r1, r2, r3}
	add	r5, r5, #40
	ldmia	ip, {r0, r1}
	cmp	r5, r8
	stmia	lr, {r0, r1}
	bne	.L57
	mov	r5, #0
	mov	lr, #60
	mov	ip, #30
	mov	r2, #5
	ldr	r3, .L58+28
	ldmia	r3, {r0, r1}
	ldr	r4, .L58+32
	stmia	r6, {r0, r1}
	ldr	r6, .L58+36
	str	r2, [r4, #24]
	str	lr, [r4]
	str	ip, [r4, #4]
	str	r5, [r4, #8]
	str	r5, [r4, #12]
	mov	lr, pc
	bx	r6
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r0, r3, r0, lsr #31
	add	r3, sp, #48
	add	r0, r3, r0, lsl #2
	ldr	r3, [r0, #-40]
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r6
	add	r3, r0, r0, lsr #31
	and	r3, r3, #1
	sub	r0, r3, r0, lsr #31
	add	r3, sp, #48
	add	r0, r3, r0, lsl #2
	ldr	r0, [r0, #-40]
	ldr	r1, .L58+40
	ldr	r2, .L58+44
	ldr	r3, .L58+48
	str	r0, [r4, #20]
	str	r5, [r1]
	str	r5, [r2]
	str	r5, [r3]
	add	sp, sp, #48
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	drawRect
	.word	player
	.word	32404
	.word	blocksRow
	.word	numblocks
	.word	blocksRow2
	.word	numblocks2
	.word	.LANCHOR0
	.word	ball
	.word	rand
	.word	deadBlocks
	.word	score
	.word	oldscore
	.size	initializeGame, .-initializeGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r3, .L67
	ldr	r4, .L67+4
	ldr	r2, .L67+8
	mov	r1, #5
	mov	r0, #10
	mov	lr, pc
	bx	r4
	ldr	r3, .L67
	ldr	r2, .L67+12
	mov	r1, #5
	mov	r0, #20
	mov	lr, pc
	bx	r4
	ldr	r4, .L67+16
	ldr	r2, .L67+20
	ldr	r3, [r4]
	ldr	r2, [r2]
	add	r3, r3, #1
	tst	r2, #8
	str	r3, [r4]
	beq	.L60
	ldr	r3, .L67+24
	ldr	r0, [r3]
	ands	r0, r0, #8
	beq	.L66
.L60:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L66:
	ldr	r3, .L67+28
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L67+32
	ldr	r0, [r4]
	ldr	r3, .L67+36
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	initializeGame
.L68:
	.align	2
.L67:
	.word	32767
	.word	drawString
	.word	.LC1
	.word	.LC2
	.word	timer
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	state
	.word	srand
	.size	start, .-start
	.align	2
	.global	updatePlayer
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldmia	r0, {r1, r3}
	str	r1, [r0, #8]
	str	r3, [r0, #12]
	ldr	r2, [r2, #304]
	cmp	r3, #0
	movle	r1, #0
	movgt	r1, #1
	mvn	r2, r2
	ands	r2, r1, r2, lsr #5
	subne	r3, r3, #2
	strne	r3, [r0, #4]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bxne	lr
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #16]
	add	r3, r2, r3
	cmp	r3, #238
	addle	r2, r2, #2
	strle	r2, [r0, #4]
	bx	lr
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawBall
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	lr, [r0]
	ldr	r4, [r0, #16]
	ldr	r3, [r0, #4]
	add	ip, lr, r4
	ldr	r2, [r0, #20]
	cmp	ip, #0
	add	r2, r3, r2
	str	r3, [r0, #12]
	movlt	r3, #0
	str	ip, [r0]
	movlt	ip, r3
	strlt	r3, [r0]
	ldr	r3, [r0, #24]
	rsblt	r4, r4, #0
	str	lr, [r0, #8]
	rsb	lr, r3, #160
	strlt	r4, [r0, #16]
	cmp	lr, ip
	sub	sp, sp, #12
	str	r2, [r0, #4]
	bge	.L80
	mov	r3, #1
	mov	lr, #3
	strb	r3, [r1, #26]
	ldr	ip, .L93
	ldr	r2, [r0, #4]
	ldr	r3, [r0, #24]
	str	lr, [ip]
.L80:
	cmp	r2, #0
	blt	.L92
.L81:
	rsb	ip, r3, #240
	cmp	ip, r2
	ldrlt	r2, [r0, #20]
	rsblt	r2, r2, #0
	strlt	ip, [r0, #4]
	strlt	r2, [r0, #20]
	ldr	ip, [r1, #16]
	ldr	r2, [r1, #4]
	add	ip, r2, ip
	cmp	r2, ip
	ldrlt	r4, [r0, #4]
	blt	.L87
	b	.L88
.L86:
	cmp	r2, ip
	beq	.L88
.L87:
	cmp	r2, r4
	add	r2, r2, #1
	bne	.L86
	ldr	lr, [r1]
	ldr	r5, [r0]
	sub	lr, lr, #3
	cmp	r5, lr
	ldreq	lr, [r0, #16]
	rsbeq	lr, lr, #0
	streq	lr, [r0, #16]
	cmp	r2, ip
	bne	.L87
.L88:
	ldrb	r2, [r1, #26]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L78
	mov	r4, r0
	add	r0, r0, #8
	ldmia	r0, {r0, r1}
	ldr	r5, .L93+4
	str	r2, [sp]
	mov	r2, r3
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #24]
	ldr	ip, .L93+8
	ldmia	r4, {r0, r1}
	mov	r2, r3
	str	ip, [sp]
	mov	lr, pc
	bx	r5
.L78:
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L92:
	mov	lr, #0
	ldr	ip, [r0, #20]
	rsb	ip, ip, #0
	mov	r2, lr
	str	ip, [r0, #20]
	str	lr, [r0, #4]
	b	.L81
.L94:
	.align	2
.L93:
	.word	state
	.word	drawRect
	.word	32767
	.size	drawBall, .-drawBall
	.align	2
	.global	blockCollision
	.type	blockCollision, %function
blockCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L116
	ldr	r3, [r1]
	ldr	r2, [r7]
	ldr	ip, .L116+4
	cmp	r3, #33
	str	r2, [ip]
	bgt	.L95
	ldr	r6, [r0]
	ldr	lr, [r0, #16]
	add	lr, r6, lr
	cmp	r3, lr
	ldr	r4, [r1, #4]
	ldr	r5, [r0, #4]
	beq	.L115
.L99:
	cmp	r3, r6
	movlt	r8, #0
	movge	r8, #1
	cmp	r3, lr
	movgt	r8, #0
	cmp	r5, r4
	movne	ip, #0
	andeq	ip, r8, #1
	cmp	ip, #0
	beq	.L101
.L112:
	mov	r4, #0
	ldr	lr, .L116+8
	ldr	r3, [r1, #20]
	ldr	ip, [lr]
	add	r2, r2, #1
	add	ip, ip, #1
	rsb	r3, r3, #0
	str	r4, [r0, #32]
	str	r2, [r7]
	str	ip, [lr]
	str	r3, [r1, #20]
.L104:
	ldr	r1, .L116+12
	ldr	r3, .L116+16
	ldr	r0, .L116+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L116+24
	mov	r3, #0
	ldr	r2, .L116+28
	mov	r1, #47
	mov	r0, #150
	mov	lr, pc
	bx	r4
	mov	r3, #31
	ldr	r2, .L116+20
	mov	r1, #47
	mov	r0, #150
	mov	lr, pc
	bx	r4
.L95:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L98:
	cmp	r3, r6
	movlt	r8, #0
	movge	r8, #1
.L101:
	ldr	ip, [r1, #24]
	add	r3, r3, ip
	cmp	r5, r4
	cmple	r3, r6
	bne	.L102
	ldr	r3, [r0, #20]
	add	r3, r5, r3
	cmp	r3, r4
	bge	.L113
.L102:
	add	r3, ip, r4
	cmp	r3, r5
	movne	ip, #0
	andeq	ip, r8, #1
	cmp	ip, #0
	bne	.L112
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L104
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L115:
	cmp	r4, r5
	blt	.L98
	ldr	ip, [r0, #20]
	add	ip, r5, ip
	cmp	r4, ip
	bgt	.L99
.L113:
	mov	r4, #0
	ldr	lr, .L116+8
	ldr	r3, [r1, #16]
	ldr	ip, [lr]
	add	r2, r2, #1
	add	ip, ip, #1
	rsb	r3, r3, #0
	str	r4, [r0, #32]
	str	r2, [r7]
	str	ip, [lr]
	str	r3, [r1, #16]
	b	.L104
.L117:
	.align	2
.L116:
	.word	score
	.word	oldscore
	.word	deadBlocks
	.word	.LC3
	.word	sprintf
	.word	buffer
	.word	drawString
	.word	oldBuffer
	.size	blockCollision, .-blockCollision
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r6, .L158
	ldr	r3, [r6]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L158+4
	ble	.L124
.L123:
	ldr	r1, .L158+8
	mov	r0, r4
	bl	blockCollision
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	moveq	r0, r4
	bleq	eraseBlock.part.6
.L122:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L123
.L124:
	ldr	r7, .L158+12
	ldr	r3, [r7]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L158+16
	ble	.L121
.L128:
	ldr	r1, .L158+8
	mov	r0, r4
	bl	blockCollision
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	moveq	r0, r4
	bleq	eraseBlock.part.6
.L127:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L128
.L121:
	ldr	r2, .L158+20
	ldr	r3, [r6]
	ldr	r2, [r2]
	cmp	r2, r3
	beq	.L157
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L158+4
	ble	.L135
.L134:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	movne	r0, r4
	blne	drawBlock.part.5
.L133:
	ldr	r3, [r6]
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L134
.L135:
	ldr	r3, [r7]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L158+16
	ble	.L131
.L140:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	add	r5, r5, #1
	movne	r0, r4
	blne	drawBlock.part.5
.L139:
	ldr	r3, [r7]
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L140
.L131:
	ldr	r3, .L158+24
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L137
	cmp	r3, #4
	beq	.L138
	cmp	r3, #2
	beq	.L132
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L137:
	ldr	r0, .L158+28
	ldr	r3, .L158+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L158+36
	mov	r3, #31
	ldr	r2, .L158+40
	mov	r1, #5
	mov	r0, #10
	mov	lr, pc
	bx	r4
	mov	r3, #31
	ldr	r2, .L158+44
	mov	r1, #5
	mov	r0, #20
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L157:
	mov	r2, #2
	ldr	r3, .L158+24
	str	r2, [r3]
.L132:
	mov	r0, #0
	ldr	r3, .L158+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L158+36
	mov	r3, #992
	ldr	r2, .L158+52
	mov	r1, #5
	mov	r0, #10
	mov	lr, pc
	bx	r4
	mov	r3, #992
	ldr	r2, .L158+44
	mov	r1, #5
	mov	r0, #20
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L138:
	mov	r0, #31
	ldr	r3, .L158+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L158+36
	ldr	r3, .L158+56
	ldr	r2, .L158+60
	mov	r1, #5
	mov	r0, #10
	mov	lr, pc
	bx	r4
	ldr	r3, .L158+56
	ldr	r2, .L158+64
	mov	r1, #5
	mov	r0, #20
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L159:
	.align	2
.L158:
	.word	numblocks
	.word	blocksRow
	.word	ball
	.word	numblocks2
	.word	blocksRow2
	.word	deadBlocks
	.word	state
	.word	gameoverBitmap
	.word	drawBackgroundImage3
	.word	drawString
	.word	.LC8
	.word	.LC7
	.word	fillScreen
	.word	.LC6
	.word	32767
	.word	.LC4
	.word	.LC5
	.size	draw, .-draw
	.align	2
	.global	erasePlayer
	.type	erasePlayer, %function
erasePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	stmfd	sp!, {r4, lr}
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	sub	sp, sp, #8
	add	r0, r0, #8
	ldmia	r0, {r0, r1}
	ldr	r4, .L162
	str	ip, [sp]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L163:
	.align	2
.L162:
	.word	drawRect
	.size	erasePlayer, .-erasePlayer
	.align	2
	.global	drawPlayer
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r4, r0
	ldrh	ip, [r4, #24]
	sub	sp, sp, #12
	ldr	r3, [r0, #16]
	ldr	r2, [r0, #20]
	ldr	r5, .L166
	ldmia	r0, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #16]
	ldr	r3, [r4, #20]
	ldmia	r4, {r1, r2}
	str	r0, [sp]
	ldr	r4, .L166+4
	ldr	r0, .L166+8
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L167:
	.align	2
.L166:
	.word	drawRect
	.word	drawImage3
	.word	paddleBitmap
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	r3, .L176
	ldr	r3, [r3]
	tst	r3, #1
	sub	sp, sp, #12
	beq	.L169
	ldr	r3, .L176+4
	ldr	r3, [r3]
	tst	r3, #1
	beq	.L175
.L169:
	ldr	r4, .L176+8
	mov	r0, r4
	bl	updatePlayer
	mov	ip, #0
	add	r0, r4, #8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldmia	r0, {r0, r1}
	ldr	r5, .L176+12
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	bl	drawPlayer
	mov	r1, r4
	ldr	r0, .L176+16
	bl	drawBall
	ldr	r4, .L176+20
	mov	r3, #31
	ldr	r2, .L176+24
	mov	r1, #5
	mov	r0, #150
	mov	lr, pc
	bx	r4
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L175:
	mov	r2, #4
	ldr	r3, .L176+28
	str	r2, [r3]
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L177:
	.align	2
.L176:
	.word	oldButtons
	.word	buttons
	.word	player
	.word	drawRect
	.word	ball
	.word	drawString
	.word	.LC9
	.word	state
	.size	update, .-update
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	update
	ldr	r3, .L180
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	draw
.L181:
	.align	2
.L180:
	.word	waitForVBlank
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	mov	r4, #67108864
	mov	r2, #0
	ldr	r3, .L194
	ldr	r6, .L194+4
	strh	r3, [r4]	@ movhi
	ldr	r0, .L194+8
	ldr	r3, .L194+12
	str	r2, [r6]
	mov	lr, pc
	bx	r3
	ldr	r7, .L194+16
	ldr	r5, .L194+20
	ldr	fp, .L194+24
	ldr	r10, .L194+28
	ldr	r9, .L194+32
	ldr	r8, .L194+36
.L183:
	ldr	r3, [r7]
	ldr	r2, [r6]
.L184:
	str	r3, [r5]
	ldr	r3, [r4, #304]
	str	r3, [r7]
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L184
.L186:
	.word	.L185
	.word	.L187
	.word	.L188
	.word	.L189
	.word	.L190
.L190:
	ldr	r3, .L194+40
	mov	lr, pc
	bx	r3
	b	.L183
.L189:
	ldr	r3, .L194+44
	mov	lr, pc
	bx	r3
	b	.L183
.L188:
	ldr	r3, .L194+48
	mov	lr, pc
	bx	r3
	b	.L183
.L187:
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
	mov	lr, pc
	bx	r8
	b	.L183
.L185:
	mov	lr, pc
	bx	fp
	b	.L183
.L195:
	.align	2
.L194:
	.word	1027
	.word	state
	.word	openbgBitmap
	.word	drawBackgroundImage3
	.word	buttons
	.word	oldButtons
	.word	start
	.word	update
	.word	waitForVBlank
	.word	draw
	.word	pause
	.word	lose
	.word	win
	.size	main, .-main
	.text
	.align	2
	.global	drawBlock
	.type	drawBlock, %function
drawBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxeq	lr
	b	drawBlock.part.5
	.size	drawBlock, .-drawBlock
	.align	2
	.global	eraseBlock
	.type	eraseBlock, %function
eraseBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #32]
	cmp	r3, #0
	bxne	lr
	b	eraseBlock.part.6
	.size	eraseBlock, .-eraseBlock
	.comm	deadBlocks,4,4
	.comm	score,4,4
	.comm	oldscore,4,4
	.comm	buffer,41,4
	.comm	oldBuffer,41,4
	.comm	state,4,4
	.comm	timer,4,4
	.comm	ball,28,4
	.comm	numblocks2,4,4
	.comm	blocksRow2,400,4
	.comm	numblocks,4,4
	.comm	blocksRow,400,4
	.comm	player,28,4
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	-1
	.word	1
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"WELCOME TO BREAKOUT! :D\000"
.LC2:
	.ascii	"PRESS START (ENTER KEY) TO PLAY...\000"
	.space	1
.LC3:
	.ascii	"%d\000"
	.space	1
.LC4:
	.ascii	"GAME IS PAUSED\000"
	.space	1
.LC5:
	.ascii	"PRESS START (ENTER) TO CONTINUE..\000"
	.space	2
.LC6:
	.ascii	"YOU WIN! :D\000"
.LC7:
	.ascii	"PRESS START (ENTER) TO PLAY AGAIN..\000"
.LC8:
	.ascii	"YOU LOST! :(\000"
	.space	3
.LC9:
	.ascii	"SCORE: \000"
	.ident	"GCC: (devkitARM release 45) 5.3.0"
