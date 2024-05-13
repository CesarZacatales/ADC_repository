org 100h

section .text

; direccionamiento inmediato
    mov ah, 12d ; r// 12d --> 0c
    mov bh, 244d ; r// f4d --> f4
; direccionamiento por registro
    mov al, ah
;suma s/c
    add al, ah ; r// 24d --> 18h
;direccionamiento absoluto
    mov [200h], al
; suma que genere acarreo
    adc ah, bh
; suma c/C
    adc ah, al ; r//19

    int 20h