

// Increment FOR LOOP SNIPPET
// USE X2 as I
MOV     X2,     #1      // Change based on loop params
incforloop:
        // PUT YOUR STUFF HERE
        //

        ADD     X2,     X2,     #1  // Increment by 1
        CMP     X2,     #10     // Also change based on loop params
        B.LE    incforloop

// Decrement FOR LOOP SNIPPET
// USE X2 as I
MOV     X2,     #10     // Change based on loop params
decforloop:
        // PUT YOUR STUFF HERE
        //

        SUBS    X2, X2, #1
        B.NE    decforloop


// While Loop
// While X4 < 5
whileloop: CMP  X4,     #5      // Change based on loop conditions
        B.GE    whileloopdone
        // Statements in the loop body
        B       whileloop

whileloopdone:


// DO WHILE
// Gotta run once before condition tested

// Start Do While X4 < 5
dowhileloop: // Statements in the loop body
        // more statements
        CMP  X4,     #5      // Change based on loop conditions
        B.GE    dowhileloopdone
        B       dowhileloop

dowhileloopdone:


// IF W5 < #imm, ELSE,  
CMP     W5,     #10     // Change based on if condition
B.GE    elselabel
// IF statements

B endif
elselabel:
// ELSE statements


endif:  // We done


