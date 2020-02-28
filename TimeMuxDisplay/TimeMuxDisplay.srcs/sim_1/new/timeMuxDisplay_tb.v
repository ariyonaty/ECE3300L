`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2020 04:36:33 PM
// Design Name: 
// Module Name: timeMuxDisplay_tb
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


module timeMuxDisplay_tb();

    reg     clk;
    reg     [3:0] D0;
    reg     [3:0] D1;
    reg     [3:0] D2;
    reg     [3:0] D3;
    
    wire    dp;
    wire    [7:0] enable;
    wire    [6:0] seg;

    top uut (clk, D0, D1, D2, D3, dp, enable, seg);

    always #1 clk = ~clk;

    initial begin
        clk = 0; D3 = 5; D2 = 4; D1 = 3; D0 = 2;
    end

endmodule
