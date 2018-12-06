
_main:

;ON_OFF.c,1 :: 		void main() {
;ON_OFF.c,2 :: 		TRISD=0;
	CLRF        TRISD+0 
;ON_OFF.c,3 :: 		PORTD=0;
	CLRF        PORTD+0 
;ON_OFF.c,5 :: 		while(1){
L_main0:
;ON_OFF.c,6 :: 		portd.f1=~portd.f1;
	BTG         PORTD+0, 1 
;ON_OFF.c,7 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main2:
	DECFSZ      R13, 1, 1
	BRA         L_main2
	DECFSZ      R12, 1, 1
	BRA         L_main2
	DECFSZ      R11, 1, 1
	BRA         L_main2
	NOP
;ON_OFF.c,9 :: 		}
	GOTO        L_main0
;ON_OFF.c,11 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
