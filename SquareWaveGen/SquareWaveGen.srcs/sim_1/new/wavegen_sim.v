`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2020 05:02:22 PM
// Design Name: 
// Module Name: wavegen_sim
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


module wavegen_sim();
    
    reg     clk;
    reg     [7:0] t;
    wire    wave;
    
    sqwavegen uut (clk, t, wave);
    
    always #1 clk = ~clk;
    
    initial begin
                clk = 0; t = 8'b10000;
        #1000   $stop;
    end

endmodule
