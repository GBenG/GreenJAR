
	//.def	aBUF		= R27


////////////////// ��������� ������� /////////////////////////

//	OUTI	TIMSK0,(1<<TOIE0)	; ��������� ���������� �������
// 	OUTI	TCCR0B,(1<<CS00)	; ��������� ������. ������������=1
								; �.�. ������ � �������� ��������.

//////////////////////// PORTs ///////////////////////////////

	//	SETB	DDRX,Y,R16	; �����

	//	CLRB	DDRX,Y,R16	; ����
	//	SETB	PORTX,Y,R16	; ��������


	SETB	DDRB,0,R16	; �����[>]		; LED
	CLRB	PORTB,0,R16	; [0]

	SETB	DDRB,1,R16	; �����[>]		; LED
	CLRB	PORTB,1,R16	; [0]

	SETB	DDRB,2,R16	; �����[>]		; LED
	CLRB	PORTB,2,R16	; [0]

	SETB	DDRB,3,R16	; �����[>]		; LED
	CLRB	PORTB,3,R16	; [0]

	SETB	DDRB,4,R16	; �����[>]		; LED
	CLRB	PORTB,4,R16	; [0]


PUSH	R20
PUSH	R20
 
; End Internal Hardware Init ===================================




