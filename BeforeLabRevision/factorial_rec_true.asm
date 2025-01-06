
        .CODE

factorial_rec_true_asm PROC
; int factorial_rec_true_asm(int n);
        
        PUSH    RBP
        MOV     RBP, RSP

BOUNDRY_IF:
        CMP     RCX, 0
        JNE     RECURSION
        MOV     RAX, 1
        RET

RECURSION:
        SUB     RCX, 1
        CALL    factorial_rec_true_asm
        MUL     RCX

ENDING:
        POP     RBP
        RET

factorial_rec_true_asm ENDP

        END