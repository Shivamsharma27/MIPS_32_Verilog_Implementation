`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 05:51:32 PM
// Design Name: 
// Module Name: lower_ALU_mux
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


module lower_ALU_mux(
input [31:0]data_from_instruction_memory,input [31:0]data_from_mem_stage,input [31:0]data_from_WB_stage,input [1:0]lower_ALU_mux_select_line,output reg [31:0]bypassed_data);
always@(*)
begin
if (lower_ALU_mux_select_line==2'b00)
bypassed_data=data_from_instruction_memory;
else if (lower_ALU_mux_select_line==2'b01)
bypassed_data=data_from_mem_stage;
else if(lower_ALU_mux_select_line==2'b10)
bypassed_data=data_from_WB_stage;
/*else if(upper_ALU_mux_select_line==2'b11)
bypassed_data=data_from_data_mem_out;*/
else
bypassed_data=data_from_instruction_memory;
end
endmodule


