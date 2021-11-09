`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 09:14:05 PM
// Design Name: 
// Module Name: MUX_mem_stage
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


module MUX_mem_stage(input [31:0]A_mem_1, input[31:0] A_mem_2,input mux_mem_line,output [31:0]A_mem_data);
reg [31:0]data_reg_mem;
always @(*)
begin
if (mux_mem_line==0)
begin
data_reg_mem=A_mem_1;
end
else if (mux_mem_line==1)
begin
data_reg_mem=A_mem_2;
end
end
assign A_mem_data=data_reg_mem;
endmodule
