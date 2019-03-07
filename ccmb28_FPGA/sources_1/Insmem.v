`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 16:55:52
// Design Name: 
// Module Name: Insmem
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


module Insmem(in, out);

    input  [9:0]in;                          //input
    output [31:0]out;
    
    reg [31:0]mem[1023:0];
    initial $readmemh("F:/benchmark_ccmbinc.hex",mem);
    
    assign out[31:0] = mem[in][31:0];
endmodule
