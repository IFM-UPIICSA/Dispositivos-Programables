
_main:

;DECO.c,29 :: 		void main() {
;DECO.c,30 :: 		ADCON1=15;
	MOVLW       15
	MOVWF       ADCON1+0 
;DECO.c,31 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;DECO.c,32 :: 		TRISD=0;
	CLRF        TRISD+0 
;DECO.c,34 :: 		while(1) {
L_main0:
;DECO.c,35 :: 		for(i=0;i<=23;i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main2:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _i+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main7
	MOVF        _i+0, 0 
	SUBLW       23
L__main7:
	BTFSS       STATUS+0, 0 
	GOTO        L_main3
;DECO.c,36 :: 		PORTD=LETRAS[i];
	MOVLW       _LETRAS+0
	ADDWF       _i+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_LETRAS+0)
	ADDWFC      _i+1, 0 
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(_LETRAS+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	BTFSC       _i+1, 7 
	MOVLW       255
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, PORTD+0
;DECO.c,37 :: 		Delay_ms(80);
	MOVLW       208
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_main5:
	DECFSZ      R13, 1, 1
	BRA         L_main5
	DECFSZ      R12, 1, 1
	BRA         L_main5
	NOP
	NOP
;DECO.c,35 :: 		for(i=0;i<=23;i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;DECO.c,38 :: 		}
	GOTO        L_main2
L_main3:
;DECO.c,39 :: 		}
	GOTO        L_main0
;DECO.c,40 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
