
			.include "tn13def.inc"	; Используем ATMega8
			.include "macro.asm"	; Все макросы у нас тут
			.include "parpwm_macro.asm"	; Все макросы у нас тут

; RAM =====================================================
			.DSEG					; Оперативка 

//////////////////////////////////////////////////////////////////////////////
////////////                      MINI SOURCE                    /////////////
//////////////////////////////////////////////////////////////////////////////

	.def 	STATUS 	= R20		; 
	.def 	DIR 	= R21		; 
	.def 	COUNT 	= R22		; 
	.def 	PWM0 	= R23		; 
	.def 	PWM1 	= R24		;
	.def 	PWM2 	= R25		;
	.def 	PWM3 	= R26		;
	.def 	PWM4 	= R27		;
	.def 	RANDOM 	= R28		; 

WAIT0:     .byte 2
WAIT1:     .byte 2
WAIT2:     .byte 2
WAIT3:     .byte 2
WAIT4:     .byte 2

//////////////////////////////////////////////////////////////////////////////

; FLASH ===================================================
			.CSEG

			.include "vectors.asm"	; Все вектора прерываний спрятаны в этом файле
			.ORG	INT_VECTORS_SIZE

//////////////////////////////////////////////////////////////////////////////
////////////                     ПРЕРЫВАНИЯ                      /////////////
//////////////////////////////////////////////////////////////////////////////
				
TOF_OK:	
		
		PUSH	R16
		PUSH	R17

		ROR		RANDOM

		POP	R17
		POP	R16

RETI

//////////////////////////////////////////////////////////////////////////////
////////////                   PROGRAMM INIT                     /////////////
//////////////////////////////////////////////////////////////////////////////			
Reset:		ldi r16, low(RAMEND)
 			out SPL,r16
			
			.include "initial.asm"			; Все инициализации тут.

			SEI								; Разрешаем глобальные переменные

	//		DDLOOP 10,255,255

			CLR	COUNT
			CLR	DIR
			CLR	STATUS
			LDI RANDOM,5

			LDI	R16,255
			STS	WAIT0,R16
			LDI	R16,120
			STS	WAIT1,R16
			LDI	R16,200
			STS	WAIT2,R16
			LDI	R16,24
			STS	WAIT3,R16
			LDI	R16,250
			STS	WAIT4,R16

			LDI	R16,1
			STS	WAIT0+1,R16
			LDI	R16,2
			STS	WAIT1+1,R16
			LDI	R16,0
			STS	WAIT2+1,R16
			LDI	R16,4
			STS	WAIT3+1,R16
			LDI	R16,5
			STS	WAIT4+1,R16

//////////////////////////////////////////////////////////////////////////////
////////////             		ЦИКЛ ОЖИДАНИЯ     	             /////////////
//////////////////////////////////////////////////////////////////////////////
LOOP:		

			LEDPWM	COUNT,PWM0,PORTB,0
			LEDPWM	COUNT,PWM1,PORTB,1
			LEDPWM	COUNT,PWM2,PORTB,2
			LEDPWM	COUNT,PWM3,PORTB,3
			LEDPWM	COUNT,PWM4,PORTB,4


		//	DDLOOP 1,2,2

			INC	COUNT;
			CPI	COUNT,255
			BRNE	p_outloop
			RJMP	pwm_cha
p_outloop:	RJMP	outloop

pwm_cha:
			PWM_CHANGE DIR,0,PWM0,WAIT0,STATUS,0
			PWM_CHANGE DIR,1,PWM1,WAIT1,STATUS,1
			PWM_CHANGE DIR,2,PWM2,WAIT2,STATUS,2
			PWM_CHANGE DIR,3,PWM3,WAIT3,STATUS,3
			PWM_CHANGE DIR,4,PWM4,WAIT4,STATUS,4
			
			RJMP	waitc

outloop:

RJMP	LOOP
//--------------------------------------------------
waitc:

			WAITLOOP STATUS,0,WAIT0,DIR,0
			WAITLOOP STATUS,1,WAIT1,DIR,1
			WAITLOOP STATUS,2,WAIT2,DIR,2
			WAITLOOP STATUS,3,WAIT3,DIR,3
			WAITLOOP STATUS,4,WAIT4,DIR,4

//--------------------------------------------------
RJMP	LOOP
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

; EEPROM ==================================================
		.ESEG			; Сегмент EEPROM  
