		AREA	RESET, DATA, READONLY
		EXPORT  Reset_Handler
		EXPORT 	__Vectors

__Vectors
		DCD     0x20002000        ; Initial stack pointer
		DCD     Reset_Handler
		
		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR		R0, =num1		; load addr		=> you have to manually load the numbers in starting addr=0x20000000 (start of SRAM) before the execution starts
		LDR 	R1, [R0]		; load num
		LDR 	R0, =num2
		LDR		R2, [R0]
		LDR		R0, =num3
		LDR		R3, [R0]

		ADD		R4, R1, R2
		SUB		R5, R4, R3
		
		LDR		R0, =res
		STR		R5, [R0]
		
		B		stop
stop
		B 		stop
		
		AREA    |.data|, DATA, READWRITE
		ALIGN
num1    DCD     5            
num2    DCD     7
num3 	DCD 	2
res		DCD		0