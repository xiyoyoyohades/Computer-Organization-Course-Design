`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 10:18:09
// Design Name: 
// Module Name: sim_data_mem
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


module sim_data_mem;
 reg clk;
 reg str;
 reg [3:0]sel;
 reg ld;
 reg clr;
 reg [19:0]addr;
 reg [31:0]data_in;
 wire [31:0]data_out;
initial begin
     clk = 0;
     str = 0;
     sel = 4'b1111;
     ld = 0;
     clr = 0;
     addr = 0;
     data_in = 0;
     forever begin
     #1
     clk = ~clk;
     end
end


Memory memory( clk,str, sel,ld,   clr, addr,data_in,data_out );

initial begin
//load data
    #5 str = 1;
    #5 addr = 1;
    #5 data_in = 32'h11111111;
    #5 addr = 2;
    #5 data_in = 32'h22222222;
    #5 addr = 3;
    #5 data_in = 32'h33333333;
    //output
    str = 0;
    #5 ld = 1;
    #5 addr = 2;
    #5 addr = 1;
    //test sel
    #5 sel = 4'b0101;
    #5 sel = 4'b1000;
    #5 sel = 4'b1111;
    //test clr
    #5 clr = 1;
    #5 clr = 0;
    #5 addr = 3;
    #5 addr = 2;
    #5 addr = 1;
end
endmodule
