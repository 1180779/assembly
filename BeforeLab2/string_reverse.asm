

        .CODE

string_reverse_asm PROC
; extern "C" void string_reverse_asm(char* s, int length);

BOUNDRY_EMPTY_OR_SINGLE_LETTER:
        CMP     RDX, 1
        JG      RECURSION
        RET

RECURSION:
        MOV     R8B, [RCX]
        XCHG    [RCX + RDX - 1], R8B
        MOV     [RCX], R8B

        ADD     RCX, 1
        SUB     RDX, 2
        CALL    string_reverse_asm
        RET

string_reverse_asm ENDP

        END