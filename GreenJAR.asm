
			.include "tn13def.inc"	; ���������� ATMega8
			.include "macro.asm"	; ��� ������� � ��� ���
			.include "parpwm_macro.asm"	; ��� ������� � ��� ���

; RAM =====================================================
			.DSEG					; ���������� 

//////////////////////////////////////////////////////////////////////////////
////////////                      MINI SOURCE                    /////////////
//////////////////////////////////////////////////////////////////////////////

	.def 	STATUS 	= R20		; 
//	.def 	DISP 	= R21		; 
	.def 	COUNT 	= R22		; 
	.def 	PWM0 	= R23		; 
	.def 	PWM1 	= R24		;
	.def 	PWM2 	= R25		;
	.def 	PWM3 	= R26		;
	.def 	PWM4 	= R27		;

WAIT0:     .byte 1
WAIT1:     .byte 1
WAIT2:     .byte 1
WAIT3:     .byte 1
WAIT4:     .byte 1

//////////////////////////////////////////////////////////////////////////////

; FLASH ===================================================
			.CSEG

			.include "vectors.asm"	; ��� ������� ���������� �������� � ���� �����
			.ORG	INT_VECTORS_SIZE

//////////////////////////////////////////////////////////////////////////////
////////////                     ����������                      /////////////
//////////////////////////////////////////////////////////////////////////////
/*				
TOF_OK:	
		
		RCALL	LOOP

RETI
*/
//////////////////////////////////////////////////////////////////////////////
////////////                   PROGRAMM INIT                     /////////////
//////////////////////////////////////////////////////////////////////////////			
Reset:		ldi r16, low(RAMEND)
 			out SPL,r16
			
			.include "initial.asm"			; ��� ������������� ���.

			SEI								; ��������� ���������� ����������

			DDLOOP 10,255,255

			CLR	COUNT
		//	LDI	PWM0,50
			LDI	STATUS,16
//////////////////////////////////////////////////////////////////////////////
////////////             		���� ��������     	             /////////////
//////////////////////////////////////////////////////////////////////////////
LOOP:

			LEDPWM	STATUS,COUNT,PWM0,PORTB,0
			LEDPWM	STATUS,COUNT,PWM1,PORTB,1
			LEDPWM	STATUS,COUNT,PWM2,PORTB,2
			LEDPWM	STATUS,COUNT,PWM3,PORTB,3
			LEDPWM	STATUS,COUNT,PWM4,PORTB,4

		//	DDLOOP 1,2,2

			INC	COUNT;
			CPI	COUNT,255
			BRNE	outloop

			PWM_CHANGE STATUS,0,PWM0
			PWM_CHANGE STATUS,1,PWM1
			PWM_CHANGE STATUS,2,PWM2
			PWM_CHANGE STATUS,3,PWM3
			PWM_CHANGE STATUS,4,PWM4

outloop:

RJMP	LOOP
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

; EEPROM ==================================================
		.ESEG			; ������� EEPROM  
