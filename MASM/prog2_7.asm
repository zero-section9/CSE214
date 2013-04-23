.model small
.stack 64
.data
  n db 05h
  arr db 0AH,0FH,0DH,10H,02H
  ascending db 100h dup(?)
  descending db 100h dup(?)
.code
  start:mov ax,@data
    mov ds,ax
    xor cx,cx
    xor dx,dx
    mov cl,n
    lea si,arr
    lea di,ascending
    inc si
    inc di
    dec cl
    inc dl
   lopi:mov al,[si]
      mov bx,di
      xchg dl,cl
     lopj:mov ah,[bx-1]
        cmp ah,al
        jnc lopjb
        mov [bx],ah
        dec bx
        loop lopj
     lopjb:mov [bx],al
      xchg cl,dl
      inc si
      inc di
      inc dl
      loop lopi
    mov ah,4ch
    int 21h
  end start
.end