ORG 100h

SECTION .text

GLOBAL _start

_start:
    ; Inicializar valores n y k
    MOV byte[200h], 6d       ; n = 5 (por ejemplo)
    MOV byte[204h], 3d       ; k = 3 (por ejemplo)

    ; Calcular combinaciones
    CALL combinations

    ; Mostrar mensaje
    MOV [206h], AX ; Guardamos un respaldo del valor AX
    MOV AH, 09h ; Función de impresión de cadenas
    MOV DX, msg ; Dirección de la cadena
    INT 21h

    ; Mostrar resultado almacenado en AX
    CALL print_number

    ; Terminar el programa
    MOV AH, 4Ch
    INT 21h

combinations:
    ; Calcular n!
    MOV CX, [200h]      ; CX = [n]
    MOV AX, 1d          ; AX = 1
    CALL factorial
    MOVZX EBX, AX      ; EBX = n!

    ; Calcular k!
    MOV CX, [204h]      ; DX = [k]
    MOV AX, 1d          ; AX = 1
    CALL factorial
    MOVZX ESI, AX      ; ESI = k!

    ; Calcular (n-k)!
    MOV CX, [200h]      ; CX = [n]
    MOV DX, [204h]      ; DX = [k]
    SUB CX, DX          ; CX = n - k
    MOV AX, 1d          ; AX = 1
    CALL factorial
    MOVZX EDI, AX      ; EDI = (n - k)!

    ; Calcular combinaciones: n! / (k! * (n - k)!)
    MOV EAX, EBX     ; EAX = n!
    IMUL ESI, EDI    ; ESI = k! * (n - k)!
    DIV ESI          ; EAX = n! / (k! * (n - k)!)
    RET

factorial:
    CMP CX, 0      ; Comprobar si n = 0
    JLE fin       ; Si n <= 0, devolver 1
    MUL ECX       ; Multiplicamos AX por CX extendido
    CMP CX, 1      ; Comprobar si n = 1
    LOOP factorial ; Si no, seguir multiplicando
    RET
print_number:
    ; Convertir valor en [206h] a una cadena y mostrarla
    MOV AX, [206h]  ; AX = [206h]
    MOV CX, 10    ; Divisor para convertir a decimal
    MOV BX, 0       ; BX = 0 para contar la longitud de la cadena

    convert_loop:
        XOR DX, DX  ; Limpiar DX para la división
        DIV CX      ; Dividir por 10
        ADD DL, '0' ; Convertir el resto a ASCII
        PUSH DX     ; Empujar el dígito a la pila
        INC BX      ; Incrementar contador de dígitos
        TEST AX, AX ; ¿Es cero el cociente?
        JNZ convert_loop  ; Si no, seguir dividiendo

    ; Mostrar los dígitos
    print_loop:
        POP DX      ; Sacar un dígito de la pila
        MOV AH, 02h ; Función de impresión de caracteres
        INT 21h
        DEC BX      ; Decrementar contador de dígitos
        JNZ print_loop  ; Si hay más dígitos, imprimir el siguiente

    RET
fin:
 MOV AX, 1
 RET
section .data
    msg db 'Combinations C(n, k) = $'

section .bss
    ; Aquí puedes definir variables no inicializadas si las necesitas