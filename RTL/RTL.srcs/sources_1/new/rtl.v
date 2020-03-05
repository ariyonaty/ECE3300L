`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 01:34:47 PM
// Design Name: 
// Module Name: rtl
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


module rtl
    (
        input       [3:0] dataIn,
        input       [2:0] ALUS,
        input       [2:0] RS,
        input       enable,
        input       clk,
        output reg  [3:0] dataOut 
    );

    wire [3:0] A, B;
    reg [3:0] ALUOut;

    assign A = dataOut;
    assign B = dataIn;
    
    always @(ALUS, A, B) begin
        case (ALUS)
            3'b000: ALUOut = B;  
            3'b001: ALUOut = A + B; 
            3'b010: ALUOut = A - B;
            3'b011: ALUOut = B - A;
            3'b100: ALUOut = A & B;
            3'b101: ALUOut = A | B;
            3'b110: ALUOut = A ^ B;
            3'b111: ALUOut = A; 
        endcase        
    end

    always @(posedge clk) begin
        if (enable) begin
            case (RS)
                3'b000: dataOut = dataOut;                      // hold
                3'b001: dataOut = dataOut >> 1;                 // Shift right
                3'b010: dataOut = dataOut << 1;                 // Shift left
                3'b011: dataOut = {dataOut[2:0], dataOut[3]};   // Rotate Left      
                3'b100: dataOut = dataOut + 1;                  // Increment
                3'b101: dataOut = dataOut - 1;                  // Decrement
                3'b110: dataOut = 0;                            // Reset
                3'b111: dataOut = ALUOut;                       // Load
            endcase
        end
    end

endmodule
