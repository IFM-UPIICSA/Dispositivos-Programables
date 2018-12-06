#line 1 "D:/ledButton/ledButton.c"
void main() {
 TRISA=1;
 CMCON=7;
 ADCON1=15;

 while(1) {
 if(button (&PORTA, 0, 100, 1)){
 PORTA.F1=~PORTA.F1;
 }
 }
}
