.model small
.stack 64
.data
  ;n dw 000BH
  ;arrA db 08H,66H,0AH,0FH,0DH,10H,02H,00H,09H,0FFH,18H
  n dw 0004h
  arrA db 08H,66H,0AH,0FH
  arrB db 100h dup(?)
  arrP db 400h dup(?)
  msgus db "Unsorted Array: $"
  msgs db "Sorted Array:   $"
.code
  start:mov ax,@data
    mov ds,ax
    mov es,ax
    
    ;Display Unsorted Array
    mov ah,09h
    lea dx,msgus
    int 21h
    mov cx,n
    lea si,arrA
    call printArr
    
    ;Copy arrA to arrB
    mov cx,n
    lea si,arrA
    lea di,arrB
    rep movsb
    
    ;Sorting
    mov ax,n
    dec ax
    lea si,arrA
    lea di,arrB
    call mergeSort
    
    ;Display Result
    mov ah,09h
    lea dx,msgs
    int 21h
    mov cx,n
    lea si,arrA
    call printArr
    
    mov ah,4ch
    int 21h
  
      
   ;Proc - mergeSort
   ;@ si - lower bound
   ;@ ax - upper bound offset
   ;@ di - dest index
   mergeSort proc
    push di
    
    xchg si,di
    mov cx,ax
    
    mov bl,02h
    div bl
    
    cmp ax,01h
    jz skip1
          
    push si
    push di
    push ax
    push cx
    call mergeSort
    pop cx
    pop ax
    pop di
    pop si
    
   skip1:add si,ax
    inc si
    xchg ax,cx
    sub ax,cx
    
    cmp ax,01h
    jz skip2
    
    push di
    push ax
    push cx
    call mergeSort
    pop cx
    pop ax
    pop di
    
   skip2:xchg si,di
    pop di
    add cx,si
    mov bx,cx
    inc bx
    mov dx,bx
    add dx,ax
    
    call merge
    
    ret
   mergeSort endp
   
   ;Proc - merge
   ;@ si - left lower bound
   ;@ cx - left upper bound
   ;@ bx - right lower bound
   ;@ dx - right upper bound
   ;@ di - dest index 
   merge proc
    mrgc:mov al,[si]
      mov ah,[bx]
      cmp ah,al
      jc cpybx
      jmp cpysi 
     cpysi:mov [di],al
       inc si
       cmp si,cx
       jc copyd
       jmp mrgc
     cpybx:mov [di],ah
       inc bx
       cmp bx,dx
       jc copys
       jmp mrgc
     copys:inc cx
      sub cx,si
      rep movsb
      ret 
     copyd:mov cx,dx
      inc cx
      sub cx,bx
      rep movsb
      ret
   merge endp
   
   ;Proc - printArr
   ;@ cx -
   ;@ si -
   printArr proc
     lea di,arrP
     mov bl,0ah
    cres:xor ah,ah
       mov al,[si]
       div bl
       add ah,30h
       mov [di+2],ah
       xor ah,ah
       div bl
       add ax,3030h
       mov [di],ax
       mov [di+3],','
       inc si
       add di,04h
       loop cres
     mov [di-1],'$'
     
     lea dx,arrP
     mov ah,09h
     int 21h
     ret
   printArr endp
   
  end start
.end