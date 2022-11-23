

.global _start

_start:
        ldr     x4, string1
        add     x0, x1, x4

        


.data

string1:        .ascii "This is a string"
.align  4
string2:        .asciz "This one is null terminated"
.align  4
abyte:          .byte -0x45
.align  4
adouble:        .double 3.1415962
.align  4
afloat:         .float 3.14159
.align  4
anocta:         .octa 0x121134561211345612113456ABCDEFAA
.align  4
aquad:          .quad 0xDEADBEEFF000BA22
.align  4
ashort:         .short 0xDEAD
.align  4
aword:          .word 0xDEADBEEF
