`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/05/2021 10:27:47 AM
// Design Name: 
// Module Name: or_control_ID_EX_stage
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


module or_control_ID_EX_stage(input signal_or,input clock,output reg out_or_control_reg);

always@(posedge clock)
out_or_control_reg=signal_or;
endmodule