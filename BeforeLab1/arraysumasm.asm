        .MODEL FLAT

        .CODE

arraysumasm PROC C
        ; int arraysumasm(int T[], int size)
        ; sum of elements of the array

        PUSH    EBP
        MOV     EBP, ESP
    
        ; EAX = <sum>
        ; EBX = i
        ; ECX = size
        ; EDX = T address

        XOR     EAX, EAX 
        MOV     EBX, -1             ; i = -1
        MOV     ECX, [EBP + 12]
        MOV     EDX, [EBP + 8]

        SUB     EDX, 4

SUMLOOP:
        ADD     EBX, 1              ; ++i
        CMP     EBX, ECX            ; | i < size
        JGE     ENDING              ; |

        ADD     EDX, 4
        ADD     EAX, [EDX]
        JMP     SUMLOOP

ENDING:
        POP     EBP
        RET

arraysumasm ENDP

        END
