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
    xor bx,bx
    xor cx,cx
    xor dx,dx
    mov cl,n
    lea bp,arr
    lea di,ascending
    lea si,descending
    mov al,[bp]
    mov [di],al
    mov [si],al
    dec cl
    inc dl
   lopi:mov bx,cx
      add bx,bp
      mov al,[bx]
      mov dh,cl
      mov cl,dl
      mov bx,cx
     lopj1:mov ah,[bx+di-1]
        cmp al,ah
        jnc lopj1b
        mov [bx+di],ah
        dec bx
        loop lopj1
     lopj1b:mov [bx+di-1],al
        mov cl,dl
     lopj2:mov bx,cx
        mov ah,[bx+si-1]
        cmp ah,al
        jnc lopj2b
        mov [bx+si],ah   
        loop lopj2
     lopj2b:mov [bx+si-1],al
      mov cl,dh
      inc dl
      loop lopi
    mov ah,4ch
    int 21h
  end start
.end