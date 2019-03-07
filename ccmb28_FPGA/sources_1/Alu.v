`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/03/04 15:30:39
// Design Name: 
// Module Name: Alu
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


module Alu(
input [31:0]src_a,
input [31:0]src_b,
input [3:0]alu_op,
input [4:0]shmat,   // the bits to shmat
output reg eq,
output reg [31:0]result1,
output reg [31:0]result2   //espicailly for mul and divide
    );
reg [63:0]mul_tmp;
    initial
    begin
        eq = 0;
        result1 <= 32'h00000;
        result2 <= 32'h00000; 
    end
    always@(src_a or src_b or alu_op or shmat)
    begin
        if(src_a==src_b)
            eq = 1;
        else 
            eq = 0;
        case(alu_op)
            4'b0000:        //logical left shift
            begin
                result1 <= src_b<<shmat;
                result2 <= 0;
            end
            4'b0001:        //algorithm right shift
            begin
                result1 <= ($signed(src_b))>>>shmat;
                result2 <= 0;
            end
            4'b0010:        //logical right shift
            begin
                result1 <= src_b>>shmat; 
                result2 <= 0;           
            end
            4'b0011:        //unsigned multiply
            begin
                mul_tmp = src_a*src_b;
                result1 <= mul_tmp[31:0];
                result2 <= mul_tmp[63:32];          
            end
            4'b0100:        //unsigned divide
            begin
                result1 <= src_a / src_b; 
                result2 <= src_a % src_b;         
            end 
            4'b0101:        //add
            begin
                result1 <= src_a + src_b;
                result2 <= 0;            
            end 
            4'b0110:        //sub
            begin
                result1 <= src_a - src_b;
                result2 <= 0;            
            end  
            4'b0111:        //and
            begin
                result1 <= src_a & src_b;
                result2 <= 0;    
            end 
            4'b1000:        //or
            begin
                result1 <= src_a | src_b;
                result2 <= 0;            
            end
            4'b1001:        //xor
            begin
                result1 <= src_a ^ src_b;
                result2 <= 0;           
            end
            4'b1010:        //nor
            begin
                result1 <= ~(src_a | src_b);
                result2 <= 0;            
            end
            4'b1011:        //signed cmp
            begin
                if(src_a[15:15]^src_b[15:15])       //different signal
                    result1 <= (src_a < src_b) ? 0 : 1;
                else                                //same signal
                    result1 <= (src_a < src_b) ? 1 : 0;    
                result2 <= 0;           
            end
            4'b1100:        //unsigned cmp
            begin
                result1 <= (src_a < src_b) ? 1 : 0; 
                result2 <= 0;             
            end          
            default:
            begin
                result1 <= 0;
                result2 <= 0;
            end
        endcase
    end
endmodule
