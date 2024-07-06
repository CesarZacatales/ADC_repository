org 100h
section .text

setup:
  MOV SI, 300d ; Columna inicial para el primer borde vertical
  MOV DI, 100d ; Fila inicial para el primer borde vertical

main:
  CALL IniciarModoVideo
  CALL DibujarEscalera
  CALL EsperarTecla

  INT 20H

IniciarModoVideo:
  MOV AH, 0h
  MOV AL, 12h      ; Modo gráfico 640x480, 16 colores
  INT 10h
  RET

DibujarEscalera:
  MOV CX, SI        ; CX como la coordenada X inicial (300d)
  MOV DX, DI        ; DX como la coordenada Y inicial (100d)

DibujarLineaVertical1:
  MOV AH, 0Ch       ; Función del BIOS para poner un píxel
  MOV AL, 0100b     ; Color del píxel (azul)
  MOV BH, 0         ; Página de video 0
  MOV CX, SI        ; Coordenada X
  MOV DX, DI        ; Coordenada Y
  INT 10h           ; Enciende el píxel

  INC DI            ; Incrementa la fila (Y)
  CMP DI, 400d      ; Compara la fila actual con el límite de 400
  JLE DibujarLineaVertical1  ; Si no se alcanza el límite, continúa dibujando

  ; Dibuja la segunda línea vertical
  MOV SI, 320d ; Columna inicial para el segundo borde vertical
  MOV DI, 100d ; Fila inicial para el segundo borde vertical

DibujarLineaVertical2:
  MOV AH, 0Ch       ; Función del BIOS para poner un píxel
  MOV AL, 0100b     ; Color del píxel (azul)
  MOV BH, 0         ; Página de video 0
  MOV CX, SI        ; Coordenada X
  MOV DX, DI        ; Coordenada Y
  INT 10h           ; Enciende el píxel

  INC DI            ; Incrementa la fila (Y)
  CMP DI, 400d      ; Compara la fila actual con el límite de 400
  JLE DibujarLineaVertical2  ; Si no se alcanza el límite, continúa dibujando

  ; Dibuja los peldaños horizontales, quitando el primero y el último
  MOV DI, 120d ; Fila inicial para el primer peldaño

DibujarPeldano:
  MOV SI, 300d ; Columna inicial para el primer peldaño
  MOV BX, 20   ; Longitud del peldaño

DibujarPixelHorizontal:
  MOV AH, 0Ch       ; Función del BIOS para poner un píxel
  MOV AL, 0100b     ; Color del píxel (azul)
  MOV BH, 0         ; Página de video 0
  MOV CX, SI        ; Coordenada X
  MOV DX, DI        ; Coordenada Y
  INT 10h           ; Enciende el píxel

  INC SI            ; Incrementa la columna
  DEC BX            ; Decrementa la cuenta de longitud del peldaño
  JNZ DibujarPixelHorizontal  ; Si BX no es cero, continúa dibujando píxeles en esta fila

  ; Al finalizar el peldaño, prepara el siguiente
  ADD DI, 40        ; Desplaza a la siguiente fila
  CMP DI, 380d      ; Compara la fila actual con el límite de 380 (para quitar el último peldaño)
  JLE DibujarPeldano   ; Si no se alcanza el límite, continúa dibujando el siguiente peldaño
  RET               ; Termina la función cuando la escalera está completa

EsperarTecla:
  MOV AH, 00h
  INT 16h           ; Lee una tecla del teclado
  RET
