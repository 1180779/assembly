
        includelib ucrt.lib
        includelib legacy_stdio_definitions.lib

        EXTERN  printf : PROC

        .DATA

NL      EQU     0DH
CR      EQU     0AH
FORMAT BYTE "move disc %5d from rod %5d to rod %5d", CR, NL, 0

        .CODE

hanoi_asm PROC
; void hanoi_asm(int n, int from, int to, int aux);
;                  RCX,      RDX,     R8,      R9

BOUNDRY_IF_0:
        CMP     RCX, 0
        JNE     RECURSION
        RET

RECURSION:
        PUSH    RBP
        MOV     RBP, RSP

        SUB     RSP, 8 * 5 
        ; 8 * 4 would be sufficient for variables, 
        ; but before each CALL windows demands a 16-byte boundary alignment
        MOV     [RBP - 8], RCX
        MOV     [RBP - 8 * 2], RDX
        MOV     [RBP - 8 * 3], R8
        MOV     [RBP - 8 * 4], R9

        SUB     RCX, 1
        XCHG    R8, R9
        CALL    hanoi_asm

        MOV     RCX, OFFSET FORMAT
        MOV     RDX, [RBP - 8]
        MOV     R8, [RBP - 8 * 2]
        MOV     R9, [RBP - 8 * 3]
        CALL    printf

        MOV     RCX, [RBP - 8]
        SUB     RCX, 1
        MOV     RDX, [RBP - 8 * 4]
        MOV     R8, [RBP - 8 * 3]
        MOV     R9, [RBP - 8 * 2]
        CALL    hanoi_asm

        ADD     RSP, 8 * 5
        POP     RBP
        RET

hanoi_asm ENDP

        END