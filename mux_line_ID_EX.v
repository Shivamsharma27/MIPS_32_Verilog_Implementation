`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2021 01:05:47 PM
// Design Name: 
// Module Name: mux_line_ID_EX
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


module mux_line_ID_EX(input [1:0]mux_line_input,
output reg [1:0] mux_line_output,
input clock);
always@(posedge clock)
begin
mux_line_output=mux_line_input;
end
endmodule
