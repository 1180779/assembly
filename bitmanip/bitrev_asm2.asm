
        .MODEL FLAT
            
        .CODE

bitrev_asm2 PROC C
        ; int bitrev_asm2(int x);

        PUSH    EBP
        MOV     EBP, ESP

        MOV     EDX, [EBP + 8]
        MOV     ECX, 33

INVLOOP:
        SUB     ECX, 1
        JZ      ENDING

        SHL     EDX, 1
        RCR     EAX, 1
        JMP     INVLOOP

ENDING:
        POP     EBP
        RET

bitrev_asm2 ENDP

        END