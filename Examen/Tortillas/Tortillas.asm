
_main:

;Tortillas.c,26 :: 		void main() {
;Tortillas.c,28 :: 		TRISC.F0 = 1;
	BSF         TRISC+0, 0 
;Tortillas.c,29 :: 		TRISC.F1 = 0;
	BCF         TRISC+0, 1 
;Tortillas.c,30 :: 		TRISC.F2 = 0;
	BCF         TRISC+0, 2 
;Tortillas.c,31 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Tortillas.c,32 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;Tortillas.c,34 :: 		Keypad_Init();
	CALL        _Keypad_Init+0, 0
;Tortillas.c,36 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;Tortillas.c,37 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Tortillas.c,39 :: 		while (1){
L_main0:
;Tortillas.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);  //Limpiiar LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Tortillas.c,42 :: 		while(PORTC.F0 == 0){
L_main2:
	BTFSC       PORTC+0, 0 
	GOTO        L_main3
;Tortillas.c,43 :: 		Lcd_out(1,1, "Encendido");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Tortillas+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Tortillas+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Tortillas.c,44 :: 		entrada = 0;
	CLRF        _entrada+0 
	CLRF        _entrada+1 
;Tortillas.c,45 :: 		kp = 0;
	CLRF        _kp+0 
;Tortillas.c,47 :: 		do{
L_main4:
;Tortillas.c,48 :: 		do{
L_main7:
;Tortillas.c,49 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Tortillas.c,50 :: 		}while((!kp)&&(PORTC.F0 == 0));
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L__main29
	BTFSC       PORTC+0, 0 
	GOTO        L__main29
	GOTO        L_main7
L__main29:
;Tortillas.c,51 :: 		if(kp == 9){
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
;Tortillas.c,52 :: 		entrada = 1;
	MOVLW       1
	MOVWF       _entrada+0 
	MOVLW       0
	MOVWF       _entrada+1 
;Tortillas.c,53 :: 		}else{
	GOTO        L_main13
L_main12:
;Tortillas.c,54 :: 		Lcd_Out(2,2,"Error");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Tortillas+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Tortillas+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Tortillas.c,55 :: 		Delay_ms(300);
	MOVLW       4
	MOVWF       R11, 0
	MOVLW       12
	MOVWF       R12, 0
	MOVLW       51
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	DECFSZ      R11, 1, 1
	BRA         L_main14
	NOP
	NOP
;Tortillas.c,56 :: 		Lcd_Cmd(_LCD_CLEAR);  //Limpiiar LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Tortillas.c,57 :: 		Lcd_out(1,1, "Encendido");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Tortillas+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Tortillas+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Tortillas.c,58 :: 		}
L_main13:
;Tortillas.c,59 :: 		}while((entrada == 0) &&(PORTC.F0 == 0));
	MOVLW       0
	XORWF       _entrada+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main31
	MOVLW       0
	XORWF       _entrada+0, 0 
L__main31:
	BTFSS       STATUS+0, 2 
	GOTO        L__main28
	BTFSC       PORTC+0, 0 
	GOTO        L__main28
	GOTO        L_main4
L__main28:
;Tortillas.c,61 :: 		if( (PORTC.F0 == 0) && (entrada ==1) ){
	BTFSC       PORTC+0, 0 
	GOTO        L_main19
	MOVLW       0
	XORWF       _entrada+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main32
	MOVLW       1
	XORWF       _entrada+0, 0 
L__main32:
	BTFSS       STATUS+0, 2 
	GOTO        L_main19
L__main27:
;Tortillas.c,63 :: 		PORTC.F1 = 1;
	BSF         PORTC+0, 1 
;Tortillas.c,64 :: 		for(i=0; i<10; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main20:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main33
	MOVLW       10
	SUBWF       _i+0, 0 
L__main33:
	BTFSC       STATUS+0, 0 
	GOTO        L_main21
;Tortillas.c,65 :: 		if(i==9)
	MOVLW       0
	XORWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main34
	MOVLW       9
	XORWF       _i+0, 0 
L__main34:
	BTFSS       STATUS+0, 2 
	GOTO        L_main23
;Tortillas.c,66 :: 		Lcd_Out (2,2,"10           ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Tortillas+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Tortillas+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_main24
L_main23:
;Tortillas.c,68 :: 		Lcd_Chr (2,2, numeros[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       _numeros+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_numeros+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Tortillas.c,69 :: 		}
L_main24:
;Tortillas.c,70 :: 		Delay_ms(100);
	MOVLW       2
	MOVWF       R11, 0
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       186
	MOVWF       R13, 0
L_main25:
	DECFSZ      R13, 1, 1
	BRA         L_main25
	DECFSZ      R12, 1, 1
	BRA         L_main25
	DECFSZ      R11, 1, 1
	BRA         L_main25
	NOP
;Tortillas.c,64 :: 		for(i=0; i<10; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Tortillas.c,71 :: 		}
	GOTO        L_main20
L_main21:
;Tortillas.c,72 :: 		PORTC.F1 = 0;
	BCF         PORTC+0, 1 
;Tortillas.c,73 :: 		PORTC.F2 = 1;
	BSF         PORTC+0, 2 
;Tortillas.c,74 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;Tortillas.c,75 :: 		PORTC.F2 = 0;
	BCF         PORTC+0, 2 
;Tortillas.c,76 :: 		Lcd_Cmd(_LCD_CLEAR);  //Limpiiar LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Tortillas.c,77 :: 		Lcd_out(1,1, "Encendido");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Tortillas+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Tortillas+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Tortillas.c,78 :: 		}
L_main19:
;Tortillas.c,79 :: 		}
	GOTO        L_main2
L_main3:
;Tortillas.c,80 :: 		}
	GOTO        L_main0
;Tortillas.c,81 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
