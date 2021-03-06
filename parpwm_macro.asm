.MACRO PWM_CHANGE

			SBRC	@0,@1
			RJMP	inc_pwm
			RJMP	dec_pwm
inc_pwm:
			CPI	@2,254
			BREQ chedir
			INC	@2
			RJMP lpwmout

dec_pwm:	
			CPI	@2,0
			BREQ lpwmout
			DEC	@2

			CPI	@2,0
			BRNE lpwmout

			CBR @4,1<<@5	; ��������� �� ���������� �� ����
//---------------------------------------
		//	LDI	R17,2
			MOV	R17,RANDOM
			ANDI	R17,0b00000111

			STS	@3,RANDOM
			STS	@3+1,R17
//---------------------------------------
			RJMP lpwmout

chedir:

			CBR 	@0,1<<@1
			RJMP	lpwmout




lpwmout:

.ENDM

// @0 - DIR
// @1 - Bit in DIR
// @2 - PWMx
// @3 - WAIT Cell
// @4 - STATUS
// @5 - Bit in STATUS


//========================================

.MACRO LEDPWM

			CP		@0,@1
			BRSH	low_side
			RJMP	high_side

low_side:	
			
			
			CLRB	@2,@3,R16	; [0]
			RJMP	end_side

high_side:

			SETB	@2,@3,R16	; [1]
			RJMP	end_side

end_side:

.ENDM
// @0 - COUNT
// @1 - PWM Register
// @2 - PORTx
// @3 - Pin in PORTx

//========================================

.MACRO WAITLOOP

			SBRC	@0,@1
			RJMP	go_next

			LDS		R16,@2
			LDS		R17,@2+1

			CPI		R16,0
			BREQ	test_pl
			DEC		R16
			STS		@2,R16
			RJMP	go_next

test_pl:	CPI		R17,0
			BREQ	st_ch
			DEC		R17
			LDI		R16,255
			STS		@2,R16
			STS		@2+1,R17
			RJMP	go_next

st_ch:		
			SBR 	@0,1<<@1
			SBR 	@3,1<<@4

go_next:



.ENDM

// @0 - STATUS
// @1 - Bit in STATUS
// @2 - WAIT Cell
// @3 - DIR
// @4 - Bit in DIR

//========================================
