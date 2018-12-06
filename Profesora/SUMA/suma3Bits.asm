
_main:

;suma3Bits.c,3 :: 		void main() {
;suma3Bits.c,4 :: 		TRISA=0B01110111;
	MOVLW       119
	MOVWF       TRISA+0 
;suma3Bits.c,5 :: 		TRISB=0;
	CLRF        TRISB+0 
;suma3Bits.c,6 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;suma3Bits.c,7 :: 		ADCON1=0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;suma3Bits.c,9 :: 		while(1){
L_main0:
;suma3Bits.c,10 :: 		DATOA=(PORTA & 0B00000111);
	MOVLW       7
	ANDWF       PORTA+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       _DATOA+0 
;suma3Bits.c,11 :: 		DATOB=((PORTA>>4) & 0B00000111);
	MOVF        PORTA+0, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVLW       7
	ANDWF       R0, 1 
	MOVF        R0, 0 
	MOVWF       _DATOB+0 
;suma3Bits.c,12 :: 		PORTB=DATOA + DATOB;
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       PORTB+0 
;suma3Bits.c,13 :: 		}
	GOTO        L_main0
;suma3Bits.c,14 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
