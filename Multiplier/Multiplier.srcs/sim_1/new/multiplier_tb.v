`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 02:07:27 AM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb();

    reg clk;
    reg go;
    reg [5:0] multiplier;
    reg [5:0] multiplicand;
    wire [11:0] product;

    multiplier uut
    (
        .clk(clk),
        .go(go),
        .multiplier(multiplier),
        .multiplicand(multiplicand),
        .product(product)
    );

    always #0.5 clk = ~clk;

    initial begin
                multiplier = 5;     multiplicand = 10; clk = 0; go = 1; #4 go = 0;
        #100    multiplier = 55;    multiplicand = 55;          go = 1; #4 go = 0;
        #100    multiplier = 50;    multiplicand = 20;          go = 1; #4 go = 0;
        #100    multiplier = 33;    multiplicand = 11;          go = 1; #4 go = 0;
        #100    multiplier = 40;    multiplicand = 0;           go = 1; #4 go = 0;
        #100    multiplier = 11;    multiplicand = 60;          go = 1; #4 go = 0;
        #100    $stop;
    end

endmodule
