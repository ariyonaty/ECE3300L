`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/25/2020 09:50:41 PM
// Design Name: 
// Module Name: fulladder_4bit_sim
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


module fulladder_4bit_sim();

    reg [3:0] x, y;
    reg Cin;
    
    wire [3:0] s;
    wire Cout;
    
    top uut (x, y, Cin, Cout, s);
    
    initial begin
            x = 0; y = 0; Cin = 0;
        #1  x = 3; y = 4; Cin = 0;
        #1  x = 3; y = 4; Cin = 1;
        #1  x = 7; y = 7; Cin = 1;
        #1  x = 15; y = 4; Cin = 0;
    end
    
endmodule
