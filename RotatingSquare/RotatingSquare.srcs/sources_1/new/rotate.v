`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2020 12:40:29 AM
// Design Name: 
// Module Name: rotate
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


module rotate
    (
        input       clk,
        input       dir,
        input       start,
        input       reset,
        output      [2:0] curr_state,
        output reg  [7:0] enable,
        output reg  [6:0] seg
    );

    reg [2:0] state, next_state;
    assign curr_state = state;
    parameter [2:0] S0 = 0, // Segment - Top    Square 
                    S1 = 1, // Segment - Top    Square
                    S2 = 2, // Segment - Top    Square
                    S3 = 3, // Segment - Top    Square
                    S4 = 4, // Segment - Bottom Square
                    S5 = 5, // Segment - Bottom Square
                    S6 = 6, // Segment - Bottom Square
                    S7 = 7; // Segment - Bottom Square

    always @(posedge clk) begin // Update state 
        if (reset)
            state <= S0;
        else if (start)
            state <= next_state;
    end

    always @(*) begin                   // Moore machine and outputs
        if (dir) begin                  // If direction is '1' 
            next_state = state + 1'b1;  // --> increment state by 1
            case (state)
                3'b000 : begin enable <= ~(8'h08); seg <= (~7'h63); end //  TOP   
                3'b001 : begin enable <= ~(8'h04); seg <= (~7'h63); end //  TOP
                3'b010 : begin enable <= ~(8'h02); seg <= (~7'h63); end //  TOP
                3'b011 : begin enable <= ~(8'h01); seg <= (~7'h63); end //  TOP
                3'b100 : begin enable <= ~(8'h01); seg <= (~7'h5c); end //  BOTTOM  
                3'b101 : begin enable <= ~(8'h02); seg <= (~7'h5c); end //  BOTTOM  
                3'b110 : begin enable <= ~(8'h04); seg <= (~7'h5c); end //  BOTTOM  
                3'b111 : begin enable <= ~(8'h08); seg <= (~7'h5c); end //  BOTTOM  
                default: begin enable <= ~(8'h08); seg <= (~7'h63); end  
            endcase                     
        end else begin                  // If direction is '1'     
            next_state = state - 1'b1;  // --> decrement state by 1
            case (state)
                3'b000 : begin enable <= ~(8'h08); seg <= (~7'h63); end //  TOP   
                3'b001 : begin enable <= ~(8'h04); seg <= (~7'h63); end //  TOP
                3'b010 : begin enable <= ~(8'h02); seg <= (~7'h63); end //  TOP
                3'b011 : begin enable <= ~(8'h01); seg <= (~7'h63); end //  TOP
                3'b100 : begin enable <= ~(8'h01); seg <= (~7'h5c); end //  BOTTOM  
                3'b101 : begin enable <= ~(8'h02); seg <= (~7'h5c); end //  BOTTOM  
                3'b110 : begin enable <= ~(8'h04); seg <= (~7'h5c); end //  BOTTOM  
                3'b111 : begin enable <= ~(8'h08); seg <= (~7'h5c); end //  BOTTOM  
                default: begin enable <= ~(8'h08); seg <= (~7'h63); end  
            endcase
        end
    end

endmodule
