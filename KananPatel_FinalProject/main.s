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
	.global	goToInstruction
	.type	goToInstruction, %function
goToInstruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #256
	mov	r1, #7040
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #512
	mov	r4, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r3, .L6
.L2:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L2
	ldr	r5, .L6+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L6
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r2, #0
	ldr	r0, .L6+8
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L6+12
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L6+16
	mov	r2, #100663296
	ldr	r1, .L6+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L6+24
	ldr	r1, .L6+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #5
	ldr	r3, .L6+32
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L7:
	.align	2
.L6:
	.word	shadowOAM
	.word	DMANow
	.word	instructionPal
	.word	loadPalette
	.word	8672
	.word	instructionTiles
	.word	100718592
	.word	instructionMap
	.word	state
	.size	goToInstruction, .-goToInstruction
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #256
	mov	r1, #7040
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #512
	mov	r4, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r3, .L12
.L9:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L9
	ldr	r5, .L12+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #67108864
	mov	r2, #0
	ldr	r0, .L12+8
	strh	r2, [r3, #16]	@ movhi
	ldr	r1, .L12+12
	strh	r2, [r3, #18]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #3040
	mov	r2, #100663296
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L12+20
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #4
	ldr	r3, .L12+28
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	shadowOAM
	.word	DMANow
	.word	pausePal
	.word	loadPalette
	.word	pauseTiles
	.word	100718592
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	initPlayer
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	mov	r2, #0
	mov	r5, #115
	mov	r4, #40
	mov	lr, #31744
	mov	r1, #16
	mov	ip, #300
	mov	r0, #1
	ldr	r3, .L16
	str	r5, [r3]
	str	r4, [r3, #4]
	strh	lr, [r3, #52]	@ movhi
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #40]
	str	r2, [r3, #44]
	str	ip, [r3, #28]
	str	r0, [r3, #48]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initEnemy
	.type	initEnemy, %function
initEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r2, #0
	mov	r4, #212
	mov	lr, #160
	mov	r1, #16
	mov	ip, #31
	mov	r0, #200
	ldr	r3, .L20
	str	r4, [r3, #8]
	str	lr, [r3, #12]
	strh	ip, [r3, #52]	@ movhi
	str	r0, [r3, #28]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #48]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	enemy
	.size	initEnemy, .-initEnemy
	.align	2
	.global	initPTower
	.type	initPTower, %function
initPTower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r4, #60
	mov	r1, #0
	mov	lr, #70
	mov	ip, #40
	mov	r0, #100
	ldr	r3, .L24
	ldr	r2, [r3, #20]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	rsb	r2, r2, r4
	str	r4, [r3]
	str	lr, [r3, #16]
	str	r2, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	ptower
	.size	initPTower, .-initPTower
	.align	2
	.global	initETower
	.type	initETower, %function
initETower:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	ip, #0
	mov	r6, #60
	mov	r5, #70
	mov	r4, #40
	mov	lr, #100
	mov	r0, #360
	ldr	r3, .L28
	ldr	r3, [r3, #20]
	add	r3, r3, r3, lsr #31
	ldr	r2, .L28+4
	ldr	r1, .L28+8
	mov	r3, r3, asr #1
	rsb	r3, r3, #180
	str	r3, [r2, #4]
	ldmia	r1, {r1, r3}
	rsb	r3, r3, #220
	str	r3, [r2, #12]
	ldr	r3, .L28+12
	add	r1, r1, #5
	str	r6, [r2]
	str	r6, [r3]
	str	r5, [r2, #16]
	str	r5, [r3, #16]
	str	r4, [r2, #20]
	str	r4, [r3, #20]
	str	lr, [r2, #24]
	str	lr, [r3, #24]
	str	r1, [r2, #8]
	str	r1, [r3, #8]
	str	ip, [r2, #28]
	str	ip, [r3, #28]
	str	r0, [r3, #4]
	str	r0, [r3, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	ptower
	.word	etower
	.word	.LANCHOR0
	.word	etower2
	.size	initETower, .-initETower
	.align	2
	.global	initBullets
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	ip, #10
	mov	r5, #4
	mov	r6, #2
	mov	lr, #1
	mov	r4, r2
	ldr	r0, .L34
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #20]
	ldr	r0, [r0]
	add	r1, r3, r1
	ldr	r3, .L34+4
	stmia	r3, {r0, r1}
	ldr	r1, .L34+8
	str	r5, [r3, #28]
	str	r6, [r3, #16]
	str	lr, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	ip, [r1]
	ldr	r5, .L34+12
.L31:
	ldr	lr, .L34+4
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, r5, r4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #40
	ldmia	lr, {r0, r1}
	cmp	r4, #400
	stmia	ip, {r0, r1}
	bne	.L31
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	bullet
	.word	bulletCount
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initEBullets
	.type	initEBullets, %function
initEBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	ip, #1
	mov	r5, #2
	mov	lr, #4
	mov	r0, #10
	mov	r4, r2
	ldr	r1, .L40
	ldr	r3, .L40+4
	ldr	r6, [r1]
	ldr	r1, [r1, #4]
	str	r1, [r3, #4]
	ldr	r1, .L40+8
	str	r5, [r3, #16]
	str	r6, [r3]
	str	lr, [r3, #28]
	str	ip, [r3, #24]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #32]
	str	r0, [r1]
	ldr	r5, .L40+12
.L37:
	ldr	lr, .L40+4
	ldmia	lr!, {r0, r1, r2, r3}
	add	ip, r5, r4
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #40
	ldmia	lr, {r0, r1}
	cmp	r4, #400
	stmia	ip, {r0, r1}
	bne	.L37
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	enemy
	.word	ebullet
	.word	ebulletCount
	.word	ebullets
	.size	initEBullets, .-initEBullets
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #1
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r1, #16
	mov	r4, #0
	mov	lr, #160
	mov	r5, #40
	mov	ip, #31
	mov	r0, #200
	mov	r9, #115
	mov	r8, #31744
	mov	r7, #300
	mov	r6, #212
	ldr	r3, .L44
	str	r2, [r3, #48]
	ldr	r2, .L44+4
	str	r4, [r3, #8]
	str	lr, [r2, #12]
	str	r4, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #40]
	str	r4, [r3, #44]
	str	r9, [r3]
	strh	r8, [r3, #52]	@ movhi
	str	r7, [r3, #28]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	r5, [r3, #4]
	str	r1, [r2, #20]
	str	r1, [r2, #16]
	str	r4, [r2]
	str	r4, [r2, #4]
	str	r4, [r2, #24]
	str	r4, [r2, #48]
	str	r6, [r2, #8]
	strh	ip, [r2, #52]	@ movhi
	str	r0, [r2, #28]
	bl	initETower
	mov	ip, #60
	mov	r0, #70
	mov	r1, #100
	ldr	r3, .L44+8
	ldr	r2, [r3, #20]
	add	r2, r2, r2, lsr #31
	mov	r2, r2, asr #1
	rsb	r2, r2, ip
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3, #28]
	str	r5, [r3, #20]
	str	r2, [r3, #4]
	str	r0, [r3, #16]
	str	r1, [r3, #24]
	str	ip, [r3]
	bl	initBullets
	bl	initEBullets
	mov	r1, #9
	mov	r2, #96
	ldr	r3, .L44+12
	ldr	r0, .L44+16
	str	r1, [r3, #4]
	str	r4, [r0]
	str	r2, [r3]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.word	enemy
	.word	ptower
	.word	.LANCHOR0
	.word	time
	.size	initGame, .-initGame
	.align	2
	.global	shoot
	.type	shoot, %function
shoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	ldr	r3, .L50
	ldr	r2, [r3, #48]
	cmp	r2, r1
	str	r1, [r0, #32]
	beq	.L49
	cmp	r2, #0
	bxne	lr
	mvn	r1, #1
	add	r2, r3, #8
	ldmia	r2, {r2, ip}
	add	r3, r2, #5
	str	r3, [r0, #8]
	str	ip, [r0, #12]
	str	r1, [r0, #24]
	bx	lr
.L49:
	mov	ip, #2
	add	r1, r3, #8
	ldmia	r1, {r1, r2}
	ldr	r3, [r3, #20]
	add	r1, r1, #5
	add	r3, r2, r3
	str	r1, [r0, #8]
	str	r3, [r0, #12]
	str	ip, [r0, #24]
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.size	shoot, .-shoot
	.align	2
	.global	eshoot
	.type	eshoot, %function
eshoot:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #1
	ldr	r2, .L53
	ldr	r3, [r2, #8]
	ldr	r2, [r2, #12]
	add	r3, r3, #5
	str	r1, [r0, #32]
	str	r3, [r0, #8]
	str	r2, [r0, #12]
	bx	lr
.L54:
	.align	2
.L53:
	.word	enemy
	.size	eshoot, .-eshoot
	.align	2
	.global	ebulletCollison
	.type	ebulletCollison, %function
ebulletCollison:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	lr, [r1, #12]
	ldr	ip, [r0, #12]
	add	r3, lr, #16
	cmp	ip, r3
	movle	r3, #1
	movgt	r3, #0
	cmp	ip, lr
	movle	r3, #0
	cmp	r3, #0
	beq	.L56
	ldr	r3, [r1, #24]
	cmp	r3, #0
	beq	.L77
.L57:
	ldr	r1, [r2, #12]
	ldr	r3, [r2, #20]
	add	r3, r1, r3
	cmp	ip, r3
	movle	r3, #1
	movgt	r3, #0
	cmp	ip, r1
	movle	r3, #0
	cmp	r3, #0
	beq	.L60
	ldr	r3, [r2, #28]
	cmp	r3, #0
	bne	.L55
	ldr	r1, [r2, #24]
	sub	r1, r1, #10
	cmp	r1, #0
	str	r1, [r2, #24]
	str	r3, [r0, #32]
	beq	.L62
.L55:
	ldr	lr, [sp], #4
	bx	lr
.L60:
	ldr	r3, [r2, #24]
	cmp	r3, #0
	bne	.L55
	ldr	r3, [r2, #28]
	cmp	r3, #0
	bne	.L55
.L62:
	mov	r3, #1
	ldr	lr, [sp], #4
	str	r3, [r2, #28]
	bx	lr
.L56:
	ldr	r3, [r1, #28]
	cmp	r3, #0
	bne	.L57
	ldr	r3, [r1, #24]
	cmp	r3, #0
	bne	.L57
.L58:
	mov	r3, #1
	str	r3, [r1, #24]
	b	.L57
.L77:
	ldr	lr, [r1, #28]
	sub	lr, lr, #50
	cmp	lr, #0
	str	lr, [r1, #28]
	str	r3, [r0, #32]
	beq	.L58
	b	.L57
	.size	ebulletCollison, .-ebulletCollison
	.align	2
	.global	movePlayer
	.type	movePlayer, %function
movePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	r2, .L100
	beq	.L79
	ldr	r1, .L100+4
	ldr	ip, [r2, #4]
	ldr	lr, [r1, #4]
.L80:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	bne	.L85
	cmp	ip, #119
	ble	.L86
	cmp	lr, #272
	beq	.L97
.L88:
	cmp	lr, #272
	addlt	lr, lr, #1
	strlt	lr, [r1, #4]
.L89:
	mov	r3, #1
	str	r3, [r2, #48]
.L85:
	mov	r7, #67108864
	ldr	r0, [r1, #8]
	ldr	r4, .L100+8
	mov	r5, r0, asl #16
	mov	r6, lr, asl #16
	mov	r5, r5, lsr #16
	mov	r6, r6, lsr #16
	ldr	r3, [r1]
	add	r0, r0, #1
	strh	r6, [r7, #16]	@ movhi
	ldr	r6, [r4, #8]
	strh	r5, [r7, #20]	@ movhi
	ldr	r5, [r2]
	str	r0, [r1, #8]
	ldr	r1, [r4, #12]
	rsb	r6, r3, r6
	add	r5, r5, r3
	mov	r3, r3, asl #16
	add	ip, lr, ip
	mov	r3, r3, lsr #16
	rsb	lr, lr, r1
	strh	r3, [r7, #18]	@ movhi
	str	lr, [r4, #4]
	str	r6, [r4]
	str	r5, [r2, #8]
	str	ip, [r2, #12]
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L79:
	ldr	ip, [r2, #4]
	ldr	r1, .L100+4
	cmp	ip, #120
	ldr	lr, [r1, #4]
	ble	.L98
.L82:
	sub	ip, ip, #1
	str	ip, [r2, #4]
.L84:
	mov	r3, #0
	str	r3, [r2, #48]
	b	.L80
.L86:
	ldr	r3, [r2, #20]
	ldr	r0, [r2, #12]
	rsb	r3, r3, #512
	cmp	r0, r3
	bge	.L88
.L90:
	add	ip, ip, #1
	str	ip, [r2, #4]
	b	.L89
.L98:
	rsbs	r3, lr, #1
	movcc	r3, #0
	cmp	ip, #0
	movle	r3, #0
	cmp	r3, #0
	bne	.L99
	cmp	lr, #0
	subgt	lr, lr, #1
	strgt	lr, [r1, #4]
	b	.L84
.L97:
	ldr	r3, [r2, #20]
	ldr	r0, [r2, #12]
	rsb	r3, r3, #512
	cmp	r0, r3
	bge	.L89
	b	.L90
.L99:
	mov	lr, #0
	b	.L82
.L101:
	.align	2
.L100:
	.word	player
	.word	.LANCHOR0
	.word	enemy
	.size	movePlayer, .-movePlayer
	.align	2
	.global	animations
	.type	animations, %function
animations:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L106
	ldr	r3, .L106+4
	ldr	r1, [r0, #40]
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r1, r3, asl #2
	bne	.L103
	ldr	r2, [r0, #44]
	cmp	r2, #0
	moveq	r3, #1
	streq	r3, [r0, #44]
	beq	.L103
	cmp	r2, #1
	moveq	r3, #2
	streq	r3, [r0, #44]
	beq	.L103
	cmp	r2, #2
	streq	r3, [r0, #44]
.L103:
	add	r1, r1, #1
	str	r1, [r0, #40]
	bx	lr
.L107:
	.align	2
.L106:
	.word	player
	.word	1717986919
	.size	animations, .-animations
	.align	2
	.global	activateCheat
	.type	activateCheat, %function
activateCheat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #25
	mov	ip, #50
	ldr	r0, .L109
	ldr	r1, .L109+4
	ldr	r2, .L109+8
	str	ip, [r0, #28]
	str	r3, [r1, #24]
	str	r3, [r2, #24]
	bx	lr
.L110:
	.align	2
.L109:
	.word	enemy
	.word	etower
	.word	etower2
	.size	activateCheat, .-activateCheat
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L126
	ldr	r3, .L126+4
	ldrb	r2, [r1]	@ zero_extendqisi2
	ldr	r0, [r1, #48]
	stmfd	sp!, {r4, lr}
	strh	r2, [r3]	@ movhi
	ldr	r2, [r1, #4]
	cmp	r0, #0
	movne	r2, r2, asl #23
	mvnne	r2, r2, lsr #6
	mvnne	r2, r2, lsr #17
	moveq	r2, r2, asl #23
	subeq	r0, r0, #28672
	moveq	r2, r2, lsr #23
	orreq	r0, r2, r0
	streqh	r0, [r3, #2]	@ movhi
	ldr	r0, .L126+8
	strneh	r2, [r3, #2]	@ movhi
	ldr	r2, [r1, #44]
	ldr	ip, [r0, #24]
	mov	r2, r2, asl #23
	mov	r2, r2, lsr #16
	cmp	ip, #0
	strh	r2, [r3, #4]	@ movhi
	movne	r2, #512
	ldr	ip, .L126+4
	strneh	r2, [ip, #8]	@ movhi
	bne	.L115
	ldr	r4, [r0, #48]
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldr	r0, [r0, #4]
	cmp	r4, #0
	movne	r0, r0, asl #23
	mvnne	r0, r0, lsr #6
	mvnne	r0, r0, lsr #17
	strh	lr, [ip, #8]	@ movhi
	moveq	r0, r0, asl #23
	ldreq	lr, .L126+12
	moveq	r0, r0, lsr #23
	add	r2, r2, #4
	orreq	lr, r0, lr
	orr	r2, r2, #8192
	streqh	lr, [ip, #10]	@ movhi
	strneh	r0, [ip, #10]	@ movhi
	strh	r2, [r3, #12]	@ movhi
.L115:
	ldr	r2, .L126+16
	ldr	r2, [r2, #28]
	cmp	r2, #0
	movne	r2, #512
	strneh	r2, [r3, #16]	@ movhi
	bne	.L119
	ldr	r2, .L126+20
	ldmia	r2, {r0, r2}
	sub	r0, r0, #15
	rsb	r2, r2, #15
	and	r0, r0, #255
	mov	r2, r2, asl #23
	mvn	r0, r0, asl #17
	mvn	r2, r2, lsr #5
	mvn	r0, r0, lsr #17
	mvn	r2, r2, lsr #18
	ldr	ip, [r1, #44]
	mov	ip, ip, asl #8
	add	ip, ip, #8
	orr	ip, ip, #4096
	strh	r0, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	strh	ip, [r3, #20]	@ movhi
.L119:
	ldr	r2, .L126+24
	ldr	r2, [r2, #28]
	cmp	r2, #0
	movne	r2, #512
	strneh	r2, [r3, #24]	@ movhi
	bne	.L121
	ldr	r2, .L126+20
	ldmia	r2, {r0, r2}
	sub	r0, r0, #15
	rsb	r2, r2, #220
	and	r0, r0, #255
	mov	r2, r2, asl #23
	mvn	r0, r0, asl #17
	mvn	r2, r2, lsr #5
	mvn	r0, r0, lsr #17
	mvn	r2, r2, lsr #18
	ldr	ip, [r1, #44]
	mov	ip, ip, asl #8
	add	ip, ip, #8
	orr	ip, ip, #4096
	strh	r0, [r3, #24]	@ movhi
	strh	r2, [r3, #26]	@ movhi
	strh	ip, [r3, #28]	@ movhi
.L121:
	ldr	r2, .L126+28
	ldr	r0, [r2, #28]
	cmp	r0, #0
	bne	.L122
	ldr	r2, [r2, #4]
	cmp	r2, #240
	bgt	.L122
	ldr	r0, .L126+20
	ldr	r0, [r0]
	sub	r0, r0, #15
	mov	r2, r2, asl #23
	and	r0, r0, #255
	mvn	r2, r2, lsr #5
	mvn	r0, r0, asl #17
	mvn	r2, r2, lsr #18
	mvn	r0, r0, lsr #17
	ldr	r1, [r1, #44]
	mov	r1, r1, asl #8
	add	r1, r1, #8
	orr	r1, r1, #4096
	strh	r1, [r3, #36]	@ movhi
	strh	r2, [r3, #34]	@ movhi
	strh	r0, [r3, #32]	@ movhi
	ldmfd	sp!, {r4, lr}
	bx	lr
.L122:
	mov	r2, #512
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #32]	@ movhi
	bx	lr
.L127:
	.align	2
.L126:
	.word	player
	.word	shadowOAM
	.word	enemy
	.word	-28672
	.word	ptower
	.word	.LANCHOR0
	.word	etower
	.word	etower2
	.size	updateOAM, .-updateOAM
	.align	2
	.global	updateBulletOAM
	.type	updateBulletOAM, %function
updateBulletOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L137
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	stmfd	sp!, {r4, r5, lr}
	mov	r1, #0
	mov	r5, #512
	mov	r4, #12
	ldr	r3, .L137+4
	ldr	r2, .L137+8
.L132:
	ldr	r0, [r3]
	cmp	r0, #0
	ldrne	r0, [r3, #-28]
	ldrneb	lr, [r3, #-32]	@ zero_extendqisi2
	bicne	r0, r0, #65024
	add	r1, r1, #1
	strneh	r4, [r2, #44]	@ movhi
	strneh	r0, [r2, #42]	@ movhi
	strneh	lr, [r2, #40]	@ movhi
	streqh	r5, [r2, #40]	@ movhi
	cmp	r1, ip
	add	r3, r3, #40
	add	r2, r2, #8
	blt	.L132
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	bulletCount
	.word	bullets+32
	.word	shadowOAM
	.size	updateBulletOAM, .-updateBulletOAM
	.align	2
	.global	updateEBulletOAM
	.type	updateEBulletOAM, %function
updateEBulletOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L148
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	stmfd	sp!, {r4, r5, lr}
	mov	r1, #0
	mov	r5, #512
	mov	r4, #12
	ldr	r3, .L148+4
	ldr	r2, .L148+8
.L143:
	ldr	r0, [r3]
	cmp	r0, #0
	ldrne	r0, [r3, #-28]
	ldrneb	lr, [r3, #-32]	@ zero_extendqisi2
	bicne	r0, r0, #65024
	add	r1, r1, #1
	strneh	r4, [r2, #124]	@ movhi
	strneh	r0, [r2, #122]	@ movhi
	strneh	lr, [r2, #120]	@ movhi
	streqh	r5, [r2, #120]	@ movhi
	cmp	r1, ip
	add	r3, r3, #40
	add	r2, r2, #8
	blt	.L143
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L149:
	.align	2
.L148:
	.word	ebulletCount
	.word	ebullets+32
	.word	shadowOAM
	.size	updateEBulletOAM, .-updateEBulletOAM
	.align	2
	.global	updateEBullets
	.type	updateEBullets, %function
updateEBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L157
	ldr	r1, .L158
	ldr	r3, [r0, #12]
	ldr	r2, [r1, #4]
	sub	r3, r3, #2
	ldr	ip, [r0, #28]
	rsb	r2, r2, r3
	cmp	r2, ip
	str	r3, [r0, #12]
	movlt	r3, #0
	stmfd	sp!, {r4, lr}
	ldr	lr, [r1]
	ldr	r1, [r0, #8]
	rsb	r1, lr, r1
	stmia	r0, {r1, r2}
	strlt	r3, [r0, #32]
	ldr	r2, .L158+4
	ldr	r1, .L158+8
	bl	ebulletCollison
	ldmfd	sp!, {r4, lr}
	b	updateEBulletOAM
.L157:
	b	updateEBulletOAM
.L159:
	.align	2
.L158:
	.word	.LANCHOR0
	.word	ptower
	.word	player
	.size	updateEBullets, .-updateEBullets
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L163
.L161:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L161
	bx	lr
.L164:
	.align	2
.L163:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L166
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L167:
	.align	2
.L166:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L170+8
	ldr	r2, [r2]
	ldr	r7, .L170+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r6, [r2, #20]
	mov	r1, r0
	ldr	r2, .L170+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L170+20
	mov	lr, pc
	bx	r4
	strh	r6, [r7, #2]	@ movhi
	mov	r1, r5
	ldr	r3, .L170+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	ldr	r4, .L170+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7]	@ movhi
	strh	r3, [r7, #2]	@ movhi
	mov	r0, r9
	ldr	r7, .L170+32
	str	r9, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #28]
	str	r8, [r4]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r6, .L170+36
	adr	r3, .L170
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L170+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L170+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L171:
	.align	3
.L170:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	goToStart
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #256
	mov	r1, #7040
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #512
	mov	r4, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r3, .L176
.L173:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L173
	ldr	r0, .L176+4
	ldr	r3, .L176+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L176+12
	ldr	r3, .L176+16
	mov	r2, #100663296
	ldr	r1, .L176+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L176+24
	ldr	r1, .L176+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1
	ldr	r2, .L176+32
	ldr	r1, .L176+36
	ldr	r0, .L176+40
	bl	playSoundA
	mov	r2, #0
	ldr	r3, .L176+44
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L177:
	.align	2
.L176:
	.word	shadowOAM
	.word	startPal
	.word	loadPalette
	.word	DMANow
	.word	19552
	.word	startTiles
	.word	100718592
	.word	startMap
	.word	11025
	.word	1835530
	.word	LoginScreenLoop
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.type	lose.part.2, %function
lose.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L180
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L181:
	.align	2
.L180:
	.word	buttons
	.size	lose.part.2, .-lose.part.2
	.set	win.part.1,lose.part.2
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L184
	ldr	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.2
.L185:
	.align	2
.L184:
	.word	oldButtons
	.size	lose, .-lose
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, #0
	ldr	r3, .L192
	ldr	r0, .L192+4
	ldr	r2, [r3]
	ldr	lr, .L192+8
	ldr	ip, .L192+12
	str	r4, [r2, #20]
	mov	r3, #1
	str	r4, [r2, #32]
	ldr	r1, .L192+16
	strh	r4, [r0, #2]	@ movhi
	ldr	r2, .L192+20
	strh	r4, [r0, #6]	@ movhi
	ldr	r0, .L192+24
	str	r4, [lr, #12]
	str	r4, [ip, #12]
	bl	playSoundA
	mov	r3, #67108864
	mov	r1, #4864
	mov	r0, #23552
	ldr	r2, .L192+28
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #10]	@ movhi
	ldr	r0, .L192+32
	ldr	r3, .L192+36
	mov	lr, pc
	bx	r3
	ldr	r5, .L192+40
	mov	r3, #2624
	mov	r2, #100663296
	ldr	r1, .L192+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	ldr	r2, .L192+48
	ldr	r1, .L192+52
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1936
	ldr	r2, .L192+56
	ldr	r1, .L192+60
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L192+64
	ldr	r1, .L192+68
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r1, #512
	ldr	r2, .L192+72
.L189:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L189
	mov	r3, #16384
	ldr	r2, .L192+76
	ldr	r1, .L192+80
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #256
	ldr	r2, .L192+84
	ldr	r1, .L192+88
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #1
	ldr	r3, .L192+92
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L193:
	.align	2
.L192:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.word	794304
	.word	11025
	.word	gamemusic
	.word	6404
	.word	landPal
	.word	loadPalette
	.word	DMANow
	.word	landTiles
	.word	100720640
	.word	landMap
	.word	100679680
	.word	skyTiles
	.word	100714496
	.word	skyMap
	.word	shadowOAM
	.word	100728832
	.word	spritesample2Tiles
	.word	83886592
	.word	spritesample2Pal
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L206
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L195
	ldr	r2, .L206+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L205
.L195:
	tst	r3, #1
	beq	.L194
	ldr	r3, .L206+4
	ldr	r3, [r3]
	tst	r3, #1
	ldmeqfd	sp!, {r4, lr}
	beq	goToInstruction
.L194:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L205:
	bl	goToGame
	bl	initGame
	ldr	r3, [r4]
	b	.L195
.L207:
	.align	2
.L206:
	.word	oldButtons
	.word	buttons
	.size	start, .-start
	.align	2
	.global	instruction
	.type	instruction, %function
instruction:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L220
	ldr	r3, [r4]
	tst	r3, #8
	beq	.L209
	ldr	r2, .L220+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L219
.L209:
	tst	r3, #1
	beq	.L208
	ldr	r3, .L220+4
	ldr	r3, [r3]
	tst	r3, #1
	ldmeqfd	sp!, {r4, lr}
	beq	goToStart
.L208:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L219:
	bl	goToGame
	bl	initGame
	ldr	r3, [r4]
	b	.L209
.L221:
	.align	2
.L220:
	.word	oldButtons
	.word	buttons
	.size	instruction, .-instruction
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L227
	ldr	r3, [r3]
	tst	r3, #256
	bxeq	lr
	ldr	r3, .L227+4
	ldr	r3, [r3]
	tst	r3, #256
	bxne	lr
	b	goToGame
.L228:
	.align	2
.L227:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r6, #0
	mov	r5, r2
	ldr	r2, .L231+8
	ldr	r2, [r2]
	ldr	r7, .L231+12
	mov	r9, r1
	mov	r8, r0
	mov	r10, r3
	str	r6, [r2, #32]
	mov	r1, r0
	ldr	r2, .L231+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L231+20
	mov	lr, pc
	bx	r4
	strh	r6, [r7, #6]	@ movhi
	mov	r1, r5
	ldr	r3, .L231+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	ldr	r4, .L231+28
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r7, #4]	@ movhi
	strh	r3, [r7, #6]	@ movhi
	mov	r0, r9
	ldr	r7, .L231+32
	str	r9, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #28]
	str	r8, [r4]
	str	r10, [r4, #16]
	mov	lr, pc
	bx	r7
	ldr	r6, .L231+36
	adr	r3, .L231
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r8, r0
	mov	r0, r5
	mov	r9, r1
	mov	lr, pc
	bx	r7
	ldr	r5, .L231+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L231+44
	mov	lr, pc
	bx	r3
	mov	r3, #1
	str	r0, [r4, #20]
	str	r3, [r4, #12]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L232:
	.align	3
.L231:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #0
	ldr	r2, .L237
	ldr	r1, .L237+4
	ldr	r0, .L237+8
	bl	playSoundB
	mov	r4, #0
	mov	r2, #512
	ldr	r3, .L237+12
.L234:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L234
	ldr	r5, .L237+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L237+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #7040
	ldr	r1, .L237+20
	strh	r0, [r2, #8]	@ movhi
	ldr	r6, .L237+24
	str	r3, [r1]
	ldr	r0, .L237+28
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	str	r3, [r1, #4]
	mov	lr, pc
	bx	r6
	ldr	r3, .L237+32
	mov	r2, #100663296
	ldr	r1, .L237+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L237+40
	ldr	r1, .L237+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L237+48
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L238:
	.align	2
.L237:
	.word	11025
	.word	19584
	.word	Victory
	.word	shadowOAM
	.word	DMANow
	.word	.LANCHOR0
	.word	loadPalette
	.word	winPal
	.word	20192
	.word	winTiles
	.word	100718592
	.word	winMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #0
	ldr	r2, .L243
	ldr	r1, .L243+4
	ldr	r0, .L243+8
	bl	playSoundB
	mov	r4, #0
	mov	r2, #512
	ldr	r3, .L243+12
.L240:
	strh	r2, [r3, r4]	@ movhi
	add	r4, r4, #8
	cmp	r4, #1024
	bne	.L240
	ldr	r5, .L243+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L243+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #7040
	ldr	r1, .L243+20
	strh	r0, [r2, #8]	@ movhi
	ldr	r6, .L243+24
	str	r3, [r1]
	ldr	r0, .L243+28
	strh	r3, [r2, #16]	@ movhi
	strh	r3, [r2, #18]	@ movhi
	str	r3, [r1, #4]
	mov	lr, pc
	bx	r6
	ldr	r3, .L243+32
	mov	r2, #100663296
	ldr	r1, .L243+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	ldr	r2, .L243+40
	ldr	r1, .L243+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #2
	ldr	r3, .L243+48
	ldmfd	sp!, {r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L244:
	.align	2
.L243:
	.word	11025
	.word	18144
	.word	Defeat
	.word	shadowOAM
	.word	DMANow
	.word	.LANCHOR0
	.word	loadPalette
	.word	losePal
	.word	17056
	.word	loseTiles
	.word	100718592
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	bulletCollision
	.type	bulletCollision, %function
bulletCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, [r0, #12]
	ldr	r3, [r0, #28]
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r4, r0
	ldr	r0, [r1, #12]
	add	r3, ip, r3
	cmp	r3, r0
	mov	r5, r2
	blt	.L246
	ldr	r2, [r1, #24]
	cmp	r2, #0
	bne	.L247
.L251:
	mov	r0, #0
	ldr	r2, [r1, #28]
	sub	r2, r2, #50
	cmp	r2, r0
	str	r2, [r1, #28]
	str	r0, [r4, #32]
	beq	.L248
.L249:
	ldr	r2, [r5, #12]
	cmp	r3, r2
	blt	.L252
.L272:
	ldr	r3, [r5, #20]
	add	r2, r2, r3
	cmp	r2, ip
	blt	.L252
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L245
	ldr	r2, [r5, #24]
	sub	r2, r2, #25
	cmp	r2, #0
	str	r2, [r5, #24]
	str	r3, [r4, #32]
	beq	.L254
.L245:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L246:
	add	r2, r0, #16
	cmp	ip, r2
	movle	r2, #1
	movgt	r2, #0
	cmp	ip, r0
	movle	r2, #0
	cmp	r2, #0
	beq	.L250
	ldr	r2, [r1, #24]
	cmp	r2, #0
	beq	.L251
	b	.L249
.L247:
	add	r2, r0, #16
	cmp	ip, r2
	movle	r2, #1
	movgt	r2, #0
	cmp	ip, r0
	movle	r2, #0
	cmp	r2, #0
	bne	.L249
.L250:
	ldr	r2, [r1, #28]
	cmp	r2, #0
	bne	.L249
	ldr	r2, [r1, #24]
	cmp	r2, #0
	bne	.L249
.L248:
	mov	r2, #1
	mov	r3, #0
	str	r2, [r1, #24]
	ldr	r0, .L273
	ldr	r2, .L273+4
	ldr	r1, .L273+8
	bl	playSoundB
	ldr	ip, [r4, #12]
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #12]
	add	r3, ip, r3
	cmp	r3, r2
	bge	.L272
.L252:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L245
	ldr	r3, [r5, #28]
	cmp	r3, #0
	bne	.L245
.L254:
	mov	r3, #1
	str	r3, [r5, #28]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L274:
	.align	2
.L273:
	.word	EnemySlain
	.word	11025
	.word	33984
	.size	bulletCollision, .-bulletCollision
	.align	2
	.global	updateBullets
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L285
	add	r1, r0, #24
	ldmia	r1, {r1, r2}
	ldr	r3, [r0, #12]
	add	r3, r3, r1
	cmp	r3, r2
	movge	r1, #0
	movlt	r1, #1
	rsb	r2, r2, #512
	cmp	r3, r2
	movle	r2, r1
	orrgt	r2, r1, #1
	stmfd	sp!, {r4, lr}
	ldr	lr, .L286
	ldr	ip, [lr, #4]
	cmp	r2, #0
	rsb	ip, ip, r3
	str	r3, [r0, #12]
	movne	r3, #0
	mov	r4, r0
	ldr	lr, [lr]
	ldr	r1, [r0, #8]
	rsb	r2, lr, r1
	stmia	r0, {r2, ip}
	strne	r3, [r0, #32]
	ldr	r2, .L286+4
	ldr	r1, .L286+8
	bl	bulletCollision
	mov	r0, r4
	ldr	r2, .L286+12
	ldr	r1, .L286+8
	bl	bulletCollision
	ldmfd	sp!, {r4, lr}
	b	updateBulletOAM
.L285:
	b	updateBulletOAM
.L287:
	.align	2
.L286:
	.word	.LANCHOR0
	.word	etower
	.word	enemy
	.word	etower2
	.size	updateBullets, .-updateBullets
	.global	__aeabi_idivmod
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r7, .L349
	bl	movePlayer
	bl	animations
	ldr	r3, [r7]
	tst	r3, #1
	bne	.L337
	ldr	r6, .L349+4
.L289:
	ldr	r3, [r6]
	cmp	r3, #0
	ble	.L296
.L299:
	mov	r4, #0
	ldr	r5, .L349+8
.L297:
	mov	r0, r5
	bl	updateBullets
	ldr	r3, [r6]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #40
	bgt	.L297
.L296:
	ldr	r8, .L349+12
	ldr	r3, [r8, #24]
	cmp	r3, #0
	beq	.L291
	ldr	r6, .L349+16
.L300:
	ldr	r3, [r6]
	cmp	r3, #0
	movgt	r5, #0
	ldrgt	r4, .L349+20
	ble	.L310
.L309:
	mov	r0, r4
	bl	updateEBullets
	ldr	r3, [r6]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #40
	bgt	.L309
.L310:
	ldr	r4, .L349+24
	ldr	r2, .L349+28
	ldr	r3, [r4, #12]
	ldr	r2, [r2, #4]
	rsb	r3, r2, r3
	str	r3, [r4, #4]
	ldr	r5, .L349+32
	bl	updateOAM
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L349+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, [r7]
	tst	r3, #256
	beq	.L308
	ldr	r3, .L349+40
	ldr	r3, [r3]
	tst	r3, #256
	beq	.L345
.L308:
	ldr	r3, .L349+44
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L311
	ldr	r3, .L349+48
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L311
.L312:
	ldr	r5, .L349+52
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L313
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L346
.L313:
	ldr	r3, [r7]
	tst	r3, #2
	beq	.L288
	ldr	r3, .L349+40
	ldr	r3, [r3]
	tst	r3, #2
	moveq	r3, #25
	moveq	r2, #50
	streq	r3, [r5, #24]
	streq	r2, [r8, #28]
	streq	r3, [r4, #24]
.L288:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L311:
	bl	goToLose
	b	.L312
.L291:
	ldr	r2, .L349+56
	ldr	r3, [r2]
	ldr	r4, .L349+60
	add	r3, r3, #1
	mov	r0, r3
	ldr	r1, [r4]
	ldr	r5, .L349+64
	str	r3, [r2]
	mov	lr, pc
	bx	r5
	cmp	r1, #0
	ldr	r6, .L349+16
	bne	.L300
	ldr	r0, [r6]
	cmp	r0, #0
	ble	.L301
	ldr	ip, .L349+20
	ldr	r3, [ip, #32]
	cmp	r3, #0
	movne	r3, ip
	bne	.L304
	b	.L347
.L305:
	ldr	r2, [r3, #32]
	cmp	r2, #0
	beq	.L302
.L304:
	add	r1, r1, #1
	cmp	r0, r1
	add	r3, r3, #40
	bne	.L305
.L301:
	ldr	r3, .L349+68
	mov	lr, pc
	bx	r3
	ldr	r3, .L349+72
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #3
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	rsb	r3, r3, r0
	add	r3, r3, #200
	str	r3, [r4]
	b	.L300
.L337:
	ldr	r3, .L349+40
	ldr	r3, [r3]
	ands	r3, r3, #1
	ldr	r6, .L349+4
	bne	.L289
	ldr	r0, [r6]
	cmp	r0, #0
	ble	.L296
	ldr	ip, .L349+8
	ldr	r2, [ip, #32]
	cmp	r2, #0
	movne	r2, ip
	beq	.L348
.L295:
	add	r3, r3, #1
	cmp	r3, r0
	add	r2, r2, #40
	beq	.L299
	ldr	r1, [r2, #32]
	cmp	r1, #0
	bne	.L295
	add	r3, r3, r3, lsl #2
	add	r0, ip, r3, lsl #3
.L293:
	bl	shoot
	b	.L289
.L346:
	bl	goToWin
	b	.L313
.L345:
	bl	goToPause
	b	.L308
.L347:
	mov	r1, r3
.L302:
	mov	r0, #1
	ldr	r3, [r8, #8]
	add	r1, r1, r1, lsl #2
	ldr	r2, [r8, #12]
	add	r1, ip, r1, lsl #3
	add	r3, r3, #5
	str	r0, [r1, #32]
	str	r3, [r1, #8]
	str	r2, [r1, #12]
	b	.L301
.L348:
	mov	r0, ip
	b	.L293
.L350:
	.align	2
.L349:
	.word	oldButtons
	.word	bulletCount
	.word	bullets
	.word	enemy
	.word	ebulletCount
	.word	ebullets
	.word	etower2
	.word	.LANCHOR0
	.word	DMANow
	.word	shadowOAM
	.word	buttons
	.word	player
	.word	ptower
	.word	etower
	.word	time
	.word	.LANCHOR1
	.word	__aeabi_idivmod
	.word	rand
	.word	1374389535
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
	mov	r5, #67108864
	stmfd	sp!, {r4, r7, fp, lr}
	mov	lr, #1
	mov	r7, #128
	mov	r6, #0
	ldr	r3, .L371
	ldrh	r1, [r5, #4]
	ldrh	r2, [r3]
	ldr	r4, .L371+4
	ldr	r0, .L371+8
	ldr	ip, .L371+12
	orr	r1, r1, #8
	orr	r2, r2, lr
	strh	r7, [r5, #132]	@ movhi
	strh	r6, [r5, #128]	@ movhi
	strh	r4, [r5, #130]	@ movhi
	strh	r1, [r5, #4]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	str	ip, [r0, #4092]
	ldr	r3, .L371+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L371+20
	ldr	r8, .L371+24
	ldr	r7, .L371+28
	ldr	fp, .L371+32
	ldr	r10, .L371+36
	ldr	r9, .L371+40
	ldr	r6, .L371+44
.L360:
	ldr	r2, [r4]
	str	r2, [r8]
	ldr	r3, [r7]
	ldr	r1, [r5, #304]
	str	r1, [r4]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L352
.L354:
	.word	.L353
	.word	.L355
	.word	.L356
	.word	.L357
	.word	.L358
	.word	.L359
.L359:
	mov	lr, pc
	bx	r9
.L352:
	mov	lr, pc
	bx	r6
	b	.L360
.L358:
	tst	r2, #256
	beq	.L352
	tst	r1, #256
	bne	.L352
	ldr	r3, .L371+48
	mov	lr, pc
	bx	r3
	b	.L352
.L357:
	tst	r2, #8
	beq	.L352
	ldr	r3, .L371+52
	mov	lr, pc
	bx	r3
	b	.L352
.L356:
	tst	r2, #8
	beq	.L352
	ldr	r3, .L371+56
	mov	lr, pc
	bx	r3
	b	.L352
.L353:
	mov	lr, pc
	bx	fp
	b	.L352
.L355:
	mov	lr, pc
	bx	r10
	b	.L352
.L372:
	.align	2
.L371:
	.word	67109376
	.word	-1266
	.word	50360320
	.word	interruptHandler
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	game
	.word	instruction
	.word	waitForVblank
	.word	goToGame
	.word	lose.part.2
	.word	win.part.1
	.size	main, .-main
	.text
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L390
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L387
	ldr	r0, .L390+4
	ldr	r3, [r0, #12]
	cmp	r3, r2
	stmfd	sp!, {r4, lr}
	beq	.L376
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L376
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L388
	ldr	r1, .L390+8
	ldr	r2, .L390+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #20]
	strh	r3, [r2, #2]	@ movhi
.L376:
	ldr	r0, .L390+16
	ldr	r3, [r0, #12]
	cmp	r3, #0
	beq	.L380
	ldr	r3, [r0, #28]
	ldr	r2, [r0, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r0, #28]
	blt	.L380
	ldr	r3, [r0, #16]
	cmp	r3, #0
	bne	.L389
	ldr	r1, .L390+8
	ldr	r2, .L390+12
	ldr	r1, [r1]
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
.L380:
	mov	r2, #1
	ldr	r3, .L390
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L390
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L387:
	mov	r2, #1
	ldr	r3, .L390
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L388:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundA
	b	.L376
.L389:
	ldmia	r0, {r0, r1, r2}
	bl	playSoundB
	b	.L380
.L391:
	.align	2
.L390:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L393
	ldr	r0, .L393+4
	ldr	r1, .L393+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L394:
	.align	2
.L393:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L396
	ldr	ip, .L396+4
	ldr	r0, .L396+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L397:
	.align	2
.L396:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L399
	ldr	ip, .L399+4
	ldr	r1, [r2]
	ldr	r0, .L399+8
	ldr	r2, .L399+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	str	r3, [r1, #32]
	str	r3, [r0, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L400:
	.align	2
.L399:
	.word	dma
	.word	soundA
	.word	soundB
	.word	67109120
	.size	stopSound, .-stopSound
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L403
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L403+4
	ldr	ip, .L403+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L404:
	.align	2
.L403:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.comm	soundB,32,4
	.comm	soundA,32,4
	.global	vOff
	.global	hOff2
	.global	hOff
	.comm	buttons,4,4
	.comm	oldButtons,4,4
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	buffer,41,4
	.comm	oldBuffer,41,4
	.global	nextBulletSpawn
	.comm	time,4,4
	.comm	ebulletCount,4,4
	.comm	ebullet,40,4
	.comm	ebullets,400,4
	.comm	bulletCount,4,4
	.comm	bullet,40,4
	.comm	bullets,400,4
	.comm	etower2,44,4
	.comm	etower,44,4
	.comm	ptower,44,4
	.comm	enemy,56,4
	.comm	player,56,4
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	nextBulletSpawn, %object
	.size	nextBulletSpawn, 4
nextBulletSpawn:
	.word	32
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	hOff2, %object
	.size	hOff2, 4
hOff2:
	.space	4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
