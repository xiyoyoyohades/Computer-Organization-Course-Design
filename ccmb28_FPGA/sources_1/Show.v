`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 16:25:52
// Design Name: 
// Module Name: Show
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


module Show(show_clk,state_show,led_data,   mem_data,  ge,shi,bai,qian,wan,  tiao_ge,tiao_shi,tiao_bai,tiao_qian,  wu_tiao_ge,wu_tiao_shi,wu_tiao_bai,wu_tiao_qian, seg,an);
input show_clk;
input [1:0]state_show;
input [31:0]led_data;

input [31:0]mem_data;

input [3:0]ge;
input [3:0]shi;
input [3:0]bai;
input [3:0]qian;
input [3:0]wan;

input [3:0]tiao_ge;
input [3:0]tiao_shi;
input [3:0]tiao_bai;
input [3:0]tiao_qian;

input [3:0]wu_tiao_ge;
input [3:0]wu_tiao_shi;
input [3:0]wu_tiao_bai;
input [3:0]wu_tiao_qian;

output reg[7:0]seg;
output reg[7:0]an;

reg [3:0]num;
reg [3:0]temp;
reg [3:0]temp2;
reg [3:0]temp3;
reg [3:0]temp4;
initial begin
    an=8'b11111111;
   temp= 0 ;
   temp2= 0 ;
   temp3= 0 ;
   temp4 = 0;
    num=0;
    seg = 0;
end
//always@(posedge clk)  //加到数据通路中
//begin
//    Clkn(clk,frequence,clk_N);
//    xianshi_clk(clk,show_clk);
//end


always@(posedge show_clk)
begin
    if(state_show==0) //显示leddata
    begin
        if(num==0)
        begin
            temp=led_data[3:0];
            an=8'b11111110;
            num=num+1;
        end
        else if(num==1)
        begin
            temp=led_data[7:4];
            an=8'b11111101;
            num=num+1;
        end
        else if(num==2)
        begin
            temp=led_data[11:8];
            an=8'b11111011;
            num=num+1;
        end
        else if(num==3)
        begin
            temp=led_data[15:12];
            an=8'b11110111;
            num=num+1;
        end
        else if(num==4)
        begin
            temp=led_data[19:16];
            an=8'b11101111;
            num=num+1;
        end
        else if(num==5)
        begin
            temp=led_data[23:20];
            an=8'b11011111;
            num=num+1;
        end
        else if(num==6)
        begin
            temp=led_data[27:24];
            an=8'b10111111;
            num=num+1;
        end
        else if(num==7)
        begin
            temp=led_data[31:28];
            an=8'b01111111;
            num=0;
        end
        else
        begin
        end
        
        case(temp)
            4'b0000:seg = 8'b11000000;
            4'b0001:seg = 8'b11111001;
            4'b0010: seg = 8'b10100100;
            4'b0011: seg = 8'b10110000;
            4'b0100: seg = 8'b10011001;
            4'b0101: seg = 8'b10010010;
            4'b0110: seg = 8'b10000010;
            4'b0111: seg = 8'b11111000;
            4'b1000:seg = 8'b10000000;
            4'b1001:seg = 8'b10011000;
            4'b1010: seg = 8'b10001000;
            4'b1011: seg = 8'b10000011;
            4'b1100: seg = 8'b11000110;
            4'b1101: seg = 8'b10100001;
            4'b1110: seg = 8'b10000110;
            4'b1111: seg = 8'b10001110;        
        endcase
    end
    
    
    else if(state_show==1)//显示时钟周期
    begin
        if(num==0)
        begin
            temp2=ge;
            an=8'b11111110;
            num=num+1;
        end
        else if(num==1)
        begin
            temp2=shi;
            an=8'b11111101;
            num=num+1;
        end
        else if(num==2)
        begin
            temp2=bai;
            an=8'b11111011;
            num=num+1;
        end
        else if(num==3)
        begin
            temp2=qian;
            an=8'b11110111;
            num=num+1;
        end
        else if(num==4)
        begin
            temp2=wan;
            an=8'b11101111;
            num=0;
        end
        else
        begin
            an=8'b11111111;
            num=0;
        end
        case(temp2)
            4'b0000:seg = 8'b11000000;
            4'b0001:seg = 8'b11111001;
            4'b0010: seg = 8'b10100100;
            4'b0011: seg = 8'b10110000;
            4'b0100: seg = 8'b10011001;
            4'b0101: seg = 8'b10010010;
            4'b0110: seg = 8'b10000010;
            4'b0111: seg = 8'b11111000;
            4'b1000:seg = 8'b10000000;
            4'b1001:seg = 8'b10011000;
            4'b1010: seg = 8'b10001000;
            4'b1011: seg = 8'b10000011;
            4'b1100: seg = 8'b11000110;
            4'b1101: seg = 8'b10100001;
            4'b1110: seg = 8'b10000110;
            4'b1111: seg = 8'b10001110;        
        endcase
    end
    
    else if(state_show==2) //内存数据观察
    begin
        if(num==0)
        begin
            temp3=mem_data[3:0];
            an=8'b11111110;
            num=num+1;
        end
        else if(num==1)
        begin
            temp3=mem_data[7:4];
            an=8'b11111101;
            num=num+1;
        end
        else if(num==2)
        begin
            temp3=mem_data[11:8];
            an=8'b11111011;
            num=num+1;
        end
        else if(num==3)
        begin
            temp3=mem_data[15:12];
            an=8'b11110111;
            num=num+1;
        end
        else if(num==4)
        begin
            temp3=mem_data[19:16];
            an=8'b11101111;
            num=num+1;
        end
        else if(num==5)
        begin
            temp3=mem_data[23:20];
            an=8'b11011111;
            num=num+1;
        end
        else if(num==6)
        begin
            temp3=mem_data[27:24];
            an=8'b10111111;
            num=num+1;
        end
        else if(num==7)
        begin
            temp3=mem_data[31:28];
            an=8'b01111111;
            num=0;
        end
        else
        begin
        end
        case(temp3)
            4'b0000:seg = 8'b11000000;
            4'b0001:seg = 8'b11111001;
            4'b0010: seg = 8'b10100100;
            4'b0011: seg = 8'b10110000;
            4'b0100: seg = 8'b10011001;
            4'b0101: seg = 8'b10010010;
            4'b0110: seg = 8'b10000010;
            4'b0111: seg = 8'b11111000;
            4'b1000:seg = 8'b10000000;
            4'b1001:seg = 8'b10011000;
            4'b1010: seg = 8'b10001000;
            4'b1011: seg = 8'b10000011;
            4'b1100: seg = 8'b11000110;
            4'b1101: seg = 8'b10100001;
            4'b1110: seg = 8'b10000110;
            4'b1111: seg = 8'b10001110;        
        endcase
    end
    else if(state_show==3) //条件周期数，无条件分支周期数
    begin
        if(num==0)
        begin
            temp4=wu_tiao_ge;
            an=8'b11111110;
            num=num+1;
        end
        else if(num==1)
        begin
            temp4=wu_tiao_shi;
            an=8'b11111101;
            num=num+1;
        end
        else if(num==2)
        begin
            temp4=wu_tiao_bai;
            an=8'b11111011;
            num=num+1;
        end
        else if(num==3)
        begin
           temp4=wu_tiao_qian;
            an=8'b11110111;
            num=num+1;
        end
        else if(num==4)
        begin
            temp4=tiao_ge;
            an=8'b11101111;
            num=num+1;
        end
        else if(num==5)
        begin
            temp4=tiao_shi;
            an=8'b11011111;
            num=num+1;
        end
        else if(num==6)
        begin
            temp4=tiao_bai;
            an=8'b10111111;
            num=num+1;
        end
        else if(num==7)
        begin
            temp4=tiao_qian;
            an=8'b01111111;
            num=0;
        end
        else 
        begin
        end
        case(temp4)
            4'b0000:seg = 8'b11000000;
            4'b0001:seg = 8'b11111001;
            4'b0010: seg = 8'b10100100;
            4'b0011: seg = 8'b10110000;
            4'b0100: seg = 8'b10011001;
            4'b0101: seg = 8'b10010010;
            4'b0110: seg = 8'b10000010;
            4'b0111: seg = 8'b11111000;
            4'b1000:seg = 8'b10000000;
            4'b1001:seg = 8'b10011000;
            4'b1010: seg = 8'b10001000;
            4'b1011: seg = 8'b10000011;
            4'b1100: seg = 8'b11000110;
            4'b1101: seg = 8'b10100001;
            4'b1110: seg = 8'b10000110;
            4'b1111: seg = 8'b10001110;        
        endcase
    end
    else 
    begin
    end
end
endmodule
