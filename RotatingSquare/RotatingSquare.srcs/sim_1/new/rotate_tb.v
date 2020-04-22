`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2020 02:08:43 AM
// Design Name: 
// Module Name: rotate_tb
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


module rotate_tb();

    reg clk, dir, start, reset;
    wire [2:0] curr_state;
    wire [7:0] enable;
    wire [6:0] seg;

    rotate uut 
    (  
        .clk(clk),
        .dir(dir),
        .start(start),
        .reset(reset),
        .curr_state(curr_state),
        .enable(enable),
        .seg(seg)
    );

    always #1 clk = ~clk;

    initial begin
            clk = 0; reset = 1;
        #2  reset = 0; start = 1; dir = 1;
        #14 dir = 0;
        #8  start = 0;
        #4  reset = 1;
        #6  $stop;
    end

endmodule
