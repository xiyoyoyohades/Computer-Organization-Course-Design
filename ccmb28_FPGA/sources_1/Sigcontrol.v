`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:33:05
// Design Name: 
// Module Name: Sigcontrol
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


module Sigcontrol(
input [5:0]op,
input [5:0]func,
output syscall,
output regdst,
output jal,
output regwrite,
output alusrc,   //used for alu in_2
output [3:0]aluop,
output memwrite,
output memtoreg,
output bne,
output beq,
output jmp,
output jr,
output signext,
output bltz,
output sb,
output sv
    );
    assign aluop[3] = {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0]};
    
    assign aluop[2] = {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0]}|{
    op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]}|{
    op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0]}|
	{op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]};
    
    assign aluop[1] = {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&~func[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0]};

    assign aluop[0] = {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0]}|{
    op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]}|{
    op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]}|
	{op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0]};
    
    assign memtoreg =  op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
    
    assign memwrite =  {op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0]}|
	{op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]};
    
    assign alusrc = {~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0]}|{
    op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]}|{
    op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0]}|
	{op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]};
    
    assign regwrite = {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&op[0]}|{
    op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]}|{
    ~op[5]&~op[4]&op[3]&op[2]&~op[1]&~op[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&~func[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]};
    
    assign syscall = ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&func[3]&func[2]&~func[1]&~func[0];
    
    assign signext = {~op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&~op[1]&op[0]}|{
    ~op[5]&~op[4]&op[3]&~op[2]&op[1]&~op[0]}|{
    op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0]}|{
    op[5]&~op[4]&op[3]&~op[2]&op[1]&op[0]}|
	{op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0]};
    
    assign regdst = {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&~func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&~func[0]}|{
    ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&func[5]&~func[4]&func[3]&~func[2]&func[1]&func[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&~func[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]};
    
    assign beq = ~op[5]&~op[4]&~op[3]&op[2]&~op[1]&~op[0];
    
    assign bne = ~op[5]&~op[4]&~op[3]&op[2]&~op[1]&op[0];
    
    assign jr = ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&func[3]&~func[2]&~func[1]&~func[0];
    
    assign jmp = ~op[5]&~op[4]&~op[3]&~op[2]&op[1]&~op[0];
    
    assign jal = ~op[5]&~op[4]&~op[3]&~op[2]&op[1]&op[0];
	
	assign bltz= ~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&op[0];
	
	assign sb= op[5]&~op[4]&op[3]&~op[2]&~op[1]&~op[0];
	
	assign sv= {~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&~func[0]}|
	{~op[5]&~op[4]&~op[3]&~op[2]&~op[1]&~op[0]&~func[5]&~func[4]&~func[3]&func[2]&func[1]&func[0]};

endmodule
