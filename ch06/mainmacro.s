//
// Assembler program to convert a string to all upper case by calling a function
//
// x0-x2 - Parameters to Linux function services
// x1 - address of output string
// x0 - address of input string
// x2 - original input string address 
// x8 - Linux function number

.include "uppermacro.s"

.global _start

_start: toupper tststr, buffer
        
        mov x2, x0      // return code from toupper is the length of the string
        BL      _print

        toupper tststr2, buffer // Convert a second string
        mov x2, x0      // return code from toupper is the length of the string
        BL      _print
        B       _exit

_print:
        mov x0, #1      // 1 = STDOUT Linux file handle
        ldr x1, =buffer // String to print
        mov x8, #64     // 64 is the number for the Linux write() syscall
        svc  0          // Call the Linux service routine
        ret

_exit:
        mov x0, #0      // Exit with return code 0
        mov x8, #93     // 93 is the number for the Linux exit() syscall
        svc  0          // call the Linux service routine

.data
tststr:         .asciz  "This is our Test string that We will convert.\n"
tststr2:        .asciz  "A second string to upper case!!\n"
buffer:         .fill   255, 1, 0
