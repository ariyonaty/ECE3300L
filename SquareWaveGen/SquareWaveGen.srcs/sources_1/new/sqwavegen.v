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
        input       [7:0] switch,
        output      wave );
    
    localparam CLK_FREQ = 100_000_000;


    /* 
        Delay Counter:
            Counts to 100 (99) 
     */

    reg [6:0] counter = (CLK_FREQ/CLK_FREQ_OUT) - 1;

    wire delayOut;
    assign delayOut = ~(|counter);
    assign delayWave = delayOut;

    always @ (posedge clk) begin
        if (delayOut) begin
            counter <= (CLK_FREQ/CLK_FREQ_OUT) - 1;
        end
        else
            counter <= counter - 1'b1;
    end


    // Binary Counter

    reg [7:0] cntIn, cntOut;
    wire binOut;
    assign binOut = ~(|cntOut);
    assign binWave = binOut;

    initial cntOut = 0;
    initial cntIn = 0;

    always @ (posedge clk) begin
        cntIn <= switch;
        if (binOut) begin
            cntIn <= switch; 
            cntOut <= cntIn;
        end
        if (delayOut) begin
            cntOut <= cntOut - 1'b1;
        end
    end

    // T Flip Flop

    reg q = 1'b0;
    assign wave = q;

    always @ (posedge clk) begin
        if (binOut)
            q <= ~q;
    end
    
endmodule
