org 100h

section .data
    celcius dd 0.0
    v1 dd 9.0
    v2 dd 5.0
    v3 dd 32.0
    result dd 0.0

section .text
    main:
        XOR AX, AX
        mov eax, [200h]
        mov [celcius], eax
        fld dword [celcius]
        fld dword [v1] 
        fmul
        fld dword [v2]
        fdiv
        fld dword [v3]
        fadd
        fstp dword [210h]

        int 20h