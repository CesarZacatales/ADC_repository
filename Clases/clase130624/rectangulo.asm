org 100h

section .text
    ; Configurar modo video
    mov ah, 00h
    mov al, 12h
    int 10h 

    ; Configurar color y página de video
    mov ah, 0ch
    mov al, 02h ; color
    mov bh, 00h ; página de visualización

    ; Configurar coordenadas iniciales
    mov cx, 90d ; x inicial
    mov dx, 50d ; y inicial (mitad de la pantalla vertical)

draw_rect:
    ; Dibujar línea horizontal de un rectángulo
    mov cx, 90d ; reiniciar x a 90

s1:
    int 10h ; dibujar píxel en (cx, dx)
    inc cx ; incrementar x
    cmp cx, 180d ; comparar x con 120 (ancho del rectángulo)
    jnz s1 ; si no ha llegado a 120, continuar dibujando la línea

    ; Incrementar y para la siguiente línea del rectángulo
    inc dx ; incrementar y
    cmp dx, 90d ; comparar y con 320 (altura del rectángulo)
    jl draw_rect ; si no ha llegado a 320, continuar dibujando filas

s2:
    ; Esperar a que se presione la tecla 'S'
    mov ah, 00h
    int 16h
    cmp al, 73d ; comparar tecla presionada con 'S'
    jnz s2
    ; Volver al modo de texto
    mov ah, 00h 
    mov al, 03h
    int 10h
    int 20h