`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:36:30
// Design Name: 
// Module Name: Clkn
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


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/07 17:27:24
// Design Name: 
// Module Name: divider
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


module Clkn(clk,frequence ,clk_N);
input clk;                      // 系统时钟
input [1:0]frequence;
output reg clk_N;                   // 分频后的时钟
//parameter A = 4;      // 1Hz的时钟,N=fclk/fclk_N
parameter A = 1_000_000;      // 1Hz的时钟,N=fclk/fclk_N
parameter B = 10_000_000;
parameter C = 1_000_000;
parameter D = 100_000;
reg [31:0] counter;             /* 计数器变量，通过计数实现分频。
                                   当计数器从0计数到(N/2-1)时，
                                   输出时钟翻转，计数器清零 */
initial begin
    clk_N = 0;
    counter = 0;
end
always @(posedge clk)  begin    // 时钟上升沿
    if(frequence==0)
    begin
        if(counter >=  A/2 -1 )                       // 功能实现
        begin
            clk_N = ~clk_N;
            counter = 0;
        end
        else 
           counter = counter + 1;  
     end
     else if(frequence==1)
     begin
        if(counter >=  B/2 -1 )                       // 功能实现
             begin
                 clk_N = ~clk_N;
                 counter = 0;
             end
             else 
                counter = counter + 1;  
     end
     else if(frequence==2)
     begin
             if(counter >=  C/2 -1 )                       // 功能实现
                  begin
                      clk_N = ~clk_N;
                      counter = 0;
                  end
                  else 
                     counter = counter + 1;  
      end
      else if(frequence==3)
      begin
          if(counter >=  D/2 -1 )                       // 功能实现
          begin
             clk_N = ~clk_N;
             counter = 0;
          end
          else 
             counter = counter + 1;  
      end
end                           
endmodule

