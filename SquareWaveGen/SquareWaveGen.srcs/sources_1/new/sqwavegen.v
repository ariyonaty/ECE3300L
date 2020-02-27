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
        output      delayWave,
        output      binWave,
        output      wave);
    
    localparam CLK_FREQ = 100_000_000;

    reg [7:0] counter = (CLK_FREQ/CLK_FREQ_OUT);

    wire delayOut;
    assign delayOut = ~(|counter);
    assign delayWave = delayOut;

    always @ (posedge clk) begin
        if (delayOut) begin
            counter <= (CLK_FREQ/CLK_FREQ_OUT);
        end
        else
            counter <= counter - 1'b1;
    end


    // ---------------------------------------------
    reg [7:0] cntIn, cntOut;
    wire binOut;
    assign binOut = ~(|cntOut);
    assign binWave = binOut;

    always @ (posedge clk) begin
        if (binOut)
            cntIn <= switch; 
            cntOut <= cntIn;
        if (delayOut)
            cntOut <= cntOut - 1'b1;
    end

    always @(switch) begin
        cntOut <= cntIn;
    end

    // ---------------------------------------------

    reg q;

    always @ (posedge clk) begin
        if (binOut)
            q <= ~q;
    end

    assign wave = q;
    
endmodule
