//
// ASM to convert non alphanumeric chars in string to spaces
//
// X0-X2 - Reserved for Linux syscalls
// X3 - addr of output string
// X4 - addr of input string
// W5 - index of char being processed
// X8 - Linux svc number

.global _start  // Give Linker prog. start addr

_start: 
        ldr     x4,     =instr
        ldr     x3,     =outstr

        // This is assuming null-terminated strings
loop:   ldrb    w5,     [x4], #1        // Read from input buff, and increment input pointer
        
        cmp     w5,     #0              // Have we hit the null-termination
        b.eq    print

        cmp     w5,     #' '
        b.lt    cont

        // W5 < '0' ? continue
        cmp     w5,     #'0'
        b.lt    convert

        cmp     w5,     #':'
        b.lt    cont

        cmp     w5,     #'A'
        b.lt    convert

        cmp     w5,     #'['
        b.lt    cont

        cmp     w5,     #'a'
        b.lt    convert

        cmp     w5,     #'{'
        b.lt    cont

convert:
        mov     w5,     #' '

cont:
        strb    w5,     [x3],   #1      // Store to output, and increment output pointer
        cmp     w5,     #0              // Have we hit the null-termination
        b.ne    loop

//
// Linux write syscall to print to STDOUT
//
//      x0      File handle number to write to
//      x1      addr of buffer holding data to be written
//      x2      length of data to write
//      x8      Linux Syscall number (64 for write())
//
print:
        mov     x0,     #1              // 1 == STDOUT
        ldr     x1,     =outstr         // x1 holds address of buffer to print
        sub     x2,     x3,     x1      // Use the pointer to get the length; x2 holds str length
        mov     x8,     #64             // 64 is the Linux write syscall number
        svc     0                       // /trigger the syscall

//
// Linux exit syscall
//      x0      Return code
//      x0      Linux Syscall number (93 for exit())
//
       mov      x0,     #0              // 0 return code indicates success
       mov      x8,     #93             // 93 is the exit / terminate syscall number
       svc      0                       // trigger the syscall

.data
instr:  .asciz  "ThiS iZ 0 1 2 3 or Test string thAt#$^&*()!@~$_+ we will convert.\n"
outstr: .fill   255, 1, 0

