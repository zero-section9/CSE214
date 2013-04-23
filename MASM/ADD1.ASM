.model small
.stack 64
.data
.code
mov ax,@data
mov ds,ax
start:
mov cx,0005h
mov si,2000h
mov ax,[si]
dec cx
l1:inc si
mov bx,[si]
add ax,bx
loop l1
mov ah,4ch
int 21h
end
.end
