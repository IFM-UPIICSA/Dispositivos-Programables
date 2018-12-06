
_main:

;DECO.c,14 :: 		void main() {
;DECO.c,15 :: 		TRISA=15;
	MOVLW       15
	MOVWF       TRISA+0 
;DECO.c,16 :: 		ADCON1=15;
	MOVLW       15
	MOVWF       ADCON1+0 
;DECO.c,17 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;DECO.c,18 :: 		PORTA=0;
	CLRF        PORTA+0 
;DECO.c,19 :: 		TRISD=0;
	CLRF        TRISD+0 
;DECO.c,21 :: 		while(1) {
L_main0:
;DECO.c,22 :: 		PORTD=DIGITOS[PORTA];
	MOVLW       _DIGITOS+0
	ADDWF       PORTA+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_DIGITOS+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_DIGITOS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;DECO.c,23 :: 		}
	GOTO        L_main0
;DECO.c,24 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
