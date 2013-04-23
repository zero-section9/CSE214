.model small
.stack 64
.data
    src dw 1200h
    dest dw 2200h
.code
start:mov ax,@data
    mov ds,ax
    mov si,src  
    mov di,dest
    mov cx,0003h
   lop:mov ax,[si]
       mov [di],ax
       add si,02h
       add di,02h
       loop lop
    mov ah,4ch
    int 21h
    end start
.end