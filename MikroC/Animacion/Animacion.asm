
_CustomChar1:

;Animacion.c,7 :: 		void CustomChar1(char pos_row, char pos_char) {
;Animacion.c,9 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,10 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
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
;Animacion.c,11 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,12 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar1_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar1_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Animacion.c,13 :: 		}
L_end_CustomChar1:
	RETURN      0
; end of _CustomChar1

_CustomChar2:

;Animacion.c,17 :: 		void CustomChar2(char pos_row, char pos_char) {
;Animacion.c,19 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,20 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
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
;Animacion.c,21 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,22 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar2_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar2_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Animacion.c,23 :: 		}
L_end_CustomChar2:
	RETURN      0
; end of _CustomChar2

_CustomChar3:

;Animacion.c,27 :: 		void CustomChar3(char pos_row, char pos_char) {
;Animacion.c,29 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,30 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character3[i]);
	CLRF        CustomChar3_i_L0+0 
L_CustomChar36:
	MOVF        CustomChar3_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar37
	MOVLW       _character3+0
	ADDWF       CustomChar3_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character3+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character3+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar3_i_L0+0, 1 
	GOTO        L_CustomChar36
L_CustomChar37:
;Animacion.c,31 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,32 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar3_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar3_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Animacion.c,33 :: 		}
L_end_CustomChar3:
	RETURN      0
; end of _CustomChar3

_CustomChar4:

;Animacion.c,37 :: 		void CustomChar4(char pos_row, char pos_char) {
;Animacion.c,39 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,40 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character4[i]);
	CLRF        CustomChar4_i_L0+0 
L_CustomChar49:
	MOVF        CustomChar4_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar410
	MOVLW       _character4+0
	ADDWF       CustomChar4_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character4+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character4+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar4_i_L0+0, 1 
	GOTO        L_CustomChar49
L_CustomChar410:
;Animacion.c,41 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,42 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar4_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar4_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Animacion.c,43 :: 		}
L_end_CustomChar4:
	RETURN      0
; end of _CustomChar4

_main:

;Animacion.c,66 :: 		void main() {
;Animacion.c,68 :: 		Lcd_Init();                              // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Animacion.c,69 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,70 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Animacion.c,71 :: 		while(1){
L_main12:
;Animacion.c,72 :: 		Lcd_Out(1,1,"HELP");                    // Print * ASCII value on LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Animacion+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Animacion+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Animacion.c,73 :: 		Lcd_Chr(2,3+cnt, kp);                    // Print * ASCII value on LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _cnt+0, 0 
	ADDLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Animacion.c,74 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main14:
	DECFSZ      R13, 1, 1
	BRA         L_main14
	DECFSZ      R12, 1, 1
	BRA         L_main14
	NOP
;Animacion.c,75 :: 		CustomChar1(0,0);
	CLRF        FARG_CustomChar1_pos_row+0 
	CLRF        FARG_CustomChar1_pos_char+0 
	CALL        _CustomChar1+0, 0
;Animacion.c,76 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main15:
	DECFSZ      R13, 1, 1
	BRA         L_main15
	DECFSZ      R12, 1, 1
	BRA         L_main15
	NOP
;Animacion.c,77 :: 		CustomChar2(0,0);
	CLRF        FARG_CustomChar2_pos_row+0 
	CLRF        FARG_CustomChar2_pos_char+0 
	CALL        _CustomChar2+0, 0
;Animacion.c,78 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main16:
	DECFSZ      R13, 1, 1
	BRA         L_main16
	DECFSZ      R12, 1, 1
	BRA         L_main16
	NOP
;Animacion.c,79 :: 		CustomChar3(0,0);
	CLRF        FARG_CustomChar3_pos_row+0 
	CLRF        FARG_CustomChar3_pos_char+0 
	CALL        _CustomChar3+0, 0
;Animacion.c,80 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	NOP
;Animacion.c,81 :: 		CustomChar4(0,0);
	CLRF        FARG_CustomChar4_pos_row+0 
	CLRF        FARG_CustomChar4_pos_char+0 
	CALL        _CustomChar4+0, 0
;Animacion.c,82 :: 		Delay_ms(10);
	MOVLW       26
	MOVWF       R12, 0
	MOVLW       248
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	NOP
;Animacion.c,83 :: 		}
	GOTO        L_main12
;Animacion.c,84 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
