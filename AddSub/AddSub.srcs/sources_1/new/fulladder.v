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


module fulladder(X, Y, Cin, Cout, S);

    input X;
    input Y;
    input Cin;
    output Cout;
    output S;
    
    wire w1, w2, w3, w4;
    
    xor(w1, X, Y);
    xor(S, Cin, w1);
    
    and(w2, X, Y);
    and(w3, X, Cin);
    and(w4, Y, Cin);
    
    or (Cout, w2, w3, w4);    

endmodule









