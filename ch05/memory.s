
// Define the entry point

.global _start

_start: LDR     X1,     =somearray
        LDR     W2,     [X1]
        ORR     W2,     W2,    #3
        
        STRB    W2,     [X1]

        mov     X0,     #1 // STDOUT
        ldr     X1,     =somearray
        mov     X2,     #1
        mov     X8,     #64
        svc     0

// Exit
        mov     X0,     #0      // return code goes in X0
        mov     X8,     #93     // Exit syscall (terminates)
        svc     0

.data

somearray:      .fill   10,4,0
