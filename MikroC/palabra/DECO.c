  int i=0;
  const unsigned short LETRAS[] =
{
0x00, //Código del dígito
0x06, //Código del dígito I
0x73, //Código del dígito P
0x39, //Código del dígito C
0x3F, //Código del dígito O
0x37, //Código del dígito N
0xF1, //Código del dígito F
0x06, //Código del dígito I
0xFD, //Código del dígito G
0x00, //Código del dígito
0x30, //Código del dígito 1
0x67, //Código del dígito 9
0x5B, //Código del dígito 2
0x80, //Código del dígito .
0x30, //Código del dígito 1
0xFD, //Código del dígito 6
0x7F, //Código del dígito 8
0x80, //Código del dígito .
0x3F, //Código del dígito 0
0x80, //Código del dígito .
0x30, //Código del dígito 1
0x3F, //Código del dígito 0
0x30, //Código del dígito 1
0x00 //Código del dígito
};
void main() {
     ADCON1=15;
     CMCON=7;
     TRISD=0;

     while(1) {
        for(i=0;i<=23;i++){
           PORTD=LETRAS[i];
           Delay_ms(80);
        }
   }
}