

        .CODE

horner_asm PROC
; float horner_asm(float coef[], int coef_len, float x);
; XMM0                      RCX,          RDX,    XMM2

        PUSH    RBP
        MOV     RBP, RSP

        MOVSS   XMM0, REAL4 PTR [RCX]

HORNER_LOOP:
        SUB     RDX, 1
        CMP     RDX, 0
        JE      ENDING

        MULSS   XMM0, XMM2
        ADD     RCX, 4
        MOVSS   XMM1, REAL4 PTR [RCX]
        ADDSS   XMM0, XMM1
        JMP     HORNER_LOOP

ENDING:
        POP     RBP
        RET


horner_asm ENDP
        END