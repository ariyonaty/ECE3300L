`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 03:08:14 AM
// Design Name: 
// Module Name: top
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


module top
    (
        input       clk,
        input       [1:0] sensor,
        output      [2:0] NS,
        output      [2:0] EW
    );

    wire clk_1hz;

    clock_gen g1 
    (
        .clk_in(clk),
        .clk_out(clk_1hz)
    );

    traffic_light t1
    (
        .clk(clk_1hz),
        .sensor(sensor),
        .NS(NS),
        .EW(EW)
    );

endmodule // top
