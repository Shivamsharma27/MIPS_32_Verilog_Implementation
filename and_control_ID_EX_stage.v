`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 10:49:29 AM
// Design Name: 
// Module Name: and_control_ID_EX_stage
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


module and_control_ID_EX_stage(input signal_and,input clock,output reg out_and_control_reg);

always@(posedge clock)
out_and_control_reg=signal_and;
endmodule
