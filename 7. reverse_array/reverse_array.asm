		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
n		DCD		5
arr		DCD		1,2,3,4,5

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =n
		LDR 	R0, [R0]
		SUB		R0, R0, #1		; set it to n-1
		LDR		R1, =arr		; arr[0]
		MOV		R6, #4
		MLA		R2, R0, R6, R1	; arr[n-1]

		B		loop
loop	
		LDR		R4, [R1]
		LDR		R5, [R2]
		STR		R5, [R1]
		STR		R4, [R2]
		ADD		R1, R1, #4
		SUB		R2, R2, #4
		CMP		R1, R2
		BLT		loop
				
		B		stop
stop
		B 		stop
		