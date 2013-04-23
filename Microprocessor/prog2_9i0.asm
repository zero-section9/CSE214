.model small
.stack 64
.data
  hexn dw 23EAH
  bin db 08H dup(?)
.code
  start:mov ax,@data
    mov ds,ax
    mov ax,hexn
    mov cx,0008h
    lea si,bin
   cnvrt:mov bl,01h
      and bl,al
      shr ax,01h
      mov bh,al
      shl bh,04h
      add bh,bl
      mov [si],bh
      inc si
      loop cnvrt
    mov ah,4ch
    inc 21h
  end start
.end    