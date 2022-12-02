//
// Assembler Macros for common Linux service routines
//


// Macro for printing
// 
// arg1 - buffer - The buffer to print
//
// x0 - Linux File Handle; set to #1 for STDOUT
// x1 - The String to print
// x8 - Set to 64 for the Linux write() service routine
.MACRO  print   buffer
        mov x0, #1              // #1 is the Linux STDOUT file handle
        ldr x1, =\buffer
        mov x8, #64             // #64 is the Linux write() service routine number
        svc 0                   // Call the Linux service routine
.ENDM


// Macro for exiting via Linux exit() routine
//
// arg1 - retcode - The Return code
//
// x0 - The return code
// x8 - Set to 93, the Linux exit() service routine number
.MACRO  exit    retcode
        mov x0, \retcode        // The code to return, should be 0 for success.
        mov x8, #93             // The number for the Linux exit() routine
        svc 0                   // Call the Linux service routine
.ENDM
