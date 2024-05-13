        org 100

        section .text

;direccionamiento inmediato
    mov ah, 5d
    mov al, 4d 
;comparacion
prueba: cmp ah, al
        ja salto1
        mov bh, 03d

salto1:
    mov ah, 2d
    jmp prueba


        int 20h
        