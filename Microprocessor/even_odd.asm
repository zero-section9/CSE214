include emu8086.inc
mov ax,0dh
shr ax,01h
jc odd 
PRINT 'Even'
hlt
odd:PRINT 'Odd'
hlt