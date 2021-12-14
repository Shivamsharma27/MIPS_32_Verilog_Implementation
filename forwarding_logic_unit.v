`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 06:22:41 PM
// Design Name: 
// Module Name: forwarding_logic_unit
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
module forwarding_logic_unit(input [31:0] instruction_in_execution,input[31:0]instruction_in_writeback,
input [31:0] instruction_in_mem,output reg[1:0]upper_ALU_mux_select_line_wire,
output reg[1:0]lower_ALU_mux_select_line_wire);
//reg [4:0]rs1_D;
//reg [4:0]rs2_D;
reg [4:0]rs1_EX;
reg [4:0]rs2_EX;
reg [4:0]rd_WB;
reg [4:0]rd_MEM;

always@(*)
begin

rs1_EX=instruction_in_execution[19:15];
rs2_EX=instruction_in_execution[24:20];
rd_MEM=instruction_in_mem[11:7];
rd_WB=instruction_in_writeback[11:7];

if ((rs1_EX==rd_MEM)&(rs2_EX!==rd_WB))
begin

upper_ALU_mux_select_line_wire=2'b01;
lower_ALU_mux_select_line_wire=2'b00;
end
else if ((rs2_EX==rd_MEM)&(rs1_EX!==rd_WB))
begin
lower_ALU_mux_select_line_wire=2'b01;
upper_ALU_mux_select_line_wire=2'b00;
end
else if ((rs1_EX==rd_WB)&(rs2_EX!==rd_MEM))

begin
upper_ALU_mux_select_line_wire=2'b10;
lower_ALU_mux_select_line_wire=2'b00;
end

else if ((rs2_EX==rd_WB)&(rs1_EX!==rd_MEM))
begin
lower_ALU_mux_select_line_wire=2'b10;
upper_ALU_mux_select_line_wire=2'b00;
end
else if ((rs1_EX==rd_MEM)&(rs2_EX==rd_WB))
begin
lower_ALU_mux_select_line_wire=2'b10;
upper_ALU_mux_select_line_wire=2'b01;
end
else if ((rs2_EX==rd_MEM)&(rs1_EX==rd_WB))
begin
lower_ALU_mux_select_line_wire=2'b01;
upper_ALU_mux_select_line_wire=2'b10;
end
/*if (rs2_EX==rd_WB)
begin
lower_ALU_mux_select_line_wire=2'b10;
if((rs1_EX==rd_MEM))
upper_ALU_mux_select_line_wire=2'b01;
else 
upper_ALU_mux_select_line_wire=2'b00;

end

if (rs1_EX==rd_WB)
begin
upper_ALU_mux_select_line_wire=2'b10;
if((rs1_EX==rd_MEM))
lower_ALU_mux_select_line_wire=2'b01;
else 
lower_ALU_mux_select_line_wire=2'b00;

end
*/

else
begin
upper_ALU_mux_select_line_wire=2'b00;
lower_ALU_mux_select_line_wire=2'b00;
end
end

endmodule