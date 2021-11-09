`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2021 10:04:25 AM
// Design Name: 
// Module Name: ALU_OUT_EX_MEM
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


module ALU_OUT_EX_MEM(input [31:0]data_from_ALU,input clock,output reg [31:0]data_for_Mem_stage);
always@(posedge clock)
begin
data_for_Mem_stage=data_from_ALU;
end

endmodule


