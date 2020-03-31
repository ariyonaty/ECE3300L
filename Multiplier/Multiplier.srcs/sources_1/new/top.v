`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2020 02:41:55 AM
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
        input       pb,
        input       [5:0] multiplier,
        input       [5:0] multiplicand,
        output      dp,
        output      [7:0] enable,
        output      [6:0] seg 
    );

    reg [26:0] counter;
    assign tick = ~(|counter);
    assign multiplierEnable = tick & pb;

    wire [11:0] multiplierOut;
    wire [15:0] bcdOut;

    always @(posedge clk) begin
        counter = counter + 1;
        if (counter == 50_000_000)
            counter = 0;
    end

    multiplier m1
    (
        .clk(clk),
        .go(multiplierEnable),
        .multiplier(multiplier),
        .multiplicand(multiplicand),
        .product(multiplierOut)
    );

    b2bcd b1
    (
        .clk(clk),
        .binaryIn(multiplierOut),
        .BCD(bcdOut)
    );

    displayInterface d1 
    (
        .clk(clk),
        .D0(bcdOut[3:0]),
        .D1(bcdOut[7:4]),
        .D2(bcdOut[11:8]),
        .D3(bcdOut[15:12]),
        .dp(dp),
        .enable(enable),
        .seg(seg)
    );

endmodule
