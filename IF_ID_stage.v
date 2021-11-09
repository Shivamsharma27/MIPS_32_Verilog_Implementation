`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 11:58:13 PM
// Design Name: 
// Module Name: IF_ID_stage
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


module IF_ID_stage(input [31:0]instruction_reg_out,input clock,output [31:0]full_instruction);
reg [31:0]mid_reg;
always@(posedge clock)
begin
mid_reg=instruction_reg_out;
end
assign full_instruction=mid_reg;

endmodule
