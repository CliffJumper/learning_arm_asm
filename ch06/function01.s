

.global _start

_start: bl myfunc
        mov x1, #5
        b   exit
    
myfunc: str lr, [sp, #-16]! // Push LR onto the stack
        mov x1, #9
        ldr lr, [sp], #16
        ret

//
// Linux exit syscall
//      x0      Return code
//      x0      Linux Syscall number (93 for exit())
//
exit:
       mov      x0,     #0              // 0 return code indicates success
       mov      x8,     #93             // 93 is the exit / terminate syscall number
       svc      0                       // trigger the syscall
