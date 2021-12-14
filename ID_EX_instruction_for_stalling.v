`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 08:30:12 AM
// Design Name: 
// Module Name: ID_EX_instruction_for_stalling
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


module instruction_buffer(input [31:0]full_instruction_in,input clock,
output [31:0]full_instruction_out);
reg [31:0]mid_reg;
always@(posedge clock)
begin
mid_reg=full_instruction_in;
end
assign full_instruction_out=mid_reg;

endmodule

