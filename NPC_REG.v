`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 07:17:27 PM
// Design Name: 
// Module Name: NPC_REG
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


module NPC_REG(input [9:0]PC_reg_out,
output [9:0]NPC_reg_out);
reg[9:0] main_reg_NPC;
initial 
begin
main_reg_NPC=10'd0;
end
always@(PC_reg_out)
begin
main_reg_NPC=PC_reg_out +10'd4;
end
assign NPC_reg_out=main_reg_NPC;

endmodule
