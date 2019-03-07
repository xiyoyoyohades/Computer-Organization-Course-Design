`timescale 1ns / 1ps


module sim_datapath;
 reg clk;
 reg [15:0]sw;

wire [7:0]seg;
wire [7:0]an; 
// module datapath(
// input clk,
// input [15:0]sw,
// output [7:0]seg,
// output [7:0]an
//     );
initial begin
     clk = 0;
     sw = 0;
     forever begin
     #1
     clk = ~clk;
     end
end


datapath DATAPATH( clk,sw,seg,an );

initial begin
//load data
    #50000  ;
    end
    
    
    
    

endmodule
