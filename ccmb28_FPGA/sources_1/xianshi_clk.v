`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 10:27:55
// Design Name: 
// Module Name: xianshi_clk
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


module xianshi_clk(clk,show_clk);
input clk;
output reg show_clk;
reg [31:0]num;
initial
begin
    num=0;
    show_clk=0;
end
always@(posedge clk)
begin
    num=num+1;
    if(num==15000)
    begin
        show_clk=1;
    end
    else if(num==30000)
    begin
        show_clk=0;
        num=0;
    end
end
endmodule
