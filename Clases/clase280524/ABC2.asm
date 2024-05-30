org 100h

section .text

    mov ah, 09h  
    mov al, 42h
    mov bh, 00h 
    mov bl, 79h 
    mov cx, 01h

    mov ah, 02h    ; Función 02h: Set cursor position
    mov bh, 00h    ; Página 0
    mov dh, 00h    ; Fila 0
    mov dl, 01h    ; Columna 1
    
    mov ah, 0Ah    ; Función 0Ah: Write character at cursor position with attribute
    mov al, 'B'    ; Carácter 'B'
    mov bh, 00h    ; Página 0
    mov bl, 1Eh    ; Atributo: 1E (azul sobre fondo amarillo)
    mov cx, 1      ; Número de veces a escribir el carácter

  
int 10h