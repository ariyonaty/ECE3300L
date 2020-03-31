`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2020 11:47:09 PM
// Design Name: 
// Module Name: multiplier
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


module multiplier
    (
        input       clk,
        input       go,
        input       [5:0] multiplier,
        input       [5:0] multiplicand,
        output reg  [11:0] product
    );

    reg state, next_state;
    parameter   S0 = 0,
                S1 = 1;

    reg [2:0] C = 0;
    assign C0 = C[0];   
    assign C1 = C[1];   
    assign C2 = C[2];   

    always @(posedge clk) begin
        state <= next_state;
    end

    always @(state or go or zed) begin
        case (state)
            S0: 
                if (go) begin
                    next_state = S1;
                    C = 3'b001;
                end else begin
                    next_state = S0;
                    C = 3'b000;
                end 
            S1: 
                if (zed) begin
                    next_state = S0;
                    C = 3'b100;
                end else begin
                    next_state = S1;
                    C = 3'b010;
                end
            default: next_state = S0;          
        endcase
    end

    reg [5:0] multiplierReg;
    assign zed = ~(|multiplierReg);
    always @(posedge clk) begin
        if (C0)
            multiplierReg <= multiplier;
        if (C1)
            multiplierReg <= multiplierReg - 1;
    end

    reg [11:0] multiplicandReg;
    reg [11:0] PI;
    always @(posedge clk) begin
        if (C0) begin
            multiplicandReg <= {6'd0, multiplicand};
            PI <= 0;
        end
        if (C1) begin
            PI <= multiplicandReg + PI;
        end
        if (C2) begin
            product <= PI; 
        end
    end

endmodule
