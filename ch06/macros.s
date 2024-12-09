//
// General Purpose Macros for Linux
//

//
// linuxprint
// Prints a buffer to STDOUT
//
// buff - Address of the buffer to print.
// len	- The length of the string to print
//
// x0-x2, x8
// x0 - Gets set to 1, the Linux filehandle for STDOUT
// x1 - Gets set to the address of the string to print
// x2 - Gets set to the string length
// x8 - Get set to 64, the service number of the Linux write() func

.MACRO	linuxprint	buff, len
	mov	x0,	#1	// 1 === STDOUT
	mov	x1,	=\buff	// The buffer to print
	mov	x2,	\len	// The length of the buffer
	mov	x8,	#64	// The Linux write() syscall number
	svc	0		// Call the service routine
.ENDM

//
// exit
// Exits the program with a return code
//
// returncode - the code to return to the OS
// x0 - Gets set to the return code
// x8 - Gets set to 93, the Linux exit() service routine number
//
.MACRO	exit	returncode
	mov	x0,	\returncode	// The passed in returncode; 0 - success nonzero - failure
	mov	x8,	#93		// 93 is the Linux code for the exit() routine
	svc	0			// Call the Service routine
.ENDM


