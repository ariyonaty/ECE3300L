`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 11:36:17 AM
// Design Name: 
// Module Name: add_sub
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module add_sub4bit(A, B, OP, Cout, R, Ov);

    input   [3:0] A;
    input   [3:0] B;
    input   OP;
    output  Cout;
    output  [3:0] R;
    output  Ov;     

    wire c1, c2, c3;
    wire t1, t2, t3, t4;
    
    //     add_sub(X,       Y, Cin, subIn,  subOut, Cout,   R);
    add_sub inst4 (A[0], B[0], t4,  t3,     t4,     c1,     R[0]);
    add_sub inst3 (A[1], B[1], c1,  t2,     t3,     c2,     R[1]);
    add_sub inst2 (A[2], B[2], c2,  t1,     t2,     c3,     R[2]);
    add_sub inst1 (A[3], B[3], c3,  OP,     t1,     Cout,   R[3]);
    
    xor (Ov, Cout, c3);

endmodule
