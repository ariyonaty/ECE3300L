`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 12:17:32 AM
// Design Name: 
// Module Name: bcd_adder_sim
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


module bcd_adder_sim();

    reg [7:0] X;
    reg load, clk;
    
    wire [8:0] R;
    
    top uut (X, load, clk, R);
    
    always
        #5  clk = ~clk;
    
    initial begin
            clk = 0;
            X = 8'b01010101;            #1 load = 1; #1 load = 0;
        #1  X = 8'b01010101;
        #1  X = 8'b10011001;            #1 load = 1; #1 load = 0;
        #1  X = 8'b10011001;
        #1  X = 8'b10000111;            #1 load = 1; #1 load = 0;
        #1  X = 8'b01111000;
        #1  X = 8'b00100101;            #1 load = 1; #1 load = 0;
        #1  X = 8'b01110101;
        #1  X = 8'b00110011;            #1 load = 1; #1 load = 0;
        #1  X = 8'b01100110;
        #1  X = 8'b01101001;            #1 load = 1; #1 load = 0;
        #1  X = 8'b10010110;
        #1  $stop;
    end

endmodule
