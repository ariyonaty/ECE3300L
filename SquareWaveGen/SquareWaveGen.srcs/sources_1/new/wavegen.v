`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/21/2020 03:38:49 PM
// Design Name: 
// Module Name: wavegen
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


module wavegen
//    #(parameter delay = 100)
    (
        input       clk,
        input       [7:0] t,
        output      wave
    );
    
    reg [7:0] delayCounter = 8'h64;
    reg [7:0] binCounter;
    
    reg q;
     
    wire [6:0] outDelay;
    wire nOutDelay;
    
    wire [7:0] outT;
    wire nOutT;

    always @(posedge clk) begin
        if (nOutDelay)
            delayCounter = 8'h64;
        else
             delayCounter <= delayCounter - 1'b1;
    end

    always @(posedge clk) begin
        if (nOutDelay) begin
            if (nOutT)
                binCounter <= t;
            else
                binCounter <= binCounter - 1'b1;
        end
        if (nOutT)
            binCounter = t;
    end    
    
    always @(posedge clk) begin
        if (nOutT)
            q = ~q;
    end
        
    assign outT = binCounter;
    assign nOutT = ~(|outT);    

    assign outDelay = delayCounter;			
	assign nOutDelay = ~(|outDelay);
	
	assign wave = q;
	    	
endmodule
