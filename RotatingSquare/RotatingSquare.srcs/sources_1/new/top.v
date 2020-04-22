`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2020 01:47:01 AM
// Design Name: 
// Module Name: top
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


module top
    (
        input       clk,
        input       dir,
        input       operate,
        input       reset,
        output      [2:0] state,
        output      [7:0] enable,
        output      [6:0] seg
    );

    // Modify counter block here
    // to speed up or slow down
    // segment rotation
    reg [26:0] counter;
    assign clock_slow = ~(|counter);
    always @(posedge clk) begin
        counter = counter + 1;
        if (counter == 50_000_000)
            counter = 0;
    end

    rotate r1 
    (
        .clk(clock_slow),
        .dir(dir),
        .start(operate),
        .reset(reset),
        .curr_state(state),
        .enable(enable),
        .seg(seg)
    );

endmodule
