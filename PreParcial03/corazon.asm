BITS 16

ORG 100h

start:
    ; Configurar el modo gráfico 13h (320x200, 256 colores)
    mov ax, 0013h
    int 10h

    ; Dibujar el corazón
    call DrawHeart

    ; Esperar a que se presione una tecla
    mov ah, 00h
    int 16h

    ; Volver al modo de texto 3h (80x25, 16 colores)
    mov ax, 0003h
    int 10h

    ; Terminar el programa
    mov ax, 4c00h
    int 21h

DrawHeart:
    ; Segmento de memoria de video
    mov ax, 0A000h
    mov es, ax

    ; Coordenadas del corazón (ajusta según sea necesario)
    ; Este ejemplo dibuja un corazón más grande
    ; Coordenadas relativas al centro (160, 100)

    ; Parte superior izquierda del corazón
    mov di, (100 - 10) * 320 + (160 - 10)
    call PutPixel
    mov di, (100 - 11) * 320 + (160 - 9)
    call PutPixel
    mov di, (100 - 12) * 320 + (160 - 8)
    call PutPixel
    mov di, (100 - 13) * 320 + (160 - 7)
    call PutPixel
    mov di, (100 - 14) * 320 + (160 - 6)
    call PutPixel
    mov di, (100 - 14) * 320 + (160 - 5)
    call PutPixel
    mov di, (100 - 13) * 320 + (160 - 4)
    call PutPixel
    mov di, (100 - 12) * 320 + (160 - 3)
    call PutPixel
    mov di, (100 - 11) * 320 + (160 - 2)
    call PutPixel
    mov di, (100 - 10) * 320 + (160 - 1)
    call PutPixel

    ; Parte superior derecha del corazón
    mov di, (100 - 10) * 320 + (160 + 10)
    call PutPixel
    mov di, (100 - 11) * 320 + (160 + 9)
    call PutPixel
    mov di, (100 - 12) * 320 + (160 + 8)
    call PutPixel
    mov di, (100 - 13) * 320 + (160 + 7)
    call PutPixel
    mov di, (100 - 14) * 320 + (160 + 6)
    call PutPixel
    mov di, (100 - 14) * 320 + (160 + 5)
    call PutPixel
    mov di, (100 - 13) * 320 + (160 + 4)
    call PutPixel
    mov di, (100 - 12) * 320 + (160 + 3)
    call PutPixel
    mov di, (100 - 11) * 320 + (160 + 2)
    call PutPixel
    mov di, (100 - 10) * 320 + (160 + 1)
    call PutPixel

    ; Parte inferior del corazón
    mov di, (100) * 320 + (160 - 15)
    call PutPixel
    mov di, (100 + 1) * 320 + (160 - 14)
    call PutPixel
    mov di, (100 + 2) * 320 + (160 - 13)
    call PutPixel
    mov di, (100 + 3) * 320 + (160 - 12)
    call PutPixel
    mov di, (100 + 4) * 320 + (160 - 11)
    call PutPixel
    mov di, (100 + 5) * 320 + (160 - 10)
    call PutPixel
    mov di, (100 + 6) * 320 + (160 - 9)
    call PutPixel
    mov di, (100 + 7) * 320 + (160 - 8)
    call PutPixel
    mov di, (100 + 8) * 320 + (160 - 7)
    call PutPixel
    mov di, (100 + 9) * 320 + (160 - 6)
    call PutPixel
    mov di, (100 + 10) * 320 + (160 - 5)
    call PutPixel
    mov di, (100 + 11) * 320 + (160 - 4)
    call PutPixel
    mov di, (100 + 12) * 320 + (160 - 3)
    call PutPixel
    mov di, (100 + 13) * 320 + (160 - 2)
    call PutPixel
    mov di, (100 + 14) * 320 + (160 - 1)
    call PutPixel
    mov di, (100 + 15) * 320 + (160)
    call PutPixel
    mov di, (100 + 14) * 320 + (160 + 1)
    call PutPixel
    mov di, (100 + 13) * 320 + (160 + 2)
    call PutPixel
    mov di, (100 + 12) * 320 + (160 + 3)
    call PutPixel
    mov di, (100 + 11) * 320 + (160 + 4)
    call PutPixel
    mov di, (100 + 10) * 320 + (160 + 5)
    call PutPixel
    mov di, (100 + 9) * 320 + (160 + 6)
    call PutPixel
    mov di, (100 + 8) * 320 + (160 + 7)
    call PutPixel
    mov di, (100 + 7) * 320 + (160 + 8)
    call PutPixel
    mov di, (100 + 6) * 320 + (160 + 9)
    call PutPixel
    mov di, (100 + 5) * 320 + (160 + 10)
    call PutPixel
    mov di, (100 + 4) * 320 + (160 + 11)
    call PutPixel
    mov di, (100 + 3) * 320 + (160 + 12)
    call PutPixel
    mov di, (100 + 2) * 320 + (160 + 13)
    call PutPixel
    mov di, (100 + 1) * 320 + (160 + 14)
    call PutPixel
    mov di, (100) * 320 + (160 + 15)
    call PutPixel

    ret

PutPixel:
    mov al, 4Fh    ; Color (rojo)
    stosb
    ret

times 510-($-$$) db 0
dw 0xaa55