`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:50:54 AM
// Design Name: 
// Module Name: lw_control_ID_EX_stage
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


module lw_control_ID_EX_stage(input signal_lw,input clock,output reg out_lw_control_reg);

always@(posedge clock)
out_lw_control_reg=signal_lw;
endmodule
