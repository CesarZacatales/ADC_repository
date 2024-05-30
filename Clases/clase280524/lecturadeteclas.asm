org 100h

section .text

    mov ah, 00
    int 16h
    mov [0200h], al

        int 20h