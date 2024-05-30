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
call comparacion
    mov [201], ah

        int 20h

        salto
         salto
        sub al, 1d  
        ret
comparacion:
    cmp al, bh
;salto condicional sin signo
    jb salto ;salto si d<f
    sub al, 3d
    jmp comparacion