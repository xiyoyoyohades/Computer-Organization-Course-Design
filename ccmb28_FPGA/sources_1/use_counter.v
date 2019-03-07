`timescale 1ns / 1ps


module use_counter(zong_counter_data,tiao_jian_counter_data,wu_tiao_jian_counter_data,clk_n,rst,zhong_zhou_qi_incress_signal,tiao_jian_incress_signal,wu_tiao_jian_incress_signal,    wan,qian,bai,shi,ge,  tiao_qian,tiao_bai,tiao_shi,tiao_ge,  wu_tiao_qian,wu_tiao_bai,wu_tiao_shi,wu_tiao_ge);
input clk_n;
input rst;
input zhong_zhou_qi_incress_signal;
input tiao_jian_incress_signal;
input wu_tiao_jian_incress_signal;
output reg [3:0]wan;
output reg [3:0]qian;
output reg [3:0]bai;
output reg [3:0]shi;
output reg [3:0]ge;

output reg [3:0]tiao_qian;
output reg [3:0]tiao_bai;
output reg [3:0]tiao_shi;
output reg [3:0]tiao_ge;

output reg [3:0]wu_tiao_qian;
output reg [3:0]wu_tiao_bai;
output reg [3:0]wu_tiao_shi;
output reg [3:0]wu_tiao_ge;

initial begin
    wan=0;
 qian=0;
 bai=0;
 shi=0;
 ge=0;

 tiao_qian=0;
 tiao_bai=0;
 tiao_shi=0;
 tiao_ge=0;

 wu_tiao_qian=0;
 wu_tiao_bai=0;
 wu_tiao_shi=0;
 wu_tiao_ge=0;

end

input [31:0]zong_counter_data;
input [31:0]tiao_jian_counter_data;
input [31:0]wu_tiao_jian_counter_data;
always@(posedge clk_n)
begin
    wan=zong_counter_data/10000;
    qian=zong_counter_data/1000-wan*10;
    bai=zong_counter_data/100-wan*100-qian*10;
    shi=zong_counter_data/10-wan*1000-qian*100-bai*10;
    ge=zong_counter_data-wan*10000-qian*1000-bai*100-shi*10;
    
    tiao_qian=tiao_jian_counter_data/1000;
    tiao_bai=tiao_jian_counter_data/100-tiao_qian*10;
    tiao_shi=tiao_jian_counter_data/10-tiao_qian*100-tiao_bai*10;
    tiao_ge=tiao_jian_counter_data-tiao_qian*1000-tiao_bai*100-tiao_shi*10;
    
    wu_tiao_qian=wu_tiao_jian_counter_data/1000;
    wu_tiao_bai=wu_tiao_jian_counter_data/100-wu_tiao_qian*10;
    wu_tiao_shi=wu_tiao_jian_counter_data/10-wu_tiao_qian*100-wu_tiao_bai*10;
    wu_tiao_ge=wu_tiao_jian_counter_data-wu_tiao_qian*1000-wu_tiao_bai*100-wu_tiao_shi*10;
end    

endmodule
