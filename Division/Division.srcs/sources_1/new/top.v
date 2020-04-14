`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2020 01:47:23 AM
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
        input       [7:0] divisor,
        input       [7:0] dividend,
        output      dp,
        output      [7:0] enable,
        output      [6:0] seg 
    );

    reg [26:0] counter;
    assign tick = ~(|counter);
    assign dividerEnable = tick & pb;

    wire [7:0] dividerOut;
    wire [15:0] bcdOut;

    always @(posedge clk) begin
        counter = counter + 1;
        if (counter == 50_000_000)
            counter = 0;
    end

    divider di1
    (
        .clk(clk),
        .div(pb),
        .divisor(divisor),
        .dividend(dividend),
        .quotient(dividerOut)
    );

    b2bcd b1
    (
        .clk(clk),
        .binaryIn({4'd0, dividerOut}),
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
