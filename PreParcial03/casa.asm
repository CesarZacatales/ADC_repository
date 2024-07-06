ORG 100h

SECTION .data
    color DB 13h ;COLOR (Rosado)
    pos_x DW 300d ;COLUMNA
    pos_y DW 200d ;FILA
    dim_y DW 100d ;FILA
    auxCountLeft DW 0d ;AUXILIAR
    auxCountRight DW 0d ;AUXILIAR

SECTION .text
    GLOBAL main

main:
    CALL video_mode_init

    ; Dibuja los cubos primero
    CALL draw_cube_top
    CALL draw_eyes
    CALL draw_cube_left
    CALL draw_cube_right

    ; Establece el color rosado para el triángulo
    MOV BYTE[color], 13h
    MOV WORD[pos_x], 300d
    MOV WORD[pos_y], 200d
    MOV WORD[dim_y], 100d
    CALL print_triangle

    INT 20h

video_mode_init:
    MOV AH, 00H
    MOV AL, 12h
    INT 10h
RET

print_triangle:
    MOV AH, 0CH
    MOV AL, BYTE[color]
    MOV BH, 0h

    MOV DI, 0
    MOV DX, WORD[pos_y]   ;FILA
    CALL loop_row
RET

loop_row:
    CMP DI, WORD[dim_y]
        JE return_loop_row

    MOV CX, WORD[pos_x]   ;COLUMNA
    INT 10h

    MOV WORD[auxCountLeft], CX
    MOV WORD[auxCountRight], CX

    MOV SI, 0
    CALL loop_column

    INC DI
    ADD DX, 1d
    JMP loop_row

return_loop_row:
RET

loop_column:
    CMP SI, DI
        JAE return_loop_column

    MOV CX, WORD[auxCountRight]
    INT 10h

    MOV CX, WORD[auxCountLeft]
    INT 10h

    INC WORD[auxCountRight]
    DEC WORD[auxCountLeft]
    INC SI

    JMP loop_column

return_loop_column:
RET

draw_cube_top:
    ; Dibuja un cubo en la punta superior del triángulo
    MOV AH, 0CH  ; Función para dibujar píxel
    MOV AL, 0Fh  ; Color del cubo (blanco)
    MOV BH, 0h   ; Página de pantalla

    ; Coordenadas para el cubo superior
    MOV CX, 240d ; X inicial (centrado respecto a la punta del triángulo)
    MOV DX, 80d  ; Y inicial (un poco más arriba de la punta del triángulo)
    MOV SI, 0    ; Contador para la altura del cubo

cube_loop_row_top:
    CMP SI, 120   ; Altura del cubo (120 píxeles)
        JAE return_draw_cube_top

    MOV DI, 0    ; Contador para la anchura del cubo

cube_loop_column_top:
    CMP DI, 120   ; Anchura del cubo (120 píxeles)
        JAE next_cube_row_top

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de columnas
    JMP cube_loop_column_top

next_cube_row_top:
    SUB CX, 120   ; Resetea la coordenada X al inicio de la fila
    INC DX       ; Incrementa la coordenada Y
    INC SI       ; Incrementa el contador de filas
    JMP cube_loop_row_top

return_draw_cube_top:
RET

draw_eyes:
    ; Dibuja los ojos (líneas negras) en el centro del cubo superior
    MOV AH, 0CH  ; Función para dibujar píxel
    MOV AL, 00h  ; Color de las líneas (negro)
    MOV BH, 0h   ; Página de pantalla

    ; Coordenadas para la primera línea (ojo izquierdo)
    MOV CX, 260d ; X inicial (centrado en el cubo superior)
    MOV DX, 125d ; Y inicial (más arriba en el cubo superior)
    MOV DI, 0    ; Contador para la longitud de la línea

eye_left_loop_1:
    CMP DI, 20   ; Longitud de la línea (20 píxeles)
        JAE next_eye_right_1

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de longitud
    JMP eye_left_loop_1

next_eye_right_1:
    ; Coordenadas para la primera línea (ojo derecho)
    MOV CX, 300d ; X inicial (centrado en el cubo superior)
    MOV DX, 125d ; Y inicial (más arriba en el cubo superior)
    MOV DI, 0    ; Contador para la longitud de la línea

eye_right_loop_1:
    CMP DI, 20   ; Longitud de la línea (20 píxeles)
        JAE next_eye_left_2

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de longitud
    JMP eye_right_loop_1

next_eye_left_2:
    ; Coordenadas para la segunda línea (ojo izquierdo)
    MOV CX, 260d ; X inicial (centrado en el cubo superior)
    MOV DX, 135d ; Y inicial (más abajo en el cubo superior)
    MOV DI, 0    ; Contador para la longitud de la línea

eye_left_loop_2:
    CMP DI, 20   ; Longitud de la línea (20 píxeles)
        JAE next_eye_right_2

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de longitud
    JMP eye_left_loop_2

next_eye_right_2:
    ; Coordenadas para la segunda línea (ojo derecho)
    MOV CX, 300d ; X inicial (centrado en el cubo superior)
    MOV DX, 135d ; Y inicial (más abajo en el cubo superior)
    MOV DI, 0    ; Contador para la longitud de la línea

eye_right_loop_2:
    CMP DI, 20   ; Longitud de la línea (20 píxeles)
        JAE next_eye_left_3

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de longitud
    JMP eye_right_loop_2

next_eye_left_3:
    ; Coordenadas para la tercera línea (ojo izquierdo)
    MOV CX, 260d ; X inicial (centrado en el cubo superior)
    MOV DX, 145d ; Y inicial (más abajo en el cubo superior)
    MOV DI, 0    ; Contador para la longitud de la línea

eye_left_loop_3:
    CMP DI, 20   ; Longitud de la línea (20 píxeles)
        JAE next_eye_right_3

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de longitud
    JMP eye_left_loop_3

next_eye_right_3:
    ; Coordenadas para la tercera línea (ojo derecho)
    MOV CX, 300d ; X inicial (centrado en el cubo superior)
    MOV DX, 145d ; Y inicial (más abajo en el cubo superior)
    MOV DI, 0    ; Contador para la longitud de la línea

eye_right_loop_3:
    CMP DI, 20   ; Longitud de la línea (20 píxeles)
        JAE return_draw_eyes

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de longitud
    JMP eye_right_loop_3

return_draw_eyes:
RET

draw_cube_left:
    ; Dibuja un cubo debajo de la punta izquierda del triángulo
    MOV AH, 0CH  ; Función para dibujar píxel
    MOV AL, 0Fh  ; Color del cubo (blanco)
    MOV BH, 0h   ; Página de pantalla

    ; Coordenadas para el cubo izquierdo
    MOV CX, 205d ; X inicial (más a la izquierda respecto a la punta izquierda del triángulo)
    MOV DX, 300d ; Y inicial (debajo de la punta izquierda del triángulo)
    MOV SI, 0    ; Contador para la altura del cubo

cube_loop_row_left:
    CMP SI, 60   ; Altura del cubo (60 píxeles)
        JAE return_draw_cube_left

    MOV DI, 0    ; Contador para la anchura del cubo

cube_loop_column_left:
    CMP DI, 60   ; Anchura del cubo (60 píxeles)
        JAE next_cube_row_left

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de columnas
    JMP cube_loop_column_left

next_cube_row_left:
    SUB CX, 60   ; Resetea la coordenada X al inicio de la fila
    INC DX       ; Incrementa la coordenada Y
    INC SI       ; Incrementa el contador de filas
    JMP cube_loop_row_left

return_draw_cube_left:
RET

draw_cube_right:
    ; Dibuja un cubo debajo de la punta derecha del triángulo
    MOV AH, 0CH  ; Función para dibujar píxel
    MOV AL, 0Fh  ; Color del cubo (blanco)
    MOV BH, 0h   ; Página de pantalla

    ; Coordenadas para el cubo derecho
    MOV CX, 345d ; X inicial (más a la izquierda respecto a la punta derecha del triángulo)
    MOV DX, 300d ; Y inicial (debajo de la punta derecha del triángulo)
    MOV SI, 0    ; Contador para la altura del cubo

cube_loop_row_right:
    CMP SI, 60   ; Altura del cubo (60 píxeles)
        JAE return_draw_cube_right

    MOV DI, 0    ; Contador para la anchura del cubo

cube_loop_column_right:
    CMP DI, 60   ; Anchura del cubo (60 píxeles)
        JAE next_cube_row_right

    INT 10h      ; Dibuja el píxel en (CX, DX)

    INC CX       ; Incrementa la coordenada X
    INC DI       ; Incrementa el contador de columnas
    JMP cube_loop_column_right

next_cube_row_right:
    SUB CX, 60   ; Resetea la coordenada X al inicio de la fila
    INC DX       ; Incrementa la coordenada Y
    INC SI       ; Incrementa el contador de filas
    JMP cube_loop_row_right

return_draw_cube_right:
RET