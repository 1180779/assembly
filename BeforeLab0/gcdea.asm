
	.MODEL FLAT

	.CODE

nwdea PROC C
	; unsigned nwda(unsigned a, unsigned b)
	; zwraca najwiêkszy wspólny dzielnik
	; nie sprawdza czy a i b sa rozne od 0

	PUSH	EBP
	MOV		EBP, ESP

	; kompilator wrzuca paramtery funkcji na stos w kolejnosci 
	; odwrotnej do wystepowania w sygnaturze funkcji
	; elementy na stosie maja (32 bity) 4 bajty
	; na szczycie stosu po wejsciu do procedury jest adres powrotny
	;
	; stos rosnie w dol!!!
	;
	;        stos            adres 
 	; |----------------|                  ^
	; |       b        |     EBP + 12     |
	; |----------------|                  |   kierunek rosniecia
	; |       a        |     EBP + 8      |        adresow
	; |----------------|                  |
	; |      RET       |     EBP + 4
	; |----------------|
	; |    stare EBP   |     EBP
	; |----------------| 

	
	MOV		EBX, [EBP + 8]		; EBX = a
	MOV		EAX, [EBP + 12]		; EAX = b

WHILELOOP:
	CMP		EAX, 0
	JE		KONIEC			; jesli b rowne 0 to koniec
	MOV		ECX, EAX		; x = b

	MOV		EAX, EBX		; | 
	MOV		EDX, 0			; |
	DIV		ECX				; | b = a % b
	MOV		EAX, EDX		; | 

	MOV		EBX, ECX		; a = x
	JMP		WHILELOOP		; powrot do poczatku petli

KONIEC:						; wynik podajemy w EAX
	MOV		EAX, EBX		; kopiowanie a do akumulatora
	POP		EBP				; przywracamy stary BasePointer (usuwamy argumenty ze stosu)
	RET						; powrot do 

nwdea ENDP

	END
