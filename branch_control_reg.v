`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 01:13:15 PM
// Design Name: 
// Module Name: branch_control_reg
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


module branch_control_reg(input branch_control_reg_in,input clock,
output reg branch_control_reg_out);
always@(posedge clock)
branch_control_reg_out=branch_control_reg_in;
endmodule
