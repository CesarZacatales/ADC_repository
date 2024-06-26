ORG 100h

SECTION .text

    ; Limpiamos los registros AX, BX
    XOR AX, AX
    XOR BX, BX

    ; Leer numero 1
    MOV AH, 00h
    INT 16h
    sub al, '0' ;  Convierte el carácter ASCII a un valor numérico (si los números son del 0 al 9)
    MOV [0200h], AL

    ; Leer numero 2
    MOV AH, 00h
    INT 16h
    sub al, '0' ;  Convierte el carácter ASCII a un valor numérico (si los números son del 0 al 9)
    MOV [0201h], AL

    ; Leer numero 3
    MOV AH, 00h
    INT 16h
    sub al, '0' ;  Convierte el carácter ASCII a un valor numérico (si los números son del 0 al 9)
    MOV [0202h], AL

    main:
        CMP AL, 1d
        JE division
        CMP AL, 2d
        JE suma
        CALL error
        INT 20h


    division:
        XOR AX, AX ; Limpiamos el registro AX
        MOV AL, [0200h] ; Cargamos el primer número
        MOV BL, [0201h] ; Cargamos el segundo número
        DIV BL
        mov byte [0230h], AL ; Guardamos el cociente
        INT 20h ; Salimos del programa


    suma:
        XOR AX, AX ; Limpiamos el registro AX
        MOV AL, [0200h] ; Cargamos el primer número
        MOV BL, [0201h] ; Cargamos el segundo número
        ADD AL, BL
        mov byte [0240h], AL ; Guardamos la suma
        INT 20h ; Salimos del programa

    error:
        mov byte [0250h], 'I'
        mov byte [0251h], 'N'
        mov byte [0252h], 'C'
        mov byte [0253h], 'O'
        mov byte [0254h], 'R'
        mov byte [0255h], 'R'
        mov byte [0256h], 'E'
        mov byte [0257h], 'C'
        mov byte [0258h], 'T'
        mov byte [0259h], 'O'
        RET