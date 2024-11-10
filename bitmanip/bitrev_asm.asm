        .MODEL FLAT

        .CODE

bitrev_asm PROC C
        ; int bitrev_asm(int x);

        PUSH    EBP
        MOV     EBP, ESP

        MOV     EDX, [EBP + 8]
        
        MOV     ECX, 32
        XOR     EAX, EAX ; EAX = 0

REVLOOP:
        SUB     ECX, 1
        JZ      ENDING

        SHR     EDX, 1
        ADC     EAX, 0
        SHL     EAX, 1
        JMP     REVLOOP

ENDING:
        SHR     EDX, 1
        ADC     EAX, 0

        POP     EBP
        RET

bitrev_asm ENDP

        END


