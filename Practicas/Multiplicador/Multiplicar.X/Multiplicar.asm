;PB=DATOA*CTE
  
	    LIST P=18F4550
	    #INCLUDE<P18F4550.INC>
	  
    ;PALABRA DE CONFIGURACION
    
    CTE	    EQU	    .10
    DATOA   EQU	    .40
   
	    ORG	    .0
	    
CONFIGU	    NOP
	    
MULTI	    ;Limpiar registros y datos
	    CLRF    .40
	    CLRF    LATB
	    CLRF    WREG
	    CLRF    .10
	    ;Ejecutar operaciones
	    MOVLW   .5	    ;Mover el valor consntante a w
	    MOVWF   DATOA   ;Mover de w a un registro
	    MOVLW   CTE	    ;Mover un valor constante a w
	    MULWF   DATOA   ;Multiplicar DATOA y se almacena en PRODL
	    MOVFF   PRODL,PORTB	;Mover a esos espacios de memoria por default
	    GOTO    MULTI
	    END