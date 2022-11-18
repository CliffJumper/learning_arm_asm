//
// Assembler programm to print "Hello, World!"
//
// X0-X2 parameters to Linux function services
// X8 Linux function number
//

.global _start // Program starting address

// Setup the parameters to print hello world
// and then call Linux to do the print
_start: mov	X0, #1          // 1 = STDOUT
	ldr	X1, =helloworld // The string to print
	mov 	X2, #21         // Length of string
	mov	X8, #64         // Linux write system call
	svc	0               // Call Linux to output the string

// Setup parameters to exit the program
// and call Linux to do it
mov	X0, #0  // Return code 0
mov	X8, #93 // Service code 93 terminates
svc	0	// Call Linux to terminate

.data
helloworld:     .ascii "Hello, obtuse jerks!\n"


