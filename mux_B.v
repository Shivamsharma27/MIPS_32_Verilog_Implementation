`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2021 10:36:17 PM
// Design Name: 
// Module Name: mux_B
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

module mux_B(input [31:0]B1, input[31:0] B2,input [1:0]mux_lines,output [31:0]B_data);
reg [31:0]data_reg;
always @(*)
begin
if (mux_lines[1]==0)
begin
data_reg=B1;
end
else if (mux_lines[1]==1)
begin
data_reg=B2;
end
end
assign B_data=data_reg;
endmodule
