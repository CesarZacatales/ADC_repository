org 100h

section .text

salto01:
        mov ah, 12h
        int 16h
        cmp al, 01
        
        jne salto01

        int 20h