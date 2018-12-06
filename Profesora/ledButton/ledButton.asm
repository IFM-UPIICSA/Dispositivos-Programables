
_main:

;ledButton.c,2 :: 		void main() {
;ledButton.c,3 :: 		TRISA=1;
	MOVLW       1
	MOVWF       TRISA+0 
;ledButton.c,4 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;ledButton.c,5 :: 		ADCON1=15;
	MOVLW       15
	MOVWF       ADCON1+0 
;ledButton.c,8 :: 		while(1){
L_main0:
;ledButton.c,10 :: 		if(Button (&PORTA, 0, 100, 1)){
	MOVLW       PORTA+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTA+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       100
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main2
;ledButton.c,11 :: 		PORTA.F1=~PORTA.F1;
	BTG         PORTA+0, 1 
;ledButton.c,12 :: 		}
L_main2:
;ledButton.c,13 :: 		}
	GOTO        L_main0
;ledButton.c,14 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
