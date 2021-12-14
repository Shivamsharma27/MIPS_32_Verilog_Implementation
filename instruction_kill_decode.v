`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 07:37:44 AM
// Design Name: 
// Module Name: instruction_kill
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
module instruction_kill_decode(input [31:0]input1,output reg[31:0]kill_instruction,input control_kill,input lw_use_stall_control);
parameter nop=32'b00000000000000000000000000010011;
always@(*)
begin
if ((control_kill==1)|(lw_use_stall_control==1))
begin
kill_instruction=nop;
end
else 
kill_instruction=input1;
end
endmodule

