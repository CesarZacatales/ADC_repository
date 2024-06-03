org 100h

section .text

 mov ah, 06h; funcion para mover filas 
    mov al, 24d ; numero de filas a mover
    mov bh, 30h ; color de fondo
    mov cx, 00h ; desde la posicion 0,0
    mov dx, 184Fh ; hasta la posicion 24,79
    int 10h

    mov ah, 06h 
    mov al, 05d
    mov bh, 61h
    mov cx, 0a1ch 
    mov dx, 0e34h
    int 10h ; interrupcion de video




int 20h