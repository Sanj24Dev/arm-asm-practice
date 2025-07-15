		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
n		DCD		10
arr		DCD		1,4,6,2,3,8,4,2,6,7
max		DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =n
		LDR 	R0, [R0]
		
		LDR		R1, =arr
		LDR		R2, [R1]		; initial max
		MOV		R3, #1			; counter
loop	
		LDR		R4, [R1,#4]!
		CMP		R2, R4
		BGE		continue
		MOV		R2, R4
continue
		ADD		R3, R3, #1
		CMP 	R3, R0
		BLT		loop
		
		LDR 	R5, =max
		STR		R2, [R5]
				
		B		stop
stop
		B 		stop
		