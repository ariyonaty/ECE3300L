`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2020 11:35:40 PM
// Design Name: 
// Module Name: delay
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


module delay
    (
        input       clk,
        input       trigger,
        output reg  delay2,
        output reg  delay4,
        output reg  delay5,
        output reg  delay10,
        output reg  delay15
    );

    reg [3:0] counter;

    always @(posedge clk) begin
        if (trigger) begin
            counter = counter + 1;
            if (counter == 2)   begin delay2 = 1;   counter = 0; end  
            if (counter == 4)   begin delay4 = 1;   counter = 0; end  
            if (counter == 5)   begin delay5 = 1;   counter = 0; end  
            if (counter == 10)  begin delay10 = 1;  counter = 0; end      
            if (counter == 15)  begin delay15 = 1;  counter = 0; end      
        end
        if (counter == 0) 
        begin
                            delay2 = 0;
                            delay4 = 0;
                            delay5 = 0;
                            delay10 = 0;
                            delay15 = 0;
        end
    end

endmodule // delay

