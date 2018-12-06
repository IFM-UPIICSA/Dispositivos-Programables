
_main:

;Estacionamiento.c,24 :: 		void main() {
;Estacionamiento.c,25 :: 		Keypad_Init();                           // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;Estacionamiento.c,27 :: 		TRISC.F0 = 1;
	BSF         TRISC+0, 0 
;Estacionamiento.c,28 :: 		TRISC.F1 = 0;
	BCF         TRISC+0, 1 
;Estacionamiento.c,29 :: 		TRISC.F2 = 0;
	BCF         TRISC+0, 2 
;Estacionamiento.c,30 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;Estacionamiento.c,31 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Estacionamiento.c,32 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;Estacionamiento.c,34 :: 		Lcd_Init();                              // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Estacionamiento.c,35 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Estacionamiento.c,36 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Estacionamiento.c,39 :: 		while(1){
L_main0:
;Estacionamiento.c,41 :: 		while(PORTC.F0 == 1){
L_main2:
	BTFSS       PORTC+0, 0 
	GOTO        L_main3
;Estacionamiento.c,42 :: 		kp=0;
	CLRF        _kp+0 
;Estacionamiento.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Estacionamiento.c,45 :: 		Lcd_Out(1,3,"Estacionados");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,46 :: 		if(dispo > 0){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _dispo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVF        _dispo+0, 0 
	SUBLW       0
L__main36:
	BTFSC       STATUS+0, 0 
	GOTO        L_main4
;Estacionamiento.c,47 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;Estacionamiento.c,48 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;Estacionamiento.c,49 :: 		}else if(dispo ==0){
	GOTO        L_main5
L_main4:
	MOVLW       0
	XORWF       _dispo+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVLW       0
	XORWF       _dispo+0, 0 
L__main37:
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
;Estacionamiento.c,50 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Estacionamiento.c,51 :: 		PORTC.F2 = 1;
	BSF         PORTC+0, 2 
;Estacionamiento.c,52 :: 		}
L_main6:
L_main5:
;Estacionamiento.c,53 :: 		Lcd_Chr(2,3,num[dispo]);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       _num+0
	ADDWF       _dispo+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_num+0)
	ADDWFC      _dispo+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Estacionamiento.c,56 :: 		do{
L_main7:
;Estacionamiento.c,57 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Estacionamiento.c,58 :: 		}while( (!kp) && (PORTC.F0 == 1));
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	BTFSS       PORTC+0, 0 
	GOTO        L__main34
	GOTO        L_main7
L__main34:
;Estacionamiento.c,61 :: 		if( (kp == 4) && (PORTC.F0 == 1) ){
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
	BTFSS       PORTC+0, 0 
	GOTO        L_main14
L__main33:
;Estacionamiento.c,62 :: 		if( dispo > 0 ){
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _dispo+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVF        _dispo+0, 0 
	SUBLW       0
L__main38:
	BTFSC       STATUS+0, 0 
	GOTO        L_main15
;Estacionamiento.c,63 :: 		dispo = dispo-1;
	MOVLW       1
	SUBWF       _dispo+0, 1 
	MOVLW       0
	SUBWFB      _dispo+1, 1 
;Estacionamiento.c,64 :: 		Lcd_Out(2,1,"Exito");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,65 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	DECFSZ      R11, 1, 1
	BRA         L_main16
	NOP
	NOP
;Estacionamiento.c,66 :: 		}else{
	GOTO        L_main17
L_main15:
;Estacionamiento.c,67 :: 		Lcd_Out(2,1,"Lleno");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,68 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
	NOP
	NOP
;Estacionamiento.c,69 :: 		}
L_main17:
;Estacionamiento.c,70 :: 		}else if( (kp == 2) && (PORTC.F0 == 1) ){
	GOTO        L_main19
L_main14:
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
	BTFSS       PORTC+0, 0 
	GOTO        L_main22
L__main32:
;Estacionamiento.c,71 :: 		if(dispo < 12){
	MOVLW       128
	XORWF       _dispo+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVLW       12
	SUBWF       _dispo+0, 0 
L__main39:
	BTFSC       STATUS+0, 0 
	GOTO        L_main23
;Estacionamiento.c,72 :: 		dispo = dispo+1;
	INFSNZ      _dispo+0, 1 
	INCF        _dispo+1, 1 
;Estacionamiento.c,73 :: 		Lcd_Out(2,1,"Exito");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,74 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main24:
	DECFSZ      R13, 1, 1
	BRA         L_main24
	DECFSZ      R12, 1, 1
	BRA         L_main24
	DECFSZ      R11, 1, 1
	BRA         L_main24
	NOP
	NOP
;Estacionamiento.c,75 :: 		}else{
	GOTO        L_main25
L_main23:
;Estacionamiento.c,76 :: 		Lcd_Out(2,1,"Vacio");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,77 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main26:
	DECFSZ      R13, 1, 1
	BRA         L_main26
	DECFSZ      R12, 1, 1
	BRA         L_main26
	DECFSZ      R11, 1, 1
	BRA         L_main26
	NOP
	NOP
;Estacionamiento.c,78 :: 		}
L_main25:
;Estacionamiento.c,79 :: 		}else if( (PORTC.F0 == 0) ){
	GOTO        L_main27
L_main22:
	BTFSC       PORTC+0, 0 
	GOTO        L_main28
;Estacionamiento.c,80 :: 		Lcd_Out(2,1,"Cerrado");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,81 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
	NOP
;Estacionamiento.c,82 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Estacionamiento.c,83 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;Estacionamiento.c,84 :: 		}else{
	GOTO        L_main30
L_main28:
;Estacionamiento.c,85 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Estacionamiento.c,86 :: 		Lcd_Out(2,1,"Error Entrada");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Estacionamiento+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Estacionamiento+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Estacionamiento.c,87 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
	NOP
;Estacionamiento.c,88 :: 		}
L_main30:
L_main27:
L_main19:
;Estacionamiento.c,90 :: 		}
	GOTO        L_main2
L_main3:
;Estacionamiento.c,94 :: 		}
	GOTO        L_main0
;Estacionamiento.c,95 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
