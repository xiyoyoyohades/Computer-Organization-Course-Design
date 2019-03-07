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
input clk;                      // ϵͳʱ��
input [1:0]frequence;
output reg clk_N;                   // ��Ƶ���ʱ��
//parameter A = 4;      // 1Hz��ʱ��,N=fclk/fclk_N
parameter A = 1_000_000;      // 1Hz��ʱ��,N=fclk/fclk_N
parameter B = 10_000_000;
parameter C = 1_000_000;
parameter D = 100_000;
reg [31:0] counter;             /* ������������ͨ������ʵ�ַ�Ƶ��
                                   ����������0������(N/2-1)ʱ��
                                   ���ʱ�ӷ�ת������������ */
initial begin
    clk_N = 0;
    counter = 0;
end
always @(posedge clk)  begin    // ʱ��������
    if(frequence==0)
    begin
        if(counter >=  A/2 -1 )                       // ����ʵ��
        begin
            clk_N = ~clk_N;
            counter = 0;
        end
        else 
           counter = counter + 1;  
     end
     else if(frequence==1)
     begin
        if(counter >=  B/2 -1 )                       // ����ʵ��
             begin
                 clk_N = ~clk_N;
                 counter = 0;
             end
             else 
                counter = counter + 1;  
     end
     else if(frequence==2)
     begin
             if(counter >=  C/2 -1 )                       // ����ʵ��
                  begin
                      clk_N = ~clk_N;
                      counter = 0;
                  end
                  else 
                     counter = counter + 1;  
      end
      else if(frequence==3)
      begin
          if(counter >=  D/2 -1 )                       // ����ʵ��
          begin
             clk_N = ~clk_N;
             counter = 0;
          end
          else 
             counter = counter + 1;  
      end
end                           
endmodule

