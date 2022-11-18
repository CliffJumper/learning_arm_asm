.global _start


        // X0X1X2 = X3X4X5 + X6X7X8
_start: MOV     X5,     #0x1200000000000000 
        MOV     X8,     #0xFFED000000000000
        MOV     X4,     #0xF000000000000000
        MOV     X7,     #0xF000000000000000
        MOV     X3,     #0x0123000000000000
        MOV     X6,     #0x0055000000000000

_192bit_add:    // Load first addend in X3, X4, and X5, LSB in X5
                // Load second addend in X6, X7, and X8, LSB in X8
                // SUM will be in X0, X1, and X2, LSB in X2, and the carry flag will be set if needed
        ADDS    X2,     X5,     X8
        ADCS    X1,     X4,     X7
        ADCS    X0,     X3,     X6

_exit:  // W0 holds return code
        MOV     X8,     #93     // Service command code 93
        SVC     0               // Call Linux
