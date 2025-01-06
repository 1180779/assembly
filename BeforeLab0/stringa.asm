        .MODEL FLAT

        .CODE

S2B     EQU     ('A' - 'a')
B2S     EQU     ('a' - 'A')    

stringBigSmallAsm PROC C
        PUSH    EBP
        MOV     EBP, ESP

        MOV     EBX, [EBP + 8]  ; EBX - wskaünik na string
        SUB     EBX, 1

WHILELOOP:
        ADD     EBX, 1
        MOV     AL, [EBX]
        CMP     AL, 0
        JE      KONIEC

S2BCHANGE:
        CMP     AL, 'a'      ; sprawdz czy w zakresie 'a' - 'z'
        JB      B2SCHANGE       ; 
        CMP     AL, 'z'      ;
        JA      B2SCHANGE       ;

        ADD     AL, S2B
        MOV     BYTE PTR [EBX], AL
        JMP     WHILELOOP

B2SCHANGE:
       CMP      AL, 'A'
       JB       WHILELOOP
       CMP      AL, 'Z'
       JA       WHILELOOP

       ADD      AL, B2S
       MOV      BYTE PTR [EBX], AL
       JMP      WHILELOOP

KONIEC:
        POP     EBP
        RET

stringBigSmallAsm ENDP

        END