
_CustomChar1:

;Alarma.c,28 :: 		void CustomChar1(char pos_row, char pos_char) {
;Alarma.c,30 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,31 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
	CLRF        CustomChar1_i_L0+0 
L_CustomChar10:
	MOVF        CustomChar1_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar11
	MOVLW       _character1+0
	ADDWF       CustomChar1_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character1+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character1+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar1_i_L0+0, 1 
	GOTO        L_CustomChar10
L_CustomChar11:
;Alarma.c,32 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,33 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar1_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar1_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Alarma.c,34 :: 		}
L_end_CustomChar1:
	RETURN      0
; end of _CustomChar1

_CustomChar2:

;Alarma.c,38 :: 		void CustomChar2(char pos_row, char pos_char) {
;Alarma.c,40 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,41 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
	CLRF        CustomChar2_i_L0+0 
L_CustomChar23:
	MOVF        CustomChar2_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar24
	MOVLW       _character2+0
	ADDWF       CustomChar2_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character2+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character2+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar2_i_L0+0, 1 
	GOTO        L_CustomChar23
L_CustomChar24:
;Alarma.c,42 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,43 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar2_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar2_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Alarma.c,44 :: 		}
L_end_CustomChar2:
	RETURN      0
; end of _CustomChar2

_main:

;Alarma.c,46 :: 		void main() {
;Alarma.c,49 :: 		CMCON = 7;
	MOVLW       7
	MOVWF       CMCON+0 
;Alarma.c,50 :: 		ADCON1 = 15;
	MOVLW       15
	MOVWF       ADCON1+0 
;Alarma.c,51 :: 		TRISA = 0B00000011;
	MOVLW       3
	MOVWF       TRISA+0 
;Alarma.c,52 :: 		PORTA = 0;
	CLRF        PORTA+0 
;Alarma.c,54 :: 		TRISC.F0 = 0;
	BCF         TRISC+0, 0 
;Alarma.c,55 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;Alarma.c,58 :: 		Keypad_Init();                           // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;Alarma.c,59 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Alarma.c,60 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,61 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,64 :: 		while (1){
L_main6:
;Alarma.c,65 :: 		kp = 0;
	CLRF        _kp+0 
;Alarma.c,66 :: 		while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
L_main8:
	BTFSC       PORTA+0, 0 
	GOTO        L_main9
	BTFSC       PORTA+0, 1 
	GOTO        L_main9
L__main37:
;Alarma.c,67 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,68 :: 		do
L_main12:
;Alarma.c,69 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Alarma.c,70 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
;Alarma.c,71 :: 		if( (kp == 4) && (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main17
	BTFSC       PORTA+0, 0 
	GOTO        L_main17
	BTFSC       PORTA+0, 1 
	GOTO        L_main17
L__main36:
;Alarma.c,73 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,74 :: 		Lcd_Out(1,1,txt1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt1+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt1+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,77 :: 		while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
L_main18:
	BTFSC       PORTA+0, 0 
	GOTO        L_main19
	BTFSC       PORTA+0, 1 
	GOTO        L_main19
L__main35:
;Alarma.c,78 :: 		PORTC.F0 = ~PORTC.F0;
	BTG         PORTC+0, 0 
;Alarma.c,79 :: 		Delay_ms(500);
	MOVLW       6
	MOVWF       R11, 0
	MOVLW       19
	MOVWF       R12, 0
	MOVLW       173
	MOVWF       R13, 0
L_main22:
	DECFSZ      R13, 1, 1
	BRA         L_main22
	DECFSZ      R12, 1, 1
	BRA         L_main22
	DECFSZ      R11, 1, 1
	BRA         L_main22
	NOP
	NOP
;Alarma.c,80 :: 		}
	GOTO        L_main18
L_main19:
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
;Alarma.c,84 :: 		CustomChar1(2,1);
	MOVLW       2
	MOVWF       FARG_CustomChar1_pos_row+0 
	MOVLW       1
	MOVWF       FARG_CustomChar1_pos_char+0 
	CALL        _CustomChar1+0, 0
;Alarma.c,85 :: 		PORTC.F0 = 0;
	BCF         PORTC+0, 0 
;Alarma.c,86 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main23:
	DECFSZ      R13, 1, 1
	BRA         L_main23
	DECFSZ      R12, 1, 1
	BRA         L_main23
	DECFSZ      R11, 1, 1
	BRA         L_main23
	NOP
;Alarma.c,88 :: 		}else if( (kp==4) && ( (PORTA.F0 == 1) || (PORTA.F1 == 1) ) ){
	GOTO        L_main24
L_main17:
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_main29
	BTFSC       PORTA+0, 0 
	GOTO        L__main34
	BTFSC       PORTA+0, 1 
	GOTO        L__main34
	GOTO        L_main29
L__main34:
L__main33:
;Alarma.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,91 :: 		Lcd_Out(1,1,txt2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,92 :: 		Lcd_Out(2,1,txt3);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt3+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt3+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,93 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main30:
	DECFSZ      R13, 1, 1
	BRA         L_main30
	DECFSZ      R12, 1, 1
	BRA         L_main30
	DECFSZ      R11, 1, 1
	BRA         L_main30
	NOP
;Alarma.c,94 :: 		}else{
	GOTO        L_main31
L_main29:
;Alarma.c,96 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Alarma.c,97 :: 		Lcd_Out(1,1,txt2);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt2+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt2+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,98 :: 		Lcd_Out(2,1,txt4);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _txt4+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_txt4+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Alarma.c,99 :: 		Delay_ms(3000);
	MOVLW       31
	MOVWF       R11, 0
	MOVLW       113
	MOVWF       R12, 0
	MOVLW       30
	MOVWF       R13, 0
L_main32:
	DECFSZ      R13, 1, 1
	BRA         L_main32
	DECFSZ      R12, 1, 1
	BRA         L_main32
	DECFSZ      R11, 1, 1
	BRA         L_main32
	NOP
;Alarma.c,100 :: 		}
L_main31:
L_main24:
;Alarma.c,101 :: 		}
	GOTO        L_main8
L_main9:
;Alarma.c,102 :: 		}
	GOTO        L_main6
;Alarma.c,103 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
