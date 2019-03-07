`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:29:46
// Design Name: 
// Module Name: Memory
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


module Memory(
input clk,
input str,  //store enable
input [3:0]sel,   //select within a word
input ld,    //load enable
input clr,   //clean
input [19:0]addr,
input [31:0]data_in,
output  [31:0]data_out   
    );  
    reg [31:0]mem[1023:0];
integer loop;
  reg pre_clr;
  initial pre_clr = 0;
  
  always@(posedge clk or posedge clr)
  begin
      if(pre_clr == 0 && clr == 1)
      begin
          loop = 0;
          while((loop < 10'b1111111111)|| (loop == 10'b1111111111))
          begin
              mem[loop] = 0;
              loop = loop + 1;
          end
      end
      else if(clr == 1)
      ;
      else if(str == 1)
      begin
          case(sel)
          4'b0001:mem[addr][7:0] = data_in[7:0];
          4'b0010:mem[addr][15:8] = data_in[7:0];
          4'b0100:mem[addr][23:16] = data_in[7:0];
          4'b1000:mem[addr][31:24] = data_in[7:0];
          4'b0011:mem[addr][15:0] = data_in[15:0];
          4'b1100:mem[addr][31:16] = data_in[15:0];
          4'b1111:mem[addr][31:0] = data_in[31:0];
          endcase
      end
//        else if(ld == 1)
//        begin
//            case(sel)
//            4'b0001:data_out[31:0] = {mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7],mem[addr][7:0]};
//            4'b0010:data_out[31:0] = {mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15:8]};
//            4'b0100:data_out[31:0] = {mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23],mem[addr][23:16]};
//            4'b1000:data_out[31:0] = {mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31:24]};
//            4'b0011:data_out[31:0] = {mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15],mem[addr][15:0]};
//            4'b1100:data_out[31:0] = {mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31],mem[addr][31:16]};
//            4'b1111:data_out[31:0] = mem[addr][31:0];
//            endcase
//        end
      else
      ;
      pre_clr = clr;
  end
  assign data_out[31:0] = (mem[addr][31:0])&({32{ld}});

endmodule
