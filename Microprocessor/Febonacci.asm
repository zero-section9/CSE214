MOV AX, 3000H
MOV DS, AX
MOV [0200H], 0000H
MOV [0202H], 0001H
MOV CX, 000FH
MOV AX, 0200H
MOV SI, AX
MOV AX, 0204H
MOV DI, AX
MOV AX, [0202H] 
LOP:ADD AX, [SI]
MOV [DI], AX
ADD SI,02h  
ADD DI,02h
LOOP LOP
HLT