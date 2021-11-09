`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 07:12:40 PM
// Design Name: 
// Module Name: pc_reg_synchronous
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


module PC_reg_synchronous(input [11:0]addr_mux_reg_out,
input clock,
output [11:0]PC_reg_out
 );
 reg [11:0]main_reg;
 always@(posedge clock)
 begin
 main_reg=addr_mux_reg_out;
 end
 assign PC_reg_out=main_reg;
endmodule
