        
        .MODEL FLAT

        .CODE

insertionsortasm PROC C
        ; insertionsortasm(int T[], int size)
        ; sortowanie przez wstawianie
    
        PUSH    EBP
        MOV     EBP, ESP

        ; save callee-saved registers
        PUSH    EBX
        PUSH    ESI
        PUSH    EDI

	    ; kompilator wrzuca paramtery funkcji na stos w kolejnosci 
	    ; odwrotnej do wystepowania w sygnaturze funkcji
	    ; elementy na stosie maja (32 bity) 4 bajty
	    ; na szczycie stosu po wejsciu do procedury jest adres powrotny
	    ;
	    ; stos rosnie w dol!!!
	    ;
	    ;        stos            adres 
 	    ; |----------------|                  ^
	    ; |      size      |     EBP + 12     |
	    ; |----------------|                  |   kierunek rosniecia
	    ; |      T[]       |     EBP + 8      |        adresow
	    ; |----------------|                  |
	    ; |      RET       |     EBP + 4
	    ; |----------------|
	    ; |    stare EBP   |     EBP = ESP
        ; |----------------| 

        ; EAX = i
        ; EBX = j
        ; ECX = T address
        ; EDX = size
        ; ESI = temp
        ; EDI = T[j - 1]

        MOV     EDX, [EBP + 12]     
        MOV     ECX, [EBP + 8]      

        MOV     EAX, -1                     ; i = -1

OUTERLOOP:
        ADD     EAX, 1                      ; ++i
        CMP     EAX, EDX                    ; | i < size
        JGE     KONIEC                      ; |

        MOV     ESI, [ECX + 4*EAX]          ; temp = T[i]

        MOV     EBX, EAX                    ; |
        ADD     EBX, 1                      ; | j = i + 1

INNERLOOP:
        SUB     EBX, 1                      ; --j

        CMP     EBX, 0                      ; | j > 0
        JLE     AFTERINNER                  ; |

        MOV     EDI, [ECX + 4*EBX - 4]      ; EDI = T[j - 1]
        CMP     EDI, ESI                    ; | T[j - 1] > temp
        JLE     AFTERINNER                  ; |

        MOV     [ECX + 4*EBX], EDI          ; T[j] = T[j - 1]
        JMP     INNERLOOP

AFTERINNER:
        MOV     [ECX + 4*EBX], ESI
        JMP     OUTERLOOP

KONIEC:
        ; restore callee-saved registers
        POP     EDI
        POP     ESI
        POP     EBX

        POP     EBP
        RET

insertionsortasm ENDP

        END