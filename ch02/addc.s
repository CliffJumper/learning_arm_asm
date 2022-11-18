// 
// Example of 128-bit addition with the ADD/ADDC instructions.
//

.global _start

// Load the registers with some data
//      First   64-bit  number  is      0x0000000000000003FFFFFFFFFFFFFFFF
_start: MOV     X2,     #0x0000000000000003
        MOV     X3,     #0xFFFFFFFFFFFFFFFF
//      Second  64-bit  number  is      0x00000000000000050000000000000001
        MOV     X4,     #0x0000000000000005
        MOV     X5,     #0x0000000000000001

        ADDS    X1, X3, X5
        ADC     X0, X2, X4

// Setup the parameters to exit the program and then call Linux to do it.
// W0 is the return code and will be what we calcualted above.
MOV     X8,     #93     // Service command code 93
SVC     0               // Call Linux to terminate


