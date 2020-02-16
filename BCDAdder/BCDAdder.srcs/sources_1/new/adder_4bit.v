`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2020 09:34:12 PM
// Design Name: 
// Module Name: adder_4bit
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


module adder_4bit
   #(parameter ADDER_WIDTH = 4)
    (
        input   [ADDER_WIDTH-1:0] a, b,
        input   carry_in,
        output  carry_out,
        output  [ADDER_WIDTH-1:0] sum
    );

   assign {carry_out, sum} = a + b + carry_in;
   
endmodule
