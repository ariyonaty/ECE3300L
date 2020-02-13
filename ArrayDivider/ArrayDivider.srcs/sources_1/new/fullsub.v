`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 08:24:57 PM
// Design Name: 
// Module Name: fullsub
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


module fullsub(x, y, bin, diff, bout);

    input       x;
    input       y;
    input       bin;
    output      diff;
    output      bout;
    
    wire z1, z2, z3; 
    
    xor(z1, x, y);
    xor(diff, z1, bin);
    and(z2, ~x, y);
    and(z3, ~z1, bin);
    or(bout, z2, z3);
    
endmodule
