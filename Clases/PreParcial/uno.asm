ORG 100h

SECTION .text

    xor ax, ax
    xor dx, dx
    xor cx, cx

    mov ax, 25
    mov bl, 3
    mov di, 0200h
    
divide:
    div bl
    mov [di], al
    inc di
    cmp al, 3
    jb finalizar
    mov cl, al
    mov ax, cx
    jmp divide

finalizar:
    mov byte [220h], 'F'
    mov byte [221h], 'I'
    mov byte [222h], 'N'
    int 20h
