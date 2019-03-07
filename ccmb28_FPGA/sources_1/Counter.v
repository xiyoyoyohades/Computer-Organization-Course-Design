`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:35:37
// Design Name: 
// Module Name: Counter
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


module Counter(
input clk,
input incress_signal,
input rst,
output reg [31:0]count
    );
initial begin
    count=0;
end
    always @(posedge clk)
    begin
        if(incress_signal==1)
        begin
            count<=count+1;
        end
        else ;
        if(rst==1)
        begin
            count<=0;
        end
        else ;
    end
endmodule






