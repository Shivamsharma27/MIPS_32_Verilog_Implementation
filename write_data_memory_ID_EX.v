`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 06:45:23 PM
// Design Name: 
// Module Name: write_data_memory_ID_EX
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


module write_data_memory_ID_EX(input signal_write_data_memory,input clock,output reg out_write_data_memory);

always@(posedge clock)
out_write_data_memory=signal_write_data_memory;
endmodule


