
        .CODE

factorial_asm PROC
; int factorial_asm(int n);

        PUSH    RBP
        MOV     RBP, RSP

        ; RCX - n
        ; RAX - wynik

        MOV     RAX, 1

        CMP     RCX, 0
        JE      ENDING

FACTORIAL_LOOP:
        MOV     RDX, 0
        MUL     RCX        
        SUB     RCX, 1
        JNZ     FACTORIAL_LOOP

ENDING:
        POP     RBP
        RET

factorial_asm ENDP

        END