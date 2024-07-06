org 100h
section .text

main:
    CALL IniciarModoVideo
    CALL DibujarGradas
    CALL EsperarTecla

    INT 20h

IniciarModoVideo:
    MOV AH, 00h
    MOV AL, 13h      ; Modo gráfico 320x200, 256 colores
    INT 10h
    RET

DibujarGradas:
    MOV CX, 3   ; Número de gradas
    MOV SI, 50  ; Posición inicial X
    MOV DI, 50  ; Posición inicial Y
    MOV DX, 0   ; Indicador de orientación de rectángulo (0: horizontal, 1: vertical)

DibujarGrada:
    CMP DX, 0
    JE DibujarRectanguloHorizontal
    JMP DibujarRectanguloVertical

DibujarRectanguloHorizontal:
    MOV AX, 50  ; Ancho del rectángulo horizontal
    MOV BX, 10  ; Alto del rectángulo horizontal

    MOV CX, AX  ; Reinicia CX al ancho del rectángulo
    MOV DX, BX  ; Reinicia DX al alto del rectángulo
    MOV DI, 50  ; Reinicia DI a la fila inicial

    MOV AL, 4   ; Color del rectángulo horizontal (cyan)

DibujarFilaHorizontal:
    MOV SI, 50  ; Reinicia SI a la columna inicial

DibujarPixelHorizontal:
    MOV AH, 0Ch    ; Función del BIOS para poner un píxel
    MOV BH, 0      ; Página de video 0
    MOV CX, SI     ; Coordenada X
    MOV DX, DI     ; Coordenada Y
    INT 10h        ; Enciende el píxel

    INC SI         ; Incrementa la columna
    DEC CX         ; Decrementa la cuenta de longitud de la fila
    JNZ DibujarPixelHorizontal  ; Si CX no es cero, continúa dibujando píxeles en esta fila

    ADD DI, 20     ; Añade un espacio vertical entre gradas
    DEC DX         ; Decrementa la cuenta de altura del rectángulo horizontal
    JNZ DibujarFilaHorizontal  ; Si DX no es cero, dibuja la siguiente fila

    ADD SI, 70     ; Añade un espacio horizontal entre gradas
    DEC CX         ; Decrementa el número de gradas restantes
    JNZ DibujarGrada  ; Si CX no es cero, dibuja la siguiente grada

    RET

DibujarRectanguloVertical:
    MOV AX, 10  ; Ancho del rectángulo vertical
    MOV BX, 50  ; Alto del rectángulo vertical

    MOV CX, AX  ; Reinicia CX al ancho del rectángulo
    MOV DX, BX  ; Reinicia DX al alto del rectángulo
    MOV SI, 150 ; Reinicia SI a la columna inicial

    MOV AL, 2   ; Color del rectángulo vertical (verde)

DibujarColumnaVertical:
    MOV DI, 50  ; Reinicia DI a la fila inicial

DibujarPixelVertical:
    MOV AH, 0Ch    ; Función del BIOS para poner un píxel
    MOV BH, 0      ; Página de video 0
    MOV CX, SI     ; Coordenada X
    MOV DX, DI     ; Coordenada Y
    INT 10h        ; Enciende el píxel

    INC DI         ; Incrementa la fila
    DEC DX         ; Decrementa la cuenta de altura del rectángulo vertical
    JNZ DibujarPixelVertical  ; Si DX no es cero, continúa dibujando píxeles en esta columna

    ADD SI, 30     ; Añade un espacio horizontal entre gradas
    DEC CX         ; Decrementa la cuenta de ancho del rectángulo vertical
    JNZ DibujarColumnaVertical  ; Si CX no es cero, dibuja la siguiente columna

    ADD DI, 20     ; Añade un espacio vertical entre gradas
    DEC CX         ; Decrementa el número de gradas restantes
    JNZ DibujarGrada  ; Si CX no es cero, dibuja la siguiente grada

    RET

EsperarTecla:
    MOV AH, 00h
    INT 16h        ; Lee una tecla del teclado
    RET
