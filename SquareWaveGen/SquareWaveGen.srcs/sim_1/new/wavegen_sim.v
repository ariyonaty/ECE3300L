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

//    parameter delay = 100;
    
    reg     clk;
    reg     [7:0] t;
    wire    wave;
    
//    wavegen #(delay)    uut (clk, t, wave);
    sqwavegen uut (clk, t, wave);
    
    always #1 clk = ~clk;
    
    initial begin
            clk = 1;
        #200 $stop;
    end

endmodule
