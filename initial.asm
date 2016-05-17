
	//.def	aBUF		= R27


////////////////// НАСТРОЙКА ТАЙМЕРА /////////////////////////

//	OUTI	TIMSK0,(1<<TOIE0)	; Разрешаем прерывание таймера
// 	OUTI	TCCR0B,(1<<CS00)	; Запускаем таймер. Предделитель=1
								; Т.е. тикаем с тактовой частотой.

//////////////////////// PORTs ///////////////////////////////

	//	SETB	DDRX,Y,R16	; выход

	//	CLRB	DDRX,Y,R16	; вход
	//	SETB	PORTX,Y,R16	; подтяжко


	SETB	DDRB,0,R16	; выход[>]		; LED
	CLRB	PORTB,0,R16	; [0]

	SETB	DDRB,1,R16	; выход[>]		; LED
	CLRB	PORTB,1,R16	; [0]

	SETB	DDRB,2,R16	; выход[>]		; LED
	CLRB	PORTB,2,R16	; [0]

	SETB	DDRB,3,R16	; выход[>]		; LED
	CLRB	PORTB,3,R16	; [0]

	SETB	DDRB,4,R16	; выход[>]		; LED
	CLRB	PORTB,4,R16	; [0]


PUSH	R20
PUSH	R20
 
; End Internal Hardware Init ===================================




