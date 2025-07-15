		AREA	RESET, CODE, READONLY
		EXPORT	Reset_Handler
		EXPORT	__Vectors
__Vectors
		DCD 	0x20002000
		DCD		Reset_Handler
		
		AREA 	|.data|, DATA, READWRITE
		ALIGN
n		DCD		5
fib		DCD		0

		AREA	|.text|, CODE, READONLY
Reset_Handler
		LDR 	R0, =n
		LDR 	R0, [R0]

		BL		find_fib

store
		LDR 	R5, =fib
		STR		R0, [R5]
				
		B		stop
stop
		B 		stop
		
find_fib
		PUSH 	{LR}
		;base case
		CMP		R0, #0
		BEQ		return
		
		CMP		R0, #1
		BEQ		return
		
		PUSH	{R0}
		; calc fib(n-1)
		SUB		R0, R0, #1
		BL		find_fib
		; R1 = fib(n-1)
		MOV		R1, R0
		
		; calc fib(n-2)
		POP		{R0}
		SUB		R0, R0, #2
		PUSH	{R1}
		BL		find_fib	
		POP		{R1}
		ADD		R0, R0, R1		; = fib(n-2) + fib(n-1)
		POP 	{PC}
		
return
		POP		{PC}

		
		