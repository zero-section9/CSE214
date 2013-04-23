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
    lea bx,arr
    lea bp,arr
    xor si,si
    mov dl,[bx][si]
    mov dh,[bp][si]
   mov ah,4ch
   int 21h
  end start
.end