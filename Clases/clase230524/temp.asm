org 100h
section .text

global main 

main:
    XOR AX, AX
    XOR DX, DX
    XOR BX, BX
    XOR CX, CX
    MOV AL, [200H]
    MOV BH, 9D
    MOV CH, 5D
    MOV DH, 32D
    MUL BH; ESTA R//AX
    DIV CH
