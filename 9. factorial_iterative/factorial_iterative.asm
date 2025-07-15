		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
n		DCD		10
fact	DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =n
		LDR 	R0, [R0]
		
		MOV		R1, #1
		CMP		R0, #0
		BEQ		store
		
loop	
		MUL		R1, R1, R0
		SUBS	R0, R0, #1
		BNE		loop

store
		LDR 	R5, =fact
		STR		R1, [R5]
				
		B		stop
stop
		B 		stop
		