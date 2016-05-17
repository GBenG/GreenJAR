.MACRO PWM_CHANGE

			SBRC	@0,@1
			RJMP	inc_pwm
			RJMP	dec_pwm
inc_pwm:
			CPI	@2,254
			BREQ chestat
			INC	@2
			RJMP lpwmout

dec_pwm:	
			CPI	@2,0
			BREQ lpwmout
			DEC	@2
			RJMP lpwmout

chestat:

			CBR 	@0,1<<@1	

lpwmout:

.ENDM

// @0 - STATUS
// @1 - Bit in STATUS
// @3 - 

//========================================

.MACRO LEDPWM

			CP		@1,@2
			BRSH	low_side
			RJMP	high_side

low_side:	
			
			
			CLRB	@3,@4,R16	; [0]
			RJMP	end_side

high_side:

			SETB	@3,@4,R16	; [1]
			RJMP	end_side

end_side:

.ENDM
// @0 - STATUS
// @1 - COUNT
// @2 - PWM Register
// @3 - PORTx
// @4 - Pin in PORTx
