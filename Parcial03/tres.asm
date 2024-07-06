org 100h
; variables
section .data
 mensaje_principal db 'Parcial final de arquitectura$'
 mensaje_bienvenida db 'Para mostrar el triangulo presione 1$'
 mensaje_opcion2 db 'Para mostrar la figura presione 2$'
 mensaje_final db 'Para salir presione 3$'
 mensaje_fin db 'Fin del programa$'
 mensaje_error db 'Opcion no valida$'
 mensaje_salida db 'Para salir presione s$'
 mensaje_nombre db 'Cesar Adonay Zacatales Lopez 00223021$'
 mensaje_triangulo db 'Ingresaste la opcion del triangulo$'
 mensaje_figura db 'Ingresaste la opcion de la figura.$'
 status_main_loop DB 1h
    color DB 10010010b
    pos_x DW 300d
    pos_y DW 200d
    dim_y DW 100d
    dim_x DW 100d
    auxCountLeft DW 0d
    auxCountRight DW 0d

; funciones
section .text

setup:
  MOV SI, 90d ; Columna inicial
  MOV DI, 70d ; Fila inicial

main:
 CALL IniciarModoTexto
 MOV CH, 1
 CALL CentrarCursor
 CALL ImprimirPrincipal
 MOV CH, 11
 CALL CentrarCursor
 CALL ImprimirWelcom
 MOV CH, 12
 CALL CentrarCursor
 CALL ImprimirOptions2
 MOV CH, 13
 CALL CentrarCursor
 CALL ImprimirFinal
 MOV CH, 14
 CALL CentrarCursorNombre
 CALL ImprimirNombre
 CALL EsperarTecla
 CALL CompararTecla
 int 20h

CentrarCursor:
 MOV AH, 02h
 MOV DH, CH ; Fila central
 MOV DL, 24 ; Columna central
 int 10h ; Llama a la interrupción del BIOS para posicionar el cursor
 RET

CentrarCursorNombre:
 MOV AH, 02h
 MOV DH, 22 ; Fila central
 MOV DL, 25 ; Columna central
 int 10h ; Llama a la interrupción del BIOS para posicionar el cursor
 RET

IniciarModoTexto:
 MOV AH, 0h
 MOV AL, 03h ; Establece modo texto 80x25
 int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
 RET

ImprimirPrincipal:
 MOV AH, 09h
 MOV DX,  mensaje_principal
 INT 21h
 RET

ImprimirWelcom:
 MOV AH, 09h
 MOV DX, mensaje_bienvenida
 INT 21h
 RET

ImprimirFinal:
 MOV AH, 09h
 MOV DX, mensaje_final
 INT 21h
 RET

ImprimirOptions2:
 MOV AH, 09h
 MOV DX, mensaje_opcion2
 INT 21h
 RET

ImprimirNombre:
 MOV AH, 09h
 MOV DX, mensaje_nombre
 INT 21h
 RET

ImprimirError:
 MOV AH, 09h
 MOV DX, mensaje_error
 INT 21h
 RET

ImprimirSalida:
 MOV AH, 09h
 MOV DX, mensaje_salida
 INT 21h
 RET

ImprimirFin:
 MOV AH, 09h
 MOV DX, mensaje_fin
 INT 21h
 RET

EsperarTecla:
 MOV AH, 00h
 INT 16h
 RET

CompararTecla:
 CMP AL, '1'
 JE OpcionTriangulo
 CMP AL, '2'
 JE OpcionFigura
 CMP AL, '3'
 JE Salir
 JMP main

OpcionTriangulo:
 MOV AH, 0h
 MOV AL, 03h ; Establece modo texto 80x25
 int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
 CALL CentrarCursor
 MOV AH, 09h
 MOV DX, mensaje_triangulo
 INT 21h
 CALL IniciarModoVideo
 CALL DibujarTriangulo
 CALL EsperarTecla
 RET

OpcionFigura:
 MOV AH, 0h
 MOV AL, 03h ; Establece modo texto 80x25
 int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
 CALL CentrarCursor
 MOV AH, 09h
 MOV DX, mensaje_figura
 INT 21h
 CALL video_mode_init
CALL main_loop
ret
 

 RET

Salir:
 MOV AH, 0h
 MOV AL, 03h ; Establece modo texto 80x25
 int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
 CALL CentrarCursor
 CALL ImprimirFin
 MOV AH, 4Ch
 INT 21h
 RET

IniciarModoVideo:
  MOV AH, 0h
  MOV AL, 12h      ; Modo gráfico 640x480, 16 colores
  INT 10h
  RET

DibujarTriangulo:
  MOV CX, SI        ; CX como la coordenada X inicial (90d)
  MOV DX, DI        ; DX como la coordenada Y inicial (70d)
  MOV BX, 1         ; BX se usa para contar la longitud de la fila

DibujarFila:
  MOV CX, SI        ; Reinicia CX a la columna inicial

DibujarPixel:
  MOV AH, 0Ch       ; Función del BIOS para poner un píxel
  MOV AL, 0100b     ; Color del píxel (azul)
  MOV BH, 0         ; Página de video 0
  MOV CX, SI        ; Coordenada X
  MOV DX, DI        ; Coordenada Y
  INT 10h           ; Enciende el píxel

  INC SI            ; Incrementa la columna
  DEC BX            ; Decrementa la cuenta de longitud de la fila
  JNZ DibujarPixel  ; Si BX no es cero, continúa dibujando píxeles en esta fila

  ; Al finalizar la fila, prepara la siguiente fila
  INC DI            ; Incrementa la fila (Y)
  MOV BX, DI
  SUB BX, 70d       ; Calcula la longitud de la siguiente fila
  MOV SI, 90d       ; Reinicia la columna inicial para la nueva fila

  CMP DI, 120d      ; Compara la fila actual con el límite de 120
  JLE DibujarFila   ; Si no se alcanza el límite, continúa dibujando la fila
  RET


video_mode_init:
    MOV  AH, 00H
    MOV AL, 12h
    INT 10h
    RET


main_loop:
    CMP BYTE[status_main_loop], 0h
        JE return
    CALL clean_display

    ;Orejas
    MOV WORD[color], 00010010b
    MOV WORD[pos_x], 200d
    MOV WORD[pos_y], 50d
    MOV WORD[dim_y], 50d
    CALL print_triangle

    MOV WORD[color], 00010010b
    MOV WORD[pos_x], 300d
    MOV WORD[pos_y], 50d
    MOV WORD[dim_y], 50d
    CALL print_triangle

    ;Cara
    MOV WORD[color], 00010110b
    MOV WORD[pos_x], 150d
    MOV WORD[pos_y], 100d
    MOV WORD[dim_y], 150d
    MOV WORD[dim_x], 200d
    CALL print_quad

    ;Ojos
    MOV WORD[color], 00010111b
    MOV WORD[pos_x], 160d
    MOV WORD[pos_y], 130d
    MOV WORD[dim_y], 5d
    MOV WORD[dim_x], 60d
    CALL print_quad

    MOV WORD[color], 00010111b
    MOV WORD[pos_x], 280d
    MOV WORD[pos_y], 130d
    MOV WORD[dim_y], 5d
    MOV WORD[dim_x], 60d
    CALL print_quad


    ;Bigotes
    MOV WORD[color], 00010101b
    MOV WORD[pos_x], 75d
    MOV WORD[pos_y], 175d
    MOV WORD[dim_y], 1d
    MOV WORD[dim_x], 125d
    CALL print_quad

    MOV WORD[color], 00010101b
    MOV WORD[pos_x], 75d
    MOV WORD[pos_y], 185d
    MOV WORD[dim_y], 1d
    MOV WORD[dim_x], 125d
    CALL print_quad

    MOV WORD[color], 00010101b
    MOV WORD[pos_x], 75d
    MOV WORD[pos_y], 195d
    MOV WORD[dim_y], 1d
    MOV WORD[dim_x], 125d
    CALL print_quad

    MOV WORD[color], 00010101b
    MOV WORD[pos_x], 300d
    MOV WORD[pos_y], 175d
    MOV WORD[dim_y], 1d
    MOV WORD[dim_x], 125d
    CALL print_quad

    MOV WORD[color], 00010101b
    MOV WORD[pos_x], 300d
    MOV WORD[pos_y], 185d
    MOV WORD[dim_y], 1d
    MOV WORD[dim_x], 125d
    CALL print_quad

    MOV WORD[color], 00010101b
    MOV WORD[pos_x], 300d
    MOV WORD[pos_y], 195d
    MOV WORD[dim_y], 1d
    MOV WORD[dim_x], 125d
    CALL print_quad

    ;Boca
    MOV WORD[color], 00010111b
    MOV WORD[pos_x], 250d
    MOV WORD[pos_y], 175d
    MOV WORD[dim_y], 20d
    CALL print_triangle


    ;Cara Fixed
    MOV WORD[color], 00010000b
    MOV WORD[pos_x], 150d
    MOV WORD[pos_y], 200d
    MOV WORD[dim_y], 50d
    CALL print_triangle

    ;Cara Fixed
    MOV WORD[color], 00010000b
    MOV WORD[pos_x], 350d
    MOV WORD[pos_y], 200d
    MOV WORD[dim_y], 50d
    CALL print_triangle

    CALL read_key

    JMP main_loop
RET


return:
RET


clean_display:
    MOV AH, 06h
    MOV AL, 00h
    MOV BH, 0h
    MOV CX, 0000h
    MOV DX, 184Fh
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
        JE return
    

    MOV CX, WORD[pos_x]   ;COLUMNA
    INT 10h

    MOV WORD[auxCountLeft], CX
    MOV WORD[auxCountRight], CX

    MOV SI, 0
    CALL loop_column

    INC DI
    ADD DX, 1d
JMP loop_row

loop_column:
    CMP SI, DI
        JAE return


    MOV CX, WORD[auxCountRight]
    INT 10h

    MOV CX, WORD[auxCountLeft]
    INT 10h

    INC WORD[auxCountRight]
    DEC WORD[auxCountLeft]
    INC SI

JMP loop_column


print_quad:
    MOV AH, 0CH
    MOV AL, BYTE[color]
    MOV BH, 0h

    MOV DI, 0
    MOV DX, WORD[pos_y]   ;FILA
    CALL quad_loop_row

RET

quad_loop_row:
    CMP DI, WORD[dim_y]
        JE return
    
    MOV SI, 0
    MOV CX, WORD[pos_x]   ;COLUMNA
    CALL quad_loop_column

    INC DI
    ADD DX, 1d
JMP quad_loop_row

quad_loop_column:
    CMP SI, WORD[dim_x]
        JE return

    INT 10h

    INC SI
    ADD CX, 1d
JMP quad_loop_column





read_key:
    MOV AH, 00h
    INT 16h
    CMP AL, 'w'
        JE move_up
    CMP AL, 's'
        JE move_down
    CMP AL, 'a'
        JE move_left
    CMP AL, 'd'
        JE move_rigth
    CMP AL, 1Bh ;ESC
        JE end_main_loop
RET

end_main_loop:
    mov BYTE[status_main_loop], 0
RET

move_up:
    SUB WORD[pos_y], 4h
RET

move_down:
    ADD WORD[pos_y], 4h
RET

move_left:
    SUB WORD[pos_x], 4h
RET

move_rigth:
    ADD WORD[pos_x], 4h
RET
