ORG 100h

SECTION .text

    XOR AX, AX
    XOR BX, BX

    MOV AX, 5d
    MOV BX, AX

main:
    ; Si BX es 1 o menos, salimos
    CMP BX, 1
    JBE fin

    CALL factorial

    JMP main

fin:

    MOV [200h], AL

    INT 20h

; Calculo del factorial
factorial:
    DEC BX         
    MUL BX           
    RET
