  const unsigned short DIGITOS[] =
{
0x3F, //C�digo del d�gito 0
0x06, //C�digo del d�gito 1
0x5B, //C�digo del d�gito 2
0x4F, //C�digo del d�gito 3
0x66, //C�digo del d�gito 4
0x6D, //C�digo del d�gito 5
0x7D, //C�digo del d�gito 6
0x07, //C�digo del d�gito 7
0x7F, //C�digo del d�gito 8
0x6F, //C�digo del d�gito 9
};
void main() {
TRISA=15;
ADCON1=15;
CMCON=7;
PORTA=0;
TRISD=0;

while(1) {
  PORTD=DIGITOS[PORTA];
}
}