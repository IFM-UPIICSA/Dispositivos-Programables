  int i=0;
  const unsigned short LETRAS[] =
{
0x00, //C�digo del d�gito
0x06, //C�digo del d�gito I
0x73, //C�digo del d�gito P
0x39, //C�digo del d�gito C
0x3F, //C�digo del d�gito O
0x37, //C�digo del d�gito N
0xF1, //C�digo del d�gito F
0x06, //C�digo del d�gito I
0xFD, //C�digo del d�gito G
0x00, //C�digo del d�gito
0x30, //C�digo del d�gito 1
0x67, //C�digo del d�gito 9
0x5B, //C�digo del d�gito 2
0x80, //C�digo del d�gito .
0x30, //C�digo del d�gito 1
0xFD, //C�digo del d�gito 6
0x7F, //C�digo del d�gito 8
0x80, //C�digo del d�gito .
0x3F, //C�digo del d�gito 0
0x80, //C�digo del d�gito .
0x30, //C�digo del d�gito 1
0x3F, //C�digo del d�gito 0
0x30, //C�digo del d�gito 1
0x00 //C�digo del d�gito
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