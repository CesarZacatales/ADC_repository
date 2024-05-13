        org 100

        section .text

;direccionamiento inmediato
    mov ah, 5d
    mov al, 4d ; la multiplicacion da 20 en decimal y en hexadecimal da 14
;multiplicacion s/signo usa al o ax
    mul ah, al 

;mover resultado con direccionamiento indirecto a memoria
    mov bp, 200h
    mov [bp], al

        int 20h