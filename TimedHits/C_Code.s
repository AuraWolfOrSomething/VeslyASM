	.cpu arm7tdmi
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"C_Code.c"
@ GNU C17 (devkitARM release 56) version 11.1.0 (arm-none-eabi)
@	compiled by GNU C version 10.3.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.18-GMP

@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed: -mcpu=arm7tdmi -mthumb -mthumb-interwork -mtune=arm7tdmi -mlong-calls -march=armv4t -O2
	.text
	.align	1
	.p2align 2,,3
	.global	AreTimedHitsEnabled
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	AreTimedHitsEnabled, %function
AreTimedHitsEnabled:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	ldr	r3, .L8	@ tmp122,
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	ldrh	r2, [r3]	@ gBattleStats, gBattleStats
	movs	r3, #252	@ tmp126,
	lsls	r3, r3, #2	@ tmp126, tmp126,
@ C_Code.c:94: int AreTimedHitsEnabled(void) { 
	push	{r4, lr}	@
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	tst	r2, r3	@ gBattleStats, tmp126
	bne	.L3		@,
@ C_Code.c:98: 	if (TimedHitsDifficultyRam->off) { return false; } 
	ldr	r3, .L8+4	@ tmp131,
	ldr	r3, [r3]	@ TimedHitsDifficultyRam, TimedHitsDifficultyRam
	ldrb	r3, [r3]	@ *TimedHitsDifficultyRam.0_4, *TimedHitsDifficultyRam.0_4
@ C_Code.c:96: 		return false; 
	movs	r0, #0	@ <retval>,
@ C_Code.c:98: 	if (TimedHitsDifficultyRam->off) { return false; } 
	lsls	r3, r3, #25	@ tmp152, *TimedHitsDifficultyRam.0_4,
	bpl	.L7		@,
.L1:
@ C_Code.c:100: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L7:
@ C_Code.c:99: 	return !CheckFlag(DisabledFlag); 
	ldr	r3, .L8+8	@ tmp141,
	ldr	r0, [r3]	@ DisabledFlag, DisabledFlag
	ldr	r3, .L8+12	@ tmp143,
	bl	.L10		@
@ C_Code.c:99: 	return !CheckFlag(DisabledFlag); 
	rsbs	r3, r0, #0	@ tmp148, tmp150
	adcs	r0, r0, r3	@ <retval>, tmp150, tmp148
	b	.L1		@
.L3:
@ C_Code.c:96: 		return false; 
	movs	r0, #0	@ <retval>,
	b	.L1		@
.L9:
	.align	2
.L8:
	.word	gBattleStats
	.word	TimedHitsDifficultyRam
	.word	DisabledFlag
	.word	CheckFlag
	.size	AreTimedHitsEnabled, .-AreTimedHitsEnabled
	.align	1
	.p2align 2,,3
	.global	InitVariables
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	InitVariables, %function
InitVariables:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:108: 	proc->timer2 = 0xFF; 
	movs	r2, #255	@ tmp120,
@ C_Code.c:122: } 
	@ sp needed	@
@ C_Code.c:108: 	proc->timer2 = 0xFF; 
	str	r2, [r0, #68]	@ tmp120, MEM <unsigned int> [(unsigned char *)proc_2(D) + 68B]
@ C_Code.c:105: 	proc->broke = false; 
	movs	r2, #255	@ tmp121,
	lsls	r2, r2, #16	@ tmp121, tmp121,
	str	r2, [r0, #72]	@ tmp121, MEM <unsigned int> [(unsigned char *)proc_2(D) + 72B]
@ C_Code.c:119: 	proc->code4frame = 0xff;
	ldr	r2, .L12	@ tmp122,
@ C_Code.c:103: 	proc->anim = NULL; 
	movs	r3, #0	@ tmp114,
@ C_Code.c:119: 	proc->code4frame = 0xff;
	str	r2, [r0, #76]	@ tmp122, MEM <unsigned int> [(unsigned char *)proc_2(D) + 76B]
@ C_Code.c:118: 	proc->buttonsToPress = 0; 
	movs	r2, #80	@ tmp123,
@ C_Code.c:103: 	proc->anim = NULL; 
	str	r3, [r0, #44]	@ tmp114, proc_2(D)->anim
@ C_Code.c:104: 	proc->anim2 = NULL; 
	str	r3, [r0, #48]	@ tmp114, proc_2(D)->anim2
@ C_Code.c:107: 	proc->timer = 0; 
	str	r3, [r0, #52]	@ tmp114, proc_2(D)->timer
@ C_Code.c:113: 	proc->currentRound = NULL; 
	str	r3, [r0, #56]	@ tmp114, proc_2(D)->currentRound
@ C_Code.c:114: 	proc->active_bunit = NULL; 
	str	r3, [r0, #60]	@ tmp114, proc_2(D)->active_bunit
@ C_Code.c:115: 	proc->opp_bunit = NULL; 
	str	r3, [r0, #64]	@ tmp114, proc_2(D)->opp_bunit
@ C_Code.c:118: 	proc->buttonsToPress = 0; 
	strh	r3, [r0, r2]	@ tmp114, proc_2(D)->buttonsToPress
@ C_Code.c:122: } 
	bx	lr
.L13:
	.align	2
.L12:
	.word	-16646145
	.size	InitVariables, .-InitVariables
	.align	1
	.p2align 2,,3
	.global	StartTimedHitsProc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	StartTimedHitsProc, %function
StartTimedHitsProc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ C_Code.c:126: 	proc = Proc_Find(TimedHitsProcCmd); 
	ldr	r4, .L17	@ tmp114,
	ldr	r3, .L17+4	@ tmp115,
	movs	r0, r4	@, tmp114
	bl	.L10		@
@ C_Code.c:127: 	if (!proc) { 
	cmp	r0, #0	@ tmp118,
	beq	.L16		@,
.L14:
@ C_Code.c:131: } 
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L16:
@ C_Code.c:128: 		proc = Proc_Start(TimedHitsProcCmd, (void*)3); 
	movs	r1, #3	@,
	movs	r0, r4	@, tmp114
	ldr	r3, .L17+8	@ tmp117,
	bl	.L10		@
@ C_Code.c:131: } 
	b	.L14		@
.L18:
	.align	2
.L17:
	.word	.LANCHOR0
	.word	Proc_Find
	.word	Proc_Start
	.size	StartTimedHitsProc, .-StartTimedHitsProc
	.align	1
	.p2align 2,,3
	.global	SetCurrentAnimInProc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SetCurrentAnimInProc, %function
SetCurrentAnimInProc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ C_Code.c:136: 	proc = Proc_Find(TimedHitsProcCmd); 
	ldr	r3, .L25	@ tmp129,
@ C_Code.c:134: void SetCurrentAnimInProc(struct Anim* anim) { 
	movs	r5, r0	@ anim, tmp188
@ C_Code.c:136: 	proc = Proc_Find(TimedHitsProcCmd); 
	ldr	r0, .L25+4	@ tmp128,
	bl	.L10		@
	subs	r4, r0, #0	@ proc, tmp189,
@ C_Code.c:137: 	if (!proc) { return; } 
	beq	.L19		@,
@ C_Code.c:108: 	proc->timer2 = 0xFF; 
	movs	r2, #255	@ tmp135,
	str	r2, [r0, #68]	@ tmp135, MEM <unsigned int> [(unsigned char *)proc_18 + 68B]
@ C_Code.c:105: 	proc->broke = false; 
	movs	r2, #255	@ tmp136,
	lsls	r2, r2, #16	@ tmp136, tmp136,
	str	r2, [r0, #72]	@ tmp136, MEM <unsigned int> [(unsigned char *)proc_18 + 72B]
@ C_Code.c:119: 	proc->code4frame = 0xff;
	ldr	r2, .L25+8	@ tmp137,
@ C_Code.c:104: 	proc->anim2 = NULL; 
	movs	r3, #0	@ tmp130,
@ C_Code.c:119: 	proc->code4frame = 0xff;
	str	r2, [r0, #76]	@ tmp137, MEM <unsigned int> [(unsigned char *)proc_18 + 76B]
@ C_Code.c:118: 	proc->buttonsToPress = 0; 
	movs	r2, #80	@ tmp138,
@ C_Code.c:104: 	proc->anim2 = NULL; 
	str	r3, [r0, #48]	@ tmp130, proc_18->anim2
@ C_Code.c:107: 	proc->timer = 0; 
	str	r3, [r0, #52]	@ tmp130, proc_18->timer
@ C_Code.c:113: 	proc->currentRound = NULL; 
	str	r3, [r0, #56]	@ tmp130, proc_18->currentRound
@ C_Code.c:114: 	proc->active_bunit = NULL; 
	str	r3, [r0, #60]	@ tmp130, proc_18->active_bunit
@ C_Code.c:115: 	proc->opp_bunit = NULL; 
	str	r3, [r0, #64]	@ tmp130, proc_18->opp_bunit
@ C_Code.c:118: 	proc->buttonsToPress = 0; 
	strh	r3, [r0, r2]	@ tmp130, proc_18->buttonsToPress
@ C_Code.c:140: 	proc->anim = anim; 
	str	r5, [r0, #44]	@ anim, proc_18->anim
@ C_Code.c:141: 	proc->anim2 = GetAnimAnotherSide(anim); 
	ldr	r3, .L25+12	@ tmp141,
	movs	r0, r5	@, anim
	bl	.L10		@
@ C_Code.c:141: 	proc->anim2 = GetAnimAnotherSide(anim); 
	str	r0, [r4, #48]	@ tmp190, proc_18->anim2
@ C_Code.c:142: 	proc->roundId = anim->nextRoundId-1; 
	ldrh	r3, [r5, #14]	@ tmp144,
	subs	r3, r3, #1	@ tmp145,
	lsls	r3, r3, #24	@ tmp146, tmp145,
	lsrs	r0, r3, #24	@ _4, tmp146,
@ C_Code.c:142: 	proc->roundId = anim->nextRoundId-1; 
	movs	r3, #70	@ tmp147,
	strb	r0, [r4, r3]	@ _4, proc_18->roundId
@ C_Code.c:145: 	proc->currentRound = GetCurrentRound(proc->roundId); 
	ldr	r3, .L25+16	@ tmp149,
	bl	.L10		@
@ C_Code.c:146: 	proc->side = GetAnimPosition(anim) ^ 1; 
	ldr	r3, .L25+20	@ tmp150,
@ C_Code.c:145: 	proc->currentRound = GetCurrentRound(proc->roundId); 
	str	r0, [r4, #56]	@ tmp191, proc_18->currentRound
@ C_Code.c:146: 	proc->side = GetAnimPosition(anim) ^ 1; 
	movs	r0, r5	@, anim
	bl	.L10		@
@ C_Code.c:146: 	proc->side = GetAnimPosition(anim) ^ 1; 
	movs	r3, #1	@ tmp152,
@ C_Code.c:146: 	proc->side = GetAnimPosition(anim) ^ 1; 
	movs	r2, #74	@ tmp155,
@ C_Code.c:146: 	proc->side = GetAnimPosition(anim) ^ 1; 
	lsls	r0, r0, #24	@ tmp151, tmp192,
	asrs	r0, r0, #24	@ _8, tmp151,
	eors	r3, r0	@ tmp154, _8
@ C_Code.c:146: 	proc->side = GetAnimPosition(anim) ^ 1; 
	strb	r3, [r4, r2]	@ tmp154, proc_18->side
@ C_Code.c:147: 	proc->active_bunit = gpEkrBattleUnitLeft; 
	ldr	r3, .L25+24	@ tmp157,
@ C_Code.c:148: 	proc->opp_bunit = gpEkrBattleUnitRight; 
	ldr	r2, .L25+28	@ tmp158,
@ C_Code.c:147: 	proc->active_bunit = gpEkrBattleUnitLeft; 
	ldr	r3, [r3]	@ gpEkrBattleUnitLeft.2_11, gpEkrBattleUnitLeft
@ C_Code.c:148: 	proc->opp_bunit = gpEkrBattleUnitRight; 
	ldr	r2, [r2]	@ gpEkrBattleUnitRight.3_12, gpEkrBattleUnitRight
@ C_Code.c:147: 	proc->active_bunit = gpEkrBattleUnitLeft; 
	str	r3, [r4, #60]	@ gpEkrBattleUnitLeft.2_11, proc_18->active_bunit
@ C_Code.c:148: 	proc->opp_bunit = gpEkrBattleUnitRight; 
	str	r2, [r4, #64]	@ gpEkrBattleUnitRight.3_12, proc_18->opp_bunit
@ C_Code.c:149: 	if (!proc->side) { 
	cmp	r0, #1	@ _8,
	bne	.L22		@,
@ C_Code.c:150: 		proc->active_bunit = gpEkrBattleUnitRight; 
	str	r2, [r4, #60]	@ gpEkrBattleUnitRight.3_12, proc_18->active_bunit
@ C_Code.c:151: 		proc->opp_bunit = gpEkrBattleUnitLeft;
	str	r3, [r4, #64]	@ gpEkrBattleUnitLeft.2_11, proc_18->opp_bunit
.L22:
@ C_Code.c:153: 	if (!proc->loadedImg) {
	movs	r6, #73	@ tmp159,
@ C_Code.c:153: 	if (!proc->loadedImg) {
	ldrb	r3, [r4, r6]	@ tmp160,
	cmp	r3, #0	@ tmp160,
	beq	.L24		@,
.L19:
@ C_Code.c:164: }
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L24:
@ C_Code.c:154: 		Copy2dChr(&Press_Image, (void*)0x06012980, 6, 2);
	ldr	r5, .L25+32	@ tmp163,
	movs	r2, #6	@,
	ldr	r0, .L25+36	@ tmp162,
	ldr	r1, .L25+40	@,
	adds	r3, r3, #2	@,
	bl	.L27		@
@ C_Code.c:155: 		Copy2dChr(&BattleStar, (void*)0x06012a40, 2, 2); // 0x108 
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+44	@ tmp165,
	ldr	r1, .L25+48	@,
	bl	.L27		@
@ C_Code.c:156: 		Copy2dChr(&A_Button, (void*)0x06012800, 2, 2); // 0x140
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+52	@ tmp168,
	ldr	r1, .L25+56	@,
	bl	.L27		@
@ C_Code.c:157: 		Copy2dChr(&B_Button, (void*)0x06012840, 2, 2); // 0x142 
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+60	@ tmp171,
	ldr	r1, .L25+64	@,
	bl	.L27		@
@ C_Code.c:158: 		Copy2dChr(&Left_Button, (void*)0x06012880, 2, 2); // 0x144
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+68	@ tmp174,
	ldr	r1, .L25+72	@,
	bl	.L27		@
@ C_Code.c:159: 		Copy2dChr(&Right_Button, (void*)0x060128C0, 2, 2); // 0x146
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+76	@ tmp177,
	ldr	r1, .L25+80	@,
	bl	.L27		@
@ C_Code.c:160: 		Copy2dChr(&Up_Button, (void*)0x06012900, 2, 2); // 0x148
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+84	@ tmp180,
	ldr	r1, .L25+88	@,
	bl	.L27		@
@ C_Code.c:161: 		Copy2dChr(&Down_Button, (void*)0x06012940, 2, 2); // 0x14a
	movs	r3, #2	@,
	movs	r2, #2	@,
	ldr	r0, .L25+92	@ tmp183,
	ldr	r1, .L25+96	@,
	bl	.L27		@
@ C_Code.c:162: 		proc->loadedImg = true;
	movs	r3, #1	@ tmp186,
	strb	r3, [r4, r6]	@ tmp186, proc_18->loadedImg
	b	.L19		@
.L26:
	.align	2
.L25:
	.word	Proc_Find
	.word	.LANCHOR0
	.word	-16711681
	.word	GetAnimAnotherSide
	.word	GetCurrentRound
	.word	GetAnimPosition
	.word	gpEkrBattleUnitLeft
	.word	gpEkrBattleUnitRight
	.word	Copy2dChr
	.word	Press_Image
	.word	100739456
	.word	BattleStar
	.word	100739648
	.word	A_Button
	.word	100739072
	.word	B_Button
	.word	100739136
	.word	Left_Button
	.word	100739200
	.word	Right_Button
	.word	100739264
	.word	Up_Button
	.word	100739328
	.word	Down_Button
	.word	100739392
	.size	SetCurrentAnimInProc, .-SetCurrentAnimInProc
	.align	1
	.p2align 2,,3
	.global	BreakOnce
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	BreakOnce, %function
BreakOnce:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:246: 	if (proc->broke) { return; } 
	movs	r3, #72	@ tmp115,
@ C_Code.c:246: 	if (proc->broke) { return; } 
	ldrb	r2, [r0, r3]	@ tmp116,
	cmp	r2, #0	@ tmp116,
	bne	.L28		@,
@ C_Code.c:247: 	proc->broke = true; 
	adds	r2, r2, #1	@ tmp118,
	strb	r2, [r0, r3]	@ tmp118, proc_4(D)->broke
@ C_Code.c:248: 	asm("mov r11, r11");
	.syntax divided
@ 248 "C_Code.c" 1
	mov r11, r11
@ 0 "" 2
	.thumb
	.syntax unified
.L28:
@ C_Code.c:249: } 
	@ sp needed	@
	bx	lr
	.size	BreakOnce, .-BreakOnce
	.align	1
	.p2align 2,,3
	.global	HitNow
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	HitNow, %function
HitNow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:253: 	if (!HpProc) { return false; } // 
	cmp	r1, #0	@ tmp125,
	beq	.L32		@,
@ C_Code.c:255: 	if (proc->EkrEfxIsUnitHittedNowFrames) { return false; } 
	movs	r3, #79	@ tmp118,
@ C_Code.c:255: 	if (proc->EkrEfxIsUnitHittedNowFrames) { return false; } 
	ldrb	r0, [r0, r3]	@ tmp120,
@ C_Code.c:253: 	if (!HpProc) { return false; } // 
	rsbs	r3, r0, #0	@ tmp122, tmp120
	adcs	r0, r0, r3	@ <retval>, tmp120, tmp122
.L30:
@ C_Code.c:257: } 
	@ sp needed	@
	bx	lr
.L32:
@ C_Code.c:253: 	if (!HpProc) { return false; } // 
	movs	r0, #0	@ <retval>,
	b	.L30		@
	.size	HitNow, .-HitNow
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC25:
	.ascii	"\001\002\020 @\200\000"
	.text
	.align	1
	.p2align 2,,3
	.global	GetButtonsToPress
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	GetButtonsToPress, %function
GetButtonsToPress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	r5, r8	@,
	mov	lr, fp	@,
	mov	r7, r10	@,
	mov	r6, r9	@,
	push	{r5, r6, r7, lr}	@
@ C_Code.c:305: 	if (AlwaysA || TimedHitsDifficultyRam->alwaysA) { return A_BUTTON; } 
	ldr	r3, .L60	@ tmp137,
@ C_Code.c:305: 	if (AlwaysA || TimedHitsDifficultyRam->alwaysA) { return A_BUTTON; } 
	ldr	r3, [r3]	@ AlwaysA, AlwaysA
@ C_Code.c:304: int GetButtonsToPress(TimedHitsProc* proc) { 
	mov	r8, r0	@ proc, tmp184
	sub	sp, sp, #12	@,,
@ C_Code.c:305: 	if (AlwaysA || TimedHitsDifficultyRam->alwaysA) { return A_BUTTON; } 
	cmp	r3, #0	@ AlwaysA,
	bne	.L45		@,
@ C_Code.c:305: 	if (AlwaysA || TimedHitsDifficultyRam->alwaysA) { return A_BUTTON; } 
	ldr	r3, .L60+4	@ tmp139,
	ldr	r2, [r3]	@ TimedHitsDifficultyRam.10_2, TimedHitsDifficultyRam
@ C_Code.c:305: 	if (AlwaysA || TimedHitsDifficultyRam->alwaysA) { return A_BUTTON; } 
	ldrb	r3, [r2]	@ *TimedHitsDifficultyRam.10_2, *TimedHitsDifficultyRam.10_2
	lsls	r3, r3, #26	@ tmp186, *TimedHitsDifficultyRam.10_2,
	bmi	.L45		@,
@ C_Code.c:306: 	int keys = proc->buttonsToPress;
	movs	r3, #80	@ tmp149,
@ C_Code.c:306: 	int keys = proc->buttonsToPress;
	ldrh	r0, [r0, r3]	@ <retval>,
@ C_Code.c:307: 	if (!keys) { 
	cmp	r0, #0	@ <retval>,
	bne	.L33		@,
@ C_Code.c:308: 		u8 KeysList[] = { A_BUTTON, B_BUTTON, DPAD_RIGHT, DPAD_LEFT, DPAD_UP, DPAD_DOWN }; 
	ldr	r3, .L60+8	@ tmp151,
	ldr	r1, [r3]	@ tmp154,
	str	r1, [sp]	@ tmp154,
	mov	r1, sp	@ tmp189,
	ldrh	r3, [r3, #4]	@ tmp156,
	strh	r3, [r1, #4]	@ tmp156,
@ C_Code.c:313: 		int numberOfRandomButtons = NumberOfRandomButtons; 
	ldr	r3, .L60+12	@ tmp158,
	ldr	r3, [r3]	@ numberOfRandomButtons, NumberOfRandomButtons
	mov	r9, r3	@ numberOfRandomButtons, numberOfRandomButtons
@ C_Code.c:314: 		if (!numberOfRandomButtons) { numberOfRandomButtons = TimedHitsDifficultyRam->difficulty; } 
	cmp	r3, #0	@ numberOfRandomButtons,
	beq	.L56		@,
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	ble	.L57		@,
.L36:
	ldr	r3, .L60+16	@ tmp180,
	mov	fp, r3	@ tmp180, tmp180
@ C_Code.c:321: 			if (button & 0xF0) { // some dpad 
	movs	r3, #15	@ tmp168,
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	movs	r6, #0	@ i,
@ C_Code.c:311: 		int oppDir = 0; 
	movs	r7, #0	@ oppDir,
@ C_Code.c:306: 	int keys = proc->buttonsToPress;
	movs	r5, #0	@ keys,
@ C_Code.c:312: 		int size = 5; // -1 since we count from 0  
	movs	r4, #5	@ size,
@ C_Code.c:321: 			if (button & 0xF0) { // some dpad 
	mov	r10, r3	@ tmp168, tmp168
	b	.L43		@
.L39:
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	adds	r6, r6, #1	@ i,
@ C_Code.c:336: 			keys |= button; 
	orrs	r5, r0	@ keys, button
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	cmp	r9, r6	@ numberOfRandomButtons, i
	ble	.L58		@,
.L43:
@ C_Code.c:317: 			num = NextRN_N(size); 
	movs	r0, r4	@, size
	bl	.L62		@
@ C_Code.c:318: 			button = KeysList[num];
	mov	r3, sp	@ tmp197,
	ldrb	r0, [r3, r0]	@ button, KeysList
@ C_Code.c:321: 			if (button & 0xF0) { // some dpad 
	mov	r2, r10	@ tmp168, tmp168
	movs	r3, r0	@ tmp170, button
	bics	r3, r2	@ tmp170, tmp168
	beq	.L39		@,
@ C_Code.c:322: 				if (button == DPAD_RIGHT) { oppDir = DPAD_LEFT; } 
	cmp	r0, #16	@ button,
	beq	.L48		@,
@ C_Code.c:323: 				if (button == DPAD_LEFT) { oppDir = DPAD_RIGHT; } 
	cmp	r0, #32	@ button,
	beq	.L49		@,
@ C_Code.c:324: 				if (button == DPAD_UP) { oppDir = DPAD_DOWN; } 
	cmp	r0, #64	@ button,
	bne	.L59		@,
@ C_Code.c:324: 				if (button == DPAD_UP) { oppDir = DPAD_DOWN; } 
	movs	r7, #128	@ oppDir,
.L40:
@ C_Code.c:326: 				for (int c = 0; c <= size; ++c) { 
	cmp	r4, #0	@ size,
	blt	.L39		@,
	mov	r2, sp	@ ivtmp.83,
@ C_Code.c:326: 				for (int c = 0; c <= size; ++c) { 
	movs	r3, #0	@ c,
	b	.L42		@
.L41:
@ C_Code.c:326: 				for (int c = 0; c <= size; ++c) { 
	adds	r3, r3, #1	@ c,
@ C_Code.c:326: 				for (int c = 0; c <= size; ++c) { 
	adds	r2, r2, #1	@ ivtmp.83,
	cmp	r4, r3	@ size, c
	blt	.L39		@,
.L42:
@ C_Code.c:327: 					if (KeysList[c] == oppDir) { 
	ldrb	r1, [r2]	@ MEM[(unsigned char *)_14], MEM[(unsigned char *)_14]
@ C_Code.c:327: 					if (KeysList[c] == oppDir) { 
	cmp	r1, r7	@ MEM[(unsigned char *)_14], oppDir
	bne	.L41		@,
@ C_Code.c:328: 						KeysList[c] = KeysList[size]; 
	mov	r2, sp	@ tmp200,
@ C_Code.c:328: 						KeysList[c] = KeysList[size]; 
	mov	r1, sp	@ tmp201,
@ C_Code.c:328: 						KeysList[c] = KeysList[size]; 
	ldrb	r2, [r2, r4]	@ _11, KeysList
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	adds	r6, r6, #1	@ i,
@ C_Code.c:328: 						KeysList[c] = KeysList[size]; 
	strb	r2, [r1, r3]	@ _11, KeysList[c_22]
@ C_Code.c:329: 						size--; 
	subs	r4, r4, #1	@ size,
@ C_Code.c:336: 			keys |= button; 
	orrs	r5, r0	@ keys, button
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	cmp	r9, r6	@ numberOfRandomButtons, i
	bgt	.L43		@,
.L58:
@ C_Code.c:336: 			keys |= button; 
	movs	r0, r5	@ <retval>, keys
@ C_Code.c:338: 		proc->buttonsToPress = keys; 
	lsls	r3, r5, #16	@ tmp176, keys,
	lsrs	r3, r3, #16	@ prephitmp_19, tmp176,
.L38:
	movs	r2, #80	@ tmp177,
	mov	r1, r8	@ proc, proc
	strh	r3, [r1, r2]	@ prephitmp_19, proc_31(D)->buttonsToPress
	b	.L33		@
.L45:
@ C_Code.c:305: 	if (AlwaysA || TimedHitsDifficultyRam->alwaysA) { return A_BUTTON; } 
	movs	r0, #1	@ <retval>,
.L33:
@ C_Code.c:341: } 
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L56:
@ C_Code.c:314: 		if (!numberOfRandomButtons) { numberOfRandomButtons = TimedHitsDifficultyRam->difficulty; } 
	ldrb	r3, [r2]	@ *TimedHitsDifficultyRam.10_2, *TimedHitsDifficultyRam.10_2
	lsls	r3, r3, #27	@ tmp163, *TimedHitsDifficultyRam.10_2,
@ C_Code.c:314: 		if (!numberOfRandomButtons) { numberOfRandomButtons = TimedHitsDifficultyRam->difficulty; } 
	lsrs	r2, r3, #27	@ numberOfRandomButtons, tmp163,
	mov	r9, r2	@ numberOfRandomButtons, numberOfRandomButtons
@ C_Code.c:315: 		if (!numberOfRandomButtons) { numberOfRandomButtons = 1; }
	cmp	r3, #0	@ tmp163,
	bne	.L36		@,
@ C_Code.c:315: 		if (!numberOfRandomButtons) { numberOfRandomButtons = 1; }
	movs	r3, #1	@ numberOfRandomButtons,
	mov	r9, r3	@ numberOfRandomButtons, numberOfRandomButtons
	b	.L36		@
.L59:
@ C_Code.c:325: 				if (button == DPAD_DOWN) { oppDir = DPAD_UP; } 
	cmp	r0, #128	@ button,
	bne	.L40		@,
@ C_Code.c:325: 				if (button == DPAD_DOWN) { oppDir = DPAD_UP; } 
	movs	r7, #64	@ oppDir,
	b	.L40		@
.L49:
@ C_Code.c:323: 				if (button == DPAD_LEFT) { oppDir = DPAD_RIGHT; } 
	movs	r7, #16	@ oppDir,
	b	.L40		@
.L48:
@ C_Code.c:322: 				if (button == DPAD_RIGHT) { oppDir = DPAD_LEFT; } 
	movs	r7, #32	@ oppDir,
	b	.L40		@
.L57:
@ C_Code.c:316: 		for (int i = 0; i < numberOfRandomButtons; ++i) { 
	movs	r3, #0	@ prephitmp_19,
	b	.L38		@
.L61:
	.align	2
.L60:
	.word	AlwaysA
	.word	TimedHitsDifficultyRam
	.word	.LC25
	.word	NumberOfRandomButtons
	.word	NextRN_N
	.size	GetButtonsToPress, .-GetButtonsToPress
	.align	1
	.p2align 2,,3
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	DrawButtonsToPress.part.0, %function
DrawButtonsToPress.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	lr, fp	@,
	mov	r5, r8	@,
	mov	r7, r10	@,
	mov	r6, r9	@,
	push	{r5, r6, r7, lr}	@
	sub	sp, sp, #12	@,,
@ C_Code.c:398: void DrawButtonsToPress(TimedHitsProc* proc, int x, int y, int palID) { 
	mov	fp, r2	@ y, tmp239
	movs	r7, r0	@ proc, tmp237
	mov	r8, r1	@ x, tmp238
	movs	r5, r3	@ palID, tmp240
@ C_Code.c:400: 	int keys = GetButtonsToPress(proc); 
	bl	GetButtonsToPress		@
@ C_Code.c:402: 	if (ChangePaletteWhenButtonIsPressed && proc->frame) { palID = 14; } 
	ldr	r2, .L119	@ tmp155,
@ C_Code.c:402: 	if (ChangePaletteWhenButtonIsPressed && proc->frame) { palID = 14; } 
	ldr	r2, [r2]	@ ChangePaletteWhenButtonIsPressed, ChangePaletteWhenButtonIsPressed
@ C_Code.c:400: 	int keys = GetButtonsToPress(proc); 
	movs	r4, r0	@ keys, tmp241
@ C_Code.c:402: 	if (ChangePaletteWhenButtonIsPressed && proc->frame) { palID = 14; } 
	cmp	r2, #0	@ ChangePaletteWhenButtonIsPressed,
	beq	.L66		@,
@ C_Code.c:402: 	if (ChangePaletteWhenButtonIsPressed && proc->frame) { palID = 14; } 
	movs	r3, #75	@ tmp159,
@ C_Code.c:402: 	if (ChangePaletteWhenButtonIsPressed && proc->frame) { palID = 14; } 
	ldrb	r3, [r7, r3]	@ tmp160,
	cmp	r3, #0	@ tmp160,
	beq	.LCB531	@
	b	.L109	@long jump	@
.LCB531:
.L66:
@ C_Code.c:404: 	int oam2 = OAM2_PAL(palID) | OAM2_LAYER(0); //OAM2_CHR(0);
	lsls	r5, r5, #28	@ tmp158, palID,
	lsrs	r5, r5, #16	@ prephitmp_87, tmp158,
.L65:
@ C_Code.c:405: 	PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_PressInput, oam2); 
	mov	r2, fp	@ y, y
	movs	r3, #255	@ tmp161,
	ldr	r7, .L119+4	@ tmp232,
	ands	r3, r2	@ tmp161, y
	mov	r2, r8	@ x, x
	mov	r10, r3	@ _11, tmp161
	movs	r3, r7	@ tmp163, tmp232
	lsls	r1, r2, #23	@ tmp165, x,
	ldr	r6, .L119+8	@ tmp233,
	mov	r2, r10	@, _11
	movs	r0, #2	@,
	adds	r3, r3, #32	@ tmp163,
	lsrs	r1, r1, #23	@ tmp164, tmp165,
	str	r5, [sp]	@ prephitmp_87,
	bl	.L121		@
@ C_Code.c:406: 	x += 32; 
	mov	r1, r8	@ x, x
@ C_Code.c:407: 	PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_PressInput2, oam2); 
	movs	r3, r7	@ tmp168, tmp232
@ C_Code.c:406: 	x += 32; 
	adds	r1, r1, #32	@ x,
@ C_Code.c:407: 	PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_PressInput2, oam2); 
	lsls	r1, r1, #23	@ tmp171, x,
	mov	r2, r10	@, _11
	movs	r0, #2	@,
	adds	r3, r3, #40	@ tmp168,
	lsrs	r1, r1, #23	@ tmp170, tmp171,
	str	r5, [sp]	@ prephitmp_87,
	bl	.L121		@
@ C_Code.c:408: 	y += 16; x -= 36; 
	movs	r3, #16	@ y,
	movs	r2, r7	@ ivtmp.101, tmp232
	mov	r10, r3	@ y, y
	movs	r0, r7	@ _18, tmp232
@ C_Code.c:405: 	PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_PressInput, oam2); 
	mov	r9, r6	@ tmp233, tmp233
@ C_Code.c:345: 	int c = 0; 
	movs	r1, #0	@ c,
@ C_Code.c:408: 	y += 16; x -= 36; 
	add	r10, r10, fp	@ y, y
	adds	r2, r2, #49	@ ivtmp.101,
	adds	r0, r0, #54	@ _18,
@ C_Code.c:409: 	int count = CountKeysPressed(keys); 
	subs	r3, r3, #15	@ prephitmp_85,
	b	.L69		@
.L110:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ldrb	r3, [r2]	@ prephitmp_85, MEM[(unsigned char *)_6]
	adds	r2, r2, #1	@ ivtmp.101,
.L69:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ands	r3, r4	@ tmp177, keys
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	subs	r6, r3, #1	@ tmp236, tmp177
	sbcs	r3, r3, r6	@ tmp235, tmp177, tmp236
	adds	r1, r1, r3	@ c, c, tmp235
@ C_Code.c:346: 	for (int i = 0; i < 6; ++i) { 
	cmp	r0, r2	@ _18, ivtmp.101
	bne	.L110		@,
@ C_Code.c:411: 	if (count == 1) { x += 16; } // centering 
	cmp	r1, #1	@ c,
	beq	.L111		@,
@ C_Code.c:412: 	if (count == 2) { x += 8; } 
	mov	r3, r8	@ x, x
	adds	r6, r3, #4	@ x, x,
@ C_Code.c:412: 	if (count == 2) { x += 8; } 
	cmp	r1, #2	@ c,
	bne	.L112		@,
.L71:
@ C_Code.c:415: 	if (keys & A_BUTTON) { 
	lsls	r3, r4, #31	@ tmp243, keys,
	bmi	.L113		@,
.L73:
@ C_Code.c:418: 	if (keys & B_BUTTON) { 
	lsls	r3, r4, #30	@ tmp244, keys,
	bmi	.L114		@,
.L74:
@ C_Code.c:421: 	if (keys & DPAD_LEFT) { 
	lsls	r3, r4, #26	@ tmp245, keys,
	bmi	.L115		@,
.L75:
@ C_Code.c:424: 	if (keys & DPAD_RIGHT) { 
	lsls	r3, r4, #27	@ tmp246, keys,
	bmi	.L116		@,
.L76:
@ C_Code.c:427: 	if (keys & DPAD_UP) { 
	lsls	r3, r4, #25	@ tmp247, keys,
	bmi	.L117		@,
.L77:
@ C_Code.c:430: 	if (keys & DPAD_DOWN) { 
	lsls	r4, r4, #24	@ tmp248, keys,
	bmi	.L118		@,
.L63:
@ C_Code.c:437: } 
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L112:
@ C_Code.c:408: 	y += 16; x -= 36; 
	subs	r6, r6, #8	@ x,
@ C_Code.c:415: 	if (keys & A_BUTTON) { 
	lsls	r3, r4, #31	@ tmp243, keys,
	bpl	.L73		@,
.L113:
@ C_Code.c:416: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_A_Button, oam2); x += 18; 
	mov	r1, r10	@ y, y
	movs	r2, #255	@ tmp182,
	movs	r3, r7	@ tmp181, tmp232
	ands	r2, r1	@ tmp183, y
	lsls	r1, r6, #23	@ tmp185, x,
	movs	r0, #2	@,
	str	r5, [sp]	@ prephitmp_87,
	adds	r3, r3, #56	@ tmp181,
	lsrs	r1, r1, #23	@ tmp184, tmp185,
	bl	.L122		@
@ C_Code.c:416: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_A_Button, oam2); x += 18; 
	adds	r6, r6, #18	@ x,
@ C_Code.c:418: 	if (keys & B_BUTTON) { 
	lsls	r3, r4, #30	@ tmp244, keys,
	bpl	.L74		@,
.L114:
@ C_Code.c:419: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_B_Button, oam2); x += 18; 
	mov	r1, r10	@ y, y
	movs	r2, #255	@ tmp191,
	movs	r3, r7	@ tmp190, tmp232
	ands	r2, r1	@ tmp192, y
	lsls	r1, r6, #23	@ tmp194, x,
	movs	r0, #2	@,
	str	r5, [sp]	@ prephitmp_87,
	adds	r3, r3, #64	@ tmp190,
	lsrs	r1, r1, #23	@ tmp193, tmp194,
	bl	.L122		@
@ C_Code.c:419: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_B_Button, oam2); x += 18; 
	adds	r6, r6, #18	@ x,
@ C_Code.c:421: 	if (keys & DPAD_LEFT) { 
	lsls	r3, r4, #26	@ tmp245, keys,
	bpl	.L75		@,
.L115:
@ C_Code.c:422: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Left_Button, oam2); x += 18; 
	mov	r1, r10	@ y, y
	movs	r2, #255	@ tmp200,
	movs	r3, r7	@ tmp199, tmp232
	ands	r2, r1	@ tmp201, y
	lsls	r1, r6, #23	@ tmp203, x,
	movs	r0, #2	@,
	str	r5, [sp]	@ prephitmp_87,
	adds	r3, r3, #72	@ tmp199,
	lsrs	r1, r1, #23	@ tmp202, tmp203,
	bl	.L122		@
@ C_Code.c:422: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Left_Button, oam2); x += 18; 
	adds	r6, r6, #18	@ x,
@ C_Code.c:424: 	if (keys & DPAD_RIGHT) { 
	lsls	r3, r4, #27	@ tmp246, keys,
	bpl	.L76		@,
.L116:
@ C_Code.c:425: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Right_Button, oam2); x += 18; 
	mov	r1, r10	@ y, y
	movs	r2, #255	@ tmp209,
	movs	r3, r7	@ tmp208, tmp232
	ands	r2, r1	@ tmp210, y
	lsls	r1, r6, #23	@ tmp212, x,
	movs	r0, #2	@,
	str	r5, [sp]	@ prephitmp_87,
	adds	r3, r3, #80	@ tmp208,
	lsrs	r1, r1, #23	@ tmp211, tmp212,
	bl	.L122		@
@ C_Code.c:425: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Right_Button, oam2); x += 18; 
	adds	r6, r6, #18	@ x,
@ C_Code.c:427: 	if (keys & DPAD_UP) { 
	lsls	r3, r4, #25	@ tmp247, keys,
	bpl	.L77		@,
.L117:
@ C_Code.c:428: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Up_Button, oam2); x += 18; 
	mov	r1, r10	@ y, y
	movs	r2, #255	@ tmp218,
	movs	r3, r7	@ tmp217, tmp232
	ands	r2, r1	@ tmp219, y
	lsls	r1, r6, #23	@ tmp221, x,
	movs	r0, #2	@,
	str	r5, [sp]	@ prephitmp_87,
	adds	r3, r3, #88	@ tmp217,
	lsrs	r1, r1, #23	@ tmp220, tmp221,
	bl	.L122		@
@ C_Code.c:428: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Up_Button, oam2); x += 18; 
	adds	r6, r6, #18	@ x,
@ C_Code.c:430: 	if (keys & DPAD_DOWN) { 
	lsls	r4, r4, #24	@ tmp248, keys,
	bpl	.L63		@,
.L118:
@ C_Code.c:431: 		PutSprite(2, OAM1_X(x + 0x200), OAM0_Y(y + 0x100), sSprite_Down_Button, oam2); x += 18; 
	mov	r1, r10	@ y, y
	movs	r2, #255	@ tmp227,
	movs	r3, r7	@ tmp232, tmp232
	ands	r2, r1	@ tmp228, y
	lsls	r1, r6, #23	@ tmp230, x,
	movs	r0, #2	@,
	str	r5, [sp]	@ prephitmp_87,
	adds	r3, r3, #96	@ tmp232,
	lsrs	r1, r1, #23	@ tmp229, tmp230,
	bl	.L122		@
	b	.L63		@
.L109:
	movs	r5, #224	@ prephitmp_87,
	lsls	r5, r5, #8	@ prephitmp_87, prephitmp_87,
	b	.L65		@
.L111:
@ C_Code.c:411: 	if (count == 1) { x += 16; } // centering 
	mov	r6, r8	@ x, x
	adds	r6, r6, #12	@ x,
	b	.L71		@
.L120:
	.align	2
.L119:
	.word	ChangePaletteWhenButtonIsPressed
	.word	.LANCHOR0
	.word	PutSprite
	.size	DrawButtonsToPress.part.0, .-DrawButtonsToPress.part.0
	.align	1
	.p2align 2,,3
	.global	CountKeysPressed
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CountKeysPressed, %function
CountKeysPressed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L130	@ tmp122,
	movs	r2, r1	@ ivtmp.118, tmp122
	push	{r4, r5, lr}	@
@ C_Code.c:344: int CountKeysPressed(u32 keys) { 
	movs	r3, #1	@ pretmp_5,
	movs	r4, r0	@ keys, tmp131
	adds	r2, r2, #49	@ ivtmp.118,
@ C_Code.c:345: 	int c = 0; 
	movs	r0, #0	@ <retval>,
	adds	r1, r1, #54	@ _21,
	b	.L126		@
.L129:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ldrb	r3, [r2]	@ pretmp_5, MEM[(unsigned char *)_19]
	adds	r2, r2, #1	@ ivtmp.118,
.L126:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ands	r3, r4	@ tmp126, keys
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	subs	r5, r3, #1	@ tmp130, tmp126
	sbcs	r3, r3, r5	@ tmp129, tmp126, tmp130
	adds	r0, r0, r3	@ <retval>, <retval>, tmp129
@ C_Code.c:346: 	for (int i = 0; i < 6; ++i) { 
	cmp	r2, r1	@ ivtmp.118, _21
	bne	.L129		@,
@ C_Code.c:351: } 
	@ sp needed	@
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L131:
	.align	2
.L130:
	.word	.LANCHOR0
	.size	CountKeysPressed, .-CountKeysPressed
	.align	1
	.p2align 2,,3
	.global	PressedSpecificKeys
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	PressedSpecificKeys, %function
PressedSpecificKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, lr}	@
@ C_Code.c:353: int PressedSpecificKeys(TimedHitsProc* proc, u32 keys) { 
	movs	r4, r1	@ keys, tmp179
@ C_Code.c:354: 	int reqKeys = GetButtonsToPress(proc); 
	bl	GetButtonsToPress		@
	ldr	r5, .L162	@ tmp150,
	movs	r2, r5	@ ivtmp.149, tmp150
	adds	r2, r2, #49	@ ivtmp.149,
	mov	ip, r0	@ reqKeys, tmp180
@ C_Code.c:355: 	int count = CountKeysPressed(reqKeys); 
	movs	r1, r2	@ ivtmp.177, ivtmp.149
	movs	r3, #1	@ pretmp_38,
@ C_Code.c:345: 	int c = 0; 
	movs	r6, #0	@ c,
	adds	r5, r5, #54	@ _94,
	b	.L135		@
.L158:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ldrb	r3, [r1]	@ pretmp_38, MEM[(unsigned char *)_92]
	adds	r1, r1, #1	@ ivtmp.177,
.L135:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	mov	r0, ip	@ reqKeys, reqKeys
	ands	r3, r0	@ tmp154, reqKeys
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	subs	r7, r3, #1	@ tmp168, tmp154
	sbcs	r3, r3, r7	@ tmp167, tmp154, tmp168
	adds	r6, r6, r3	@ c, c, tmp167
@ C_Code.c:346: 	for (int i = 0; i < 6; ++i) { 
	cmp	r1, r5	@ ivtmp.177, _94
	bne	.L158		@,
	movs	r1, r2	@ ivtmp.163, ivtmp.149
	movs	r3, #1	@ pretmp_18,
@ C_Code.c:345: 	int c = 0; 
	movs	r7, #0	@ c,
	b	.L134		@
.L159:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ldrb	r3, [r1]	@ pretmp_18, MEM[(unsigned char *)_85]
	adds	r1, r1, #1	@ ivtmp.163,
.L134:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ands	r3, r4	@ tmp155, keys
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	subs	r0, r3, #1	@ tmp171, tmp155
	sbcs	r3, r3, r0	@ tmp170, tmp155, tmp171
	adds	r7, r7, r3	@ c, c, tmp170
@ C_Code.c:346: 	for (int i = 0; i < 6; ++i) { 
	cmp	r1, r5	@ ivtmp.163, _94
	bne	.L159		@,
	movs	r3, #1	@ prephitmp_66,
@ C_Code.c:345: 	int c = 0; 
	movs	r1, #0	@ c,
@ C_Code.c:356: 	if (ABS(count - CountKeysPressed(keys)) > 1) { return false; } // you pressed more than 1 extra key. Shame on you. 
	cmp	r6, r7	@ c, c
	bge	.L141		@,
	b	.L138		@
.L160:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ldrb	r3, [r2]	@ prephitmp_66, MEM[(unsigned char *)_8]
	adds	r2, r2, #1	@ ivtmp.149,
.L141:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ands	r3, r4	@ tmp156, keys
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	subs	r7, r3, #1	@ tmp174, tmp156
	sbcs	r3, r3, r7	@ tmp173, tmp156, tmp174
	adds	r1, r1, r3	@ c, c, tmp173
@ C_Code.c:346: 	for (int i = 0; i < 6; ++i) { 
	cmp	r2, r5	@ ivtmp.149, _94
	bne	.L160		@,
@ C_Code.c:356: 	if (ABS(count - CountKeysPressed(keys)) > 1) { return false; } // you pressed more than 1 extra key. Shame on you. 
	subs	r1, r6, r1	@ tmp157, c, c
@ C_Code.c:356: 	if (ABS(count - CountKeysPressed(keys)) > 1) { return false; } // you pressed more than 1 extra key. Shame on you. 
	cmp	r1, #1	@ tmp157,
	bgt	.L149		@,
.L143:
@ C_Code.c:357: 	reqKeys &= ~keys; // only 0 if we hit all the correct keys (and possibly 1 extra) 
	mov	r0, ip	@ reqKeys, reqKeys
	bics	r0, r4	@ reqKeys, keys
@ C_Code.c:358: 	return (!reqKeys); 
	rsbs	r3, r0, #0	@ tmp164, reqKeys
	adcs	r0, r0, r3	@ <retval>, reqKeys, tmp164
.L132:
@ C_Code.c:359: } 
	@ sp needed	@
	pop	{r3, r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L161:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ldrb	r3, [r2]	@ pretmp_29, MEM[(unsigned char *)_78]
	adds	r2, r2, #1	@ ivtmp.149,
.L138:
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	ands	r3, r4	@ tmp158, keys
@ C_Code.c:347: 		if (keys & RomKeysList[i]) { c++; } 
	subs	r7, r3, #1	@ tmp177, tmp158
	sbcs	r3, r3, r7	@ tmp176, tmp158, tmp177
	adds	r1, r1, r3	@ c, c, tmp176
@ C_Code.c:346: 	for (int i = 0; i < 6; ++i) { 
	cmp	r2, r5	@ ivtmp.149, _94
	bne	.L161		@,
@ C_Code.c:356: 	if (ABS(count - CountKeysPressed(keys)) > 1) { return false; } // you pressed more than 1 extra key. Shame on you. 
	subs	r1, r1, r6	@ tmp159, c, c
@ C_Code.c:356: 	if (ABS(count - CountKeysPressed(keys)) > 1) { return false; } // you pressed more than 1 extra key. Shame on you. 
	cmp	r1, #1	@ tmp159,
	ble	.L143		@,
.L149:
@ C_Code.c:356: 	if (ABS(count - CountKeysPressed(keys)) > 1) { return false; } // you pressed more than 1 extra key. Shame on you. 
	movs	r0, #0	@ <retval>,
	b	.L132		@
.L163:
	.align	2
.L162:
	.word	.LANCHOR0
	.size	PressedSpecificKeys, .-PressedSpecificKeys
	.align	1
	.p2align 2,,3
	.global	SaveInputFrame
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SaveInputFrame, %function
SaveInputFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}	@
@ C_Code.c:360: void SaveInputFrame(TimedHitsProc* proc, u32 keys) { 
	movs	r4, r0	@ proc, tmp155
@ C_Code.c:361: 	struct Anim* anim = proc->anim; 
	ldr	r0, [r0, #44]	@ anim, proc_18(D)->anim
@ C_Code.c:362: 	u32 instruction = *anim->pScrCurrent++; 
	ldr	r5, [r0, #32]	@ _1, anim_19->pScrCurrent
@ C_Code.c:362: 	u32 instruction = *anim->pScrCurrent++; 
	ldr	r2, [r5]	@ instruction, *_1
@ C_Code.c:362: 	u32 instruction = *anim->pScrCurrent++; 
	adds	r3, r5, #4	@ tmp130, _1,
	str	r3, [r0, #32]	@ tmp130, anim_19->pScrCurrent
@ C_Code.c:363: 	if (ANINS_GET_TYPE(instruction) == ANIM_INS_TYPE_COMMAND) {
	lsls	r3, r2, #2	@ tmp132, instruction,
	lsrs	r3, r3, #26	@ tmp133, tmp132,
@ C_Code.c:363: 	if (ANINS_GET_TYPE(instruction) == ANIM_INS_TYPE_COMMAND) {
	cmp	r3, #5	@ tmp133,
	beq	.L171		@,
.L165:
@ C_Code.c:371: 	instruction = *anim->pScrCurrent--; 
	str	r5, [r0, #32]	@ _1, anim_19->pScrCurrent
@ C_Code.c:372: 	if (PressedSpecificKeys(proc, keys)) { 
	movs	r0, r4	@, proc
	bl	PressedSpecificKeys		@
@ C_Code.c:372: 	if (PressedSpecificKeys(proc, keys)) { 
	cmp	r0, #0	@ tmp157,
	beq	.L164		@,
@ C_Code.c:373: 		if (!proc->frame) { 
	movs	r3, #75	@ tmp147,
@ C_Code.c:373: 		if (!proc->frame) { 
	ldrb	r2, [r4, r3]	@ tmp148,
	cmp	r2, #0	@ tmp148,
	beq	.L172		@,
.L164:
@ C_Code.c:378: }  
	@ sp needed	@
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L171:
@ C_Code.c:364: 		if (ANINS_COMMAND_GET_ID(instruction) == 4) {
	adds	r3, r3, #250	@ tmp134,
	ands	r3, r2	@ _5, instruction
@ C_Code.c:364: 		if (ANINS_COMMAND_GET_ID(instruction) == 4) {
	cmp	r3, #4	@ _5,
	beq	.L173		@,
@ C_Code.c:367: 		if (ANINS_COMMAND_GET_ID(instruction) == 0xF) {
	cmp	r3, #15	@ _5,
	bne	.L165		@,
@ C_Code.c:368: 			proc->codefframe = proc->timer; proc->timer2 = 0; 
	ldr	r2, [r4, #52]	@ proc_18(D)->timer, proc_18(D)->timer
	adds	r3, r3, #62	@ tmp143,
	strb	r2, [r4, r3]	@ proc_18(D)->timer, proc_18(D)->codefframe
@ C_Code.c:368: 			proc->codefframe = proc->timer; proc->timer2 = 0; 
	movs	r2, #0	@ tmp145,
	subs	r3, r3, #9	@ tmp144,
	strb	r2, [r4, r3]	@ tmp145, proc_18(D)->timer2
	b	.L165		@
.L172:
@ C_Code.c:375: 			PlaySFX(0x13e, 0x100, 120, 1); //PlaySFX(int songid, int volume, int locate, int type)
	movs	r1, #128	@,
	movs	r0, #159	@,
@ C_Code.c:374: 			proc->frame = proc->timer; // locate is side for stereo? 
	ldr	r2, [r4, #52]	@ proc_18(D)->timer, proc_18(D)->timer
@ C_Code.c:375: 			PlaySFX(0x13e, 0x100, 120, 1); //PlaySFX(int songid, int volume, int locate, int type)
	lsls	r1, r1, #1	@,,
@ C_Code.c:374: 			proc->frame = proc->timer; // locate is side for stereo? 
	strb	r2, [r4, r3]	@ proc_18(D)->timer, proc_18(D)->frame
@ C_Code.c:375: 			PlaySFX(0x13e, 0x100, 120, 1); //PlaySFX(int songid, int volume, int locate, int type)
	lsls	r0, r0, #1	@,,
	movs	r2, #120	@,
	ldr	r4, .L174	@ tmp154,
	subs	r3, r3, #74	@,
	bl	.L176		@
@ C_Code.c:378: }  
	b	.L164		@
.L173:
@ C_Code.c:365: 			proc->code4frame = proc->timer; proc->timer2 = 0; 
	ldr	r2, [r4, #52]	@ proc_18(D)->timer, proc_18(D)->timer
	adds	r3, r3, #72	@ tmp137,
	strb	r2, [r4, r3]	@ proc_18(D)->timer, proc_18(D)->code4frame
@ C_Code.c:365: 			proc->code4frame = proc->timer; proc->timer2 = 0; 
	movs	r2, #0	@ tmp139,
	subs	r3, r3, #8	@ tmp138,
	strb	r2, [r4, r3]	@ tmp139, proc_18(D)->timer2
	b	.L165		@
.L175:
	.align	2
.L174:
	.word	PlaySFX
	.size	SaveInputFrame, .-SaveInputFrame
	.align	1
	.p2align 2,,3
	.global	SaveIfWeHitOnTime
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	SaveIfWeHitOnTime, %function
SaveIfWeHitOnTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ C_Code.c:380: 	if (proc->frame) { 
	movs	r3, #75	@ tmp127,
	ldrb	r3, [r0, r3]	@ _1,
@ C_Code.c:379: void SaveIfWeHitOnTime(TimedHitsProc* proc) {
	push	{r4, lr}	@
@ C_Code.c:380: 	if (proc->frame) { 
	cmp	r3, #0	@ _1,
	beq	.L177		@,
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	movs	r2, #77	@ tmp128,
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	ldr	r1, .L188	@ tmp129,
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	ldrb	r2, [r0, r2]	@ _2,
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	ldr	r1, [r1]	@ pretmp_32, LenienceFrames
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	cmp	r2, #255	@ _2,
	beq	.L180		@,
.L187:
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	subs	r2, r2, r3	@ tmp130, _2, _1
	asrs	r4, r2, #31	@ tmp146, tmp130,
	adds	r2, r2, r4	@ tmp131, tmp130, tmp146
	eors	r2, r4	@ tmp131, tmp146
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	cmp	r2, r1	@ tmp131, pretmp_32
	bge	.L181		@,
@ C_Code.c:381: 		if (proc->codefframe != 0xFF) { if (ABS(proc->codefframe - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } }
	movs	r2, #69	@ tmp132,
	movs	r4, #1	@ tmp133,
	strb	r4, [r0, r2]	@ tmp133, proc_21(D)->hitOnTime
.L181:
@ C_Code.c:383: 		if ((proc->timer - proc->frame) < LenienceFrames) { proc->hitOnTime = true; } 
	ldr	r2, [r0, #52]	@ proc_21(D)->timer, proc_21(D)->timer
	subs	r3, r2, r3	@ tmp138, proc_21(D)->timer, _1
@ C_Code.c:383: 		if ((proc->timer - proc->frame) < LenienceFrames) { proc->hitOnTime = true; } 
	cmp	r3, r1	@ tmp138, pretmp_32
	bge	.L177		@,
@ C_Code.c:383: 		if ((proc->timer - proc->frame) < LenienceFrames) { proc->hitOnTime = true; } 
	movs	r3, #69	@ tmp140,
	movs	r2, #1	@ tmp141,
	strb	r2, [r0, r3]	@ tmp141, proc_21(D)->hitOnTime
.L177:
@ C_Code.c:386: }
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L180:
@ C_Code.c:382: 		else if (proc->code4frame != 0xFF) { if (ABS(proc->code4frame - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } } 
	movs	r2, #76	@ tmp135,
	ldrb	r2, [r0, r2]	@ _8,
@ C_Code.c:382: 		else if (proc->code4frame != 0xFF) { if (ABS(proc->code4frame - proc->frame) < (LenienceFrames)) { proc->hitOnTime = true; } } 
	cmp	r2, #255	@ _8,
	bne	.L187		@,
	b	.L181		@
.L189:
	.align	2
.L188:
	.word	LenienceFrames
	.size	SaveIfWeHitOnTime, .-SaveIfWeHitOnTime
	.align	1
	.p2align 2,,3
	.global	CheatCodeOn
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CheatCodeOn, %function
CheatCodeOn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:389: 	return (gPlaySt.unk1F & 0x80); // 202BD0F
	ldr	r3, .L191	@ tmp117,
@ C_Code.c:390: } 
	@ sp needed	@
@ C_Code.c:389: 	return (gPlaySt.unk1F & 0x80); // 202BD0F
	ldrb	r0, [r3, #31]	@ tmp119,
	movs	r3, #127	@ tmp121,
	bics	r0, r3	@ tmp116, tmp121
@ C_Code.c:390: } 
	bx	lr
.L192:
	.align	2
.L191:
	.word	gPlaySt
	.size	CheatCodeOn, .-CheatCodeOn
	.align	1
	.p2align 2,,3
	.global	DidWeHitOnTime
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	DidWeHitOnTime, %function
DidWeHitOnTime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:389: 	return (gPlaySt.unk1F & 0x80); // 202BD0F
	ldr	r3, .L197	@ tmp119,
@ C_Code.c:393: 	if (CheatCodeOn()) { return true; } 
	ldrb	r3, [r3, #31]	@ tmp122,
	cmp	r3, #127	@ tmp122,
	bhi	.L196		@,
@ C_Code.c:394: 	if (AlwaysWork) { return true; } 
	ldr	r3, .L197+4	@ tmp123,
@ C_Code.c:394: 	if (AlwaysWork) { return true; } 
	ldr	r3, [r3]	@ AlwaysWork, AlwaysWork
	cmp	r3, #0	@ AlwaysWork,
	bne	.L196		@,
@ C_Code.c:395: 	return proc->hitOnTime;
	adds	r3, r3, #69	@ tmp125,
	ldrb	r0, [r0, r3]	@ <retval>,
	b	.L193		@
.L196:
@ C_Code.c:393: 	if (CheatCodeOn()) { return true; } 
	movs	r0, #1	@ <retval>,
.L193:
@ C_Code.c:396: }
	@ sp needed	@
	bx	lr
.L198:
	.align	2
.L197:
	.word	gPlaySt
	.word	AlwaysWork
	.size	DidWeHitOnTime, .-DidWeHitOnTime
	.align	1
	.p2align 2,,3
	.global	DrawButtonsToPress
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	DrawButtonsToPress, %function
DrawButtonsToPress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}	@
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	ldr	r4, .L204	@ tmp118,
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	ldr	r4, [r4]	@ DisplayPress, DisplayPress
	cmp	r4, #0	@ DisplayPress,
	beq	.L199		@,
	bl	DrawButtonsToPress.part.0		@
.L199:
@ C_Code.c:437: } 
	@ sp needed	@
	pop	{r4}
	pop	{r0}
	bx	r0
.L205:
	.align	2
.L204:
	.word	DisplayPress
	.size	DrawButtonsToPress, .-DrawButtonsToPress
	.align	1
	.p2align 2,,3
	.global	GetDefaultDamagePercent
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	GetDefaultDamagePercent, %function
GetDefaultDamagePercent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	movs	r1, #11	@ tmp121,
	movs	r3, #192	@ tmp122,
	ldrsb	r1, [r0, r1]	@ tmp121,
	ands	r3, r1	@ _14, tmp121
@ C_Code.c:520: 	if (success) { 
	cmp	r2, #0	@ tmp130,
	beq	.L207		@,
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r3, #128	@ _14,
	bne	.L208		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, .L212	@ tmp123,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, [r3]	@ BlockingEnabled, BlockingEnabled
	cmp	r3, #0	@ BlockingEnabled,
	beq	.L211		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, .L212+4	@ tmp125,
	ldr	r0, [r3]	@ <retval>,
	b	.L206		@
.L207:
@ C_Code.c:527: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r3, #128	@ _14,
	beq	.L211		@,
@ C_Code.c:530: 	return FailedHitDamagePercent; 
	ldr	r3, .L212+8	@ tmp127,
	ldr	r0, [r3]	@ <retval>,
.L206:
@ C_Code.c:531: } 
	@ sp needed	@
	bx	lr
.L208:
@ C_Code.c:525: 		return BonusDamagePercent; 
	ldr	r3, .L212+12	@ tmp126,
	ldr	r0, [r3]	@ <retval>,
	b	.L206		@
.L211:
@ C_Code.c:523: 			else { return 100; } 
	movs	r0, #100	@ <retval>,
	b	.L206		@
.L213:
	.align	2
.L212:
	.word	BlockingEnabled
	.word	ReducedDamagePercent
	.word	FailedHitDamagePercent
	.word	BonusDamagePercent
	.size	GetDefaultDamagePercent, .-GetDefaultDamagePercent
	.align	1
	.p2align 2,,3
	.global	GetDamagePercent
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	GetDamagePercent, %function
GetDamagePercent:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	movs	r1, #11	@ tmp121,
	movs	r3, #192	@ tmp122,
	ldrsb	r1, [r0, r1]	@ tmp121,
	ands	r3, r1	@ _9, tmp121
@ C_Code.c:520: 	if (success) { 
	cmp	r2, #0	@ tmp130,
	beq	.L215		@,
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r3, #128	@ _9,
	bne	.L216		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, .L220	@ tmp123,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, [r3]	@ BlockingEnabled, BlockingEnabled
	cmp	r3, #0	@ BlockingEnabled,
	beq	.L219		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, .L220+4	@ tmp125,
	ldr	r0, [r3]	@ <retval>,
	b	.L214		@
.L215:
@ C_Code.c:527: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r3, #128	@ _9,
	beq	.L219		@,
@ C_Code.c:530: 	return FailedHitDamagePercent; 
	ldr	r3, .L220+8	@ tmp127,
	ldr	r0, [r3]	@ <retval>,
.L214:
@ C_Code.c:535: } 
	@ sp needed	@
	bx	lr
.L216:
@ C_Code.c:525: 		return BonusDamagePercent; 
	ldr	r3, .L220+12	@ tmp126,
	ldr	r0, [r3]	@ <retval>,
	b	.L214		@
.L219:
@ C_Code.c:523: 			else { return 100; } 
	movs	r0, #100	@ <retval>,
@ C_Code.c:534: 	return GetDefaultDamagePercent(active_bunit, opp_bunit, success); 
	b	.L214		@
.L221:
	.align	2
.L220:
	.word	BlockingEnabled
	.word	ReducedDamagePercent
	.word	FailedHitDamagePercent
	.word	BonusDamagePercent
	.size	GetDamagePercent, .-GetDamagePercent
	.align	1
	.p2align 2,,3
	.global	AdjustCurrentRound
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	AdjustCurrentRound, %function
AdjustCurrentRound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}	@
@ C_Code.c:550: 	for (int i = id; i < 22; i += 2) {
	cmp	r0, #21	@ id,
	bgt	.L222		@,
	ldr	r3, .L232	@ tmp127,
	lsls	r2, r0, #1	@ tmp126, id,
@ C_Code.c:552: 		if (hp == 0xffff) { break; }
	ldr	r5, .L232+4	@ tmp128,
	adds	r2, r2, r3	@ ivtmp.209, tmp126, tmp127
	b	.L226		@
.L224:
	movs	r4, #0	@ _4,
@ C_Code.c:554: 		else if (hp >= difference) { gEfxHpLut[i] -= difference; }
	cmp	r3, r1	@ _1, difference
	blt	.L225		@,
@ C_Code.c:554: 		else if (hp >= difference) { gEfxHpLut[i] -= difference; }
	subs	r3, r3, r1	@ tmp131, _1, difference
.L230:
	lsls	r3, r3, #16	@ tmp132, tmp131,
	lsrs	r4, r3, #16	@ _4, tmp132,
.L225:
@ C_Code.c:550: 	for (int i = id; i < 22; i += 2) {
	adds	r0, r0, #2	@ id,
@ C_Code.c:553: 		if (difference < 0) { hp += difference; if (hp > 0) { gEfxHpLut[i] = hp; } else { gEfxHpLut[i] = 0; } }
	strh	r4, [r2]	@ _4, MEM[(short unsigned int *)_23]
@ C_Code.c:550: 	for (int i = id; i < 22; i += 2) {
	adds	r2, r2, #4	@ ivtmp.209,
	cmp	r0, #21	@ id,
	bgt	.L222		@,
.L226:
@ C_Code.c:551: 		hp = gEfxHpLut[i]; 
	ldrh	r3, [r2]	@ _1, MEM[(short unsigned int *)_23]
@ C_Code.c:552: 		if (hp == 0xffff) { break; }
	cmp	r3, r5	@ _1, tmp128
	beq	.L222		@,
@ C_Code.c:553: 		if (difference < 0) { hp += difference; if (hp > 0) { gEfxHpLut[i] = hp; } else { gEfxHpLut[i] = 0; } }
	cmp	r1, #0	@ difference,
	bge	.L224		@,
@ C_Code.c:553: 		if (difference < 0) { hp += difference; if (hp > 0) { gEfxHpLut[i] = hp; } else { gEfxHpLut[i] = 0; } }
	adds	r3, r3, r1	@ hp, _1, difference
	movs	r4, #0	@ _4,
@ C_Code.c:553: 		if (difference < 0) { hp += difference; if (hp > 0) { gEfxHpLut[i] = hp; } else { gEfxHpLut[i] = 0; } }
	cmp	r3, #0	@ hp,
	bgt	.L230		@,
@ C_Code.c:550: 	for (int i = id; i < 22; i += 2) {
	adds	r0, r0, #2	@ id,
@ C_Code.c:553: 		if (difference < 0) { hp += difference; if (hp > 0) { gEfxHpLut[i] = hp; } else { gEfxHpLut[i] = 0; } }
	strh	r4, [r2]	@ _4, MEM[(short unsigned int *)_23]
@ C_Code.c:550: 	for (int i = id; i < 22; i += 2) {
	adds	r2, r2, #4	@ ivtmp.209,
	cmp	r0, #21	@ id,
	ble	.L226		@,
.L222:
@ C_Code.c:558: }
	@ sp needed	@
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L233:
	.align	2
.L232:
	.word	gEfxHpLut
	.word	65535
	.size	AdjustCurrentRound, .-AdjustCurrentRound
	.align	1
	.p2align 2,,3
	.global	UpdateHP
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	UpdateHP, %function
UpdateHP:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mvns	r4, r3	@ tmp148, newHp
@ C_Code.c:563: 	int hp = gEkrGaugeHp[side];
	ldr	r5, [sp, #20]	@ tmp160, side
	asrs	r4, r4, #31	@ tmp147, tmp148,
	ands	r3, r4	@ _13, tmp147
	ldr	r4, .L245	@ tmp133,
	lsls	r5, r5, #1	@ tmp134, tmp160,
	ldrsh	r4, [r5, r4]	@ _1, gEkrGaugeHp
@ C_Code.c:564: 	some_bunit->unit.curHP = newHp; 
	strb	r3, [r2, #19]	@ _13, some_bunit_22(D)->unit.curHP
@ C_Code.c:565: 	if (hp == newHp) { return; } 
	cmp	r3, r4	@ _13, _1
	beq	.L234		@,
@ C_Code.c:567: 	if (newDamage) { diff = 0 - newDamage; }
	ldr	r2, [sp, #24]	@ tmp161, newDamage
	rsbs	r5, r2, #0	@ diff, tmp161
@ C_Code.c:567: 	if (newDamage) { diff = 0 - newDamage; }
	cmp	r2, #0	@ tmp162,
	beq	.L243		@,
@ C_Code.c:569: 	if (proc->side == side) { 
	movs	r2, #74	@ tmp136,
@ C_Code.c:569: 	if (proc->side == side) { 
	ldr	r6, [sp, #20]	@ tmp163, side
@ C_Code.c:569: 	if (proc->side == side) { 
	ldrb	r2, [r0, r2]	@ tmp137,
@ C_Code.c:569: 	if (proc->side == side) { 
	cmp	r2, r6	@ tmp137, tmp163
	beq	.L244		@,
.L234:
@ C_Code.c:583: }
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L243:
@ C_Code.c:569: 	if (proc->side == side) { 
	movs	r2, #74	@ tmp136,
@ C_Code.c:569: 	if (proc->side == side) { 
	ldr	r6, [sp, #20]	@ tmp163, side
@ C_Code.c:569: 	if (proc->side == side) { 
	ldrb	r2, [r0, r2]	@ tmp137,
@ C_Code.c:566: 	int diff = newHp - hp; 
	subs	r5, r3, r4	@ diff, _13, _1
@ C_Code.c:569: 	if (proc->side == side) { 
	cmp	r2, r6	@ tmp137, tmp163
	bne	.L234		@,
.L244:
@ C_Code.c:571: 		if (UsingSkillSys) { // uggggh 
	ldr	r2, .L245+4	@ tmp139,
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	asrs	r7, r5, #31	@ tmp156, diff,
@ C_Code.c:571: 		if (UsingSkillSys) { // uggggh 
	ldr	r6, [r2]	@ UsingSkillSys.25_5, UsingSkillSys
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	adds	r2, r5, r7	@ tmp140, diff, tmp156
	eors	r2, r7	@ tmp140, tmp156
@ C_Code.c:570: 		HpProc->cur = hp; 
	strh	r4, [r1, #46]	@ _1, HpProc_28(D)->cur
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	lsls	r2, r2, #24	@ tmp141, tmp140,
@ C_Code.c:572: 			HpProc->post = newHp;
	lsls	r4, r3, #16	@ _43, _13,
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	ldr	r0, [r0, #56]	@ pretmp_37, proc_27(D)->currentRound
@ C_Code.c:572: 			HpProc->post = newHp;
	asrs	r4, r4, #16	@ _43, _43,
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	asrs	r2, r2, #24	@ _36, tmp141,
@ C_Code.c:571: 		if (UsingSkillSys) { // uggggh 
	cmp	r6, #0	@ UsingSkillSys.25_5,
	beq	.L241		@,
@ C_Code.c:572: 			HpProc->post = newHp;
	movs	r3, #80	@ tmp142,
	strh	r4, [r1, r3]	@ _43, HpProc_28(D)->post
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	strb	r2, [r0, #3]	@ _36, pretmp_37->hpChange
@ C_Code.c:581: 		if (UsingSkillSys == 2) { proc->currentRound->overDmg = diff; } // used by Huichelaar's banim numbers 
	cmp	r6, #2	@ UsingSkillSys.25_5,
	bne	.L234		@,
@ C_Code.c:581: 		if (UsingSkillSys == 2) { proc->currentRound->overDmg = diff; } // used by Huichelaar's banim numbers 
	strh	r5, [r0, #6]	@ diff, pretmp_37->overDmg
	b	.L234		@
.L241:
@ C_Code.c:577: 			HpProc->post = newHp; 
	str	r3, [r1, #80]	@ _13, MEM <unsigned int> [(short int *)HpProc_28(D) + 80B]
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	strb	r2, [r0, #3]	@ _36, pretmp_37->hpChange
	b	.L234		@
.L246:
	.align	2
.L245:
	.word	gEkrGaugeHp
	.word	UsingSkillSys
	.size	UpdateHP, .-UpdateHP
	.align	1
	.p2align 2,,3
	.global	CheckForDeath
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	CheckForDeath, %function
CheckForDeath:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	lr, r8	@,
	movs	r7, r2	@ active_bunit, tmp244
	movs	r2, r3	@ opp_bunit, tmp245
@ C_Code.c:588: 	int side = proc->side; 
	movs	r3, #74	@ tmp163,
@ C_Code.c:587: void CheckForDeath(TimedHitsProc* proc, struct NewProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct SkillSysBattleHit* round, int hp, int newDamage) { 
	push	{lr}	@
	sub	sp, sp, #8	@,,
@ C_Code.c:587: void CheckForDeath(TimedHitsProc* proc, struct NewProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct SkillSysBattleHit* round, int hp, int newDamage) { 
	movs	r6, r1	@ HpProc, tmp243
@ C_Code.c:588: 	int side = proc->side; 
	ldrb	r3, [r0, r3]	@ _1,
@ C_Code.c:587: void CheckForDeath(TimedHitsProc* proc, struct NewProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct SkillSysBattleHit* round, int hp, int newDamage) { 
	ldr	r1, [sp, #36]	@ hp, hp
	movs	r5, r0	@ proc, tmp242
@ C_Code.c:588: 	int side = proc->side; 
	mov	r8, r3	@ _1, _1
@ C_Code.c:590: 	if (hp < 0) { hp = gEkrGaugeHp[side]; } 
	cmp	r1, #0	@ hp,
	bge	.L248		@,
@ C_Code.c:590: 	if (hp < 0) { hp = gEkrGaugeHp[side]; } 
	mov	r1, r8	@ _1, _1
	ldr	r3, .L265	@ tmp164,
	lsls	r1, r1, #1	@ tmp165, _1,
@ C_Code.c:590: 	if (hp < 0) { hp = gEkrGaugeHp[side]; } 
	ldrsh	r1, [r1, r3]	@ hp, gEkrGaugeHp
.L248:
@ C_Code.c:591: 	if (hp <= 0) { // they are dead 
	cmp	r1, #0	@ hp,
	ble	.L262		@,
.L250:
@ C_Code.c:640: 	BattleApplyExpGains();  // update exp 
	ldr	r3, .L265+4	@ tmp224,
	bl	.L10		@
@ C_Code.c:641: 	gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain; 
	ldr	r2, .L265+8	@ tmp227,
	ldr	r1, [r2]	@ gpEkrBattleUnitLeft, gpEkrBattleUnitLeft
	movs	r2, #110	@ tmp228,
@ C_Code.c:641: 	gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain; 
	ldr	r3, .L265+12	@ tmp225,
@ C_Code.c:641: 	gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain; 
	ldrsb	r1, [r1, r2]	@ tmp230,
@ C_Code.c:641: 	gBanimExpGain[0] = gpEkrBattleUnitLeft->expGain; 
	strh	r1, [r3]	@ tmp230, gBanimExpGain[0]
@ C_Code.c:642: 	gBanimExpGain[1] = gpEkrBattleUnitRight->expGain; 
	ldr	r1, .L265+16	@ tmp233,
	ldr	r1, [r1]	@ gpEkrBattleUnitRight, gpEkrBattleUnitRight
	ldrsb	r2, [r1, r2]	@ tmp236,
@ C_Code.c:642: 	gBanimExpGain[1] = gpEkrBattleUnitRight->expGain; 
	strh	r2, [r3, #2]	@ tmp236, gBanimExpGain[1]
@ C_Code.c:644: }
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r7}
	mov	r8, r7
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L262:
@ C_Code.c:593: 		UpdateHP(proc, HpProc, opp_bunit, hp, side, newDamage); 
	ldr	r3, [sp, #40]	@ tmp260, newDamage
	str	r3, [sp, #4]	@ tmp260,
	mov	r3, r8	@ _1, _1
	movs	r1, r6	@, HpProc
	movs	r0, r5	@, proc
	str	r3, [sp]	@ _1,
	movs	r3, #0	@,
	bl	UpdateHP		@
@ C_Code.c:595: 		proc->code4frame = 0xff;
	movs	r3, #76	@ tmp166,
	movs	r2, #255	@ tmp167,
@ C_Code.c:613: 		struct SkillSysBattleHit* nextRound = GetCurrentRound(proc->roundId + 1); 
	movs	r4, #70	@ tmp179,
@ C_Code.c:595: 		proc->code4frame = 0xff;
	strb	r2, [r5, r3]	@ tmp167, proc_27(D)->code4frame
@ C_Code.c:600: 		HpProc->death = true; 
	subs	r3, r3, #35	@ tmp169,
	subs	r2, r2, #254	@ tmp170,
	strb	r2, [r6, r3]	@ tmp170, HpProc_32(D)->death
@ C_Code.c:611: 		round->info |= BATTLE_HIT_INFO_FINISHES | BATTLE_HIT_INFO_KILLS_TARGET | BATTLE_HIT_INFO_END; 
	ldr	r3, [sp, #32]	@ tmp262, round
	ldrb	r3, [r3, #2]	@ tmp175,
	adds	r2, r2, #175	@ tmp172,
	orrs	r3, r2	@ tmp177, tmp172
	ldr	r2, [sp, #32]	@ tmp263, round
	strb	r3, [r2, #2]	@ tmp177,
@ C_Code.c:613: 		struct SkillSysBattleHit* nextRound = GetCurrentRound(proc->roundId + 1); 
	ldrb	r0, [r5, r4]	@ tmp180,
@ C_Code.c:613: 		struct SkillSysBattleHit* nextRound = GetCurrentRound(proc->roundId + 1); 
	ldr	r3, .L265+20	@ tmp182,
	adds	r0, r0, #1	@ tmp181,
	bl	.L10		@
@ C_Code.c:614: 		nextRound->info = BATTLE_HIT_INFO_END; 
	movs	r3, #7	@ tmp188,
	ldrh	r2, [r0, #2]	@ MEM <unsigned short> [(struct SkillSysBattleHit *)nextRound_41 + 2B], MEM <unsigned short> [(struct SkillSysBattleHit *)nextRound_41 + 2B]
	ands	r3, r2	@ tmp187, MEM <unsigned short> [(struct SkillSysBattleHit *)nextRound_41 + 2B]
	movs	r2, #128	@ tmp189,
	orrs	r3, r2	@ tmp192, tmp189
	strh	r3, [r0, #2]	@ tmp192, MEM <unsigned short> [(struct SkillSysBattleHit *)nextRound_41 + 2B]
@ C_Code.c:618: 		u16* animRound = &GetAnimRoundData()[0]; 
	ldr	r3, .L265+24	@ tmp194,
	bl	.L10		@
@ C_Code.c:619: 		for (int i = proc->roundId; i < 32; ++i) { 
	ldrb	r3, [r5, r4]	@ i,
@ C_Code.c:619: 		for (int i = proc->roundId; i < 32; ++i) { 
	cmp	r3, #31	@ i,
	bgt	.L254		@,
@ C_Code.c:621: 			animRound[i] = 0xFFFF; 
	movs	r2, #1	@ tmp241,
	rsbs	r2, r2, #0	@ tmp241, tmp241
	mov	ip, r2	@ tmp241, tmp241
@ C_Code.c:620: 			if (animRound[i] == 0xFFFF) { break; } 
	ldr	r1, .L265+28	@ tmp209,
	b	.L251		@
.L263:
@ C_Code.c:621: 			animRound[i] = 0xFFFF; 
	mov	r2, ip	@ tmp241, tmp241
@ C_Code.c:619: 		for (int i = proc->roundId; i < 32; ++i) { 
	adds	r3, r3, #1	@ i,
@ C_Code.c:621: 			animRound[i] = 0xFFFF; 
	strh	r2, [r0, r4]	@ tmp241, MEM[(u16 *)animRound_45 + _92 * 1]
@ C_Code.c:619: 		for (int i = proc->roundId; i < 32; ++i) { 
	cmp	r3, #32	@ i,
	beq	.L254		@,
.L251:
	lsls	r4, r3, #1	@ _92, i,
@ C_Code.c:620: 			if (animRound[i] == 0xFFFF) { break; } 
	ldrh	r2, [r0, r4]	@ MEM[(u16 *)animRound_45 + _92 * 1], MEM[(u16 *)animRound_45 + _92 * 1]
	cmp	r2, r1	@ MEM[(u16 *)animRound_45 + _92 * 1], tmp209
	bne	.L263		@,
.L254:
@ C_Code.c:628: 		side = 1 ^ side; 
	movs	r2, #1	@ tmp199,
	mov	r3, r8	@ _1, _1
	eors	r3, r2	@ _1, tmp199
	movs	r2, r3	@ side, _1
@ C_Code.c:629: 		hp = gEkrGaugeHp[side];
	ldr	r3, .L265	@ tmp200,
	lsls	r1, r2, #1	@ tmp201, side,
	ldrsh	r1, [r1, r3]	@ _13, gEkrGaugeHp
@ C_Code.c:630: 		if (round->attributes & BATTLE_HIT_ATTR_HPSTEAL) { hp += newDamage; } 
	ldr	r3, [sp, #32]	@ tmp266, round
	ldr	r0, [r3]	@ *round_38(D), *round_38(D)
@ C_Code.c:630: 		if (round->attributes & BATTLE_HIT_ATTR_HPSTEAL) { hp += newDamage; } 
	ldr	r3, [sp, #40]	@ tmp267, newDamage
	adds	r3, r3, r1	@ hp, tmp267, _13
@ C_Code.c:630: 		if (round->attributes & BATTLE_HIT_ATTR_HPSTEAL) { hp += newDamage; } 
	lsls	r0, r0, #23	@ tmp250, *round_38(D),
	bpl	.L264		@,
.L253:
	mvns	r0, r3	@ tmp238, hp
	asrs	r0, r0, #31	@ tmp237, tmp238,
	ands	r3, r0	@ _58, tmp237
@ C_Code.c:564: 	some_bunit->unit.curHP = newHp; 
	strb	r3, [r7, #19]	@ _58, active_bunit_52(D)->unit.curHP
@ C_Code.c:565: 	if (hp == newHp) { return; } 
	cmp	r1, r3	@ _13, _58
	beq	.L250		@,
@ C_Code.c:569: 	if (proc->side == side) { 
	movs	r0, #74	@ tmp213,
	ldrb	r0, [r5, r0]	@ tmp214,
@ C_Code.c:569: 	if (proc->side == side) { 
	cmp	r2, r0	@ side, tmp214
	bne	.L250		@,
@ C_Code.c:566: 	int diff = newHp - hp; 
	subs	r7, r3, r1	@ diff, _58, _13
@ C_Code.c:571: 		if (UsingSkillSys) { // uggggh 
	ldr	r2, .L265+32	@ tmp216,
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	ldr	r4, [r5, #56]	@ pretmp_99, proc_27(D)->currentRound
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	asrs	r5, r7, #31	@ tmp251, diff,
@ C_Code.c:571: 		if (UsingSkillSys) { // uggggh 
	ldr	r0, [r2]	@ UsingSkillSys.25_66, UsingSkillSys
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	adds	r2, r7, r5	@ tmp217, diff, tmp251
	eors	r2, r5	@ tmp217, tmp251
@ C_Code.c:570: 		HpProc->cur = hp; 
	strh	r1, [r6, #46]	@ _13, HpProc_32(D)->cur
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	lsls	r2, r2, #24	@ tmp218, tmp217,
@ C_Code.c:572: 			HpProc->post = newHp;
	lsls	r1, r3, #16	@ _97, _58,
	asrs	r1, r1, #16	@ _97, _97,
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	asrs	r2, r2, #24	@ _100, tmp218,
@ C_Code.c:571: 		if (UsingSkillSys) { // uggggh 
	cmp	r0, #0	@ UsingSkillSys.25_66,
	beq	.L257		@,
@ C_Code.c:572: 			HpProc->post = newHp;
	movs	r3, #80	@ tmp219,
	strh	r1, [r6, r3]	@ _97, HpProc_32(D)->post
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	strb	r2, [r4, #3]	@ _100, pretmp_99->hpChange
@ C_Code.c:581: 		if (UsingSkillSys == 2) { proc->currentRound->overDmg = diff; } // used by Huichelaar's banim numbers 
	cmp	r0, #2	@ UsingSkillSys.25_66,
	beq	.LCB1525	@
	b	.L250	@long jump	@
.LCB1525:
@ C_Code.c:581: 		if (UsingSkillSys == 2) { proc->currentRound->overDmg = diff; } // used by Huichelaar's banim numbers 
	strh	r7, [r4, #6]	@ diff, pretmp_99->overDmg
	b	.L250		@
.L264:
@ C_Code.c:629: 		hp = gEkrGaugeHp[side];
	movs	r3, r1	@ hp, _13
	b	.L253		@
.L257:
@ C_Code.c:577: 			HpProc->post = newHp; 
	str	r3, [r6, #80]	@ _58, MEM <unsigned int> [(short int *)HpProc_32(D) + 80B]
@ C_Code.c:580: 		proc->currentRound->hpChange = ABS(diff); 
	strb	r2, [r4, #3]	@ _100, pretmp_99->hpChange
	b	.L250		@
.L266:
	.align	2
.L265:
	.word	gEkrGaugeHp
	.word	BattleApplyExpGains
	.word	gpEkrBattleUnitLeft
	.word	gBanimExpGain
	.word	gpEkrBattleUnitRight
	.word	GetCurrentRound
	.word	GetAnimRoundData
	.word	65535
	.word	UsingSkillSys
	.size	CheckForDeath, .-CheckForDeath
	.global	__aeabi_idiv
	.align	1
	.p2align 2,,3
	.global	AdjustDamageByPercent
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	AdjustDamageByPercent, %function
AdjustDamageByPercent:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	r7, r10	@,
	mov	r6, r9	@,
	mov	r5, r8	@,
	mov	lr, fp	@,
	push	{r5, r6, r7, lr}	@
	movs	r4, r0	@ proc, tmp187
@ C_Code.c:648: 	if ((proc->currentRound->attributes & BATTLE_HIT_ATTR_MISS) || (!proc->currentRound->hpChange)) { return; } 
	ldr	r0, [r0, #56]	@ _1, proc_7(D)->currentRound
@ C_Code.c:646: void AdjustDamageByPercent(TimedHitsProc* proc, struct NewProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct SkillSysBattleHit* round, int percent) { 
	movs	r5, r1	@ HpProc, tmp188
@ C_Code.c:648: 	if ((proc->currentRound->attributes & BATTLE_HIT_ATTR_MISS) || (!proc->currentRound->hpChange)) { return; } 
	ldr	r1, [r0]	@ *_1, *_1
@ C_Code.c:646: void AdjustDamageByPercent(TimedHitsProc* proc, struct NewProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct SkillSysBattleHit* round, int percent) { 
	movs	r7, r2	@ active_bunit, tmp189
	movs	r6, r3	@ opp_bunit, tmp190
	sub	sp, sp, #20	@,,
@ C_Code.c:648: 	if ((proc->currentRound->attributes & BATTLE_HIT_ATTR_MISS) || (!proc->currentRound->hpChange)) { return; } 
	lsls	r1, r1, #30	@ tmp192, *_1,
	bmi	.L267		@,
@ C_Code.c:648: 	if ((proc->currentRound->attributes & BATTLE_HIT_ATTR_MISS) || (!proc->currentRound->hpChange)) { return; } 
	movs	r3, #3	@ tmp152,
	ldrsb	r3, [r0, r3]	@ tmp152,
	cmp	r3, #0	@ tmp152,
	beq	.L267		@,
@ C_Code.c:649: 	if (round->hpChange <= 0) { return; } // healing 
	movs	r1, #3	@ _14,
	ldr	r3, [sp, #56]	@ tmp201, round
	ldrsb	r1, [r3, r1]	@ _14,* _14
@ C_Code.c:649: 	if (round->hpChange <= 0) { return; } // healing 
	cmp	r1, #0	@ _14,
	ble	.L267		@,
@ C_Code.c:650: 	int side = proc->side; 
	movs	r3, #74	@ tmp155,
	ldrb	r3, [r4, r3]	@ side,
	mov	fp, r3	@ side, side
@ C_Code.c:651: 	int hp = gEkrGaugeHp[proc->side];
	mov	r2, fp	@ side, side
	ldr	r3, .L287	@ tmp156,
	lsls	r2, r2, #1	@ tmp157, side,
@ C_Code.c:651: 	int hp = gEkrGaugeHp[proc->side];
	ldrsh	r3, [r2, r3]	@ hp, gEkrGaugeHp
	mov	r10, r3	@ hp, hp
@ C_Code.c:652: 	if (!hp) { CheckForDeath(proc, HpProc, active_bunit, opp_bunit, round, hp, 0); return; } 
	cmp	r3, #0	@ hp,
	beq	.L282		@,
@ C_Code.c:655: 	if (gEkrGaugeDmg[side ^ 1] > oldDamage) { oldDamage = gEkrGaugeDmg[side ^ 1]; } 
	movs	r3, #1	@ tmp165,
	mov	r0, fp	@ side, side
@ C_Code.c:655: 	if (gEkrGaugeDmg[side ^ 1] > oldDamage) { oldDamage = gEkrGaugeDmg[side ^ 1]; } 
	ldr	r2, .L287+4	@ tmp160,
@ C_Code.c:655: 	if (gEkrGaugeDmg[side ^ 1] > oldDamage) { oldDamage = gEkrGaugeDmg[side ^ 1]; } 
	eors	r3, r0	@ tmp164, side
@ C_Code.c:655: 	if (gEkrGaugeDmg[side ^ 1] > oldDamage) { oldDamage = gEkrGaugeDmg[side ^ 1]; } 
	lsls	r3, r3, #1	@ tmp166, tmp164,
	ldrsh	r3, [r2, r3]	@ oldDamage, gEkrGaugeDmg
	mov	r9, r3	@ oldDamage, oldDamage
@ C_Code.c:655: 	if (gEkrGaugeDmg[side ^ 1] > oldDamage) { oldDamage = gEkrGaugeDmg[side ^ 1]; } 
	cmp	r3, r1	@ oldDamage, _14
	ble	.L283		@,
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	ldr	r3, .L287+8	@ tmp168,
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	ldr	r3, [r3]	@ UsingSkillSys, UsingSkillSys
	cmp	r3, #2	@ UsingSkillSys,
	beq	.L284		@,
.L272:
@ C_Code.c:660: 	int newDamage = (oldDamage * percent) / 100; 
	ldr	r3, [sp, #60]	@ tmp213, percent
@ C_Code.c:660: 	int newDamage = (oldDamage * percent) / 100; 
	movs	r1, #100	@,
@ C_Code.c:660: 	int newDamage = (oldDamage * percent) / 100; 
	mov	r0, r9	@ tmp173, oldDamage
	muls	r0, r3	@ tmp173, tmp213
@ C_Code.c:660: 	int newDamage = (oldDamage * percent) / 100; 
	ldr	r3, .L287+12	@ tmp176,
	bl	.L10		@
	mov	r8, r0	@ newDamage, tmp191
@ C_Code.c:661: 	if (!newDamage) { newDamage = 1; } 
	subs	r3, r0, #0	@ newDamage, newDamage,
	bne	.L273		@,
@ C_Code.c:661: 	if (!newDamage) { newDamage = 1; } 
	adds	r3, r3, #1	@ newDamage,
	mov	r8, r3	@ newDamage, newDamage
.L273:
@ C_Code.c:662: 	int newHp = hp - newDamage; 
	mov	r2, r8	@ newDamage, newDamage
	mov	r3, r10	@ hp, hp
@ C_Code.c:663: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	movs	r1, #11	@ tmp178,
@ C_Code.c:662: 	int newHp = hp - newDamage; 
	subs	r3, r3, r2	@ newHp, hp, newDamage
@ C_Code.c:663: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	movs	r2, #192	@ tmp179,
	ldrsb	r1, [r7, r1]	@ tmp178,
	ands	r2, r1	@ tmp180, tmp178
@ C_Code.c:663: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r2, #128	@ tmp180,
	beq	.L285		@,
.L274:
	mvns	r2, r3	@ tmp186, newHp
	asrs	r2, r2, #31	@ tmp185, tmp186,
	ands	r3, r2	@ newHp, tmp185
	mov	r9, r3	@ _41, newHp
@ C_Code.c:672: 	UpdateHP(proc, HpProc, opp_bunit, newHp, side, newDamage); 
	mov	r3, r8	@ newDamage, newDamage
	str	r3, [sp, #4]	@ newDamage,
	mov	r3, fp	@ side, side
	movs	r2, r6	@, opp_bunit
	str	r3, [sp]	@ side,
	movs	r1, r5	@, HpProc
	mov	r3, r9	@, _41
	movs	r0, r4	@, proc
	bl	UpdateHP		@
@ C_Code.c:676: 	CheckForDeath(proc, HpProc, active_bunit, opp_bunit, round, newHp, newDamage); 
	mov	r3, r8	@ newDamage, newDamage
	str	r3, [sp, #8]	@ newDamage,
	mov	r3, r9	@ _41, _41
.L281:
	str	r3, [sp, #4]	@ _41,
	ldr	r3, [sp, #56]	@ tmp225, round
	movs	r2, r7	@, active_bunit
	str	r3, [sp]	@ tmp225,
	movs	r1, r5	@, HpProc
	movs	r3, r6	@, opp_bunit
	movs	r0, r4	@, proc
	bl	CheckForDeath		@
.L267:
@ C_Code.c:679: } 
	add	sp, sp, #20	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	mov	fp, r7
	mov	r10, r6
	mov	r9, r5
	mov	r8, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L283:
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	ldr	r3, .L287+8	@ tmp168,
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	ldr	r3, [r3]	@ UsingSkillSys, UsingSkillSys
@ C_Code.c:654: 	int oldDamage = round->hpChange;  
	mov	r9, r1	@ oldDamage, _14
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	cmp	r3, #2	@ UsingSkillSys,
	bne	.L272		@,
.L284:
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	ldr	r3, [sp, #56]	@ tmp211, round
	movs	r2, #6	@ tmp200,
	ldrsh	r3, [r3, r2]	@ tmp170, tmp211, tmp200
	asrs	r2, r3, #31	@ tmp193, tmp170,
	adds	r3, r3, r2	@ tmp171, tmp170, tmp193
	eors	r3, r2	@ tmp171, tmp193
@ C_Code.c:656: 	if (UsingSkillSys == 2) { oldDamage = ABS(round->overDmg); } 
	lsls	r3, r3, #16	@ tmp172, tmp171,
	lsrs	r3, r3, #16	@ oldDamage, tmp172,
	mov	r9, r3	@ oldDamage, oldDamage
	b	.L272		@
.L285:
@ C_Code.c:666: 			if ((hp - oldDamage) <= 0) { if (!BlockingCanPreventLethal) { newHp = hp - oldDamage; newDamage = oldDamage; } }
	mov	r2, r10	@ hp, hp
	mov	r1, r9	@ oldDamage, oldDamage
	subs	r2, r2, r1	@ _37, hp, oldDamage
@ C_Code.c:666: 			if ((hp - oldDamage) <= 0) { if (!BlockingCanPreventLethal) { newHp = hp - oldDamage; newDamage = oldDamage; } }
	cmp	r2, #0	@ _37,
	ble	.L286		@,
.L275:
@ C_Code.c:667: 			if (!BlockingEnabled) { newHp = hp - oldDamage; newDamage = oldDamage; } 
	ldr	r1, .L287+16	@ tmp183,
@ C_Code.c:667: 			if (!BlockingEnabled) { newHp = hp - oldDamage; newDamage = oldDamage; } 
	ldr	r1, [r1]	@ BlockingEnabled, BlockingEnabled
	cmp	r1, #0	@ BlockingEnabled,
	bne	.L274		@,
@ C_Code.c:666: 			if ((hp - oldDamage) <= 0) { if (!BlockingCanPreventLethal) { newHp = hp - oldDamage; newDamage = oldDamage; } }
	movs	r3, r2	@ newHp, _37
@ C_Code.c:667: 			if (!BlockingEnabled) { newHp = hp - oldDamage; newDamage = oldDamage; } 
	mov	r8, r9	@ newDamage, oldDamage
	b	.L274		@
.L282:
@ C_Code.c:652: 	if (!hp) { CheckForDeath(proc, HpProc, active_bunit, opp_bunit, round, hp, 0); return; } 
	str	r3, [sp, #8]	@ hp,
	b	.L281		@
.L286:
@ C_Code.c:666: 			if ((hp - oldDamage) <= 0) { if (!BlockingCanPreventLethal) { newHp = hp - oldDamage; newDamage = oldDamage; } }
	ldr	r1, .L287+20	@ tmp181,
@ C_Code.c:666: 			if ((hp - oldDamage) <= 0) { if (!BlockingCanPreventLethal) { newHp = hp - oldDamage; newDamage = oldDamage; } }
	ldr	r1, [r1]	@ BlockingCanPreventLethal, BlockingCanPreventLethal
	cmp	r1, #0	@ BlockingCanPreventLethal,
	bne	.L275		@,
	movs	r3, r2	@ newHp, _37
@ C_Code.c:666: 			if ((hp - oldDamage) <= 0) { if (!BlockingCanPreventLethal) { newHp = hp - oldDamage; newDamage = oldDamage; } }
	mov	r8, r9	@ newDamage, oldDamage
	b	.L275		@
.L288:
	.align	2
.L287:
	.word	gEkrGaugeHp
	.word	gEkrGaugeDmg
	.word	UsingSkillSys
	.word	__aeabi_idiv
	.word	BlockingEnabled
	.word	BlockingCanPreventLethal
	.size	AdjustDamageByPercent, .-AdjustDamageByPercent
	.align	1
	.p2align 2,,3
	.global	AdjustDamageWithGetter
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	AdjustDamageWithGetter, %function
AdjustDamageWithGetter:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}	@
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	movs	r5, #11	@ tmp124,
	movs	r4, #192	@ tmp125,
	ldrsb	r5, [r2, r5]	@ tmp124,
@ C_Code.c:539: void AdjustDamageWithGetter(TimedHitsProc* proc, struct NewProcEfxHPBar* HpProc, struct BattleUnit* active_bunit, struct BattleUnit* opp_bunit, struct SkillSysBattleHit* round, int success) { 
	sub	sp, sp, #12	@,,
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	ands	r4, r5	@ _14, tmp124
@ C_Code.c:520: 	if (success) { 
	ldr	r5, [sp, #28]	@ tmp136, success
	cmp	r5, #0	@ tmp136,
	beq	.L290		@,
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r4, #128	@ _14,
	bne	.L291		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r4, .L304	@ tmp126,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r4, [r4]	@ BlockingEnabled, BlockingEnabled
	cmp	r4, #0	@ BlockingEnabled,
	beq	.L289		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r4, .L304+4	@ tmp128,
	ldr	r4, [r4]	@ _19,
@ C_Code.c:541: 	if (percent != 100) { 
	cmp	r4, #100	@ _19,
	bne	.L303		@,
.L289:
@ C_Code.c:544: }
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L290:
@ C_Code.c:527: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r4, #128	@ _14,
	beq	.L289		@,
@ C_Code.c:530: 	return FailedHitDamagePercent; 
	ldr	r4, .L304+8	@ tmp130,
	ldr	r4, [r4]	@ _19,
.L293:
@ C_Code.c:541: 	if (percent != 100) { 
	cmp	r4, #100	@ _19,
	beq	.L289		@,
.L303:
@ C_Code.c:542: 		AdjustDamageByPercent(proc, HpProc, active_bunit, opp_bunit, round, percent);
	str	r4, [sp, #4]	@ _19,
	ldr	r4, [sp, #24]	@ tmp137, round
	str	r4, [sp]	@ tmp137,
	bl	AdjustDamageByPercent		@
@ C_Code.c:544: }
	b	.L289		@
.L291:
@ C_Code.c:525: 		return BonusDamagePercent; 
	ldr	r4, .L304+12	@ tmp129,
	ldr	r4, [r4]	@ _19,
	b	.L293		@
.L305:
	.align	2
.L304:
	.word	BlockingEnabled
	.word	ReducedDamagePercent
	.word	FailedHitDamagePercent
	.word	BonusDamagePercent
	.size	AdjustDamageWithGetter, .-AdjustDamageWithGetter
	.align	1
	.p2align 2,,3
	.global	DoStuffIfHit
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	DoStuffIfHit, %function
DoStuffIfHit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
	mov	r7, r9	@,
	mov	r6, r8	@,
	mov	lr, r10	@,
	movs	r4, r0	@ proc, tmp299
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	ldr	r0, .L358	@ tmp175,
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	ldrh	r5, [r0]	@ gBattleStats, gBattleStats
	movs	r0, #252	@ tmp179,
@ C_Code.c:440: void DoStuffIfHit(TimedHitsProc* proc, struct ProcEkrBattle* battleProc, struct NewProcEfxHPBar* HpProc, struct SkillSysBattleHit* round) { 
	push	{r6, r7, lr}	@
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	lsls	r0, r0, #2	@ tmp179, tmp179,
@ C_Code.c:440: void DoStuffIfHit(TimedHitsProc* proc, struct ProcEkrBattle* battleProc, struct NewProcEfxHPBar* HpProc, struct SkillSysBattleHit* round) { 
	movs	r7, r2	@ HpProc, tmp300
	movs	r6, r3	@ round, tmp301
	sub	sp, sp, #8	@,,
@ C_Code.c:95: 	if (gBattleStats.config & (BATTLE_CONFIG_PROMOTION | BATTLE_CONFIG_ARENA | BATTLE_CONFIG_REFRESH | BATTLE_CONFIG_MAPANIMS | BATTLE_CONFIG_PROMOTION_PREP | BATTLE_CONFIG_DANCERING)) { 
	tst	r5, r0	@ gBattleStats, tmp179
	bne	.L306		@,
@ C_Code.c:98: 	if (TimedHitsDifficultyRam->off) { return false; } 
	ldr	r3, .L358+4	@ tmp184,
	ldr	r3, [r3]	@ TimedHitsDifficultyRam, TimedHitsDifficultyRam
	ldrb	r3, [r3]	@ *TimedHitsDifficultyRam.0_13, *TimedHitsDifficultyRam.0_13
@ C_Code.c:98: 	if (TimedHitsDifficultyRam->off) { return false; } 
	lsls	r3, r3, #25	@ tmp308, *TimedHitsDifficultyRam.0_13,
	bpl	.L354		@,
.L306:
@ C_Code.c:516: } 
	add	sp, sp, #8	@,,
	@ sp needed	@
	pop	{r5, r6, r7}
	mov	r10, r7
	mov	r9, r6
	mov	r8, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L354:
@ C_Code.c:99: 	return !CheckFlag(DisabledFlag); 
	ldr	r3, .L358+8	@ tmp194,
	ldr	r0, [r3]	@ DisabledFlag, DisabledFlag
	ldr	r3, .L358+12	@ tmp196,
	bl	.L10		@
@ C_Code.c:441: 	if (!AreTimedHitsEnabled()) { return; } 
	cmp	r0, #0	@ tmp302,
	bne	.L306		@,
@ C_Code.c:442: 	if (round->hpChange < 0) { return; } // healing 
	ldrb	r3, [r6, #3]	@ tmp201,
	cmp	r3, #127	@ tmp201,
	bhi	.L306		@,
@ C_Code.c:443: 	u32 keys = sKeyStatusBuffer.newKeys | sKeyStatusBuffer.heldKeys; 
	ldr	r3, .L358+16	@ tmp202,
@ C_Code.c:443: 	u32 keys = sKeyStatusBuffer.newKeys | sKeyStatusBuffer.heldKeys; 
	ldrh	r2, [r3, #8]	@ tmp205,
	ldrh	r3, [r3, #4]	@ tmp207,
@ C_Code.c:443: 	u32 keys = sKeyStatusBuffer.newKeys | sKeyStatusBuffer.heldKeys; 
	orrs	r2, r3	@ tmp205, tmp207
@ C_Code.c:447: 	int x = proc->anim2->xPosition; 
	ldr	r3, [r4, #48]	@ proc_8(D)->anim2, proc_8(D)->anim2
@ C_Code.c:447: 	int x = proc->anim2->xPosition; 
	movs	r5, #2	@ x,
	ldrsh	r5, [r3, r5]	@ x, proc_8(D)->anim2, x
@ C_Code.c:443: 	u32 keys = sKeyStatusBuffer.newKeys | sKeyStatusBuffer.heldKeys; 
	mov	r8, r2	@ keys, tmp205
@ C_Code.c:448: 	if (x > 119) { x -= 40; } 
	cmp	r5, #119	@ x,
	bgt	.LCB1877	@
	b	.L310	@long jump	@
.LCB1877:
@ C_Code.c:448: 	if (x > 119) { x -= 40; } 
	subs	r5, r5, #40	@ x,
.L311:
@ C_Code.c:450: 	struct BattleUnit* active_bunit = proc->active_bunit; 
	ldr	r3, [r4, #60]	@ active_bunit, proc_8(D)->active_bunit
	mov	r9, r3	@ active_bunit, active_bunit
@ C_Code.c:451: 	struct BattleUnit* opp_bunit = proc->opp_bunit; 
	ldr	r3, [r4, #64]	@ opp_bunit, proc_8(D)->opp_bunit
	mov	r10, r3	@ opp_bunit, opp_bunit
@ C_Code.c:452: 	int hitTime = !proc->EkrEfxIsUnitHittedNowFrames; 
	movs	r3, #79	@ tmp211,
@ C_Code.c:453: 	if (hitTime) { // 1 frame 
	ldrb	r3, [r4, r3]	@ tmp212,
	cmp	r3, #0	@ tmp212,
	bne	.L313		@,
@ C_Code.c:455: 		if (proc->timer2 == 0xFF) { proc->timer2 = 0; }  
	movs	r2, #68	@ tmp213,
@ C_Code.c:455: 		if (proc->timer2 == 0xFF) { proc->timer2 = 0; }  
	ldrb	r1, [r4, r2]	@ tmp214,
	cmp	r1, #255	@ tmp214,
	bne	.LCB1892	@
	b	.L355	@long jump	@
.LCB1892:
.L314:
@ C_Code.c:456: 		SaveInputFrame(proc, keys); 
	mov	r1, r8	@, keys
	movs	r0, r4	@, proc
	bl	SaveInputFrame		@
@ C_Code.c:457: 		SaveIfWeHitOnTime(proc);
	movs	r0, r4	@, proc
	bl	SaveIfWeHitOnTime		@
@ C_Code.c:458: 		if (!proc->adjustedDmg) { 
	movs	r3, #71	@ tmp218,
@ C_Code.c:458: 		if (!proc->adjustedDmg) { 
	ldrb	r2, [r4, r3]	@ tmp219,
	cmp	r2, #0	@ tmp219,
	bne	.L313		@,
@ C_Code.c:527: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	mov	r2, r9	@ active_bunit, active_bunit
	movs	r1, #192	@ tmp221,
	ldrb	r2, [r2, #11]	@ tmp220,
	lsls	r2, r2, #24	@ tmp220, tmp220,
	asrs	r2, r2, #24	@ tmp220, tmp220,
	ands	r1, r2	@ _113, tmp220
@ C_Code.c:389: 	return (gPlaySt.unk1F & 0x80); // 202BD0F
	ldr	r2, .L358+20	@ tmp222,
@ C_Code.c:393: 	if (CheatCodeOn()) { return true; } 
	ldrb	r2, [r2, #31]	@ tmp225,
	cmp	r2, #127	@ tmp225,
	bls	.LCB1912	@
	b	.L316	@long jump	@
.LCB1912:
@ C_Code.c:394: 	if (AlwaysWork) { return true; } 
	ldr	r2, .L358+24	@ tmp226,
@ C_Code.c:394: 	if (AlwaysWork) { return true; } 
	ldr	r2, [r2]	@ AlwaysWork, AlwaysWork
	cmp	r2, #0	@ AlwaysWork,
	beq	.LCB1916	@
	b	.L316	@long jump	@
.LCB1916:
@ C_Code.c:395: 	return proc->hitOnTime;
	adds	r2, r2, #69	@ tmp228,
@ C_Code.c:459: 			if (DidWeHitOnTime(proc)) { 
	ldrb	r2, [r4, r2]	@ tmp229,
	cmp	r2, #0	@ tmp229,
	bne	.L316		@,
@ C_Code.c:464: 				proc->adjustedDmg = true; 
	movs	r2, #1	@ tmp238,
	strb	r2, [r4, r3]	@ tmp238, proc_8(D)->adjustedDmg
@ C_Code.c:527: 	if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r1, #128	@ _113,
	beq	.L313		@,
@ C_Code.c:530: 	return FailedHitDamagePercent; 
	ldr	r3, .L358+28	@ tmp240,
	ldr	r3, [r3]	@ _99,
.L353:
@ C_Code.c:541: 	if (percent != 100) { 
	cmp	r3, #100	@ _99,
	beq	.L313		@,
@ C_Code.c:542: 		AdjustDamageByPercent(proc, HpProc, active_bunit, opp_bunit, round, percent);
	str	r3, [sp, #4]	@ _99,
	mov	r2, r9	@, active_bunit
	mov	r3, r10	@, opp_bunit
	movs	r1, r7	@, HpProc
	movs	r0, r4	@, proc
	str	r6, [sp]	@ round,
	bl	AdjustDamageByPercent		@
.L313:
@ C_Code.c:474: 	if (EkrEfxIsUnitHittedNow(proc->side) || (proc->code4frame != 0xFF) || (proc->codefframe != 0xFF) || (proc->timer2 != 0xFF)) { 
	movs	r3, #74	@ tmp241,
@ C_Code.c:474: 	if (EkrEfxIsUnitHittedNow(proc->side) || (proc->code4frame != 0xFF) || (proc->codefframe != 0xFF) || (proc->timer2 != 0xFF)) { 
	ldrb	r0, [r4, r3]	@ tmp242,
	ldr	r3, .L358+32	@ tmp243,
	bl	.L10		@
@ C_Code.c:474: 	if (EkrEfxIsUnitHittedNow(proc->side) || (proc->code4frame != 0xFF) || (proc->codefframe != 0xFF) || (proc->timer2 != 0xFF)) { 
	movs	r3, #68	@ tmp246,
	ldrb	r6, [r4, r3]	@ prephitmp_69,
@ C_Code.c:474: 	if (EkrEfxIsUnitHittedNow(proc->side) || (proc->code4frame != 0xFF) || (proc->codefframe != 0xFF) || (proc->timer2 != 0xFF)) { 
	cmp	r0, #0	@ tmp244,
	bne	.L321		@,
@ C_Code.c:474: 	if (EkrEfxIsUnitHittedNow(proc->side) || (proc->code4frame != 0xFF) || (proc->codefframe != 0xFF) || (proc->timer2 != 0xFF)) { 
	adds	r3, r3, #8	@ tmp248,
	ldrh	r2, [r4, r3]	@ MEM <struct TimedHitsProc> [(void *)proc_8(D)], MEM <struct TimedHitsProc> [(void *)proc_8(D)]
	ldr	r3, .L358+36	@ tmp250,
	cmp	r2, r3	@ MEM <struct TimedHitsProc> [(void *)proc_8(D)], tmp250
	beq	.L356		@,
.L321:
@ C_Code.c:389: 	return (gPlaySt.unk1F & 0x80); // 202BD0F
	ldr	r3, .L358+20	@ tmp251,
@ C_Code.c:393: 	if (CheatCodeOn()) { return true; } 
	ldrb	r3, [r3, #31]	@ tmp254,
	cmp	r3, #127	@ tmp254,
	bhi	.L323		@,
@ C_Code.c:394: 	if (AlwaysWork) { return true; } 
	ldr	r3, .L358+24	@ tmp255,
@ C_Code.c:394: 	if (AlwaysWork) { return true; } 
	ldr	r3, [r3]	@ AlwaysWork, AlwaysWork
	cmp	r3, #0	@ AlwaysWork,
	bne	.L323		@,
@ C_Code.c:395: 	return proc->hitOnTime;
	adds	r3, r3, #69	@ tmp257,
@ C_Code.c:475: 		if (DidWeHitOnTime(proc)) { 
	ldrb	r3, [r4, r3]	@ tmp258,
	cmp	r3, #0	@ tmp258,
	bne	.L323		@,
@ C_Code.c:492: 		else if (proc->timer2 < 20) { 
	cmp	r6, #19	@ prephitmp_69,
	bhi	.L325		@,
@ C_Code.c:493: 			if (ChangePaletteWhenButtonIsPressed) { 
	ldr	r2, .L358+40	@ tmp285,
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	ldr	r3, .L358+44	@ tmp284,
@ C_Code.c:493: 			if (ChangePaletteWhenButtonIsPressed) { 
	ldr	r2, [r2]	@ ChangePaletteWhenButtonIsPressed, ChangePaletteWhenButtonIsPressed
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	ldr	r3, [r3]	@ pretmp_111, DisplayPress
@ C_Code.c:493: 			if (ChangePaletteWhenButtonIsPressed) { 
	cmp	r2, #0	@ ChangePaletteWhenButtonIsPressed,
	beq	.L326		@,
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	cmp	r3, #0	@ pretmp_111,
	bne	.L357		@,
.L325:
@ C_Code.c:500: 		proc->roundEnd = true; 
	movs	r3, #78	@ tmp287,
	movs	r2, #1	@ tmp288,
	strb	r2, [r4, r3]	@ tmp288, proc_8(D)->roundEnd
	b	.L306		@
.L323:
@ C_Code.c:485: 			if (((y > (-16)) && (y < (161)))) { 
	movs	r3, #63	@ tmp259,
	subs	r3, r3, r6	@ tmp260, tmp259, prephitmp_69
@ C_Code.c:485: 			if (((y > (-16)) && (y < (161)))) { 
	cmp	r3, #175	@ tmp260,
	bhi	.L325		@,
@ C_Code.c:486: 				if (!gBanimDoneFlag[proc->side]) { // doesn't seem to matter ? 
	movs	r2, #74	@ tmp262,
	ldrb	r2, [r4, r2]	@ tmp263,
@ C_Code.c:486: 				if (!gBanimDoneFlag[proc->side]) { // doesn't seem to matter ? 
	ldr	r3, .L358+48	@ tmp261,
	lsls	r2, r2, #2	@ tmp264, tmp263,
@ C_Code.c:486: 				if (!gBanimDoneFlag[proc->side]) { // doesn't seem to matter ? 
	ldr	r3, [r2, r3]	@ gBanimDoneFlag[_56], gBanimDoneFlag[_56]
	cmp	r3, #0	@ gBanimDoneFlag[_56],
	bne	.L325		@,
@ C_Code.c:481: 			x += xPos[Mod(clock, sizeof(xPos)+1)]; 
	movs	r1, #31	@,
	movs	r0, r6	@, prephitmp_69
	ldr	r3, .L358+52	@ tmp266,
	bl	.L10		@
@ C_Code.c:481: 			x += xPos[Mod(clock, sizeof(xPos)+1)]; 
	ldr	r3, .L358+56	@ tmp267,
	movs	r2, #104	@ tmp268,
	adds	r3, r3, r0	@ tmp269, tmp267, tmp304
@ C_Code.c:484: 			y -= clock; 
	movs	r0, #48	@ tmp273,
@ C_Code.c:481: 			x += xPos[Mod(clock, sizeof(xPos)+1)]; 
	ldrb	r1, [r3, r2]	@ tmp270, xPos
@ C_Code.c:484: 			y -= clock; 
	subs	r0, r0, r6	@ y, tmp273, prephitmp_69
@ C_Code.c:487: 				PutSprite(0, OAM1_X(x + 0x200), OAM0_Y(y), sSprite_Star, oam2); 
	adds	r2, r2, #151	@ tmp275,
	ands	r2, r0	@ tmp276, y
	movs	r0, #224	@ tmp280,
@ C_Code.c:481: 			x += xPos[Mod(clock, sizeof(xPos)+1)]; 
	adds	r1, r1, r5	@ x, tmp270, x
@ C_Code.c:487: 				PutSprite(0, OAM1_X(x + 0x200), OAM0_Y(y), sSprite_Star, oam2); 
	ldr	r3, .L358+60	@ tmp271,
@ C_Code.c:482: 			x += 16; 
	adds	r1, r1, #16	@ x,
@ C_Code.c:487: 				PutSprite(0, OAM1_X(x + 0x200), OAM0_Y(y), sSprite_Star, oam2); 
	lsls	r0, r0, #8	@ tmp280, tmp280,
	lsls	r1, r1, #23	@ tmp279, x,
	str	r0, [sp]	@ tmp280,
	ldr	r5, .L358+64	@ tmp281,
	movs	r0, #0	@,
	adds	r3, r3, #8	@ tmp272,
	lsrs	r1, r1, #23	@ tmp278, tmp279,
	bl	.L27		@
	b	.L325		@
.L310:
@ C_Code.c:449: 	else if (x > 40) { x -= 20; } 
	cmp	r5, #40	@ x,
	bgt	.LCB2025	@
	b	.L311	@long jump	@
.LCB2025:
@ C_Code.c:449: 	else if (x > 40) { x -= 20; } 
	subs	r5, r5, #20	@ x,
	b	.L311		@
.L356:
@ C_Code.c:474: 	if (EkrEfxIsUnitHittedNow(proc->side) || (proc->code4frame != 0xFF) || (proc->codefframe != 0xFF) || (proc->timer2 != 0xFF)) { 
	cmp	r6, #255	@ prephitmp_69,
	bne	.L321		@,
@ C_Code.c:504: 		if (proc->timer < 1) { proc->frame = 0; } // 10 frames after hitting where it's okay to have A held down 
	ldr	r3, [r4, #52]	@ proc_8(D)->timer, proc_8(D)->timer
	cmp	r3, #0	@ proc_8(D)->timer,
	bgt	.L327		@,
@ C_Code.c:504: 		if (proc->timer < 1) { proc->frame = 0; } // 10 frames after hitting where it's okay to have A held down 
	movs	r3, #75	@ tmp291,
	strb	r0, [r4, r3]	@ tmp244, proc_8(D)->frame
.L328:
@ C_Code.c:509: 		if (!proc->roundEnd) { 
	movs	r3, #78	@ tmp294,
@ C_Code.c:509: 		if (!proc->roundEnd) { 
	ldrb	r3, [r4, r3]	@ tmp295,
	cmp	r3, #0	@ tmp295,
	beq	.LCB2043	@
	b	.L306	@long jump	@
.LCB2043:
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	ldr	r3, .L358+44	@ tmp296,
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	ldr	r3, [r3]	@ DisplayPress, DisplayPress
	cmp	r3, #0	@ DisplayPress,
	bne	.LCB2047	@
	b	.L306	@long jump	@
.LCB2047:
	movs	r3, #15	@,
	movs	r2, #24	@,
	movs	r1, r5	@, x
	movs	r0, r4	@, proc
	bl	DrawButtonsToPress.part.0		@
	b	.L306		@
.L355:
@ C_Code.c:455: 		if (proc->timer2 == 0xFF) { proc->timer2 = 0; }  
	strb	r3, [r4, r2]	@ tmp212, proc_8(D)->timer2
	b	.L314		@
.L316:
@ C_Code.c:460: 				proc->adjustedDmg = true; 
	movs	r3, #71	@ tmp230,
	movs	r2, #1	@ tmp231,
	strb	r2, [r4, r3]	@ tmp231, proc_8(D)->adjustedDmg
@ C_Code.c:521: 		if (UNIT_FACTION(&active_bunit->unit) == FACTION_RED) { 
	cmp	r1, #128	@ _113,
	bne	.L318		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, .L358+68	@ tmp233,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, [r3]	@ BlockingEnabled, BlockingEnabled
	cmp	r3, #0	@ BlockingEnabled,
	beq	.L313		@,
@ C_Code.c:522: 			if (BlockingEnabled) { return ReducedDamagePercent; }
	ldr	r3, .L358+72	@ tmp235,
	ldr	r3, [r3]	@ _81,
	b	.L353		@
.L326:
@ C_Code.c:399: 	if (!DisplayPress) { return; } 
	cmp	r3, #0	@ pretmp_111,
	beq	.L325		@,
	movs	r3, #14	@,
	movs	r2, #24	@,
	movs	r1, r5	@, x
	movs	r0, r4	@, proc
	bl	DrawButtonsToPress.part.0		@
	b	.L325		@
.L318:
@ C_Code.c:525: 		return BonusDamagePercent; 
	ldr	r3, .L358+76	@ tmp236,
	ldr	r3, [r3]	@ _81,
	b	.L353		@
.L357:
	movs	r3, #15	@,
	movs	r2, #24	@,
	movs	r1, r5	@, x
	movs	r0, r4	@, proc
	bl	DrawButtonsToPress.part.0		@
	b	.L325		@
.L327:
@ C_Code.c:507: 			SaveInputFrame(proc, keys); 
	mov	r1, r8	@, keys
	movs	r0, r4	@, proc
	bl	SaveInputFrame		@
	b	.L328		@
.L359:
	.align	2
.L358:
	.word	gBattleStats
	.word	TimedHitsDifficultyRam
	.word	DisabledFlag
	.word	CheckFlag
	.word	sKeyStatusBuffer
	.word	gPlaySt
	.word	AlwaysWork
	.word	FailedHitDamagePercent
	.word	EkrEfxIsUnitHittedNow
	.word	65535
	.word	ChangePaletteWhenButtonIsPressed
	.word	DisplayPress
	.word	gBanimDoneFlag
	.word	Mod
	.word	.LANCHOR0
	.word	.LANCHOR1
	.word	PutSprite
	.word	BlockingEnabled
	.word	ReducedDamagePercent
	.word	BonusDamagePercent
	.size	DoStuffIfHit, .-DoStuffIfHit
	.align	1
	.p2align 2,,3
	.global	LoopTimedHitsProc
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	LoopTimedHitsProc, %function
LoopTimedHitsProc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}	@
@ C_Code.c:260: 	if (!proc->anim) { return; } 
	ldr	r3, [r0, #44]	@ proc_29(D)->anim, proc_29(D)->anim
@ C_Code.c:259: void LoopTimedHitsProc(TimedHitsProc* proc) { 
	movs	r4, r0	@ proc, tmp183
	sub	sp, sp, #12	@,,
@ C_Code.c:260: 	if (!proc->anim) { return; } 
	cmp	r3, #0	@ proc_29(D)->anim,
	beq	.L360		@,
@ C_Code.c:262: 	struct ProcEkrBattle* battleProc = gpProcEkrBattle; 
	ldr	r3, .L385	@ tmp143,
	ldr	r5, [r3]	@ battleProc, gpProcEkrBattle
@ C_Code.c:264: 	if (!battleProc) { return; } // 0 after suspend until battle start 
	cmp	r5, #0	@ battleProc,
	beq	.L360		@,
@ C_Code.c:265: 	if (!proc->anim2) { return; }
	ldr	r3, [r0, #48]	@ proc_29(D)->anim2, proc_29(D)->anim2
	cmp	r3, #0	@ proc_29(D)->anim2,
	beq	.L360		@,
@ C_Code.c:266: 	if (gEkrBattleEndFlag) { return; } // 0 after suspend until battle done
	ldr	r3, .L385+4	@ tmp145,
@ C_Code.c:266: 	if (gEkrBattleEndFlag) { return; } // 0 after suspend until battle done
	ldr	r3, [r3]	@ gEkrBattleEndFlag, gEkrBattleEndFlag
	cmp	r3, #0	@ gEkrBattleEndFlag,
	bne	.L360		@,
@ C_Code.c:270: 	if (proc->timer2 != 0xFF) { proc->timer2++; } 
	movs	r2, #68	@ tmp149,
@ C_Code.c:269: 	proc->timer++;
	ldr	r3, [r0, #52]	@ proc_29(D)->timer, proc_29(D)->timer
	adds	r3, r3, #1	@ tmp147,
	str	r3, [r0, #52]	@ tmp147, proc_29(D)->timer
@ C_Code.c:270: 	if (proc->timer2 != 0xFF) { proc->timer2++; } 
	ldrb	r3, [r0, r2]	@ _6,
@ C_Code.c:270: 	if (proc->timer2 != 0xFF) { proc->timer2++; } 
	cmp	r3, #255	@ _6,
	beq	.L364		@,
@ C_Code.c:270: 	if (proc->timer2 != 0xFF) { proc->timer2++; } 
	adds	r3, r3, #1	@ tmp150,
	strb	r3, [r0, r2]	@ tmp150, proc_29(D)->timer2
.L364:
@ C_Code.c:274: 	if (proc->EkrEfxIsUnitHittedNowFrames != 0xFF) { 
	movs	r6, #79	@ tmp153,
	ldrb	r3, [r4, r6]	@ _8,
@ C_Code.c:272: 	struct SkillSysBattleHit* currentRound = proc->currentRound; 
	ldr	r7, [r4, #56]	@ currentRound, proc_29(D)->currentRound
@ C_Code.c:274: 	if (proc->EkrEfxIsUnitHittedNowFrames != 0xFF) { 
	cmp	r3, #255	@ _8,
	beq	.L365		@,
@ C_Code.c:275: 		proc->EkrEfxIsUnitHittedNowFrames++; 
	adds	r3, r3, #1	@ tmp154,
	strb	r3, [r4, r6]	@ tmp154, proc_29(D)->EkrEfxIsUnitHittedNowFrames
.L366:
@ C_Code.c:280: 	struct NewProcEfxHPBar* HpProc = Proc_Find(gProcScr_efxHPBarResire); 
	ldr	r3, .L385+8	@ tmp165,
	ldr	r6, .L385+12	@ tmp167,
	ldr	r0, [r3]	@ gProcScr_efxHPBarResire, gProcScr_efxHPBarResire
	bl	.L121		@
	subs	r2, r0, #0	@ HpProc, tmp185,
@ C_Code.c:281: 	if (!HpProc) { HpProc = Proc_Find(gProcScr_efxHPBar); } 
	beq	.L384		@,
@ C_Code.c:282: 	DoStuffIfHit(proc, battleProc, HpProc, currentRound); 
	movs	r3, r7	@, currentRound
	movs	r1, r5	@, battleProc
	movs	r0, r4	@, proc
	bl	DoStuffIfHit		@
.L368:
@ C_Code.c:255: 	if (proc->EkrEfxIsUnitHittedNowFrames) { return false; } 
	movs	r3, #79	@ tmp171,
@ C_Code.c:255: 	if (proc->EkrEfxIsUnitHittedNowFrames) { return false; } 
	ldrb	r3, [r4, r3]	@ tmp172,
	cmp	r3, #0	@ tmp172,
	bne	.L360		@,
@ C_Code.c:284: 		int x = DisplayDamage2(proc->anim2, 0, 0, 0, proc->roundId); 
	movs	r6, #70	@ tmp174,
@ C_Code.c:284: 		int x = DisplayDamage2(proc->anim2, 0, 0, 0, proc->roundId); 
	ldrb	r3, [r4, r6]	@ tmp175,
	movs	r1, #0	@,
	movs	r2, #0	@,
	str	r3, [sp]	@ tmp175,
	ldr	r0, [r4, #48]	@ proc_29(D)->anim2, proc_29(D)->anim2
	movs	r3, #0	@,
	ldr	r5, .L385+16	@ tmp176,
	bl	.L27		@
	movs	r3, r0	@ x, tmp187
@ C_Code.c:285: 		x = DisplayDamage2(proc->anim, 1, proc->anim->xPosition, x, proc->roundId);  
	ldr	r0, [r4, #44]	@ _18, proc_29(D)->anim
	movs	r1, #2	@ tmp191,
	ldrsh	r2, [r0, r1]	@ tmp177, _18, tmp191
	ldrb	r1, [r4, r6]	@ tmp179,
	str	r1, [sp]	@ tmp179,
	movs	r1, #1	@,
	bl	.L27		@
.L360:
@ C_Code.c:288: } 
	add	sp, sp, #12	@,,
	@ sp needed	@
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L365:
@ C_Code.c:277: 	else if (EkrEfxIsUnitHittedNow(proc->side)) { proc->EkrEfxIsUnitHittedNowFrames = 0; } 
	movs	r3, #74	@ tmp157,
@ C_Code.c:277: 	else if (EkrEfxIsUnitHittedNow(proc->side)) { proc->EkrEfxIsUnitHittedNowFrames = 0; } 
	ldrb	r0, [r4, r3]	@ tmp158,
	ldr	r3, .L385+20	@ tmp159,
	bl	.L10		@
@ C_Code.c:277: 	else if (EkrEfxIsUnitHittedNow(proc->side)) { proc->EkrEfxIsUnitHittedNowFrames = 0; } 
	cmp	r0, #0	@ tmp184,
	beq	.L366		@,
@ C_Code.c:277: 	else if (EkrEfxIsUnitHittedNow(proc->side)) { proc->EkrEfxIsUnitHittedNowFrames = 0; } 
	movs	r3, #0	@ tmp163,
	strb	r3, [r4, r6]	@ tmp163, proc_29(D)->EkrEfxIsUnitHittedNowFrames
	b	.L366		@
.L384:
@ C_Code.c:281: 	if (!HpProc) { HpProc = Proc_Find(gProcScr_efxHPBar); } 
	ldr	r3, .L385+24	@ tmp168,
	ldr	r0, [r3]	@ gProcScr_efxHPBar, gProcScr_efxHPBar
	bl	.L121		@
@ C_Code.c:282: 	DoStuffIfHit(proc, battleProc, HpProc, currentRound); 
	movs	r3, r7	@, currentRound
@ C_Code.c:281: 	if (!HpProc) { HpProc = Proc_Find(gProcScr_efxHPBar); } 
	movs	r6, r0	@ HpProc, tmp186
@ C_Code.c:282: 	DoStuffIfHit(proc, battleProc, HpProc, currentRound); 
	movs	r2, r0	@, HpProc
	movs	r1, r5	@, battleProc
	movs	r0, r4	@, proc
	bl	DoStuffIfHit		@
@ C_Code.c:253: 	if (!HpProc) { return false; } // 
	cmp	r6, #0	@ HpProc,
	beq	.L360		@,
	b	.L368		@
.L386:
	.align	2
.L385:
	.word	gpProcEkrBattle
	.word	gEkrBattleEndFlag
	.word	gProcScr_efxHPBarResire
	.word	Proc_Find
	.word	DisplayDamage2
	.word	EkrEfxIsUnitHittedNow
	.word	gProcScr_efxHPBar
	.size	LoopTimedHitsProc, .-LoopTimedHitsProc
	.align	1
	.p2align 2,,3
	.global	GetBattleAnimPreconfType
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	GetBattleAnimPreconfType, %function
GetBattleAnimPreconfType:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
@ C_Code.c:691: 	int result = gPlaySt.config.animationType; 
	movs	r2, #66	@ tmp129,
@ C_Code.c:690: int GetBattleAnimPreconfType(void) {
	push	{r4, lr}	@
@ C_Code.c:691: 	int result = gPlaySt.config.animationType; 
	ldr	r3, .L399	@ tmp163,
	ldrb	r0, [r3, r2]	@ gPlaySt, gPlaySt
@ C_Code.c:692: 	if (!CheatCodeOn()) { 
	ldrb	r2, [r3, #31]	@ tmp138,
@ C_Code.c:691: 	int result = gPlaySt.config.animationType; 
	lsls	r0, r0, #29	@ tmp133, gPlaySt,
@ C_Code.c:691: 	int result = gPlaySt.config.animationType; 
	lsrs	r0, r0, #30	@ <retval>, tmp133,
@ C_Code.c:692: 	if (!CheatCodeOn()) { 
	cmp	r2, #127	@ tmp138,
	bhi	.L388		@,
@ C_Code.c:693: 		if (ForceAnimsOn) { if (result == 2) { return 2; } else { return 1; } } 
	ldr	r2, .L399+4	@ tmp139,
@ C_Code.c:693: 		if (ForceAnimsOn) { if (result == 2) { return 2; } else { return 1; } } 
	ldr	r2, [r2]	@ ForceAnimsOn, ForceAnimsOn
	cmp	r2, #0	@ ForceAnimsOn,
	beq	.L388		@,
@ C_Code.c:693: 		if (ForceAnimsOn) { if (result == 2) { return 2; } else { return 1; } } 
	cmp	r0, #2	@ <retval>,
	beq	.L387		@,
.L391:
@ C_Code.c:693: 		if (ForceAnimsOn) { if (result == 2) { return 2; } else { return 1; } } 
	movs	r0, #1	@ <retval>,
.L387:
@ C_Code.c:714: }
	@ sp needed	@
	pop	{r4}
	pop	{r1}
	bx	r1
.L388:
@ C_Code.c:696:     if (gPlaySt.config.animationType != PLAY_ANIMCONF_SOLO_ANIM)
	movs	r2, #66	@ tmp142,
	ldrb	r2, [r3, r2]	@ gPlaySt, gPlaySt
@ C_Code.c:696:     if (gPlaySt.config.animationType != PLAY_ANIMCONF_SOLO_ANIM)
	movs	r3, #6	@ tmp148,
	ands	r3, r2	@ tmp149, gPlaySt
	cmp	r3, #4	@ tmp149,
	bne	.L387		@,
@ C_Code.c:700:     if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
	movs	r1, #11	@ tmp153,
@ C_Code.c:701:         if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE)
	movs	r4, #11	@ pretmp_25,
@ C_Code.c:700:     if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
	ldr	r0, .L399+8	@ tmp152,
@ C_Code.c:701:         if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE)
	ldr	r2, .L399+12	@ tmp151,
@ C_Code.c:700:     if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
	ldrsb	r1, [r0, r1]	@ tmp153,
	adds	r3, r3, #188	@ tmp154,
@ C_Code.c:701:         if (UNIT_FACTION(&gBattleTarget.unit) == FACTION_BLUE)
	ldrsb	r4, [r2, r4]	@ pretmp_25,* pretmp_25
@ C_Code.c:700:     if (UNIT_FACTION(&gBattleActor.unit) == FACTION_BLUE)
	tst	r3, r1	@ tmp154, tmp153
	beq	.L398		@,
@ C_Code.c:706:         if (UNIT_FACTION(&gBattleTarget.unit) != FACTION_BLUE)
	tst	r3, r4	@ tmp154, pretmp_25
	bne	.L391		@,
@ C_Code.c:713:         return GetSoloAnimPreconfType(&gBattleTarget.unit);
	movs	r0, r2	@, tmp151
.L398:
	ldr	r3, .L399+16	@ tmp161,
	bl	.L10		@
	b	.L387		@
.L400:
	.align	2
.L399:
	.word	gPlaySt
	.word	ForceAnimsOn
	.word	gBattleActor
	.word	gBattleTarget
	.word	GetSoloAnimPreconfType
	.size	GetBattleAnimPreconfType, .-GetBattleAnimPreconfType
	.global	xPos
	.global	RomKeysList
	.global	sSprite_Down_Button
	.global	sSprite_Up_Button
	.global	sSprite_Right_Button
	.global	sSprite_Left_Button
	.global	sSprite_B_Button
	.global	sSprite_A_Button
	.global	sSprite_Star
	.global	sSprite_PressInput2
	.global	sSprite_PressInput
	.global	sSprite_MissedInput
	.global	sSprite_HitInput
	.global	TimedHitsProcCmd
	.section	.rodata.str1.4
	.align	2
.LC112:
	.ascii	"TimedHitsProcName\000"
	.global	gEkrBg2QuakeVec
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR1,. + 128
	.type	TimedHitsProcCmd, %object
	.size	TimedHitsProcCmd, 32
TimedHitsProcCmd:
@ opcode:
	.short	1
@ dataImm:
	.short	0
@ dataPtr:
	.word	.LC112
@ opcode:
	.short	14
@ dataImm:
	.short	0
@ dataPtr:
	.word	0
@ opcode:
	.short	3
@ dataImm:
	.short	0
@ dataPtr:
	.word	LoopTimedHitsProc
@ opcode:
	.short	0
@ dataImm:
	.short	0
@ dataPtr:
	.word	0
	.type	sSprite_PressInput, %object
	.size	sSprite_PressInput, 8
sSprite_PressInput:
	.short	1
	.short	16384
	.short	-32768
	.short	332
	.type	sSprite_PressInput2, %object
	.size	sSprite_PressInput2, 8
sSprite_PressInput2:
	.short	1
	.short	0
	.short	16384
	.short	336
	.type	RomKeysList, %object
	.size	RomKeysList, 6
RomKeysList:
	.ascii	"\001\002\020 @\200"
	.space	2
	.type	sSprite_A_Button, %object
	.size	sSprite_A_Button, 8
sSprite_A_Button:
	.short	1
	.short	0
	.short	16384
	.short	320
	.type	sSprite_B_Button, %object
	.size	sSprite_B_Button, 8
sSprite_B_Button:
	.short	1
	.short	0
	.short	16384
	.short	322
	.type	sSprite_Left_Button, %object
	.size	sSprite_Left_Button, 8
sSprite_Left_Button:
	.short	1
	.short	0
	.short	16384
	.short	324
	.type	sSprite_Right_Button, %object
	.size	sSprite_Right_Button, 8
sSprite_Right_Button:
	.short	1
	.short	0
	.short	16384
	.short	326
	.type	sSprite_Up_Button, %object
	.size	sSprite_Up_Button, 8
sSprite_Up_Button:
	.short	1
	.short	0
	.short	16384
	.short	328
	.type	sSprite_Down_Button, %object
	.size	sSprite_Down_Button, 8
sSprite_Down_Button:
	.short	1
	.short	0
	.short	16384
	.short	330
	.type	xPos, %object
	.size	xPos, 30
xPos:
	.ascii	"\000\000\000\001\001\001\002\002\002\003\003\003\004"
	.ascii	"\004\004\005\005\005\004\004\004\003\003\003\002\002"
	.ascii	"\002\001\001\001"
	.space	2
	.type	sSprite_Star, %object
	.size	sSprite_Star, 8
sSprite_Star:
	.short	1
	.short	0
	.short	16384
	.short	338
	.type	sSprite_MissedInput, %object
	.size	sSprite_MissedInput, 8
sSprite_MissedInput:
	.short	1
	.short	0
	.short	16384
	.short	460
	.type	sSprite_HitInput, %object
	.size	sSprite_HitInput, 8
sSprite_HitInput:
	.short	1
	.short	2
	.short	16384
	.short	458
	.bss
	.align	2
	.type	gEkrBg2QuakeVec, %object
	.size	gEkrBg2QuakeVec, 4
gEkrBg2QuakeVec:
	.space	4
	.ident	"GCC: (devkitARM release 56) 11.1.0"
	.text
	.code 16
	.align	1
.L10:
	bx	r3
.L176:
	bx	r4
.L27:
	bx	r5
.L121:
	bx	r6
.L122:
	bx	r9
.L62:
	bx	fp
