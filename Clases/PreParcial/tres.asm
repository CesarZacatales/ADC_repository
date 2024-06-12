org 100h

section .text

    ; Mostrar letra H
    mov ah, 09h
    mov al, 'H'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra O
    mov ah, 09h
    mov al, 'O'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra L
    mov ah, 09h
    mov al, 'L'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra A
    mov ah, 09h
    mov al, 'A'
    mov bh, 00h
    mov bl, 30h
    mov cx, 1
    int 10h

    ; Mover el cursor a la siguiente fila
    mov ah, 03h
    mov bh, 00h
    int 10h
    inc dh
    ;inc dh
    xor dl, dl
    mov ah, 02h
    mov bh, 00h
    int 10h

    ; Mostrar letra A
    mov ah, 09h
    mov al, 'A'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra D
    mov ah, 09h
    mov al, 'D'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra O
    mov ah, 09h
    mov al, 'O'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra N
    mov ah, 09h
    mov al, 'N'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra A
    mov ah, 09h
    mov al, 'A'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra Y
    mov ah, 09h
    mov al, 'Y'
    mov bh, 00h
    mov bl, 30h
    mov cx, 1
    int 10h

    ; Mover el cursor a la siguiente fila
    mov ah, 03h
    mov bh, 00h
    int 10h
    ;inc dh
    inc dh
    xor dl, dl
    mov ah, 02h
    mov bh, 00h
    int 10h

    ; Mostrar letra L
    mov ah, 09h
    mov al, 'L'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra O
    mov ah, 09h
    mov al, 'O'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra P
    mov ah, 09h
    mov al, 'P'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra E
    mov ah, 09h
    mov al, 'E'
    mov bh, 00h
    mov bl, 30h
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

    ; Mostrar letra Z
    mov ah, 09h
    mov al, 'Z'
    mov bh, 00h
    mov bl, 30h
    mov cx, 1
    int 10h

    ; Terminar el programa
    int 20h