ORG 100h

SECTION .text

inmediato:

  MOV AH, 12d
  MOV AL, 0FFh
  MOV BH, 10010b
  MOV BL, "A"
;

registro:

MOV  AL, AH
MOV CX, BX
;

absoluto:
MOV [200h], AL
MOV [210h], CX

  INT 20h