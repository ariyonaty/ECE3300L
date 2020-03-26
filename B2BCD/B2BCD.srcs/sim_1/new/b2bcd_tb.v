`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 04:48:24 PM
// Design Name: 
// Module Name: b2bcd_tb
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


module b2bcd_tb();

    reg     clk;
    reg     [11:0] binIn;
    wire    [15:0] BCDout;.
    0

    b2bcd   uut (   .clk(clk),
                    .binaryIn(binIn),
                    .BCD(BCDout)
                );

    always #1 clk = ~clk;

    initial begin            
               clk = 0;
               binIn = 3456;
        #52    binIn = 999;
        #52    binIn = 75;
        #52    binIn = 8;
        #52    binIn = 12'bx;
        #52    $finish;
    end

endmodule
