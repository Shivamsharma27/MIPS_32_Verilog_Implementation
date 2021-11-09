`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:47:49 AM
// Design Name: 
// Module Name: addi_control_ID_EX_stage
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


module addi_control_ID_EX_stage(input signal_addi,input clock,output reg out_addi_control_reg);

always@(posedge clock)
out_addi_control_reg=signal_addi;
endmodule


