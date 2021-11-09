`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2021 10:35:39 PM
// Design Name: 
// Module Name: mux_A
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


module mux_A(input [31:0]A1, input[11:0] A2,input [1:0]mux_lines,output [31:0]A_data);
reg [31:0]data_reg;
always @(*)
begin
if (mux_lines[0]==0)
begin
data_reg=A1;
end
else if (mux_lines[0]==1)
begin
data_reg={{20{A2[11]}},A2};   //bcz incoming address is 12 bit
end
end
assign A_data=data_reg;
endmodule
