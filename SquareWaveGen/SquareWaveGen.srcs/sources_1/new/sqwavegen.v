`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 11:26:16 PM
// Design Name: 
// Module Name: sqwavegen
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

module sqwavegen
    #(parameter CLK_FREQ_OUT = 1_000_000)
    (
        input       clk,
        input       switch,
        output      wave
    );
    
    localparam CLK_FREQ = 100_000_000;

    integer counter = 0;
    
    reg sqwave = 0;
    assign wave = sqwave;
    
    always @ (posedge clk) begin
        if (counter == 0) begin
            sqwave <= ~sqwave;
            counter <= ((CLK_FREQ/CLK_FREQ_OUT) / 2) - 1;
        end
        else
            counter <= counter - 1;
    end
    
endmodule

// module PWM_generator (PWM_ontime, PWM_out ,
// clk , reset);

// input clk, reset; // Port type declared
// input [7:0] PWM_ontime; // 8-bit PWM input

// output reg PWM_out; // 1 bit PWM output
// wire [7:0] counter_out; // 8-bit counter
// output

// always @ (posedge clk)
// begin
// if (PWM_ontime > counter_out)
// PWM_out <= 1;
// else
// PWM_out <= 0;
// end
// counter counter_inst(
// .clk (clk),
// .counter_out (counter_out),
// .reset(reset)
// );

// endmodule

// module counter(counter_out,clk,reset);

// output [7:0] counter_out;
// input clk, reset;
// reg [7:0] counter_out;
// always @(posedge clk)
// if (reset)
// counter_out <= 8'b0;
// else
// counter_out <= counter_out + 1;
// endmodule