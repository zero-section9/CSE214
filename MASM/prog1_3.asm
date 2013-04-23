.model small
.stack 64
.data
    n dw ?
    arr db 20h dup(?) 
    sum dw ?
.code
start:mov ax,@data
    mov ds,ax
    lea si,arr
    xor ax,ax
    mov cx,n
    calc:add al,[si]
        jnc s
        inc ah
       s:inc si
        loop calc
    mov sum,ax
    mov ah,4ch
    int 21h
    end start
.end
