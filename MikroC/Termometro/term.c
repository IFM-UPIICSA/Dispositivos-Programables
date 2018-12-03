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

unsigned int vout_bin=0;
unsigned int temp=0;
 char temperatura[7];
void main(){
  TRISA=1;     //0B00000001 TRISA.F0=1 TRISA0_bit=1
  CMCON=7;
  Lcd_Init();
  //ADC_Init();

  Lcd_Cmd(_LCD_CLEAR);  
  Lcd_Cmd(_LCD_CURSOR_OFF);
  Lcd_Out(1,1,"Temperatura:");

  while(1) {
    vout_bin = ADC_Read(0);
    temp = vout_bin * 0.4887;
    IntToStr(temp, temperatura);
    Lcd_Out(2,6, temperatura);
    Lcd_Chr (2,14, 67);
    Lcd_Chr(2,13, 223);
    if (temp>=25){
       PORTA.F1=1;
       PORTA.F2=0;
    }
    else {
         PORTA.F1=0;
         PORTA.F2=1;
    }

  }
}