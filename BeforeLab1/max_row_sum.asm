        .MODEL FLAT

        .CODE

max_row_sum PROC C
; int max_row_sum(int T[][], int rowlength, int columnlength);
        
        ; EAX - max sum
        ; EBX - current sum (current row)
        ; ECX - current item (index)
        ; EDX - current row first item (index)
        ; EDI - array pointer

        PUSH    EBP
        MOV     EBP, ESP

        PUSH    EBX
        PUSH    EDI

        XOR     EAX, EAX
        XOR     EBX, EBX


        MOV     EDX, [EBP + 16]
        MOV     ECX, [EBP + 12]
        MOV     EDI, [EBP + 8]

        IMUL    ECX, EDX
        MOV     EDX, ECX

COLUMNLOOP:
        CMP     EBX, EAX
        CMOVG   EAX, EBX
        
        CMP     ECX, 0
        JE      ENDING

        SUB     EDX, [EBP + 12]
        XOR     EBX, EBX

ROWLOOP:
        SUB     ECX, 1
        ADD     EBX, [EDI + ECX * 4]
        CMP     ECX, EDX
        JNE     ROWLOOP
        JMP     COLUMNLOOP

ENDING:
        
        POP     EDI
        POP     EBX

        POP     EBP
        RET

max_row_sum ENDP

        END