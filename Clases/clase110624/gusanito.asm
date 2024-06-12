org 100h

section .text
    ; modo video
    mov ah, 00h
    mov al, 12h
    int 10h 

    mov ah, 0ch
    mov al, 02h
    mov bh, 00h
    mov cx, 00h

s1:
    mov dx, 12ch
    int 10h 
    inc cx
    cmp cx, 0140h
    jnz s1

s2:
    mov ah, 00h 
    int 16h
    cmp al, 53h 
    jnz s2
    mov ah, 00h 
    mov al, 03h
    int 10h
    int 20h