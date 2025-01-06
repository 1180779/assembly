        .MODEL FLAT

        .CODE

matrix_symmetry PROC C
; int matrix_symmetry(int *T, int size);

        PUSH    EBP
        MOV     EBP, ESP

        ; EAX - result, intermediate calculations
        ; EBX - array pointer
        ; ECX - current row index
        ; EDX - current column index
        ; EDI - symmetric row index
        ; ESI - symmetric column index
        
        ; not done

        PUSH    EBX
        PUSH    EDI
        PUSH    ESI
        
        MOV     EBX, [EBP + 8]
        MOV     ECX, [EBP + 12]
        SUB     ECX, 1
        MOV     EDX, [EBP + 12]
        SUB     EDX, 1

        MOV     EDI, 0
        MOV     ESI, 0


        


ENDING_FALSE:
        XOR     EAX, EAX
        JMP     ENDING

ENDING_TRUE:
        MOV     EAX, 1

ENDING:
        POP     ESI
        POP     EDI
        POP     EBX

        POP     EBP
        RET

matrix_symmetry ENDP

        END