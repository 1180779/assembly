        .MODEL FLAT

        .CODE

arrayabssumasm PROC C
        ; int arraymodsumasm(int T[], int size)
        ; sum of absouute values of elements of the array

        PUSH    EBP
        MOV     EBP, ESP
    
        ; EAX = <sum>
        ; EBX = i
        ; ECX = size
        ; EDX = T address
        ; ESI = T[i]

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
        MOV     ESI, [EDX]
        CMP     ESI, 0
        JGE     ADDING
        NEG     ESI

ADDING:
        ADD     EAX, ESI
        JMP     SUMLOOP

ENDING:
        POP     EBP
        RET

arrayabssumasm ENDP

        END
