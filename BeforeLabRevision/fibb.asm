
        .CODE

fibb_asm PROC
; int fibb_asm(int n);

        PUSH    RBP
        MOV     RBP, RSP

        ; RCX - n
        ; RAX - fibb(0) = 0
        ; RDX - fibb(1) = 1

        MOV     RAX, 0
        MOV     RDX, 1

        CMP     RCX, 0
        JE      ENDING

FIBB_LOOP:
        ADD     RDX, RAX
        XCHG    RDX, RAX

        SUB     RCX, 1
        JNZ     FIBB_LOOP

ENDING:
        POP     RBP
        RET


fibb_asm ENDP

        END