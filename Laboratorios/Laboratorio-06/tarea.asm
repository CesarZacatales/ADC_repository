org 100h
section .text

setup:
  MOV SI, 90d ; Columna inicial
  MOV DI, 70d ; Fila inicial

main:
  CALL IniciarModoVideo
  CALL DibujarTriangulo
  CALL EsperarTecla

  INT 20H

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
  RET               ; Termina la función cuando el triángulo está completo

EsperarTecla:
  MOV AH, 00h
  INT 16h           ; Lee una tecla del teclado
  RET
