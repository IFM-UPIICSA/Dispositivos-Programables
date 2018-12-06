
_CustomChar:

;Alarma.c,32 :: 		void CustomChar(char pos_row, char pos_char) {
;Alarma.c,34 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,35 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar0:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar1
	MOVLW       _character+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar0
L_CustomChar1:
;Alarma.c,36 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,37 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Alarma.c,38 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_main:

;Alarma.c,40 :: 		void main() {
;Alarma.c,43 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Alarma.c,44 :: 		ADCON1 = 15;
	MOVLW       15
	MOVWF       ADCON1+0 
;Alarma.c,45 :: 		TRISA = 0B00000011;
	MOVLW       3
	MOVWF       TRISA+0 
;Alarma.c,46 :: 		PORTA = 0;
	CLRF        PORTA+0 
;Alarma.c,48 :: 		TRISC.F0 = 0;
	BCF         TRISC+0, 0 
;Alarma.c,49 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;Alarma.c,52 :: 		Keypad_Init();                           // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;Alarma.c,53 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Alarma.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,55 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,58 :: 		while (1){
L_main3:
;Alarma.c,59 :: 		kp = 0;
	CLRF        _kp+0 
;Alarma.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,61 :: 		while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
L_main5:
	BTFSC       PORTA+0, 0 
	GOTO        L_main6
	BTFSC       PORTA+0, 1 
	GOTO        L_main6
L__main48:
;Alarma.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,63 :: 		do
L_main9:
;Alarma.c,64 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Alarma.c,65 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
;Alarma.c,66 :: 		if( (kp == 4) && (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
	BTFSC       PORTA+0, 0 
	GOTO        L_main14
	BTFSC       PORTA+0, 1 
	GOTO        L_main14
L__main47:
;Alarma.c,68 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,69 :: 		Lcd_Out(1,1,txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,72 :: 		while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
L_main15:
	BTFSC       PORTA+0, 0 
	GOTO        L_main16
	BTFSC       PORTA+0, 1 
	GOTO        L_main16
L__main46:
;Alarma.c,73 :: 		PORTC.F0 = ~PORTC.F0;
	BTG         PORTC+0, 0 
;Alarma.c,74 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main19:
	DECFSZ      R13, 1, 1
	BRA         L_main19
	DECFSZ      R12, 1, 1
	BRA         L_main19
	DECFSZ      R11, 1, 1
	BRA         L_main19
	NOP
	NOP
;Alarma.c,75 :: 		}
	GOTO        L_main15
L_main16:
;Alarma.c,77 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;Alarma.c,80 :: 		while (flag == 0){
L_main20:
	MOVLW       0
	XORWF       _flag+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main51
	MOVLW       0
	XORWF       _flag+0, 0 
L__main51:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;Alarma.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,83 :: 		Lcd_Out(1,1,txt5);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,84 :: 		CustomChar(2,1);
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;Alarma.c,85 :: 		Lcd_Out(2,5,"2");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Alarma+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Alarma+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,86 :: 		kp = 0;
	CLRF        _kp+0 
;Alarma.c,87 :: 		do{
L_main22:
;Alarma.c,88 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Alarma.c,89 :: 		}while(!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
;Alarma.c,90 :: 		if( kp == 2 ){   //un #
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main25
;Alarma.c,91 :: 		Lcd_Out(2,5,"1");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Alarma+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Alarma+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,92 :: 		kp = 0;
	CLRF        _kp+0 
;Alarma.c,93 :: 		do{
L_main26:
;Alarma.c,94 :: 		kp = Keypad_Key_Click();
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Alarma.c,95 :: 		}while(!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main26
;Alarma.c,96 :: 		if(kp==2){   //dos #
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
;Alarma.c,97 :: 		flag = 1;
	MOVLW       1
	MOVWF       _flag+0 
	MOVLW       0
	MOVWF       _flag+1 
;Alarma.c,98 :: 		}else{   //error boton
	GOTO        L_main30
L_main29:
;Alarma.c,99 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,100 :: 		Lcd_Out(1,1,txt7);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt7+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt7+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,101 :: 		Lcd_Out(2,1,txt8);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,102 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
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
;Alarma.c,103 :: 		}
L_main30:
;Alarma.c,104 :: 		}else{   //error boton
	GOTO        L_main32
L_main25:
;Alarma.c,105 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,106 :: 		Lcd_Out(1,1,txt7);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt7+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt7+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,107 :: 		Lcd_Out(2,1,txt8);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt8+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt8+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,108 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
	NOP
;Alarma.c,109 :: 		}
L_main32:
;Alarma.c,110 :: 		}
	GOTO        L_main20
L_main21:
;Alarma.c,113 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,114 :: 		Lcd_Out(1,1,txt5);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt5+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt5+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,115 :: 		Lcd_Out(2,1,txt9);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt9+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt9+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,116 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
;Alarma.c,117 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,118 :: 		}else if( (kp==4) && ( (PORTA.F0 == 1) || (PORTA.F1 == 1) ) ){
	GOTO        L_main35
L_main14:
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main40
	BTFSC       PORTA+0, 0 
	GOTO        L__main45
	BTFSC       PORTA+0, 1 
	GOTO        L__main45
	GOTO        L_main40
L__main45:
L__main44:
;Alarma.c,120 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,121 :: 		Lcd_Out(1,1,txt2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,122 :: 		Lcd_Out(2,1,txt3);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,123 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	DECFSZ      R11, 1, 1
	BRA         L_main41
	NOP
;Alarma.c,124 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,125 :: 		}else{
	GOTO        L_main42
L_main40:
;Alarma.c,127 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,128 :: 		Lcd_Out(1,1,txt2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,129 :: 		Lcd_Out(2,1,txt4);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt4+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,130 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main43:
	DECFSZ      R13, 1, 1
	BRA         L_main43
	DECFSZ      R12, 1, 1
	BRA         L_main43
	DECFSZ      R11, 1, 1
	BRA         L_main43
	NOP
;Alarma.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,132 :: 		}
L_main42:
L_main35:
;Alarma.c,133 :: 		}
	GOTO        L_main5
L_main6:
;Alarma.c,134 :: 		}
	GOTO        L_main3
;Alarma.c,135 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
