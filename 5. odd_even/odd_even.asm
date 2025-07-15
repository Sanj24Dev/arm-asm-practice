		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
num 	DCD     0xB

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =num
		LDR 	R0, [R0]
		
		TST		R0, 0x1			; odd num has 1 at LSB, so will AND the num with mask=0x1, this is equivalent to n%2
		MOVEQ	R1, #2			; set to 2 if even, cuz Z=1, since TST results in 0
		MOVNE	R1, #3
		
		B		stop
stop
		B 		stop