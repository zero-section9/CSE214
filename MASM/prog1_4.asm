.model small
.stack 64
.data
    num dw 0012h
    factl dw ?
    facth dw ?
.code
start:mov ax,@data
    mov ds,ax
    mov ax,0001h
    xor dx,dx
    mov cx,num
   lop:mov bx,ax
       mov ax,dx
       mul cx
       xchg ax,bx
       mul cx
       add dx,bx 
       loop lop
    mov factl,ax
    mov facth,dx       
    mov ah,4ch
    int 21h
    end start
.end;33*32*31*30*29*28*27*26*25*24*23*22*21*20*19*18*17*16*15*14*13*12*11*10*9*8*7*6*5*4*3*2