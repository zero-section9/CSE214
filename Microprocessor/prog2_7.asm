.model small
.stack 64
.data
  n db 09h
  arr db 0AH,0FH,0DH,10H,02H,00H,09H,0FFH,18H
  ascending db 100h dup(?)
  descending db 100h dup(?)
.code
  start:mov ax,@data
    mov ds,ax
    xor cx,cx
    mov cl,n
    lea si,arr
    lea di,ascending
   cpy:mov al,[si]
      mov [di],al
      inc si
      inc di
      loop cpy 
    xor dx,dx
    mov cl,n
    dec cl
    lea bx,ascending
    mov si,0001h
   lopi:mov al,[bx+si]
     mov di,si
     lopj:mov ah,[bx+di-1]
        cmp ah,al
        jc lopjb
        mov [bx+di],ah
        dec di
        jnz lopj
     lopjb:mov [bx+di],al
      inc si
      loop lopi
    mov ah,4ch
    int 21h
  end start
.end