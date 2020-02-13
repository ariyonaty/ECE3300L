`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/12/2020 11:34:18 PM
// Design Name: 
// Module Name: divider_sim
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


module divider_sim();

    reg [3:0] A, B;
    wire [3:0] Q, R;
    
    //  top (A, B, Q, R);
    top uut (A, B, Q, R);
    
    initial begin
            A = 12;     B = 3;
        #1  A = 10;     B = 10;
        #1  A = 4;      B = 12;
        #1  A = 15;     B = 6;
        #1  A = 1;      B = 15;
        #1  $stop;
    end

endmodule
