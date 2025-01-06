
        .CODE

factorial_rec_asm PROC
; int factorial_rec_asm(int n);
        
        PUSH    RBP
        MOV     RBP, RSP

        MOV     RAX, 1
        ; initialize registers

        ; call recursion function
        CALL factorial_recursion

ENDING:
        POP     RBP
        RET

factorial_rec_asm ENDP

; recursion function body - after registers have been initialized
factorial_recursion PROC

        CMP     RCX, 0
        JE     RECURSION_END

        ; MOV     RDX, 0
        MUL     RCX
        SUB     RCX, 1
        CALL    factorial_recursion

RECURSION_END:
        RET

factorial_recursion ENDP



        END