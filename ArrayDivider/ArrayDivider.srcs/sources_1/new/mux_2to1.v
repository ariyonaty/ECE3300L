`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 08:24:57 PM
// Design Name: 
// Module Name: mux_2to1
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


module mux_2to1(i0, i1, s, y);

    input i0, i1;
    input s;
    output y;
    
    wire z1, z2;
    
    and(z1, i0, ~s);
    and(z2, i1, s);
    or(y, z1, z2);

endmodule
