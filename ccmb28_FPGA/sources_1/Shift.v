`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:33:30
// Design Name: 
// Module Name: Shift
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


module Shift(
input [1:0]way,  //00:logical left,01:logical right ,10:algorithm left,11:algorithm right
input [31:0]data_in,
input [4:0]shift_num,   //the num u want to shift
output reg [31:0]data_out
    );
    always@(way or data_in or shift_num)
    begin
        case(way)
        0:data_out <= data_in<<shift_num;
        1:data_out <= data_in>>shift_num; 
        2:data_out <= ($signed(data_in))<<<shift_num; 
        3:data_out <= ($signed(data_in))>>>shift_num; 
        endcase
    end
endmodule
