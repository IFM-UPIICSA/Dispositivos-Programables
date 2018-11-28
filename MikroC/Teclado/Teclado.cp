#line 1 "C:/Users/Midoriya/Github/Dispositivos/MikroC/Teclado/Teclado.c"
unsigned short kp, cnt, entrada[6];
short pass[6] = {50,55,50,48,50,57};
int i = 0, correct = 1;


char keypadPort at PORTB;



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


void main() {
 cnt = 0;
 Keypad_Init();

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "  Login Access");
 Lcd_Out(2, 1, "   ");

 do {
 kp = 0;


 do

 kp = Keypad_Key_Click();
 while (!kp);

 switch (kp) {





 case 1: kp = 68; break;
 case 2: kp = 35; break;
 case 3: kp = 48; break;
 case 4: kp = 42; break;
 case 5: kp = 67; break;
 case 6: kp = 57; break;
 case 7: kp = 56; break;
 case 8: kp = 55; break;
 case 9: kp = 66; break;
 case 10: kp = 54; break;
 case 11: kp = 53; break;
 case 12: kp = 52; break;
 case 13: kp = 65; break;
 case 14: kp = 51; break;
 case 15: kp = 50; break;
 case 16: kp = 49; break;

 }

 if (cnt < 6) {
 entrada[cnt] = kp;
 Lcd_Chr(2,3+cnt, kp);
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
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Login Sucessfull");
 Lcd_Out(2, 1, "Welcome");
 Delay_ms(20000);
 }else if (correct == 0){
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Login Error");
 Lcd_Out(2, 1, "Try Again");
 Delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1, 1, "Insert Password");
 Lcd_Out(2, 1, "   ");
 }
 }
 } while (1);
}
