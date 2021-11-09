`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 07:08:11 PM
// Design Name: 
// Module Name: write_destination_reg_ID_EX_stage
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


module write_destination_reg_ID_EX_stage(input signal_write_destination_reg,input clock,output reg out_write_destination_reg);

always@(posedge clock)
out_write_destination_reg=signal_write_destination_reg;
endmodule