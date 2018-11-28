
_main:

;Teclado.c,25 :: 		void main() {
;Teclado.c,26 :: 		cnt = 0;                                 // Reset counter
	CLRF        _cnt+0 
;Teclado.c,27 :: 		Keypad_Init();                           // Initialize Keypad
	CALL        _Keypad_Init+0, 0
;Teclado.c,29 :: 		Lcd_Init();                              // Initialize LCD
	CALL        _Lcd_Init+0, 0
;Teclado.c,30 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Teclado.c,31 :: 		Lcd_Out(1, 1, "  Login Access");                 // Write message text on LCD
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,32 :: 		Lcd_Out(2, 1, "   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,34 :: 		do {
L_main0:
;Teclado.c,35 :: 		kp = 0;                                // Reset key code variable
	CLRF        _kp+0 
;Teclado.c,38 :: 		do
L_main3:
;Teclado.c,40 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL        _Keypad_Key_Click+0, 0
	MOVF        R0, 0 
	MOVWF       _kp+0 
;Teclado.c,41 :: 		while (!kp);
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main3
;Teclado.c,43 :: 		switch (kp) {
	GOTO        L_main6
;Teclado.c,49 :: 		case  1: kp = 68; break; // D        // Uncomment this block for keypad4x4
L_main8:
	MOVLW       68
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,50 :: 		case  2: kp = 35; break; // #
L_main9:
	MOVLW       35
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,51 :: 		case  3: kp = 48; break; // 0
L_main10:
	MOVLW       48
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,52 :: 		case  4: kp = 42; break; // *
L_main11:
	MOVLW       42
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,53 :: 		case  5: kp = 67; break; // C
L_main12:
	MOVLW       67
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,54 :: 		case  6: kp = 57; break; // 9
L_main13:
	MOVLW       57
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,55 :: 		case  7: kp = 56; break; // 8
L_main14:
	MOVLW       56
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,56 :: 		case  8: kp = 55; break; // 7
L_main15:
	MOVLW       55
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,57 :: 		case  9: kp = 66; break; // B
L_main16:
	MOVLW       66
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,58 :: 		case 10: kp = 54; break; // 6
L_main17:
	MOVLW       54
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,59 :: 		case 11: kp = 53; break; // 5
L_main18:
	MOVLW       53
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,60 :: 		case 12: kp = 52; break; // 4
L_main19:
	MOVLW       52
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,61 :: 		case 13: kp = 65; break; // A
L_main20:
	MOVLW       65
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,62 :: 		case 14: kp = 51; break; // 3
L_main21:
	MOVLW       51
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,63 :: 		case 15: kp = 50; break; // 2
L_main22:
	MOVLW       50
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,64 :: 		case 16: kp = 49; break; // 1
L_main23:
	MOVLW       49
	MOVWF       _kp+0 
	GOTO        L_main7
;Teclado.c,66 :: 		}
L_main6:
	MOVF        _kp+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
	MOVF        _kp+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_main9
	MOVF        _kp+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
	MOVF        _kp+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_main11
	MOVF        _kp+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
	MOVF        _kp+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_main13
	MOVF        _kp+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_main14
	MOVF        _kp+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_main15
	MOVF        _kp+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
	MOVF        _kp+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_main17
	MOVF        _kp+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L_main18
	MOVF        _kp+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L_main19
	MOVF        _kp+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L_main20
	MOVF        _kp+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L_main21
	MOVF        _kp+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L_main22
	MOVF        _kp+0, 0 
	XORLW       16
	BTFSC       STATUS+0, 2 
	GOTO        L_main23
L_main7:
;Teclado.c,68 :: 		if (cnt < 6) {                  // Pressed key differs from previous
	MOVLW       6
	SUBWF       _cnt+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main24
;Teclado.c,69 :: 		entrada[cnt] = kp;
	MOVLW       _entrada+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_entrada+0)
	MOVWF       FSR1H 
	MOVF        _cnt+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVF        _kp+0, 0 
	MOVWF       POSTINC1+0 
;Teclado.c,70 :: 		Lcd_Chr(2,3+cnt, kp);                    // Print * ASCII value on LCD
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        _cnt+0, 0 
	ADDLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVF        _kp+0, 0 
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;Teclado.c,71 :: 		cnt++;
	INCF        _cnt+0, 1 
;Teclado.c,72 :: 		} else {
	GOTO        L_main25
L_main24:
;Teclado.c,73 :: 		cnt = 0;
	CLRF        _cnt+0 
;Teclado.c,74 :: 		for(i=0; i<6; i++){
	CLRF        _i+0 
	CLRF        _i+1 
L_main26:
	MOVLW       128
	XORWF       _i+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main36
	MOVLW       6
	SUBWF       _i+0, 0 
L__main36:
	BTFSC       STATUS+0, 0 
	GOTO        L_main27
;Teclado.c,75 :: 		if( entrada[i] != pass[i] ){
	MOVLW       _entrada+0
	ADDWF       _i+0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_entrada+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVLW       _pass+0
	ADDWF       _i+0, 0 
	MOVWF       FSR2 
	MOVLW       hi_addr(_pass+0)
	ADDWFC      _i+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R1 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	BTFSC       R1, 7 
	MOVLW       255
	XORWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main37
	MOVF        R1, 0 
	XORWF       R2, 0 
L__main37:
	BTFSC       STATUS+0, 2 
	GOTO        L_main29
;Teclado.c,76 :: 		correct = 0;
	CLRF        _correct+0 
	CLRF        _correct+1 
;Teclado.c,77 :: 		i=6;
	MOVLW       6
	MOVWF       _i+0 
	MOVLW       0
	MOVWF       _i+1 
;Teclado.c,78 :: 		}
L_main29:
;Teclado.c,74 :: 		for(i=0; i<6; i++){
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;Teclado.c,79 :: 		}
	GOTO        L_main26
L_main27:
;Teclado.c,80 :: 		if (correct==1){
	MOVLW       0
	XORWF       _correct+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main38
	MOVLW       1
	XORWF       _correct+0, 0 
L__main38:
	BTFSS       STATUS+0, 2 
	GOTO        L_main30
;Teclado.c,81 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Teclado.c,82 :: 		Lcd_Out(1, 1, "Login Sucessfull");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,83 :: 		Lcd_Out(2, 1, "Welcome");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,84 :: 		Delay_ms(20000);
	MOVLW       203
	MOVWF       R11, 0
	MOVLW       236
	MOVWF       R12, 0
	MOVLW       132
	MOVWF       R13, 0
L_main31:
	DECFSZ      R13, 1, 1
	BRA         L_main31
	DECFSZ      R12, 1, 1
	BRA         L_main31
	DECFSZ      R11, 1, 1
	BRA         L_main31
	NOP
;Teclado.c,85 :: 		}else if (correct == 0){
	GOTO        L_main32
L_main30:
	MOVLW       0
	XORWF       _correct+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main39
	MOVLW       0
	XORWF       _correct+0, 0 
L__main39:
	BTFSS       STATUS+0, 2 
	GOTO        L_main33
;Teclado.c,86 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Teclado.c,87 :: 		Lcd_Out(1, 1, "Login Error");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,88 :: 		Lcd_Out(2, 1, "Try Again");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr6_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr6_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,89 :: 		Delay_ms(1000);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
	NOP
;Teclado.c,90 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;Teclado.c,91 :: 		Lcd_Out(1, 1, "Insert Password");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,92 :: 		Lcd_Out(2, 1, "   ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr8_Teclado+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr8_Teclado+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;Teclado.c,93 :: 		}
L_main33:
L_main32:
;Teclado.c,94 :: 		}
L_main25:
;Teclado.c,95 :: 		} while (1);
	GOTO        L_main0
;Teclado.c,96 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
