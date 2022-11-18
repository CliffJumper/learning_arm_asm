
//
// Assembler program to print a register in hex
// to stdout.
//
// X0-X2 - parameters to linux function services
// X1 - is also address of byte we are writing
// X4 - register to print
// W5 - loop index
// W6 - current character
// X8 - linux function number
//

.global _start

_start: MOV	X4, #0x6E3A
	MOVK	X4, #0x4F5D, LSL #16
	MOVK	X4, #0xFEDC, LSL #32
	MOVK	X4, #0x1234, LSL #48

	LDR	X1, =hexstr // start of string
	ADD	X1, X1, #17	    // start at least sig digit
        // Loop W5 = 16 to 1, step 1
	MOV	W5, #16    // 16 digits to print
loop:   AND     W6,     W4,     #0xf    // mask LS Digit
        // If W6 >= 10 it's a letter
        CMP     W6,     #10
        B.GE    letter
        // ELSE convert number to ascii digit
	ADD	W6, W6, #'0'
        B       cont
letter: // Handle A,B,C,D,E,F
        ADD     W6,     W6,     #('A'-10)     // Effectively + 55
cont:   // END IF
        STRB    W6,     [X1]    // Store ASCII Digit at X1 location
        SUB     X1,     X1,     #1      // Dec. for next byte/Digit

        LSR     X4,     X4,     #4      // 4-bit digit
        // NEXT Loop
        SUBS    W5,     W5,     #1      // Step W5 -1
        B.NE    loop                    // Loop if not done


// Now time to call Linux to print

        MOV     X0,     #1      // 1 == STDOUT
        ldr     X1,     =hexstr // String to print
        mov     X2,     #19     // String Length
        mov     X8,     #64     // Linux Write syscall
        svc     0       // Make Syscall

// Exit
        mov     X0,     #0      // return code goes in X0
        mov     X8,     #93     // Exit syscall (terminates)
        svc     0

.data
hexstr: .ascii  "0x123456789ABCDEFG\n"


