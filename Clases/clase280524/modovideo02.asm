org 100h

section .text

    mov ah, 09h  
    mov al, 42h
    mov bh, 00h 
    mov bl, 79h 
    mov cx, 01h

  
int 10h