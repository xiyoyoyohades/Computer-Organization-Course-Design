`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:30:23
// Design Name: 
// Module Name: Regfile
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


module Regfile(
input clk, 
input we,  //write enable
input [4:0]r1_in,   //reg 1 in
input [4:0]r2_in,   //reg 2 in
input [4:0]w,  // write reg num
input [31:0]data_in,
output [31:0]r1_out,
output [31:0]r2_out
    );
    //32 register
    reg [0:31]regfile[31:0];
    initial begin
        regfile[0] <= 0;
        regfile[1] <= 0;
        regfile[2] <= 0;
        regfile[3] <= 0;
        regfile[4] <= 0;
        regfile[5] <= 0;
        regfile[6] <= 0;
        regfile[7] <= 0;
        regfile[8] <= 0;
        regfile[9] <= 0;
        regfile[10] <= 0;
        regfile[11] <= 0;
        regfile[12] <= 0;
        regfile[13] <= 0;
        regfile[14] <= 0;
        regfile[15] <= 0;
        regfile[16] <= 0;
        regfile[17] <= 0;
        regfile[18] <= 0;
        regfile[19] <= 0;
        regfile[20] <= 0;
        regfile[21] <= 0;
        regfile[22] <= 0;
        regfile[23] <= 0;
        regfile[24] <= 0;
        regfile[25] <= 0;
        regfile[26] <= 0;
        regfile[27] <= 0;
        regfile[28] <= 0;
        regfile[29] <= 0;
        regfile[30] <= 0;
        regfile[31] <= 0;

    end
    always@(posedge clk)
    begin
        if(we)
            regfile[w]=data_in;
        else ;

    end
   assign r1_out = regfile[r1_in];
   assign r2_out = regfile[r2_in];
endmodule
