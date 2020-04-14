`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2020 12:21:12 AM
// Design Name: 
// Module Name: divider_tb
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


module divider_tb();

    reg clk, div;
    reg [7:0] divisor, dividend;
    wire [7:0] quotient;

    divider uut
    (
        .clk(clk),
        .div(div),
        .divisor(divisor),
        .dividend(dividend),
        .quotient(quotient)
    );

    always #1 clk = ~clk;

    initial begin
                clk = 0;
                div = 1; divisor = 5; dividend = 200;
        #4      div = 0;
        #120    div = 1; divisor = 1; dividend = 55;
        #4      div = 0;
        #120    div = 1; divisor = 11; dividend = 90;
        #4      div = 0;
        #120    div = 1; divisor = 55; dividend = 100;
        #4      div = 0;
        #120    $stop;
    end

endmodule