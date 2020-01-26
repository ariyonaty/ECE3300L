`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:     CalPolyPomona
// Engineer:    Ari Yonaty
// 
// Create Date: 01/25/2020 09:39:29 PM
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


module top(x, y, Cin, Cout, s);

    input       [3:0] x;
    input       [3:0] y;
    input       Cin;
    output      Cout;
    output      [3:0] s;
    
    wire C1, C2, C3;
    
    //              (x   , y   , Cin, Cout, s);
    fulladder   FA1 (x[0], y[0], Cin, C1,   s[0]);
    fulladder   FA2 (x[1], y[1], C1,  C2,   s[1]);
    fulladder   FA3 (x[2], y[2], C2,  C3,   s[2]);
    fulladder   FA4 (x[3], y[3], C3,  Cout, s[3]);

endmodule
