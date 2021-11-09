`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:56:34 AM
// Design Name: 
// Module Name: sub_control_ID_EX_stage
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


module sub_control_ID_EX_stage(
input signal_sub,input clock,output reg out_sub_control_reg);

always@(posedge clock)
out_sub_control_reg=signal_sub;
endmodule
