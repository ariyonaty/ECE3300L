`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 11:36:40 PM
// Design Name: 
// Module Name: lfsr_tb
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


module lfsr_tb();

    reg clk, load, enable;
    reg [11:0] seed;
    wire [11:0] randNum;

    lfsr uut (
            .clk(clk),
            .load(load),
            .enable(enable),
            .seed(seed),
            .randNum(randNum)
        );

    // optional, but lfsr can be passed with different parameters using:
    // lfsr #(
    //         .WIDTH(8),
    //         .POLY(8'b0011011)
    //     ) uut (
    //         .clk(clk),
    //         .load(load),
    //         .enable(enable),
    //         .seed(seed),
    //         .randNum(randNum)
    //     );

    always #1 clk = ~clk;

    initial begin
            load = 1; enable = 0; seed = 2500;  clk = 1;
        #2  load = 0; enable = 1; seed = 12'bx;
        #20 $stop;  
    end

endmodule
