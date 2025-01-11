.type _start, %function

//start of the program
.word _stack_top
.word _start
.section .isr_vector , "a", %progbits
_start:
    .word _stack_top        // Initial stack pointer
    .word Reset_Handler     // Reset handler

#.section .text.Reset_Handler
Reset_Handler:
    ldr r0, =_stack_top     // Initialize stack pointer
    mov sp, r0
    bl main                 // Call main
    b .                     // Infinite loop

    