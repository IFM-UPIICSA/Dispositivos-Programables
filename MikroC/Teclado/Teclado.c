unsigned short kp, cnt, entrada[6];
short pass[6] = {50,55,50,48,50,57};
int i = 0, correct = 1;

// Keypad module connections
char  keypadPort at PORTB;
// End Keypad module connections

// LCD module connections
sbit LCD_RS at RD2_bit;
sbit LCD_EN at RD3_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD2_bit;
sbit LCD_EN_Direction at TRISD3_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
// End LCD module connections

void main() {
  cnt = 0;                                 // Reset counter
  Keypad_Init();                           // Initialize Keypad

  Lcd_Init();                              // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                     // Clear display
  Lcd_Out(1, 1, "  Login Access");                 // Write message text on LCD
  Lcd_Out(2, 1, "   ");

  do {
    kp = 0;                                // Reset key code variable

    // Wait for key to be pressed and released
    do
      // kp = Keypad_Key_Press();          // Store key code in kp variable
      kp = Keypad_Key_Click();             // Store key code in kp variable
    while (!kp);
   // Prepare value for output, transform key to it's ASCII value
    switch (kp) {
      //case 10: kp = 42; break;  // '*'   // Uncomment this block for keypad4x3
      //case 11: kp = 48; break;  // '0'
      //case 12: kp = 35; break;  // '#'
      //default: kp += 48;

      case  1: kp = 68; break; // D        // Uncomment this block for keypad4x4
      case  2: kp = 35; break; // #
      case  3: kp = 48; break; // 0
      case  4: kp = 42; break; // *
      case  5: kp = 67; break; // C
      case  6: kp = 57; break; // 9
      case  7: kp = 56; break; // 8
      case  8: kp = 55; break; // 7
      case  9: kp = 66; break; // B
      case 10: kp = 54; break; // 6
      case 11: kp = 53; break; // 5
      case 12: kp = 52; break; // 4
      case 13: kp = 65; break; // A
      case 14: kp = 51; break; // 3
      case 15: kp = 50; break; // 2
      case 16: kp = 49; break; // 1

    }

    if (cnt < 6) {                  // Pressed key differs from previous
      entrada[cnt] = kp;
      Lcd_Chr(2,3+cnt, kp);                    // Print * ASCII value on LCD
      cnt++;
      } else {
         cnt = 0;
         for(i=0; i<6; i++){
            if( entrada[i] != pass[i] ){
               correct = 0;
               i=6;
            }
         }
         if (correct==1){
            Lcd_Cmd(_LCD_CLEAR);                     // Clear display
            Lcd_Out(1, 1, "Login Sucessfull");
            Lcd_Out(2, 1, "Welcome");
            Delay_ms(20000);
         }else if (correct == 0){
            Lcd_Cmd(_LCD_CLEAR);
            Lcd_Out(1, 1, "Login Error");
            Lcd_Out(2, 1, "Try Again");
            Delay_ms(1000);
            Lcd_Cmd(_LCD_CLEAR);                     // Clear display
            Lcd_Out(1, 1, "Insert Password");
            Lcd_Out(2, 1, "   ");
         }
      }
  } while (1);
}