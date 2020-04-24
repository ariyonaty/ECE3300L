`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 12:02:33 AM
// Design Name: 
// Module Name: traffic_machine
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


module traffic_machine
    (
        input       clk,
        input       [1:0] sensor,
        input       delay2,
        input       delay4,
        input       delay5,
        input       delay10,
        input       delay15,
        output      trigger,
        output reg  [2:0] NS,
        output reg  [2:0] EW
    );

    reg [2:0] state, next_state;
    parameter [2:0] S0 = 0,         // NS = R ; EW = G 
                    S1 = 1,         // NS = R ; EW = Y
                    S2 = 2,         // NS = R ; EW = R
                    S3 = 3,         // NS = G ; EW = R
                    S4 = 4,         // NS = Y ; EW = R
                    S5 = 6;         // NS = R ; EW = G;

    always @(posedge clk) begin
        state <= next_state;
    end 

    always @(*) begin
    end



endmodule // traffic_machine
