`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 09:08:46 PM
// Design Name: 
// Module Name: lfsr
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


module lfsr
    #(
        parameter   WIDTH = 12,
        parameter   POLY = {WIDTH{12'b011000001000}}       // polynomial follows: x^12 + x^11 + x^10 + x^4 + 1
    )(
        input       clk,
        input       load,
        input       enable,
        input       [(WIDTH-1):0] seed,
        output reg  [(WIDTH-1):0] randNum 
    );

    always @(posedge clk ) begin
        if (enable) begin                                                   // if enable --> LFSR begins to operate
            if (load) begin                                                 // if load --> randNum initialized with seed
                randNum <= seed;
            end else if (randNum[0]) begin                                  // if LSB is a '1' --> Shift rotate right.
                randNum <= {randNum[0], randNum[(WIDTH-1):1]} ^ POLY;       //  THEN, XOR with polynomial
            end else begin
                randNum <= {randNum[0], randNum[(WIDTH-1):1]};              // Otherwise, simplfy Shift rotate right
            end
        end
    end

endmodule
