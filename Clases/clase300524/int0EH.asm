org 100h

    section .text 

    mov ah, 0eh ;ACTIVAMOS LA FUNCION 0E
    mov al, 41h ; QUEREMOS REPETIR LA LETRA A 
    mov bh, 00h ; PAGINA 0
    mov bl, 05h ; COLOR DE TEXTO MAGENTA
    int 10h ; INTERRUPCION DE VIDEO

    int 20h ; INTERRUPCION DE FIN DE PROGRAMA
