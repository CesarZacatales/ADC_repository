 ;noe alas 
 ;César Zacatales
; Programa en ensamblador para imprimir el nombre y apellido en modo gráfico 13h
org 0x100

section .data
    nombre db 'noe', 0
    apellido db 'lopez', 0

section .text
start:
    ; Cambiar a modo gráfico 13h
    mov ax, 0x0013
    int 0x10

    ; Configurar las posiciones iniciales del cursor para el nombre
    mov si, nombre
    mov cx, 0 ; Columna inicial
    mov dx, 0 ; Fila inicial (Y)
    call imprimir_texto
    
    ; Configurar las posiciones iniciales del cursor para el apellido
    mov si, apellido
    mov cx, 39 ; Última columna
    mov dx, 8 ; Colocar en la fila siguiente a la del nombre (suponiendo que cada carácter es 8 píxeles de alto)
    call imprimir_texto

    ; Esperar hasta una tecla para salir
    mov ah, 0
    int 0x16

    ; Volver al modo texto 3
    mov ax, 0x0003
    int 0x10
    ret

imprimir_texto:
    pusha
    mov ah, 0x0E ; Servicio de BIOS para salida de texto en modo gráfico
    mov bh, 0 ; Página de visualización
    .loop:
        lodsb
        cmp al, 0
        je .done
        mov bl, 0x07 ; Atributo de color (blanco)
        
        ; Calcular la posición en la pantalla
        ; Columna en CX, Fila en DX
        push cx
        push dx
        mov di, cx
        shl di, 3 ; Multiplicar columna por 8 (ancho del carácter en píxeles)
        add di, dx ; Añadir la fila
        
        ; Imprimir el carácter en la posición DI
        call imprimir_caracter

        pop dx
        pop cx
        
        ; Avanzar a la siguiente fila para el próximo carácter
        add dx, 8
        jmp .loop
    .done:
    popa
    ret

imprimir_caracter:
    pusha
    mov ah, 0x0E ; Servicio de BIOS para salida de texto en modo gráfico
    mov bh, 0 ; Página de visualización
    int 0x10
    popa
    ret

times 510-($-$$) db 0
dw 0xAA55