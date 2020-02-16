`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2020 11:30:58 PM
// Design Name: 
// Module Name: register_8bit
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


module register_8bit
    (
        input       [7:0] in,
        input       clk, load,
        output reg  [7:0] out
    );
    
    always @(posedge clk) begin
        if (load) out <= in; 
        else out <= out;
    end
    
endmodule
