		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
n		DCD		5
arr		DCD		3, 4, 2, 1, 5

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =n
		LDR		R0, [R0]
		SUB 	R0, R0, #1	; n-1
		MOV 	R1, #0		; i == number of iterations = n-1
		MOV		R6, R0
		
out		CMP 	R1, R0
		BGE		stop
		LDR		R3, =arr
		MOV 	R2, #0		; j
in		CMP		R2, R6
		ADDEQ	R1, R1, #1
		SUBEQ	R6, R6, #1
		BEQ		out
		LDR		R4, [R3]
		LDR		R5, [R3, #4]
		CMP		R4, R5
		BLE		no_swap
		STR		R5, [R3]
		STR		R4, [R3, #4]
no_swap	ADD		R3, R3, #4
		ADD		R2, R2, #1
		B 		in
stop
		B 		stop
		