org 100h

    section .text 

    mov ah, 06h; funcion para mover filas 
    mov al, 05h ; numero de filas a mover
    mov bh, 30h ; color de fondo
    mov cx, 00h ; desde la posicion 0,0
    mov dx, 184Fh ; hasta la posicion 24,79
    int 10h ; interrupcion de video

    int 20h ; INTERRUPCION DE FIN DE PROGRAMA
