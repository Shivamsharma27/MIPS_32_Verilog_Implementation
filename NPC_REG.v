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


module NPC_REG(input [11:0]PC_reg_out,
output [11:0]NPC_reg_out);
reg[11:0] main_reg_NPC;
initial 
begin
main_reg_NPC=12'd0;
end
always@(PC_reg_out)
begin
main_reg_NPC=PC_reg_out +12'd4;
end
assign NPC_reg_out=main_reg_NPC;

endmodule
