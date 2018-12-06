#line 1 "D:/Dispositivos programables/programas/mikroc/ON_OFF/ON_OFF.c"
void main() {
TRISD=0;
PORTD=0;

while(1){
 portd.f1=~portd.f1;
 Delay_ms(100);

}

}
