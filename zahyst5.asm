sseg segment stack 'stack'use16
     dw 256 dup(?)
sseg ends
 
.386
 
data segment use16
    array   db 1,2,3,4
data ends
 
Cseg    segment use16
        assume  cs:Cseg,ds:data
start:  
    mov ax,data
    mov ds,ax
    mov fs,ax
    
    mov bx,offset array
    mov cx,4        
 
    call print_mas
    call Sdvig 
    call print_mas
 
    mov    ah,4ch      
    int    21h
    
Sdvig proc
    push ax cx              
    pop cx  ax          
    ret             
Sdvig endp
 
print_mas proc 
    push ax             
    mov si,0            
    mov cx,4
go:             
    mov al,array[si]
    add al,30h 
    mov dl,al
    mov ah,2h 
    int 21h 
    
    mov ah,2h 
    mov dl,' '
    int 21h  
    
    inc si      
    loop    go  
                    
    pop ax              
    ret      
print_mas endp
 
Cseg    ends
end    start
