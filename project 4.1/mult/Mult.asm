// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

// Initialize sum to 0.
@sum
M=0

// Initialize i to 1.
@i
M=1

// Main loop to calculate sum.
(LOOP)
    // Load the value of i into D.
    @i    
    D=M

    // Calculate D = i - R0.
    @R0
    D=D-M

    // If (i - R0) > 0, exit the loop.
    @END
    D;JGT

    // Load the value of R1 into D.
    @R1
    D=M

    // Add R1 to sum.
    @sum
    M=D+M

    // Increment i.
    @i
    M=M+1

    // Jump back to LOOP.
    @LOOP
    0;JMP

// End of the loop.
(END)
    // Store the final sum in R2.
    @sum
    D=M
    @R2
    M=D
