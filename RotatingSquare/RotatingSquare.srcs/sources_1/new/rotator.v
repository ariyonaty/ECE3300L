`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2020 05:54:55 PM
// Design Name: 
// Module Name: rotator
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


module rotator
    (
        input       clk,
        input       reset,
        input       enable,
        input       dir,
        output reg  [15:0] display
    );

    reg state, next_state;
    parameter   S0 = 0,
                S1 = 1;

    reg move;
    reg [2:0] pos;

    always @(posedge clk) begin
        if (reset) begin
            state <= S0;
            pos <= 0;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        case (state)
            S0: begin
                    if (enable) begin
                        next_state = S1;
                        pos = 0;
                    end else begin
                        next_state = S0;
                    end
                end
            S1: begin
                    if (enable) begin
                        next_state = S1;
                        if (dir)
                            pos = pos + 1'b1;
                        if (!dir)
                            pos = pos - 1'b1;
                    end else begin
                        next_state = S1;
                    end
                end
            default: begin
                    next_state = S0;
                    pos = 0;
                end
        endcase
    end

    always @(posedge clk) begin
        if (dir) begin
            case (pos)                              // clock wise segments
                3'b000 : display <= 16'h1234;     
                3'b001 : display <= 16'h1234;  
                3'b010 : display <= 16'h1234; 
                3'b011 : display <= 16'h1234;   
                3'b100 : display <= 16'h1234;   
                3'b101 : display <= 16'h1234;   
                3'b110 : display <= 16'h1234;   
                3'b111 : display <= 16'h1234;   
                default: display <= 16'h1234;   
            endcase
        end else begin
            case (pos)                              // counter clock wise segments
                3'b000 : display <= 16'h1234;     
                3'b001 : display <= 16'h1234;  
                3'b010 : display <= 16'h1234; 
                3'b011 : display <= 16'h1234;   
                3'b100 : display <= 16'h1234;   
                3'b101 : display <= 16'h1234;   
                3'b110 : display <= 16'h1234;   
                3'b111 : display <= 16'h1234;   
                default: display <= 16'h1234;   
            endcase
        end 
    end

endmodule
