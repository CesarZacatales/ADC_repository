org 100h

start:
    ; Mostrar letra A
    mov ah, 09h
    mov al, 'A'
    mov bh, 00h
    mov bl, 1Eh
    mov cx, 1
    int 10h

    ; Mover el cursor a la siguiente columna
    mov ah, 03h
    mov bh, 00h
    int 10h
    inc dl
    mov ah, 02h
    mov bh, 00h
    int 10h

    ; Mostrar letra B
    mov ah, 09h
    mov al, 'B'
    mov bh, 00h
    mov bl, 1Eh
    mov cx, 1
    int 10h

    ; Mover el cursor a la siguiente columna
    mov ah, 03h
    mov bh, 00h
    int 10h
    inc dl
    mov ah, 02h
    mov bh, 00h
    int 10h

    ; Mostrar letra C
    mov ah, 09h
    mov al, 'C'
    mov bh, 00h
    mov bl, 1Eh
    mov cx, 1
    int 10h

    ; Esperar hasta que se presione una tecla
    mov ah, 00h
    int 16h

    ; Terminar el programa
    mov ah, 4Ch
    int 21h
