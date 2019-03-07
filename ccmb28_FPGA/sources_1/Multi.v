`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:32:01
// Design Name: 
// Module Name: Multi
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


module Multi(sel,
in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
out);
    parameter sel_wid = 4;
    parameter data_wid = 32;
    input [sel_wid-1:0]sel;
    input [data_wid-1:0]in0;
    input [data_wid-1:0]in1;
    input [data_wid-1:0]in2;
    input [data_wid-1:0]in3;
    input [data_wid-1:0]in4;
    input [data_wid-1:0]in5;
    input [data_wid-1:0]in6;
    input [data_wid-1:0]in7;
    input [data_wid-1:0]in8;
    input [data_wid-1:0]in9;
    input [data_wid-1:0]in10;
    input [data_wid-1:0]in11;
    input [data_wid-1:0]in12;
    input [data_wid-1:0]in13;
    input [data_wid-1:0]in14;
    input [data_wid-1:0]in15;
    output reg [data_wid-1:0]out;
    initial
    begin
        out = 0;
    end
    always@(sel,in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,out)
    begin
        case(sel)
        0: begin out <= in0; end
        1: begin out <= in1; end
        2: begin out <= in2; end
        3: begin out <= in3; end
        4: begin out <= in4; end  
        5: begin out <= in5; end 
        6: begin out <= in6; end 
        7: begin out <= in7; end 
        8: begin out <= in8; end 
        9: begin out <= in9; end 
        10: begin out <= in10; end 
        11: begin out <= in11; end 
        12: begin out <= in12; end         
        13: begin out <= in13; end 
        14: begin out <= in14; end 
        15: begin out <= in15; end      
        endcase
    end
endmodule
