.model small
.stack 64
.data
    n dw ?
    arr db 20h dup(?) 
    smallest db ?
    largest db ?
.code
start:mov ax,@data
    mov ds,ax
    lea si,arr
    mov al,[si]
    mov bl,al
    mov bh,al
    mov cx,n
    dec cx
    srch:inc si
        mov al,[si]
        cmp bl,al
        jc s1
        mov bl,al
       s1:cmp bh,al
        jnc s2
        mov bh,al
       s2:loop srch
    mov smallest,bl
    mov largest,bh
    mov ah,4ch
    int 21h
    end start
.end