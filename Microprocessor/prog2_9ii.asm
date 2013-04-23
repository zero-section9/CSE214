.model small
.stack 64
.data
  bin db 11h,11h,10h,11h,00h,01h,10h,01h
  hexn dw ?
.code
  start:mov ax,@data
    mov ds,ax
    lea si,bin
    xor ax,ax
    mov cx,0008h
   cnvrt:mov bh,[si]
      mov bl,01h
      and bl,bh
      add al,bl
      ror ax,01h
      and bh,10h
      jz l1
      add ax,01h
     l1:ror ax,01h
      inc si
      loop cnvrt
    mov hexn,ax
    mov ah,4ch
    int 21h
  end start
.end  