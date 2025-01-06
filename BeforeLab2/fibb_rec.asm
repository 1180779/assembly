
        .CODE

fibb_rec_asm PROC
; int fibb_asm(int n);

BOUNDRY_IF_0:
        CMP     RCX, 0
        JNE     BOUNDRY_IF_1
        MOV     RAX, 0
        RET

BOUNDRY_IF_1:
        CMP     RCX, 1
        JNE     RECURSION
        MOV     RAX, 1
        RET

RECURSION:
        PUSH    RBP
        MOV     RBP, RSP

        SUB     RSP, 16 * 2
        MOV     [RBP - 16], RCX

        SUB     RCX, 1
        CALL    fibb_rec_asm
        MOV     [RBP - 32], RAX
        
        MOV     RCX, [RBP - 16]
        SUB     RCX, 2
        CALL    fibb_rec_asm
        
        ADD     RAX, [RBP - 32]

ENDING:
        ADD     RSP, 16 * 2
        POP     RBP
        RET

fibb_rec_asm ENDP

        END