unsigned short kp;
int dispo = 12;
char num [] = {'0','1','2','3','4','5','6','7','8','9','A','B','C'};
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
      Keypad_Init();                           // Initialize Keypad
      //Configuraciones de puertos
    TRISC.F0 = 1;
    TRISC.F1 = 0;
    TRISC.F2 = 0;
    PORTC.F0 = 0;
    PORTC.F1 = 0;
    PORTC.F2 = 0;
      //Activaciones y configuraciones de elementos
    Lcd_Init();                              // Initialize LCD
    Lcd_Cmd(_LCD_CLEAR);                     // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off

    //Ciclo infinito
    while(1){
         //Mostrar Informacion
       while(PORTC.F0 == 1){
          kp=0;
          
          Lcd_Cmd(_LCD_CLEAR);
          Lcd_Out(1,3,"Estacionados");
          if(dispo > 0){
              PORTC.F2 = 0;
              PORTC.F1 = 1;
          }else if(dispo ==0){
              PORTC.F1 = 0;
              PORTC.F2 = 1;
          }
          Lcd_Chr(2,3,num[dispo]);
          
              //Recibir o rechazar carros
           do{
              kp = Keypad_Key_Click();
           }while( (!kp) && (PORTC.F0 == 1));
           
              //Condicionales
           if( (kp == 4) && (PORTC.F0 == 1) ){
              if( dispo > 0 ){
                 dispo = dispo-1;
                 Lcd_Out(2,1,"Exito");
                 Delay_ms(300);
              }else{
                 Lcd_Out(2,1,"Lleno");
                 Delay_ms(300);
              }
           }else if( (kp == 2) && (PORTC.F0 == 1) ){
              if(dispo < 12){
                 dispo = dispo+1;
                 Lcd_Out(2,1,"Exito");
                 Delay_ms(300);
              }else{
                 Lcd_Out(2,1,"Vacio");
                 Delay_ms(300);
              }
           }else if( (PORTC.F0 == 0) ){
                Lcd_Out(2,1,"Cerrado");
                Delay_ms(300);
                PORTC.F1 = 0;
                PORTC.F2 = 0;
           }else{
               Lcd_Cmd(_LCD_CLEAR);
               Lcd_Out(2,1,"Error Entrada");
               Delay_ms(300);
           }
          
       }


       
    }
}