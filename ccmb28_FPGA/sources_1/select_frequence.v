`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/05 17:15:43
// Design Name: 
// Module Name: select_frequence
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


module select_frequence(sw,frequence);
input sw;
output reg [1:0]frequence;

initial begin
   frequence = 0;
end

always@(posedge sw)
begin
    case(frequence)
        2'b00:frequence=2'b01;
        2'b01:frequence=2'b10;
        2'b10:frequence=2'b11;
        2'b11:frequence=2'b00;
    endcase
end
endmodule
