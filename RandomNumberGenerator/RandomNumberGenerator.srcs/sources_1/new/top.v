`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2020 01:56:55 AM
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
    #(
        parameter WIDTH = 12
    )(
        input       clk,
        input       pushbutton,
        input       load,
        input       [(WIDTH-1):0] switches,
        output      dp,
        output      [7:0] enable,
        output      [6:0] seg
    );
    
    /* 
        Delay counter block.
        Counts to 50,000,000 and resets.
        Output is a 1Hz, or 1 second cycle. 
     */
    reg [26:0] counter;
    assign tick = ~(|counter);

    assign lfsrEnable = tick & pushbutton;
    wire [12:0] randNum;
    wire [15:0] bcdOut;

    always @(posedge clk) begin
        counter = counter + 1;
        if (counter == 50_000_000)
            counter = 0;
    end

    lfsr l1 
    (
        .clk(clk),
        .load(load),
        .enable(lfsrEnable),
        .seed(switches),
        .randNum(randNum)
    );

    b2bcd b1 
    (
        .clk(clk),
        .binaryIn(randNum),
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
