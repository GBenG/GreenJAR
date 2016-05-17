
			.ORG 	0x0000			; ���� �������� � ����, �� ������ ���� ������� 
			RJMP 	Reset			; ����������, ������� ������� ����� �� �������
									; �� ������ ���������. �� ����� Reset


; ��� ������������� ������� �������� ��������� ����. ���� ��� ��� ������, ��
; ����� ������� ����� ������������ �����, ��� ������ �����. ��� ��� �� ��������.
; � ��� ���� ���������� �� ����� m8def.inc � ������� ��� .equ �� .org, � �����
; ������� ����� ������� RETI. �� ������ ���� ���������� ����� �������, ����� 
; ��������� ���� �� ������ ����������. 

			.ORG	INT0addr	; External Interrupt 0
			RETI
			.ORG	PCI0addr	; External Interrupt Request 0
			RETI
			.ORG	OVF0addr	; Timer/Counter0 Overflow
			RJMP	TOF_OK
			.ORG	ERDYaddr	; EEPROM Ready
			RETI
			.ORG	ACIaddr		; Analog Comparator
			RETI
			.ORG	OC0Aaddr	; Timer/Counter Compare Match A
			RETI
			.ORG	OC0Baddr	; Timer/Counter Compare Match B
			RETI
			.ORG	WDTaddr		; Watchdog Time-out
			RETI
			.ORG	ADCCaddr	; ADC Conversion Complete
			RETI
