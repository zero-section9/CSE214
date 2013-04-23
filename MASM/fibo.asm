.model small
.stack 64
.data
    fibo dw 08h dup(?)
.code
    start:
        mov ax,@data
        mov ds,ax
        lea si,fibo
        mov di,si
        add di,0004h
        mov ax,[si+2]
        mov cx,0006h
        calc:add ax,[si]
            mov [di],ax
            add si,0002h
            add di,0002h
            loop calc
        mov ah,4ch
        int 21h
    end start
.end
