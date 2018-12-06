  const unsigned short DIGITOS[] =
{
0x3F, //Código del dígito 0
0x06, //Código del dígito 1
0x5B, //Código del dígito 2
0x4F, //Código del dígito 3
0x66, //Código del dígito 4
0x6D, //Código del dígito 5
0x7D, //Código del dígito 6
0x07, //Código del dígito 7
0x7F, //Código del dígito 8
0x6F, //Código del dígito 9
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