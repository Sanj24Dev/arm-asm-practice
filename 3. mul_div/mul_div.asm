		AREA	RESET, CODE, READONLY
		EXPORT  Reset_Handler
		EXPORT	__Vectors
		
__Vectors
		DCD		0x20002000
		DCD 	Reset_Handler
			
		AREA 	|.text|, CODE, READONLY

Reset_Handler
		LDR		R0, =num1
		LDR		R1, [R0]
		LDR		R0, =num2
		LDR		R2, [R0]
		LDR		R0, =num3
		LDR		R3, [R0]
		
		MUL		R4, R1, R2
		UDIV	R5, R4, R3
		
		LDR		R0, =res
		STR		R5, [R0]
		
		B		stop
stop	
		B		stop
		
		AREA |.data|, DATA, READWRITE
		ALIGN
num1	DCD		5
num2	DCD		9
num3	DCD		3
res		DCD		0