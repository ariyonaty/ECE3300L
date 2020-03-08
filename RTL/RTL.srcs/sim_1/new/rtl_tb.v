`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2020 11:27:05 PM
// Design Name: 
// Module Name: rtl_tb
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


module rtl_tb();

    reg [3:0] dataIn;
    reg [2:0] ALUS, RS;
    reg enable;
    reg clk;

    wire [3:0] dataOut;

    rtl uut (dataIn, ALUS, RS, enable, clk, dataOut);

    always #1 clk = ~clk;

    initial begin
            clk = 1;        enable = 1;
            dataIn = 0;     ALUS = 0;       RS = 7; 
        #2  dataIn = 9;     ALUS = 1;       RS = 7;
        #2  dataIn = 15;    ALUS = 6;       RS = 7;
        #2  dataIn = 4'bx;  ALUS = 3'bx;    RS = 1;
        #2  dataIn = 4'bx;  ALUS = 3'bx;    RS = 2;
        #2  dataIn = 4'bx;  ALUS = 3'bx;    RS = 4;
        #2  dataIn = 4'bx;  ALUS = 3'bx;    RS = 3;
        #2  dataIn = 8;     ALUS = 0;       RS = 7;
        #2  dataIn = 4;     ALUS = 5;       RS = 7;
        #2  dataIn = 4'bx;  ALUS = 3'bx;    RS = 5;
        #2  dataIn = 11;    ALUS = 6;       RS = 7;
        #2  $stop;        
    end

endmodule
