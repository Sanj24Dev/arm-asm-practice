        AREA    RESET, DATA, READONLY
        EXPORT  __Vectors
        EXPORT  Reset_Handler
        IMPORT  ITM_SendChar

__Vectors
        DCD     0x20002000        ; Initial stack pointer
        DCD     Reset_Handler     ; Reset vector
        DCD     0                 ; NMI
        DCD     0                 ; HardFault
        DCD     0                 ; MemManage
        DCD     0                 ; BusFault
        DCD     0                 ; UsageFault
        DCD     0, 0, 0, 0        ; Reserved
        DCD     SVC_Handler       ; SVC vector (position 11)

        AREA    |.text|, CODE, READONLY

; ----------------------------------------
Reset_Handler
        MOV     r0, #'4'
        SVC     #0                ; system call to print

        MOV     r0, #'2'
        SVC     #0                ; system call to print

        MOV     r0, #10           ; newline
        SVC     #0

stop    B       stop
; ----------------------------------------

SVC_Handler
        ; R0 has the char to print
        ; Link to ITM_SendChar
        PUSH    {lr}
        BL      ITM_SendChar
        POP     {pc}              ; return from handler
; ----------------------------------------

        END
