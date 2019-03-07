`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 17:13:14
// Design Name: 
// Module Name: select_content
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


module select_content(sw,state_show);
input sw;
output reg [1:0]state_show;
initial begin
state_show = 0;
end
always@(posedge sw)
begin
    case(state_show[1:0])
        2'b00:state_show=2'b01;
        2'b01:state_show=2'b10;
        2'b10:state_show=2'b11;
        2'b11:state_show=2'b00;
    endcase
end
endmodule
