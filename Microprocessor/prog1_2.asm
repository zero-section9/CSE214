.model small
.stack 64
.code
start:
    mov al,54h
    mov ah,23h
    add ah,al
    mov ah,11h
    sub al,ah
    mov cl,02h
    mul cl
    
    mov ah,4ch
    int 21h
    end start
.end