        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
        EXPORT  Reset_Handler
        IMPORT  ITM_SendChar

__Vectors
        DCD     0x20002000        ; initial stack pointer, Stack is placed at the top of RAM ==> SP = RAM_BASE + RAM_SIZE
        DCD     Reset_Handler     ; reset vector

        AREA    |.text|, CODE, READONLY

Reset_Handler
        MOV     r0, #'4'
        BL      ITM_SendChar
        MOV     r0, #'2'
        BL      ITM_SendChar
        MOV     r0, #10           ; newline '\n'
        BL      ITM_SendChar

stop    B       stop

        END
