`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 11:33:16 PM
// Design Name: 
// Module Name: divider
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


module divider
    (
        input       clk,
        input       div,
        input       [7:0] divisor,
        input       [7:0] dividend,
        output reg  [7:0] quotient
    );

    reg state, next_state;
    parameter   S0 = 0,
                S1 = 1;

    reg [3:0] C = 0;
    assign C0 = C[0];
    assign C1 = C[1];
    assign C2 = C[2];
    assign C3 = C[3];

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(*) begin
        case (state)
            S0:
                if (go) begin
                    next_state = S1;
                    C = 4'b0011;
                end else begin
                    next_state = S0;
                    C = 4'b0000;
                end
            S1: 
                if (BLA) begin
                    next_state = S0;
                    C = 4'b1000;
                end else begin
                    next_state = S1;
                    C = 4'b0110;
                end
            default: begin
                    next_state = S0;
                    C = 4'b0000;
            end
        endcase
    end

    reg [7:0] A, B, PA;
    reg blaReg = 1'b0;
    assign go = (div & (|divisor));
    assign BLA = blaReg;

    always @(posedge clk) begin
        if (C0)
            A <= divisor;
        if (C1) begin
            if (C0)
                B <= dividend;
            else
                B <= PA;
        end
        {blaReg, PA} <= ~A + B + 1'b1;
    end

    reg [7:0] QI;
    always @(posedge clk) begin
        if (C0)
            QI <= 0;
        if (C2)
            QI <= QI + 1'b1;
        if (C3)
            quotient <= QI;
    end

endmodule
