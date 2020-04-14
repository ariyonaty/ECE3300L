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

    always @(posedge clk) begin             // update state
        state <= next_state;
    end

    always @(*) begin                       // state machine ; mealy
        case (state)
            S0:             
                if (go) begin               // if go asserted, 
                    next_state = S1;        //  proceed to state 1
                    C = 4'b0011;            //  init and load registers
                end else begin              // otherwise
                    next_state = S0;        //  remain in state 0
                    C = 4'b0000;        
                end
            S1:                             
                if (BLA) begin              // if BLA asserted,
                    next_state = S0;        //  proceed to state 0
                    C = 4'b1000;            //  load quotient reg 
                end else begin              // otherwise
                    next_state = S1;        //  remain in state 1
                    C = 4'b0110;
                end
            default: begin
                    next_state = S0;
                    C = 4'b0000;
            end
        endcase
    end

    reg [7:0] A, B, PA;
    reg blaReg;
    assign go = (div & (|divisor));
    assign BLA = blaReg;

    always @(posedge clk) begin         
        if (C0)                         // if C0 asserted
            A <= divisor;               //  load reg A with dvsr input    
        if (C1) begin                   // if C1 asserted
            if (C0)                     //  2-to-1 mux
                B <= dividend;          //  C0 = 1 --> B = dvdnd input    
            else                        //  C0 = 0 --> B = subtraction
                B <= PA;                //
        end
    end

    always @(*) begin                   // subtractor block
        {blaReg, PA} <= ~A + B + 1'b1;  // takes the '2's comp'
    end

    reg [7:0] QI;
    always @(posedge clk) begin         // Quotient increment
        if (C0)                         // if C0
            QI <= 0;                    //  reset to 0
        if (C2)                         // if C2 (aka state 2)
            QI <= QI + 1'b1;            // increment by 1
        if (C3)                         // if C3 (aka rmndr < dvsr)
            quotient <= QI;             // load quotient w/ incr. value
    end

endmodule
