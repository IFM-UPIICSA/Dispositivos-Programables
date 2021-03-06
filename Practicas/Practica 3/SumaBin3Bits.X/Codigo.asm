;SUMADOR BINARIO PARALELO DE 3 BITS
	;Default
    LIST P=18F4550
    #INCLUDE<P18F4550.INC>
    
    ;CONFIG1L    DIR 300000h 	20h
    ;CONFIG	 PLLDIV=1	 ; 
    ;CONFIG	 CPUDIV=OSC1_PLL2        ;CUANDO SE USA XTAL	 
    CONFIG	 FOSC=INTOSCIO_EC        ;OSCILADOR INTERNO, RA6 COMO PIN, USB USA OSC EC
    CONFIG	 FCMEN=OFF                     ;DESHABILITDO EL MONITOREO DEL RELOJ
    CONFIG	 IESO=OFF
    ;CONFIG2L    DIR 300002H	38h
    CONFIG	 PWRT=ON                           ;PWRT HABILITADO
    CONFIG       BOR=OFF		 ;BROWN OUT RESET DESHABILITADO
    CONFIG       BORV=3		 ;RESET AL MINIMO VOLTAJE NO UTILZADO EN ESTE CASO
    CONFIG	 VREGEN=ON	 ;REGULADOR DE USB ENCENDIDO
    ;CONFIG2H    DIR 300003H	1Eh
    CONFIG	 WDT=OFF                          ;PERRO GUARDIAN (WATCH DOG) DESHABILITADO
    CONFIG       WDTPS=32768                 ;TIMER DEL WATCHDOG 
    ;CONFIG3H	 DIR 300005H	85h
    CONFIG	 CCP2MX=ON	 ;CCP2 MULTIPLEXADAS CON RC1	
    CONFIG	 PBADEN=OFF                      ;PUERTO B PINES DEL 0 AL 4 ENTRADAS DIGITALES
    CONFIG       LPT1OSC=OFF	 ;TIMER1 CONFIGURADO PARA OPERAR EN BAJA POTENCIA
    CONFIG	 MCLRE=ON                         ;MASTER CLEAR HABILITADO
    ;CONFIG4L    DIR 300006H	81h
    CONFIG	 STVREN=ON	                      ;SI EL STACK SE LLENA CAUSE RESET		
    CONFIG	 LVP=OFF		 ;PROGRAMACI�N EN BAJO VOLTAJE APAGADO
    CONFIG	 ICPRT=OFF	                       ;REGISTRO ICPORT DESHABILITADO
    CONFIG       XINST=OFF                        ;SET DE EXTENCION DE INSTRUCCIONES Y DIRECCIONAMIENTO INDEXADO OFF
    ;CONFIG5L    DIR 300008H	0Fh
    CONFIG	 CP0=OFF		 ;LOS BLOQUES DEL C�DIGO DE PROGRAMA
    CONFIG	 CP1=OFF                             ;NO ESTAN PROTEGIDOS
    CONFIG	 CP2=OFF		 
    CONFIG	 CP3=OFF
    ;CONFIG5H    DR 300009H		0Ch
    CONFIG	 CPB=OFF		 ;SECTOR BOOT NO ESTA PROTEGIDO
    CONFIG	 CPD=OFF		 ;EEPROM NO PROTEGIDA
    ;CONFIG6L    DIR 30000AH	0Fh
    CONFIG	 WRT0=OFF	                      ;BLOQUES NO PROTEGIDOS CONTRA ESCRITURA
    CONFIG	 WRT1=OFF
    CONFIG	 WRT2=OFF
    CONFIG	 WRT3=OFF
    ;CONFIG6H	 DIR 30000BH	E0h
    CONFIG	 WRTC=OFF		 ;CONFIGURACION DE REGISTROS NO PROTEGIDO
    CONFIG	 WRTB=OFF		 ;BLOQUE BOOTEABLE NO PROTEGIDO
    CONFIG	 WRTD=OFF		 ;EEPROMDE DATOS NO PROTEGIDA

    ;CONFIG7L    DIR 30000CH	0Fh
    CONFIG	 EBTR0=OFF	 	;TABLAS DE LETURA NO PROTEGIDAS
    CONFIG	 EBTR1=OFF
    CONFIG	 EBTR2=OFF
    CONFIG	 EBTR3=OFF
    ;CONFIG7H    DIR 30000DH	40h
    CONFIG	 EBTRB=OFF	   
    
    
	;Declaraciones Previas
    NUM1    EQU	    .10
    NUM2    EQU	    .11
    ORG	    .0
    
SETTINGS
	;CONFIGURACIONES DEL PUERTO A
    ;LIMPIAR PUERTO
    SETF    TRISA	
    CLRF    PORTA
    CLRF    LATA    
    MOVLW   .15		
    MOVWF   ADCON1	;DEFINIR QUE TODAS SON ENTRADAS
    MOVLW   .7
    MOVWF   CMCON	;Apagar el comparador de voltaje
    
	;CONFIGURACIONES DEL PUERTO B
    ;LIMPIAR PUERTO
    CLRF    PORTB
    CLRF    LATB
    CLRF    TRISB
    CLRF    WREG
    
SUMA	
    MOVFF   PORTA,NUM1  ;MOVER LOS DATOS DE PORTA EN NUM1
    MOVFF   PORTA,NUM2	;MOVER LOS DATOS DE PORTA EN NUM2
    
    ;MOVLW   B'00010010'
    ;MOVWF   NUM1
    ;MOVWF   NUM2
    
    MOVLW   B'00000111'  
    ANDWF   NUM1,F	;VALIDAR SOLO LOS PRIMEROS 3 BITS PARA NUM1
    RRNCF   NUM2,F	;ROTAR A LA DERECHA UNA VEZ
    RRNCF   NUM2,F	;ROTAR A LA DERECHA UNA VEZ
    RRNCF   NUM2,F	;ROTAR A LA DERECHA UNA VEZ
    RRNCF   NUM2,F	;ROTAR A LA DERECHA UNA VEZ
    MOVLW   B'00000111'  
    ANDWF   NUM2,F	;ENMASCARAR LOS 3 PRIMEROS BITS
    MOVFF   NUM1,WREG	;MOVER NUM1 A W
    ADDWF   NUM2	;SUMAR W=NUM1 CON NUM2 Y SE ALMACENA EN NUM2
    MOVFF   NUM2,PORTB	;MOVER NUM2 A PORTB
    GOTO    SUMA
    END

