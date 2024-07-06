
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
 RET

 OpcionFigura:
 MOV AH, 0h
 MOV AL, 03h ; Establece modo texto 80x25
 int 10h ; Llama a la interrupción del BIOS para cambiar el modo texto
 CALL CentrarCursor
 MOV AH, 09h
 MOV DX, mensaje_figura
 INT 21h
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