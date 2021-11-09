`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:45:19 AM
// Design Name: 
// Module Name: add_control_ID_EX_stage
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


module add_control_ID_EX_stage(input signal_add,input clock,output reg out_add_control_reg);

always@(posedge clock)
out_add_control_reg=signal_add;
endmodule
