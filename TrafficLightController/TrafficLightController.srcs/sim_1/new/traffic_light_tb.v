`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 03:47:47 AM
// Design Name: 
// Module Name: traffic_light_tb
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


module traffic_light_tb();

    reg clk;
    reg [1:0] sensor;
    wire [2:0] NS;
    wire [2:0] EW;

    traffic_light uut
    (
        .clk(clk),
        .sensor(sensor),
        .NS(NS),
        .EW(EW)
    );

    always #1 clk = ~clk;

    initial begin
            clk = 0;
        #6  sensor = 1;
        #80 $stop;    
    end
 
endmodule
