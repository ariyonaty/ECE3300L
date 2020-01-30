`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2020 02:06:28 PM
// Design Name: 
// Module Name: addsub4bit_tb
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


module addsub4bit_tb();

    reg [3:0] A, B;
    reg OP;
    
    wire Cout;
    wire [3:0] R;    
    wire Ov;
    
    //module add_sub4bit(A, B, OP, Cout, R, Ov);
    add_sub4bit uut (A, B, OP, Cout, R, Ov);
    
    
//    // TESTING UNSIGNED NUMBERS
//    initial begin
//            A = 15; B = 5;  OP = 1;
//        #1  A = 15; B = 5;  OP = 0;
//        #1  A = 7;  B = 8;  OP = 0;
//        #1  A = 5;  B = 10; OP = 1;
//        #1  A = 15; B = 15; OP = 0;
//        #1  A = 6;  B = 10; OP = 1;
//        #1  A = 1;  B = 3;  OP = 1;
//    end
    
    
    // TESTING SIGNED NUMBERS
    initial begin
            A = 3;  B = 2;  OP = 0;
        #1  A = 7;  B = 5;  OP = 1;
        #1  A = -1; B = -5; OP = 0;
        #1  A = 3;  B = 2;  OP = 1;
        #1  A = -3; B = -2; OP = 1;
        #1  A = -8; B = 2;  OP = 1;
        #1  A = 5;  B = 5;  OP = 0;
    end

endmodule
