`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 03:09:36 PM
// Design Name: 
// Module Name: lw_use_stall_unit
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
module lw_use_stall_unit(input [31:0]instruction_D,input [31:0]instruction_EX,input unit_activation_signal,output reg signal_to_stall);
reg [4:0]rs1_D;
//reg [4:0]rs2_D;
reg [4:0]rd_EX;
always@(*)
begin
if (unit_activation_signal==1)
begin
rs1_D=instruction_D[19:15];
//rs2_D=instruction_D[24:20];
rd_EX=instruction_EX[11:7];
if ((rs1_D==rd_EX))
begin
signal_to_stall=1'b1;
end
else
begin
signal_to_stall=1'b0;
end
end

end
endmodule
