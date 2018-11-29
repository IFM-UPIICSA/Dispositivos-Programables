unsigned short kp, cnt, entrada[6];
int i = 0;

//Frames
const char character1[] = {14,14,21,14,4,4,10,17};

void CustomChar1(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

const char character2[] = {14,14,4,31,4,4,10,10};

void CustomChar2(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

const char character3[] = {14,14,4,31,4,4,10,10};

void CustomChar3(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character3[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

  const char character4[] = {14,14,4,31,4,4,10,10};

void CustomChar4(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character4[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}


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

  Lcd_Init();                              // Initialize LCD
  Lcd_Cmd(_LCD_CLEAR);                     // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
  while(1){
       Lcd_Out(1,1,"HELP");                    // Print * ASCII value on LCD
      Lcd_Chr(2,3+cnt, kp);                    // Print * ASCII value on LCD
      Delay_ms(10);
      CustomChar1(0,0);
      Delay_ms(10);
      CustomChar2(0,0);
      Delay_ms(10);
      CustomChar3(0,0);
      Delay_ms(10);
      CustomChar4(0,0);
      Delay_ms(10);
  }
}