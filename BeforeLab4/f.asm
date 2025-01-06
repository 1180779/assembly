
        .CODE


; void f1(int* T1, int* T2, int* res, int size);
;             RCX,     RDX,       R8,       R9
f1      PROC

ADD_LOOP:
        SUB         R9, 4
        CMP         R9, 0
        JL          ENDING


        MOVAPS      XMM0, [RCX]
        PADDD       XMM0, [RDX]
        MOVAPS      [R8], XMM0
        
        ADD         RCX, 16
        ADD         RDX, 16
        ADD         R8, 16
        JMP         ADD_LOOP

ENDING:
        RET

f1      ENDP

; ----------------------------------------------------------

; void f2(int* T1, int* T2, int* res, int size);
;             RCX,     RDX,       R8,       R9
f2      PROC

ADD_LOOP:
        SUB         R9, 4
        CMP         R9, 0
        JL          ENDING


        MOVDQA      XMM0, [RCX]
        MOVDQA      XMM1, [RDX]
        
        PSHUFD      XMM2, XMM0, 00110010b
        PSHUFD      XMM0, XMM0, 00010000b

        PSHUFD      XMM3, XMM1, 00110010b
        PSHUFD      XMM1, XMM1, 00010000b

        PMULDQ      XMM0, XMM1
        PMULDQ      XMM2, XMM3

        PSHUFD      XMM0, XMM0, 1000b
        PSHUFD      XMM2, XMM2, 1000b

        PUNPCKLQDQ  XMM0, XMM2
        MOVDQA      [R8], XMM0

        ADD         RCX, 16
        ADD         RDX, 16
        ADD         R8, 16
        JMP         ADD_LOOP

ENDING:
        RET

f2      ENDP

; ----------------------------------------------------------

; void f3(int* T1, int y, long long int* res, int size);
;             RCX,   EDX,                 R8,        R9
f3      PROC

        VMOVD       XMM5, EDX
        VPBROADCASTD    XMM5, XMM5
        PMOVSXDQ        XMM5, XMM5
        
ADD_LOOP:
        SUB         R9, 4
        CMP         R9, 0
        JL          ENDING

        MOVDQA      XMM0, [RCX]
        
        PMOVSXDQ    XMM1, XMM0              ; XMM1 = [T1, T1, T0, T0]
        PSHUFD      XMM0, XMM0, 1110b       ; XMM0 = [__, __, T3, T2]
        PMOVSXDQ    XMM2, XMM0              ; XMM2 = [T3, T3, T2, T2]

        VPSLLVQ     XMM1, XMM1, XMM5        ; | left bit shift
        VPSLLVQ     XMM2, XMM2, XMM5        ; | 
        
        MOVDQA      [R8], XMM1              ; | save results
        MOVDQA      [R8 + 16], XMM2         ; | 

        ADD         RCX, 16
        ADD         R8, 32
        JMP         ADD_LOOP

ENDING:
        RET

f3      ENDP

; ----------------------------------------------------------

; void f4(int* T, int* res, int size);
;            RCX,      RDX,       R8
f4      PROC

        
ADD_LOOP:
        SUB         R8, 4
        CMP         R8, 0
        JL          ENDING

        MOVDQA      XMM0, [RCX]
        PABSD       XMM0, XMM0
        MOVDQA      [RDX], XMM0

        ADD         RCX, 16
        ADD         RDX, 16
        JMP         ADD_LOOP

ENDING:
        RET

f4      ENDP

; ----------------------------------------------------------

; void f5(int* T, int* res, int size);
;            RCX,      RDX,       R8
f5      PROC

        
ADD_LOOP:
        SUB         R8, 4
        CMP         R8, 0
        JL          ENDING

        MOVDQA      XMM0, [RCX]
        ; TO DO:
        ; bit mask etc
        MOVDQA      [RDX], XMM0

        ADD         RCX, 16
        ADD         RDX, 16
        JMP         ADD_LOOP

ENDING:
        RET

f5      ENDP

        END
