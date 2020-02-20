`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 12:17:32 AM
// Design Name: 
// Module Name: bcd_adder_sim
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


module bcd_adder_sim();

    reg [7:0] X;
    reg load, clk;
    
    wire [8:0] R;
    
    top uut (X, load, clk, R);
    
    always #1 clk = ~clk; 
    
    initial begin
            clk = 1;             load = 0;  
            X = 8'b0101_0101;    load = 1;      //  A = 55
        #1  X = 8'b0101_0101;    load = 0;      //  B = 55
        #1  X = 8'b1001_1001;    load = 1;      //  A = 99
        #1  X = 8'b1001_1001;    load = 0;      //  B = 99  
        #1  X = 8'b1000_0111;    load = 1;      //  A = 87
        #1  X = 8'b0111_1000;    load = 0;      //  B = 78
        #1  X = 8'b0010_0101;    load = 1;      //  A = 25
        #1  X = 8'b0111_0101;    load = 0;      //  B = 75
        #1  X = 8'b0011_0011;    load = 1;      //  A = 33
        #1  X = 8'b0110_0110;    load = 0;      //  B = 66
        #1  X = 8'b0110_1001;    load = 1;      //  A = 69
        #1  X = 8'b1001_0110;    load = 0;      //  B = 96
        #1  $stop;
    end

    /*TESTING 4 BIT ADDER*/
    /*
    reg [3:0] a, b;
    reg cin;
    wire cout;
    wire [3:0] s;
    
    adder_4bit  uut (a, b, cin, cout, s);
    
    integer i;
    
    initial begin
            a <= 0; b <= 0; cin <= 0;
        for (i = 0; i < 5; i = i + 1) begin
            #1 a <= $random;    b <= $random;   cin <= $random;
        end
        $stop;
    end*/

endmodule
