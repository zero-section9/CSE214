.model small
.stack 64
.data
  hexn dw 0fe0H
  bin db 08H dup(?)
.code
  start:mov ax,@data
    mov ds,ax
    mov ax,hexn
    mov cx,0008h
    lea si,bin
   cnvrt:xor bx,bx
      shr ax,01h
      jnc s1
      mov bh,01h
     s1:shr ax,01h
      jnc s2
      add bh,10h
     s2:mov [si],bh
      inc si
      loop cnvrt
    mov ah,4ch
    int 21h
  end start
.end    