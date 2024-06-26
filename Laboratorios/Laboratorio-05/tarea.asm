org 100h

section .text

    CALL IniciarModoTexto
    
    MOV BH, 0d ; Establece la página 0
    CALL CentrarCursor

    CALL MostrarNombre

    CALL EsperarTecla

    INT 20h


    IniciarModoTexto:
    MOV AH, 0h
    MOV AL, 03h ; Establece modo texto 80x25
    int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
    RET

    CentrarCursor:
    MOV AH, 02h
    MOV DH, 10 ; Fila central
    MOV DL, 35 ; Columna central
    int 10h ; Llama a la interrupción del BIOS para posicionar el cursor
    RET

    EsperarTecla:
    MOV AH, 00h
    INT 16h
    RET

    MostrarNombre:
    ; Mostrar letra A
    mov ah, 09h
    mov al, 'A'
    mov bh, 00h
    mov bl, 68h
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
    mov bl, 57h
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
    mov bl, 47h
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
    mov bl, 25h
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
    mov bl, 12h
    mov cx, 1
    int 10h
    RET