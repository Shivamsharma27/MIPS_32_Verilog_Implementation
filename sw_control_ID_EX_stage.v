`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:58:16 AM
// Design Name: 
// Module Name: sw_control_ID_EX_stage
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


module sw_control_ID_EX_stage(input signal_sw,input clock,output reg out_sw_control_reg);

always@(posedge clock)
out_sw_control_reg=signal_sw;
endmodule