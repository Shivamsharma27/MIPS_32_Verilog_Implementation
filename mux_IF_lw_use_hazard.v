`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 05:00:40 PM
// Design Name: 
// Module Name: mux_IF_lw_use_hazard
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


module mux_IF_lw_use_hazard(input [31:0]instruction_from_data_memory,input [31:0]instruction_from_decode,input lw_use_control_stall,output reg [31:0]output_instruction);
always@(*)
begin
if (lw_use_control_stall==1)
output_instruction=instruction_from_decode;
else
output_instruction=instruction_from_data_memory;
end
endmodule
