#line 1 "D:/ledSwitch/ledSwitch.c"
void main() {
TRISA=0B00000001;
CMCON=7;
ADCON1=0X0F;
PORTA=0;

while(1){
 if(PORTA.F0==1){
 PORTA.F1=1;
 }
 else{
 PORTA.F1=0;
 }

}

}
