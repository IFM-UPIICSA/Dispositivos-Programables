//declaracion de variables
unsigned short kp;
short numeros[] = {49,50,51,52,53,54,55,56,57};
int i=0;
int entrada = 0;
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
     //Configuraciones
     TRISC.F0 = 1;
     TRISC.F1 = 0;
     TRISC.F2 = 0;
     PORTC.F1 = 0;
     PORTC.F2 = 0;

      Keypad_Init();
     //Activacion del LCD
     Lcd_Init();
     Lcd_Cmd(_LCD_CURSOR_OFF);
     
     while (1){
        Lcd_Cmd(_LCD_CLEAR);  //Limpiiar LCD
        //Lectura del bit
        while(PORTC.F0 == 0){
           Lcd_out(1,1, "Encendido");
           entrada = 0;
           kp = 0;
           //Ciclo de entrada
           do{
               do{
                  kp = Keypad_Key_Click();
                }while((!kp)&&(PORTC.F0 == 0));
                if(kp == 9){
                   entrada = 1;
                }else{
                   Lcd_Out(2,2,"Error");
                   Delay_ms(300);
                   Lcd_Cmd(_LCD_CLEAR);  //Limpiiar LCD
                   Lcd_out(1,1, "Encendido");
                }
           }while((entrada == 0) &&(PORTC.F0 == 0));

           if( (PORTC.F0 == 0) && (entrada ==1) ){
                //Conteo
               PORTC.F1 = 1;
               for(i=0; i<10; i++){
                  if(i==9)
                     Lcd_Out (2,2,"10           ");
                  else{
                     Lcd_Chr (2,2, numeros[i]);
                  }
                  Delay_ms(100);
               }
               PORTC.F1 = 0;
               PORTC.F2 = 1;
               Delay_ms(500);
               PORTC.F2 = 0;
               Lcd_Cmd(_LCD_CLEAR);  //Limpiiar LCD
               Lcd_out(1,1, "Encendido");
           }
        }
     }
}