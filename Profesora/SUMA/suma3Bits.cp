#line 1 "D:/Dispositivos programables/programas/mikroc/SUMA/suma3Bits.c"
unsigned short DATOA=0,DATOB=0;

void main() {
TRISA=0B01110111;
TRISB=0;
CMCON=7;
ADCON1=0X0F;

while(1){
 DATOA=(PORTA & 0B00000111);
 DATOB=((PORTA>>4) & 0B00000111);
 PORTB=DATOA + DATOB;
}
}
