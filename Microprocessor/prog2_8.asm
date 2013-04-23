.model small
.stack 64
.data
    num db 0fh
    fibo dw 08h dup(?)
.code
    start:mov ax,@data
        mov ds,ax
        lea si,fibo
        mov bx,0000h
        mov [si],bx
        mov ax,0001h
        mov [si+2],ax
        xor cx,cx
        mov cl,num
        sub cl,02h
        add si,0004h
        calc:xchg ax,bx
            add ax,bx
            mov [si],ax
            add si,0002h
            loop calc
        mov ah,4ch
        int 21h
    end start
.end
