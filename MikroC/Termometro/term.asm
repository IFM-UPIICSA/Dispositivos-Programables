
_main:

;term.c,19 :: 		void main(){
;term.c,20 :: 		TRISA=1;     //0B00000001 TRISA.F0=1 TRISA0_bit=1
	MOVLW       1
	MOVWF       TRISA+0 
;term.c,21 :: 		CMCON=7;
	MOVLW       7
	MOVWF       CMCON+0 
;term.c,22 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;term.c,25 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;term.c,26 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;term.c,27 :: 		Lcd_Out(1,1,"Temperatura:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_term+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_term+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;term.c,29 :: 		while(1) {
L_main0:
;term.c,30 :: 		vout_bin = ADC_Read(0);
	CLRF        FARG_ADC_Read_channel+0 
	CALL        _ADC_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _vout_bin+0 
	MOVF        R1, 0 
	MOVWF       _vout_bin+1 
;term.c,31 :: 		temp = vout_bin * 0.4887;
	CALL        _word2double+0, 0
	MOVLW       227
	MOVWF       R4 
	MOVLW       54
	MOVWF       R5 
	MOVLW       122
	MOVWF       R6 
	MOVLW       125
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _temp+0 
	MOVF        R1, 0 
	MOVWF       _temp+1 
;term.c,32 :: 		IntToStr(temp, temperatura);
	MOVF        R0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        R1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _temperatura+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_temperatura+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;term.c,33 :: 		Lcd_Out(2,6, temperatura);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _temperatura+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_temperatura+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;term.c,34 :: 		Lcd_Chr (2,14, 67);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       14
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       67
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;term.c,35 :: 		Lcd_Chr(2,13, 223);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       223
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;term.c,36 :: 		if (temp>=25){
	MOVLW       0
	SUBWF       _temp+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main5
	MOVLW       25
	SUBWF       _temp+0, 0 
L__main5:
	BTFSS       STATUS+0, 0 
	GOTO        L_main2
;term.c,37 :: 		PORTA.F1=1;
	BSF         PORTA+0, 1 
;term.c,38 :: 		PORTA.F2=0;
	BCF         PORTA+0, 2 
;term.c,39 :: 		}
	GOTO        L_main3
L_main2:
;term.c,41 :: 		PORTA.F1=0;
	BCF         PORTA+0, 1 
;term.c,42 :: 		PORTA.F2=1;
	BSF         PORTA+0, 2 
;term.c,43 :: 		}
L_main3:
;term.c,45 :: 		}
	GOTO        L_main0
;term.c,46 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
