`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 10:48:48 PM
// Design Name: 
// Module Name: clock_gen
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

/* Takes 100 MHz clock in and outputs a 1 Hz clock */
module clock_gen(
        input       clk_in,
        output reg  clk_out
    );

    reg[26:0] counter;

    always @(posedge clk_in) begin
        counter = counter + 1;
        if (counter == 50_000_000) begin
            clk_out = ~clk_out;
            counter = 0;
        end
    end

endmodule // clock_gen
