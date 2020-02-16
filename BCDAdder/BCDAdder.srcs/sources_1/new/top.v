`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2020 11:38:53 PM
// Design Name: 
// Module Name: top
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


module top
    (
        input       [7:0] X,
        input       load, clk,
        output      [8:0] R
    );
    
    wire    [7:0] A, B;
    wire    c1, c2, c3;
    wire    [3:0] s1, s2;
    wire    g1, g2;
    wire    o1, o2, o3;
    
    assign B = X;
    reg [8:0] out;
            
    register_8bit   r1  (.in(X),    .clk(clk),  .load(load),    .out(A));
        
    adder_4bit      pa1 (.a(A[3:0]),        .b(B[3:0]), .carry_in(1'b0),   .carry_out(c1),     .sum(s1));    
    adder_4bit      pa2 (.a(4'b{1'b0,o1,o1, 1'b0}),.b(s1),     .carry_in(1'b0),   .carry_out(c2),     .sum(out[3:0]));
    adder_4bit      pa3 (.a(A[7:4]),        .b(B[7:4]), .carry_in(o2),  .carry_out(c3),      .sum(s2));
    adder_4bit      pa4 (.a(4'b{1'b0, o3, o3, 1'b0}),.b(s2),     .carry_in(1'b`0),   .carry_out(out[8]),   .sum(out[7:4]));
  
    compare9        cp1 (.A(s1),    .greater(g1));
    compare9        cp2 (.A(s2),    .greater(g2));
    
    or(o1, g1, c1);    
    or(o2, c2, c1);
    or(o3, c3, g2);
        
    assign R = out; 
   
endmodule





