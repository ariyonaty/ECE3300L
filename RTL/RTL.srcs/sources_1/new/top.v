`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 02:00:27 PM
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
        input       ex,
        input       [2:0] ALUS,
        input       [3:0] dataIn,
        input       [2:0] RS,
        output      dp,
        output      [7:0] enable,
        output      [6:0] seg    
    );


    /* 
        Delay counter block.
        Counts to 50,000,000 and resets.
        Output is a 1Hz, or 1 second cycle. 
     */
    reg [26:0] counter;
    wire tick;
    assign tick = ~(|counter);

    always @ (posedge clk) begin
        counter = counter + 1;
        if (counter == 50_000_000) begin
            counter = 0;
        end
    end

    /* 
        RTL (register transfer level) block
        Using pushbutton for execution, if 
            button and clock pulse (every 1 sec)
            RTL module enabled
        Output is 4 bit value depending on the selects
     */

    wire rtlEnable;
    assign rtlEnable = tick & ex;

    wire [3:0] dataOut;

    rtl r1 (    .dataIn(dataIn),
                .ALUS(ALUS),
                .RS(RS),
                .enable(rtlEnable),
                .clk(clk),
                .dataOut(dataOut)
            );

    /* 
        DI (Display interface) block
        Takes in 16 bit value from and outputs
            to seven segments
        Output shows:
            dataIn (input data) on segment
            segALUS (ALU select) on segment
            segRS (Register select) on segment
            dataOut (output data RTL) on segment    
     */

    wire [3:0]segALUS;
    wire [3:0]segRS;

    assign segALUS = {1'b0, ALUS};
    assign segRS = {1'b0, RS};

    displayInterface d1 (  .clk(clk),
                            .D0(dataIn),
                            .D1(segALUS),
                            .D2(segRS),
                            .D3(dataOut),
                            .dp(dp),
                            .enable(enable),
                            .seg(seg)                   
                        );

endmodule
