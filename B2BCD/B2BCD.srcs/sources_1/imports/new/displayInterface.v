`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2020 02:02:14 PM
// Design Name: 
// Module Name: displayInterface
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


module displayInterface
    (
        input       clk,
        input       [3:0] D0,
        input       [3:0] D1,
        input       [3:0] D2,
        input       [3:0] D3,
        output      dp,
        output reg  [7:0] enable,
        output reg  [6:0] seg
    );
    
    reg [19:0] counter = {20{1'b0}};

    always @(posedge clk)
        counter <= counter + 1'b1;


    /* 
        3 x 8 Decoder
            Block determines enable for seven seg
            Input: 3-bit from the most significant bits of counter
            Output: 8-bit output, active low for common anode 7 segment
    */
    always @(counter) begin
        case (counter[19:17])
            3'b000  : enable <= ~(8'b00000001);
            3'b001  : enable <= ~(8'b00000010);
            3'b010  : enable <= ~(8'b00000100);
            3'b011  : enable <= ~(8'b00001000);
            3'b100  : enable <= ~(8'b00010000);
            3'b101  : enable <= ~(8'b00100000);
            3'b110  : enable <= ~(8'b01000000);
            3'b111  : enable <= ~(8'b10000000);
            default : enable <= ~(8'b00000000);
        endcase
    end

    /* 
        Multiplexor
            Block determines binary output
            Input: 6 bit values; 4 bit referenced from switch input; 
            Output: 6 bit output; MSB signfies Enable; LSB signifies decimal point; mid-4 signify BCD value
    */
    wire [6:0] I0, I1, I2, I3, I4, I5, I6, I7;
    assign I0 = {1'b1, D0, 1'b1};
    assign I1 = {1'b1, D1, 1'b1};
    assign I2 = {1'b1, D2, 1'b1};
    assign I3 = {1'b1, D3, 1'b1};
    assign I4 = {1'b0, 4'b0, 1'b1};
    assign I5 = {1'b0, 4'b0, 1'b1};
    assign I6 = {1'b0, 4'b0, 1'b1};
    assign I7 = {1'b0, 4'b0, 1'b1};
    
    reg [5:0] Dout;

    always @(counter[19:17], I0, I1, I2, I3, I4, I5, I6, I7) begin
        case (counter[19:17])
            3'b000: Dout = I0;
            3'b001: Dout = I1;
            3'b010: Dout = I2;
            3'b011: Dout = I3;
            3'b100: Dout = I4;
            3'b101: Dout = I5;
            3'b110: Dout = I6;
            3'b111: Dout = I7;
        endcase
    end 

    /* 
        Binary to Seven Segment Decoder
        Input: 4 bit binary value
        Output: 7 bit seven segment encoded value
    */
    assign dp = Dout[0];

    always @ (Dout) begin
        if (Dout[5]) begin
            case (Dout[4:1])
                4'b0000 :   seg = ~(7'h3f);     // 0
                4'b0001 :   seg = ~(7'h06);     // 1 
                4'b0010 :   seg = ~(7'h5b);     // 2 
                4'b0011 :   seg = ~(7'h4f);     // 3 
                4'b0100 :   seg = ~(7'h66);     // 4 
                4'b0101 :   seg = ~(7'h6d);     // 5 
                4'b0110 :   seg = ~(7'h7d);     // 6 
                4'b0111 :   seg = ~(7'h07);     // 7 
                4'b1000 :   seg = ~(7'h7f);     // 8 
                4'b1001 :   seg = ~(7'h6f);     // 9 
                4'b1010 :   seg = ~(7'h77);     // 10
                4'b1011 :   seg = ~(7'h7c);     // 11
                4'b1100 :   seg = ~(7'h39);     // 12
                4'b1101 :   seg = ~(7'h5e);     // 13
                4'b1110 :   seg = ~(7'h79);     // 14
                4'b1111 :   seg = ~(7'h71);     // 15 
            endcase
        end
        else
            seg = 7'b1111111;
    end

endmodule

