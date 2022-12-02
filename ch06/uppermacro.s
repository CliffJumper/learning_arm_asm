//
// Assembler program to convert a string to upper case calling a function
//
// x1 - Address of output string
// x0 - Address of input string
// x2 - original output string for length calc
// w3 - current char being processed
//

// label 1 = loop
// label 2 = cont

.MACRO  toupper         instr, outstr
        ldr     x0, =\instr
        ldr     x1, =\outstr
        mov     x2, x1

        // The loop is until byte pointed to by x1 is non-zero
1:      ldrb   w3, [x0], #1
        
        // if w3 > 'z', continue
        cmp     w3, #'z'
        b.gt    2f

        // if w3 < 'a' end
        cmp     w3, #'a'
        b.lt    2f

        // if we're here, we need to convert
        sub w3, w3, #('a' - 'A')

2:      // end if
        strb    w3, [x1], #1    // Store char to output, and move pointer forward
        cmp     w3, #0          // If null char, stop
        b.ne    1b              // Not null, keep looping
        sub     x0, x1, x2      // get the len by subbing pointers
.ENDM
