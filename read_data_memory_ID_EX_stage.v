`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 06:42:21 PM
// Design Name: 
// Module Name: read_data_memory_ID_EX_stage
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


module read_data_memory_ID_EX_stage(input signal_read_data_memory,input clock,output reg out_read_data_memory);

always@(posedge clock)
out_read_data_memory=signal_read_data_memory;
endmodule