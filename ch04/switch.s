

.global _start

// SELECT - CASE  In this example we go to the else, because we're only doing cases for 1 and 2:

_start: MOV     X4, #4  //  number is 4
        CMP     X4, #1
        B.EQ    _case1
        CMP     X4, #2
        B.EQ    _case2
        // ELSE
_else:  NOP
        B _end
_case1: // CASE 1
        NOP
        B _end
_case2: // CASE 2
        NOP
        B _end


// Use Linux syscall to exit
_end:   mov     X0,     #0      // return code goes in X0
        mov     X8,     #93     // Exit syscall (terminates)
        svc     0
