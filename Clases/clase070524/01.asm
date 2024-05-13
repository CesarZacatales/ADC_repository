        org 100h

        section .text

;guardar en 0200h -> DD
    mov byte [0200h], 0DDh
;guardar en registro base el numero de la direccion 
    mov BX, 0200h
;direccionar al registro AL lo que hay en 0200h, de manera indirecta
    mov AL, [BX]
;direccionamiento inmediato
    mov AH, 12h
;direccionamiento x registro
    mov BH, AH
;suma sin tomar en cuenta el acarreo
    ADD AL, BL
;suma que toma en cuenta el acarreo
    sub bh, ah

        int 20h