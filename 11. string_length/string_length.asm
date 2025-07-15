		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
word	DCB		"Hello, world"
len		DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R1, =word

		MOV 	R0, #0
		BL		strlen
		
store
		LDR 	R5, =len
		STR		R0, [R5]
				
		B		stop
stop
		B 		stop
		
strlen
		PUSH 	{LR}
loop	
		LDRB	R2, [R1], #1
		CMP		R2, #0
		ADDNE	R0, R0, #1
		BNE		loop
		
		POP 	{PC}


		
		