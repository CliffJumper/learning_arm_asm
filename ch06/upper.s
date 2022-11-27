//
// Assembler program (function) to convert a string to all upper case
//
//	x1 - address of output string
//	x0 - address of input string
//	x4 - original output string for length calc
//	w5 - current char being processed

.global toupper

toupper:
	mov 	x4, x1

loop:
	ldrb	w5, [x0], #1 // load character and increment

	// if w5 > 'z' then cont
	cmp	w5, #'z'	// Is letter > z
	b.gt	cont

	// else if w5 < 'a' then goto end if
	cmp	w5, #'a'
	b.lt	cont

	// if we got here, we need to convert from lower case
	sub	w5, w5, #('a' - 'A')
cont:
	strb	w5, [x1], #1	// Store char in w5 to address pointed to in x1, then increment x1
	cmp	w5, #0		// stop if we hit a null char
	b.ne	loop
	sub 	x0, x1, x4	// Subtract the pointers to get the length

	ret	// Return to caller, returning the length
