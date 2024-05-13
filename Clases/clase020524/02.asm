org 100h

section .text

; direccionamiento inmediato
    mov ah, 12d 
    mov bh, 244d
; direccionamiento por registro
    mov al, ah
;resta s/c
    sub al, ah ; r// 232
;direccionamiento absoluto
    mov [200h],bh
; resta que genere acarreo
    sbb ah, bh
; suma c/C
    sbb ah, al ; r//19

    int 20h