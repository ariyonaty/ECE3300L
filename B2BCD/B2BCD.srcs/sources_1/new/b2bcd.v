`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2020 01:42:11 PM
// Design Name: 
// Module Name: b2bcd
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

module b2bcd
    (
        input       clk,
        input       [11:0] binaryIn,
        output      [15:0] BCD    
    );

    /* 
        C3 - Initialization
        C2 - Shift left
        C1 - Add 3 correction
        C0 - Load BCD
     */
    wire C3, C2, C1, C0;

    /* 
        Counter block.
            When C3 is asserted, the system is initialized 
            and down-counter from 12. 
            Z asserted when counter reaches zero. 
     */
    reg [3:0] counter;
    assign z = ~(|counter);
    always @(posedge clk ) begin
        if (C3)
            counter <= 4'b1100;
        else if (C2)
            counter <= counter - 1'b1; 
    end

    /* 
        Register block.
            When C3 is asserted, reg R holds binary input value
            When C2 is asserted, reg R is shifted left
     */
    reg [11:0] R;
    always @(posedge clk ) begin
        if (C3)
            R <= binaryIn;
        else if (C2)
            R <= R << 1;
    end

    /* 
        Manipulation and logic block
            Flow:
                When C3 asserted, reset all D values to 0
                When C2 asserted, SISHL (serial input shift left)
                    meaning, LSB of Dx is assigned the MSB from the binary shift 
                When C1 asserted & Dx is greater than 4, add 3 to Dx
                When C0 asserted, set BCDx = Dx
     */
    reg [3:0] D0, D1, D2, D3;
    reg [3:0] BCD0, BCD1, BCD2, BCD3;
    assign BCD = {BCD3, BCD2, BCD1, BCD0};
    always @(posedge clk ) begin
        if (C3) begin                               // Reset
            D0 <= 0;
            D1 <= 0;
            D2 <= 0;
            D3 <= 0; 
        end else if (C2) begin                      // Shift left
            D0 <= {D0[2:0], R[11]};
            D1 <= {D1[2:0], D0[3]};
            D2 <= {D2[2:0], D1[3]};
            D3 <= {D3[2:0], D2[3]};       
        end
        if (C1 && (D0 > 4))     D0 <= D0 + 3;       // BCD correction, add 3
        if (C1 && (D1 > 4))     D1 <= D1 + 3;
        if (C1 && (D2 > 4))     D2 <= D2 + 3;
        if (C1 && (D3 > 4))     D3 <= D3 + 3;
        if (C0) begin                               // Load into Dx into BCDx register
            BCD0 <= D0;
            BCD1 <= D1;
            BCD2 <= D2;
            BCD3 <= D3;
        end 
    end

    /* 
        State machine block
            3 states
            Mealy machine
            C0 - Load BCD
            C1 - Add 3 correction
            C2 - Shift left
            C3 - Initialization
     */
    reg [1:0] state;
    parameter   S0 = 0,
                S1 = 1,
                S2 = 2;

    reg [3:0] C;
    assign C3 = C[3];
    assign C2 = C[2];
    assign C1 = C[1];
    assign C0 = C[0]; 

    always @(posedge clk ) begin                
        case (state)
            S0:         state <= S1; 
            S1: if (z)  state <= S0; else state <= S2;
            S2:         state <= S1;
        endcase
    end
    always @ (*) begin
        case (state)
            S0:         C = 4'b1000;          
            S1: if (z)  C = 4'b0001; else C = 4'b0010;
            S2:         C = 4'b0100;
        endcase
    end

endmodule
