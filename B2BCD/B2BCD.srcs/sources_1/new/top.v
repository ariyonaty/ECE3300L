`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 03:01:47 PM
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
        input       [11:0] binIn,
        output      dp,
        output      [7:0] enable,
        output      [6:0] seg 
    );

    wire[15:0] BCDOut;

    b2bcd b1    (   .clk(clk),
                    .binaryIn(binIn),
                    .BCD(BCDOut)
                );

    displayInterface d1 (   .clk(clk),
                            .D0(BCDOut[3:0]),
                            .D1(BCDOut[7:4]),
                            .D2(BCDOut[11:8]),
                            .D3(BCDOut[15:12]),
                            .dp(dp),
                            .enable(enable),
                            .seg(seg)
                        );

endmodule
