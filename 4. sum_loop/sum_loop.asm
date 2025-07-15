		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
n		DCD		0xA
res		DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =n
		LDR 	R0, [R0]
		
		MOV 	R1, #1
		MOV 	R2, #0
loop	
		ADD		R2, R2, R1
		ADD 	R1, R1, #1
		CMP		R1, R0
		BLS		loop
		
		LDR		R0, =res
		STR		R2, [R0]
		
		B		stop
stop
		B 		stop