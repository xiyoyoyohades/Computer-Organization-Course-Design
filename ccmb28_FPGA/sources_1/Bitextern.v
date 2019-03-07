`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:35:20
// Design Name: 
// Module Name: Bitextern
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

module Bitextern(
input extern_way,  //0 denote unsinged, 1 signed
input [15:0]data_in,
output reg [31:0]data_out
    );
    initial
    begin
        data_out = 32'h00000;
    end    
    always@(data_in or extern_way)
    begin
        if(!extern_way || !data_in[15])         //unsigned externed&&postive integer signed extern
        begin
            data_out[31:16] <= 16'h0000;
        end
        else begin                              //negative integer signed externed
            data_out[31:16] <= 16'hffff;
        end
        data_out[15:0] <= data_in;
    end
endmodule
