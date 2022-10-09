
.thumb 
.include "Definitions.s"
push {lr} 
ldr r2, =MemorySlot 
ldr r0, [r2, #4*1] @ Slot 1 as which flag bit 


blh2 GetFlagOffset 
cmp r0, #0 
ble Exit 
mov r3, r0 @ offset 

ldrb r0, [r3] @ value 
orr r0, r1
strb r0, [r3] 

Exit: 
pop {r0} 
bx r0 
.ltorg 
GetFlagOffset: 

