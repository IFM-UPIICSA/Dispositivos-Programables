#line 1 "E:/DECO/DECO.c"
 const unsigned short DIGITOS[] =
{
0x3F,
0x06,
0x5B,
0x4F,
0x66,
0x6D,
0x7D,
0x07,
0x7F,
0x6F,
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
