`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 07:12:40 PM
// Design Name: 
// Module Name: pc_reg_synchronous
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


module PC_reg_synchronous(input [9:0]NPC_reg_out,
input clock,
output [9:0]PC_reg_out
 );
 reg [9:0]main_reg;
 always@(posedge clock)
 begin
 main_reg=NPC_reg_out;
 end
 assign PC_reg_out=main_reg;
endmodule
