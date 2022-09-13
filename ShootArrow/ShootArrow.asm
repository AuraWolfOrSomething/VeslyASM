.thumb 
.macro blh to, reg=r3
  ldr \reg, =\to
  mov lr, \reg
  .short 0xf800
.endm

.equ RefreshFogAndUnitMaps, 0x801A1F4 
.equ AddArrowTrapTargetsToTargetList, 0x802E710 @r0 = x, r1 = y, r2 = trap type (7 for arrow) 
.equ BWL_AddLossFromTrap, 0x802EA1C 
.equ GenerateDisplayedTrapDamageTargets, 0x802E8A8 
.equ AddTarget, 0x804F8BC 
.equ InitTargets, 0x804F8A4 
.equ gProc_ShowArrowAnimation, 0x859E490 
.equ RefreshEntityMaps, 0x801A1F4 
.equ CheckForDeadUnitsAndGameOver, 0x802EA28 
.equ MemorySlot, 0x30004B8 
.equ ProcStart, 0x8002C7C 
.equ ProcStartBlocking, 0x8002CE0 

push {r4-r7, lr} 
@mov r4, r0 @ Parent proc 

blh RefreshFogAndUnitMaps

mov r0, #0 
mov r1, #0 
blh InitTargets 

ldr r3, =MemorySlot 
ldrh r5, [r3, #4*1] @ damage 
add r3, #0x0B*4 

ldrh r6, [r3] @ XX 
ldrh r7, [r3, #2] @ YY
mov r0, r6 
mov r1, r7  
mov r2, r5 @ damage 
blh AddArrowTrapTargetsToTargetList 
blh BWL_AddLossFromTrap 
@blh GenerateDisplayedTrapDamageTargets 

mov r0, #0 
mov r1, #0 
blh InitTargets 

mov r0, r6 @ XX 
mov r1, r7 @ YY 
mov r2, #0 
mov r3, #7 @ arrow trap ID @ $36384 has a whole bunch of if statements related to target's r3 value 
blh AddTarget, r4  
mov r0, r6 @ XX 
mov r1, r7 @ YY 
mov r2, r5 @ damage 
blh AddArrowTrapTargetsToTargetList 

@ldr r0, =gProc_ShowArrowAnimation 
@mov r1, r4 @ parent 
@blh ProcStartBlocking 





pop {r4-r7} 
pop {r0} 
bx r0 
.ltorg 





