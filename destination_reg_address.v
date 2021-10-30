`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:20:16 AM
// Design Name: 
// Module Name: destination_reg_address
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


module destination_reg_address(
input [4:0]dest_addr_input,input clock,output[4:0]destination_addr_output);
reg [4:0]data_reg;
always@(posedge clock)
begin
data_reg=dest_addr_input;
end
assign destination_addr_output[4:0]=data_reg[4:0];
endmodule
