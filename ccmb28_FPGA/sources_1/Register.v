`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:31:40
// Design Name: 
// Module Name: Register
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


module Register(
clk,en,clr,in,
out
    );
    
        parameter WIDTH = 32;
        input clk;
        input en;
        input clr;
        input  [WIDTH-1:0]in;
        output  reg [WIDTH-1:0]out;          //reg
    initial begin
        out = 0;
    end

    always@(posedge clk or posedge clr)begin
        if(clr == 1)
            out <= 0;
        else if(en == 1)
            out <= in;
        else
            ;
    end
endmodule
