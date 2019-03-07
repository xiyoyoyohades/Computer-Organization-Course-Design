`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:00:27
// Design Name: 
// Module Name: datapath
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


module datapath(
input clk,
input [15:0]sw,
output [7:0]seg,
output [7:0]an
    );
    wire rst;
    wire go;
	
	
    assign go = sw[15];
    assign rst = sw[14];
/**********cxy的附加的指令,不影响你直接使用**********************************/
    //wire srlv_;
    //wire xor_;
    //wire lh_;
    //wire bltz_;
    //assign srlv_ = 0;
    //assign xor_ = 0;
    //assign lh_ = 0;
    //assign bltz_ = 0;
/***************************************************/    

//    input [5:0]op,
//    input [5:0]func,
    wire syscall;
    wire regdst;
    wire jal;
    wire regwrite;
    wire alusrc;   //used for alu in_2
    wire [3:0]aluop;
    wire memwrite;
    wire memtoreg;
    wire bne;
    wire beq;
    wire jmp;
    wire jr;
    wire signext;
	wire bltz;
	wire sb;
	wire sv;
	
wire if_equal;
wire j;  // = jmp
assign j = jmp;     //jmp信号等于 j
wire halt;
assign halt = syscall*(~if_equal);
wire [31:0]pc_add4;  //pc 势 4  
wire [31:0]pc_branch;  //跳转的pc
wire pc_sel;
wire pc_en;
wire [31:0]pc_out;
wire [31:0]pc_in;
wire [31:0]r1_out; //reg1 out
wire [31:0]r2_out; //reg2 out
wire [31:0]ins;  //指令孿
wire [31:0]imm_signext;  //imm signed ext
wire [31:0]imm_0ext;  //imm unsigned ext
wire clkn;      //divided clk
wire [31:0]sw_data;   //data gotten by sws, only when halt = 1,it is valid 
wire [19:0]sw_addr;  //addr denoted by sw
wire less;
assign less= r1_out[31:31];
assign sw_addr[4:0] = sw[6:2];
assign sw_addr[19:5] = 15'b0;
//------------------------- pc register & src chose----------------
assign pc_en = go|(~(halt));
assign pc_sel = jr|j|(beq&if_equal)|(bne&(~if_equal))|jal|(less&bltz);
assign pc_add4 = pc_out + 1;
//选择pc是否branch
Multi #(.sel_wid(1), .data_wid(32) ) multi_pc (pc_sel, 
pc_add4, pc_branch, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                                     pc_in);
//pc 的reg
Register pc_reg(clkn, pc_en, rst, pc_in, pc_out);

//pc branch的src的多路?择噿
wire [2:0]pc_branch_src;
wire [2:0]ext_jr;
assign ext_jr[2] = jr;assign ext_jr[1] = jr; assign ext_jr[0] = jr;
wire [2:0]ext_j;
assign ext_j[2] = j;assign ext_j[1] = j;assign ext_j[0] = j;
wire [2:0]ext_jal;
assign ext_jal[2] = jal;assign ext_jal[1] = jal; assign ext_jal[0] = jal;
wire [2:0]ext_beq;
assign ext_beq[2] = beq;assign ext_beq[1] = beq; assign ext_beq[0] = beq;
wire [2:0]ext_bne;
assign ext_bne[2] = bne;assign ext_bne[1] = bne; assign ext_bne[0] = bne;
wire [2:0]ext_bltz;
assign ext_bltz[2] = bltz;assign ext_bltz[1] = bltz; assign ext_bltz[0] = bltz;

//this means: when j, pc_branch_src = 0,..... when bne, pc_branch_src = 4
assign pc_branch_src = (ext_jr&(3'b000))|(ext_j&(3'b001))|(ext_jal&(3'b010))|
                       (ext_beq&(3'b011))|(ext_bne&(3'b100))|(ext_bltz&(3'b101));


wire [31:0]jr_branch;
assign jr_branch = r1_out;
wire [31:0]j_jal_branch;
assign j_jal_branch[25:0] = ins[25:0]; assign j_jal_branch[31:26] = pc_out[31:26]; 
wire [31:0]bne_beq_bltz_branch;
assign bne_beq_bltz_branch = pc_add4 + imm_signext;

Multi #(.sel_wid(3), .data_wid(32) ) multi_pc_branch_src (pc_branch_src, 
    jr_branch,j_jal_branch,j_jal_branch,bne_beq_bltz_branch,bne_beq_bltz_branch,bne_beq_bltz_branch,0,0,0,0,0,0,0,0,0,0,
                          pc_branch);





//---------------------------Insmem------------------
wire [9:0]ins_addr; //指令地址

assign ins_addr = pc_out[9:0];
Insmem insmem(ins_addr, ins);
wire [5:0]op;
wire [5:0]func;
wire [4:0]rs;
wire [4:0]rt;
wire [4:0]rd;
wire [4:0]sa;
wire [15:0]imm;
assign op = ins[31:26];
assign func = ins[5:0];
assign rs = ins[25:21];
assign rt = ins[20:16];
assign rd = ins[15:11];
assign sa = ins[10:6];
assign imm = ins[15:0];
//-----------------------------Sigcontrol--------------------------


Sigcontrol  sigcontrol(op,func,syscall,regdst,jal,regwrite,alusrc,aluop,
memwrite,memtoreg,bne,beq,jmp,jr,signext,bltz,sb,sv);
    
//------------------------------regfile------------------------
wire [4:0]r1_in;
wire [4:0]r2_in;
wire [4:0]w;  //the seq num to write the
wire [31:0]regfile_data_in;
Multi #(.sel_wid(1), .data_wid(5) ) multi_syscall_rs (syscall, 
rs, 5'b00010,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          r1_in);
Multi #(.sel_wid(1), .data_wid(5) ) multi_syscall_rt (syscall, 
rt, 5'b00100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          r2_in);
wire [4:0]w_tmp;  //if jal or direct w 
Multi #(.sel_wid(1), .data_wid(5) ) multi_regdest (regdst, 
     rt, rd,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          w_tmp);
Multi #(.sel_wid(1), .data_wid(5) ) multi_jal_w (jal, 
     w_tmp, 5'b11111,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                          w);

Regfile  regfile(clkn, regwrite, r1_in, r2_in, w, regfile_data_in,r1_out,r2_out);


//----------------------------alu-------------------------
wire [31:0]alu_b_in;
wire [31:0]imm_or_r2_out;
wire [31:0]ext_imm;
wire [31:0]result1;
wire [31:0]result2;

wire [4:0]shamt;

Bitextern bitext_imm0(0, imm,imm_0ext);
Bitextern bitext_imm1(1, imm,imm_signext);
Multi #(.sel_wid(1), .data_wid(32) ) multi_imm_0or1ext (signext, 
     imm_0ext, imm_signext,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                         ext_imm);
Multi #(.sel_wid(1), .data_wid(32) ) multi_alusrcb (alusrc, 
     r2_out,ext_imm,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                         imm_or_r2_out);
Multi #(.sel_wid(1), .data_wid(32) ) multi_syscall (syscall, 
      imm_or_r2_out,32'h00000022,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                         alu_b_in);
						 
Multi #(.sel_wid(1), .data_wid(5)) multi_shamt (sv, 
		sa, r1_out[4:0],0,0,0,0,0,0,0,0,0,0,0,0,0,0,
		shamt);
Alu alu(r1_out, alu_b_in, aluop, shamt, if_equal, result1, result2);


//---------------------------datamem---------------------------
wire [19:0]datamem_addr_in;
wire [31:0]datamem_data_in;
wire [31:0]datamem_data_out;
wire [31:0]regfile_data_in_tmp;

wire [3:0]select;
wire [3:0]sb_select;

assign sb_select=(4'b0001)<<(result1[1:0]);

Multi #(.sel_wid(1), .data_wid(4)) multi_select(sb,
	4'b1111, sb_select, 0,0,0,0,0,0,0,0,0,0,0,0,0,0,
	select);

//when halt is 1,that means, you can get the datas from mem by sw[]
Multi #(.sel_wid(1), .data_wid(20) ) multi_datamem_addr (halt, 
      result1[21:2],sw_addr,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                       datamem_addr_in);
                       
Memory datamem(clkn,memwrite,select,1'b1,rst,datamem_addr_in,r2_out,datamem_data_out);

//this means only when halt = 1, you can get the sw_data, or it is zero
wire [31:0]ext_halt;
assign ext_halt[0] = halt;
assign ext_halt[1] = halt;
assign ext_halt[3:2] = ext_halt[1:0];
assign ext_halt[7:4] = ext_halt[3:0];
assign ext_halt[15:8] = ext_halt[7:0];
assign ext_halt[31:16] = ext_halt[15:0];       //extend halt to 32 bit
assign sw_data = ext_halt & datamem_data_out;

Multi #(.sel_wid(1), .data_wid(32) ) multi_memtoreg (memtoreg, 
      result1, datamem_data_out,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     regfile_data_in_tmp);


//for regfile data_in influenced by jal
Multi #(.sel_wid(1), .data_wid(32) ) multi_regfile_datain_jal (jal, 
      regfile_data_in_tmp, pc_add4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                     regfile_data_in);


/**********************show module call***************************/
wire [31:0]led_data;
wire led_data_reg_en;
wire [1:0]frequence;
wire [1:0]state_show;
wire clk_N;  //分频后的时钟
wire show_clk; //显示的时钿

wire [3:0]wan;
wire [3:0]qian;
wire [3:0]bai;
wire [3:0]shi;
wire [3:0]ge;

wire [3:0]tiao_qian;
wire [3:0]tiao_bai;
wire [3:0]tiao_shi;
wire [3:0]tiao_ge;

wire [3:0]wu_tiao_qian;
wire [3:0]wu_tiao_bai;
wire [3:0]wu_tiao_shi;
wire [3:0]wu_tiao_ge;

wire zhong_zhou_qi_incress_signal;
wire tiao_jian_incress_signal;
wire wu_tiao_jian_incress_signal;

wire [31:0]zong_counter_data;
wire [31:0]tiao_jian_counter_data;
wire [31:0]wu_tiao_jian_counter_data;
//wire clk is previously done
assign led_data_reg_en = if_equal&syscall;
assign zhong_zhou_qi_incress_signal=(~halt)|go;
assign tiao_jian_incress_signal=(if_equal&beq)|((~if_equal)&bne);
assign wu_tiao_jian_incress_signal=jmp|jr|jal;

/****---------------------------leddata-------------------------------------*****/
Register led_data_reg(clkn, led_data_reg_en, rst, r2_out, led_data);

//here you append your moudluel
//j, jr, jal, be1, bne
//halt
//sw[15]is seted as go
//sw[14]is seted as rst
//sw[1]is seted as frequency select
//sw[0]is seted as content select
//[31:0]sw_data is data get from mem by sw,this shall be in your input ports
//[19:0]sw_addr is sw address , this shall be in your output prots
//the process : sw_addr ---> sw_data i've done for you
//      add the call of show here

select_content my_select_content(sw[0],state_show);
select_frequence my_select_frequence(sw[1],frequence);


Clkn my_clkn(clk,frequence,clkn);
xianshi_clk my_show_clk(clk,show_clk);
	 //看是否还霿要开关绑定地坿
Counter my_counter1(clkn,zhong_zhou_qi_incress_signal,rst,zong_counter_data);
Counter my_counter2(clkn,tiao_jian_incress_signal,rst,tiao_jian_counter_data);
Counter my_counter3(clkn,wu_tiao_jian_incress_signal,rst,wu_tiao_jian_counter_data);	 
	 
use_counter my_use_counter(zong_counter_data,tiao_jian_counter_data,wu_tiao_jian_counter_data,clkn,rst,zhong_zhou_qi_incress_signal,tiao_jian_incress_signal,wu_tiao_jian_incress_signal,    wan,qian,bai,shi,ge,  tiao_qian,tiao_bai,tiao_shi,tiao_ge,  wu_tiao_qian,wu_tiao_bai,wu_tiao_shi,wu_tiao_ge);
Show my_show(show_clk,state_show,led_data,datamem_data_out,  ge,shi,bai,qian,wan,  tiao_ge,tiao_shi,tiao_bai,tiao_qian,  wu_tiao_ge,wu_tiao_shi,wu_tiao_bai,wu_tiao_qian, seg,an);

endmodule