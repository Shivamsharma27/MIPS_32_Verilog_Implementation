`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2021 09:38:21 AM
// Design Name: 
// Module Name: mac_control_ID_EX_stage
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


module mac_control_ID_EX_stage
(input signal_mac,input clock,output reg out_mac_control_reg);

always@(posedge clock)
out_mac_control_reg=signal_mac;
endmodule

