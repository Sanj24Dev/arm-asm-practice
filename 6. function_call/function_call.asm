		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
num1	DCD		0x3
num2	DCD		0xA
res		DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =num1
		LDR 	R0, [R0]
		LDR		R1, =num2
		LDR		R1, [R1]
		
		BL		add_func
		LDR		R4, =res
		STR		R0, [R4]
		
		B		stop

add_func
		ADD  	R0, R1, R0
		BX		LR

stop
		B 		stop
		