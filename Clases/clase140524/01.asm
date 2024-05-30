        org 100

        section .text

;direccionamiento inmediato
    mov ah, 10d
    mov bh, 7d
;direccionamiento por registro
    mov al, bh
;operaciones aritmeticas 
;suma s/acarreo
    add al, ah ;R/ 17d
;comparacion del resultado de suma con un valor 
    cmp al, bh
;salto condicional sin signo
    ja salto ;salto si d>f
    mov [200h], al

        int 20h

        salto
        sub al, 1d  
        ret