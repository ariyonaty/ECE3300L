`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 01:39:19 AM
// Design Name: 
// Module Name: traffic_light
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


module traffic_light
    (
        input       clk,
        input       [1:0] sensor,
        output reg  [2:0] NS,
        output reg  [2:0] EW
    );

    reg [2:0] state, next_state;
    parameter [2:0] S0 = 0,         // NS = R ; EW = G 
                    S1 = 1,         // NS = R ; EW = Y
                    S2 = 2,         // NS = R ; EW = R
                    S3 = 3,         // NS = G ; EW = R
                    S4 = 4,         // NS = Y ; EW = R
                    S5 = 5,         // NS = R ; EW = R
                    S6 = 6;         // NS = R ; EW = G

    reg [3:0] counter;

    // always @(posedge clk) begin
    //     state <= next_state;
    // end

    always @(posedge clk) begin
        case (state)
            S0: begin
                    if (sensor > 0) begin
                        counter = 0;
                        state = S1;
                    end else begin
                        state = S0;
                    end
                end  
            S1: begin
                    counter = counter + 1;
                    if (counter == 5) begin
                        counter = 0;
                        state = S2;
                    end else begin
                        state = S1;
                    end
                end
            S2: begin
                    counter = counter + 1;
                    if (counter == 2) begin
                        counter = 0;
                        state = S3;
                    end else begin
                        state = S2;
                    end                
                end
            S3: begin
                    counter = counter + 1;
                    if (counter == 10) begin
                        counter = 0;
                        state = S4;
                    end else begin
                        state = S3;
                    end                
                end
            S4: begin
                    counter = counter + 1;
                    if (counter == 4) begin
                        counter = 0;
                        state = S5;
                    end else begin
                        state = S4;
                    end                
                end
            S5: begin
                    counter = counter + 1;
                    if (counter == 2) begin
                        counter = 0;
                        state = S6;
                    end else begin
                        state = S5;
                    end                
                end
            S6: begin
                    counter = counter + 1;
                    if (counter == 15) begin
                        counter = 0;
                        state = S0;
                    end else begin
                        state = S6;
                    end                
                end
            default:    state = S0;
        endcase
    end

    always @(*) begin                           // computes output
        case (state)
            S0: begin
                    NS = 3'b100;    //  Red
                    EW = 3'b001;    //  Green
                end  
            S1: begin
                    NS = 3'b100;    //  Red
                    EW = 3'b010;    //  Yellow
                end
            S2: begin
                    NS = 3'b100;    //  Red
                    EW = 3'b100;    //  Red
                end
            S3: begin
                    NS = 3'b001;    //  Green
                    EW = 3'b100;    //  Red
                end
            S4: begin
                    NS = 3'b010;    //  Yellow
                    EW = 3'b100;    //  Red
                end
            S5: begin
                    NS = 3'b100;    //  Red
                    EW = 3'b100;    //  Red
                end
            S6: begin
                    NS = 3'b100;    //  Red
                    EW = 3'b001;    //  Green
                end
            default: begin
                    NS = 3'b100;    //  Red
                    EW = 3'b001;    //  Green
                end
        endcase
    end



endmodule // traffic_light
