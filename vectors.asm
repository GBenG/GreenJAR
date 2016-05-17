
			.ORG 	0x0000			; Проц стартует с нуля, но дальше идут вектора 
			RJMP 	Reset			; прерываний, поэтому отсяюда сразу же прыгаем
									; на начало программы. На метку Reset


; Тут распологается таблица векторов важнейшая вещь. Если про нее забыть, то
; можно огрести такие неразрешимые глюки, что просто капец. Так что не забываем.
; я его тупо скопировал из файла m8def.inc и заменил все .equ на .org, а потом
; дописал везде команду RETI. На случай если прерывание вдруг вылезет, чтобы 
; вернулось туда же откуда прервалось. 

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
