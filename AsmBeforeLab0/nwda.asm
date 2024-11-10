
	.MODEL FLAT

	.CODE

nwda PROC C
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
	; |----------------|
	; |      RET       |     EBP + 16
 	; |----------------|                  ^
	; |       b        |     EBP + 12     |
	; |----------------|                  |   kierunek rosniecia
	; |       a        |     EBP + 8      |        adresow
	; |----------------|                  |
	; |    stare EBP   |     EBP + 4
	; |----------------|
	;                          EBP

	
	MOV		EAX, [EBP + 8]		; EAX = a
	MOV		EDX, [EBP + 12]		; EDX = b

WHILELOOP:
	CMP		EAX, EDX
	JE		KONIEC			; jesli rowne to koniec
	JA		POZAMIANIE		; jesli a wieksze od b
	XCHG	EAX, EDX		; jesli a mniejsze b to wokonujemy dalej i zamieniamy
						
POZAMIANIE:
	SUB		EAX, EDX		; a -= b
	JMP		WHILELOOP		; wracamy do poczatku petli

KONIEC:						; wynik podajemy w EAX. Zauwazmy ze a juz tam jest
	POP		EBP				; przywracamy stary BasePointer (usuwamy argumenty ze stosu)
	RET						; powrot do 

nwda ENDP

	END
