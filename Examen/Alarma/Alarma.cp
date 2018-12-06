#line 1 "C:/Users/Midoriya/Github/Dispositivos/Examen/Alarma/Alarma.c"
unsigned short kp;
char txt1[] = "Alarma Activada";
char txt2[] = "Error Activacion";
char txt3[] = "Puerta Abierta";
char txt4[] = "Codigo Incorrect";
char txt5[] = "Alerta";

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


const char character1[] = {10,17,4,14,14,31,31,4};

void CustomChar1(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character1[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

const char character2[] = {0,0,4,14,14,31,31,4};

void CustomChar2(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character2[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

void main() {


 CMCON = 7;
 ADCON1 = 15;
 TRISA = 0B00000011;
 PORTA = 0;

 TRISC.F0 = 0;
 PORTC.F0 = 0;


 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);


 while (1){
 kp = 0;
 while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
 Lcd_Cmd(_LCD_CLEAR);
 do
 kp = Keypad_Key_Click();
 while (!kp);
 if( (kp == 4) && (PORTA.F0 == 0) && (PORTA.F1 == 0) ){

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt1);


 while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
 PORTC.F0 = ~PORTC.F0;
 Delay_ms(500);
 }

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt5);
 CustomChar1(2,1);
 PORTC.F0 = 0;
 Delay_ms(3000);

 }else if( (kp==4) && ( (PORTA.F0 == 1) || (PORTA.F1 == 1) ) ){

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt2);
 Lcd_Out(2,1,txt3);
 Delay_ms(3000);
 }else{

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,txt2);
 Lcd_Out(2,1,txt4);
 Delay_ms(3000);
 }
 }
 }
}
