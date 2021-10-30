`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 09:48:21 AM
// Design Name: 
// Module Name: ID_EX_B_32
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


module ID_EX_B_32(input clock, input [31:0]source_data,output [31:0]source_reg_data);
reg [31:0] data_reg;
always@(posedge clock)
begin 
data_reg=source_data;
end
assign source_reg_data[31:0]=data_reg[31:0];
endmodule
