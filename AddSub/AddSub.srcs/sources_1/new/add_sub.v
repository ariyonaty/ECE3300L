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


module add_sub(X, Y, Cin, subIn, subOut, Cout, R);

    input X;
    input Y;
    input Cin;
    input subIn;
    output subOut;
    output Cout;
    output R;

    wire w1;
    
    buf(subOut, subIn);
    xor(w1, subIn, Y);
    
    //    fulladder(X, Y, Cin, Cout, S);
    fulladder inst (X, w1, Cin, Cout, R);

endmodule
