		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
word	DCB		"malayalam"
p_bool	DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R1, =word

		MOV 	R0, #0
		BL		strlen
		
		LDR		R1, =word
		MOV		R2, R1
		ADD		R2, R0
		SUB		R2, #1		; R2=str[n-1]
		
		BL		palindrome_check
store
		LDR 	R5, =p_bool
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
		
palindrome_check
		PUSH	{LR}
		MOV		R0, #0		; p_bool assuming it is a palindrome
p_loop
		PUSH	{R1}
		PUSH	{R2}
		LDRB 	R1, [R1]
		LDRB	R2, [R2]
		CMP		R1, R2
		MOVNE	R0, #1		; setting when a mismatch is found
		POP		{R2}
		POP		{R1}
		POPNE	{PC}
		ADD		R1, R1, #1
		SUB		R2, R2, #1
		CMP		R1, R2
		BLT		p_loop
		
		
		POP		{PC}


		
		