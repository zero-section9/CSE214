fd.model small
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
    mov smallest,al
    mov largest,al
    mov cx,n
    dec cx
    srch:inc si
        mov al,[si]
        cmp smallest,al
        jc s1
        mov smallest,al
       s1:cmp largest,al
        jnc s2
        mov largest,al
       s2:loop srch
    mov ah,4ch
    int 21h
    end start
.end