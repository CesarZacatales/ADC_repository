org 100h

section .text

; activar modo de video
 mov ah, 00h 
 mov al, 12h
 int 10h

main:

call dibujar

cmp cx, 320d
je esperar

call incrementar
jmp main

 int 20h

 dibujar:
    mov ah, 0ch 
    mov al, 04h
    mov bh, 00h
    mov cx, 00h
    mov dx, 300d
    int 10h
    ret

 esperar:
    mov ah, 00h
    int 16h
    int 21h

 incrementar:
    inc cx
    ret