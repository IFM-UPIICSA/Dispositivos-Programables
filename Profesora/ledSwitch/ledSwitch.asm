
_main:

;ledSwitch.c,1 :: 		void main() {
;ledSwitch.c,2 :: 		TRISA=0B00000001;
	MOVLW       1
	MOVWF       TRISA+0 
;ledSwitch.c,3 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;ledSwitch.c,4 :: 		ADCON1=0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;ledSwitch.c,5 :: 		PORTA=0;
	CLRF        PORTA+0 
;ledSwitch.c,7 :: 		while(1){
L_main0:
;ledSwitch.c,8 :: 		if(PORTA.F0==1){
	BTFSS       PORTA+0, 0 
	GOTO        L_main2
;ledSwitch.c,9 :: 		PORTA.F1=1;
	BSF         PORTA+0, 1 
;ledSwitch.c,10 :: 		}
	GOTO        L_main3
L_main2:
;ledSwitch.c,12 :: 		PORTA.F1=0;
	BCF         PORTA+0, 1 
;ledSwitch.c,13 :: 		}
L_main3:
;ledSwitch.c,15 :: 		}
	GOTO        L_main0
;ledSwitch.c,17 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
