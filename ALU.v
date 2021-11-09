`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 10:25:34 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input [31:0]A_ALU,input [31:0]B_ALU,input add_control_ALU,input sub_control_ALU,
input addi_control_ALU,input and_control_ALU,input or_control_ALU,input sll_control_ALU,input sra_control_ALU,
input sw_control_ALU,input lw_control_ALU,input branch_taken_decision,output reg[31:0]ALU_result );
always @(*)
begin
if (add_control_ALU==1)
begin
ALU_result=A_ALU+B_ALU;
end
if(addi_control_ALU==1)
ALU_result=A_ALU+B_ALU;
if(branch_taken_decision==1)
ALU_result=A_ALU+B_ALU;


if (sub_control_ALU==1)
ALU_result=A_ALU-B_ALU;
if (and_control_ALU==1)
ALU_result=A_ALU&B_ALU;
if (or_control_ALU==1)
ALU_result=A_ALU|B_ALU;
if (sll_control_ALU==1)
ALU_result=A_ALU<<B_ALU[4:0];
if (sra_control_ALU==1)
ALU_result=A_ALU>>>B_ALU[4:0];
if(sw_control_ALU==1)
ALU_result= A_ALU+B_ALU;
if(lw_control_ALU==1)
ALU_result=A_ALU+B_ALU;
if(sw_control_ALU==1)  //ADD ONE More condition in the sign extend logic to implement and calculate offset for load
ALU_result= A_ALU+B_ALU;


end   
endmodule
