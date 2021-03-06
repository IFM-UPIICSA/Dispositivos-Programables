unsigned short kp;
int flag = 0; //bandera de desactivacion alerta
//Texto
char txt1[] = "Alarma Activada";
char txt2[] = "Error Activacion";
char txt3[] = "Puerta Abierta";
char txt4[] = "Codigo Incorrect";
char txt5[] = "Alerta";
char txt7[] = "Error de";
char txt8[] = "Desactivacion";
char txt9[] = "Desactivada";
//Asignacion KeyPad
char  keypadPort at PORTB;
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

//Campana
const char character[] = {10,17,4,14,14,31,31,4};
void CustomChar(char pos_row, char pos_char) {
  char i;
    Lcd_Cmd(64);
    for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
    Lcd_Cmd(_LCD_RETURN_HOME);
    Lcd_Chr(pos_row, pos_char, 0);
}

void main() {
       //Configuraciones de puertos
    //PORTA
    CMCON = 7;
    ADCON1 = 15;
    TRISA = 0B00000011;
    PORTA = 0;
    //PORTC
    TRISC.F0 = 0;
    PORTC.F0 = 0;
    
    //Declaraciones de las herramientras
    Keypad_Init();                           // Initialize Keypad
    Lcd_Init();                        // Initialize LCD
    Lcd_Cmd(_LCD_CLEAR);               // Clear display
    Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
    //Lcd_Out(2,5,txt2);                 // Write text in second row

    while (1){
       kp = 0;
       Lcd_Cmd(_LCD_CLEAR);
       while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
           Lcd_Cmd(_LCD_CLEAR);
           do
             kp = Keypad_Key_Click();             // Store key code in kp variable
           while (!kp);
           if( (kp == 4) && (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
              //Alarma activida
              Lcd_Cmd(_LCD_CLEAR);               // Clear display
              Lcd_Out(1,1,txt1);

              //Ciclo de alarma, se enciende y apaga el led
              while( (PORTA.F0 == 0) && (PORTA.F1 == 0) ){
                 PORTC.F0 = ~PORTC.F0;
                 Delay_ms(100);
              }
              //Reiniciar valores
              PORTC.F0 = 0;
              flag = 0;
              //Salida de la campana
              while (flag == 0){
                    //Alarma en alerta
                 Lcd_Cmd(_LCD_CLEAR);
                 Lcd_Out(1,1,txt5);
                 CustomChar(2,1);
                 Lcd_Out(2,5,"2");
                 kp = 0;
                 do{
                    kp = Keypad_Key_Click();
                 }while(!kp);
                 if( kp == 2 ){   //un #
                    Lcd_Out(2,5,"1");
                    kp = 0;
                    do{
                       kp = Keypad_Key_Click();
                    }while(!kp);
                    if(kp==2){   //dos #
                       flag = 1;
                    }else{   //error boton
                        Lcd_Cmd(_LCD_CLEAR);
                       Lcd_Out(1,1,txt7);
                       Lcd_Out(2,1,txt8);
                       Delay_ms(500);
                 }
                 }else{   //error boton
                   Lcd_Cmd(_LCD_CLEAR);
                   Lcd_Out(1,1,txt7);
                   Lcd_Out(2,1,txt8);
                   Delay_ms(500);
                 }
              }

              //Campana desactivada
              Lcd_Cmd(_LCD_CLEAR);
              Lcd_Out(1,1,txt5);
              Lcd_Out(2,1,txt9);
              Delay_ms(500);
              Lcd_Cmd(_LCD_CLEAR);
           }else if( (kp==4) && ( (PORTA.F0 == 1) || (PORTA.F1 == 1) ) ){
                 //Entrada correcta, puerta abierta
              Lcd_Cmd(_LCD_CLEAR);               // Clear display
              Lcd_Out(1,1,txt2);
              Lcd_Out(2,1,txt3);
              Delay_ms(500);
              Lcd_Cmd(_LCD_CLEAR);
           }else{
                 //Entrada incorrecta
              Lcd_Cmd(_LCD_CLEAR);               // Clear display
              Lcd_Out(1,1,txt2);
              Lcd_Out(2,1,txt4);
              Delay_ms(500);
              Lcd_Cmd(_LCD_CLEAR);
           }
       }
    }
}