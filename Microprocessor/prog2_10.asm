.model small
.stack 64
.data
  n db 05h
  arr db 0AH,0FH,0DH,10H,02H
  num db 0DH
  found dw 0FFFFH
.code
  start:mov ax,@data
    mov ds,ax
    xor cx,cx
    mov al,num
    mov cl,n
    lea bx,arr
    xor si,si
   srch:mov ah,[bx+si]
      cmp al,ah
      jnz cntnu
      mov found,si
      jmp brk
   cntnu:inc si
      loop srch
   brk:mov ah,4ch
    int 21h
  end start
.end