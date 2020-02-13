`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 08:35:52 PM
// Design Name: 
// Module Name: top
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


module top(A, B, Q, R);

    input   [3:0] A, B;
    output  [3:0] Q, R;
    
    wire y0, y1, y2, y3, y4, y5, y6, y7, y8;
    wire b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15;
    wire d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15;
    
    // layer 1 -    (x,     y,      bin,    diff,   bout);
    fullsub     fs1 (A[3],  B[0],   0,      d0,     b0);
    fullsub     fs2 (0,     B[1],   b0,     d1,     b1);
    fullsub     fs3 (0,     B[2],   b1,     d2,     b2);
    fullsub     fs4 (0,     B[3],   b2,     d3,     b3);

    // layer 2 -    (i0,    i1,     s,      y);
    mux_2to1    m1  (d0,    A[3],   b3,     y0);
    mux_2to1    m2  (d1,    0,      b3,     y1);
    mux_2to1    m3  (d2,    0,      b3,     y2);
    
    // layer 3 -    (x,     y,      bin,    diff,   bout);
    fullsub     fs5 (A[2],  B[0],   0,      d4,     b4);
    fullsub     fs6 (y0,    B[1],   b4,     d5,     b5);
    fullsub     fs7 (y1,    B[2],   b5,     d6,     b6);
    fullsub     fs8 (y2,    B[3],   b6,     d7,     b7);

    // layer 4 -    (i0,    i1,     s,      y);
    mux_2to1    m4  (d4,    A[2],   b7,     y3);
    mux_2to1    m5  (d5,    y0,     b7,     y4);
    mux_2to1    m6  (d6,    y1,     b7,     y5);

    // layer 5 -    (x,     y,      bin,    diff,   bout);
    fullsub     fs9 (A[1],  B[0],   0,      d8,     b8);
    fullsub     fs10(y3,    B[1],   b8,     d9,     b9);
    fullsub     fs11(y4,    B[2],   b9,     d10,    b10);
    fullsub     fs12(y5,    B[3],   b10,    d11,    b11);

    // layer 6 -    (i0,    i1,     s,      y);
    mux_2to1    m7  (d8,    A[1],   b11,    y6);
    mux_2to1    m8  (d9,    y3,     b11,    y7);
    mux_2to1    m9  (d10,   y4,     b11,    y8);
    
    // layer 7 -    (x,     y,      bin,    diff,   bout);
    fullsub     fs13(A[0],  B[0],   0,      d12,    b12);
    fullsub     fs14(y6,    B[1],   b12,    d13,    b13);
    fullsub     fs15(y7,    B[2],   b13,    d14,    b14);
    fullsub     fs16(y8,    B[3],   b14,    d15,    b15);

    // layer 8 -    (i0,    i1,     s,      y);
    mux_2to1    m10 (d12,   A[0],   b15,    R[0]);
    mux_2to1    m11 (d13,   y6,     b15,    R[1]);
    mux_2to1    m12 (d14,   y7,     b15,    R[2]);
    mux_2to1    m13 (d15,   y8,     b15,    R[3]);

    not(Q[0], b15);
    not(Q[1], b11);
    not(Q[2], b7);
    not(Q[3], b3);

endmodule
