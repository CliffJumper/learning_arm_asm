//
// Assembler program to convert a string to all upper case by calling a function
//
// x0-x2 - parameters to Linux function services
// x1 - addess of output string
// x0 - address of input string
// x8 - Linux function number

.global _start	// Provide program start address

_start:
	ldr x0, =instr	// start of input string
	ldr x1, =outstr	// start of output string

	bl toupper

// Setup the parameters to print our hex nmber and then call Linux to do it.
_print:	mov	x2, x0	// Return code is the length
	mov	x1, #1	// 1 = stdout
	ldr	x1, =outstr	// string to print
	mov	x8, #64		// Linux write syscall
	svc	0		// Call Linux to output the string

_exit:	mov	x0, #0	// Return code set to zero
	mov	x8, #93	// Linux exit syscall
	svc	0	// Call Linux to exit

.data
instr:	.asciz	"This is our Test String that we will convert.\n"
outstr:	.fill 25,1,0


