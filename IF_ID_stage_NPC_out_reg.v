`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 08:05:46 AM
// Design Name: 
// Module Name: IF_ID_stage_NPC_out_reg
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


module IF_ID_stage_addr(input [11:0]addr_mux_out,input clock,output reg [11:0]addr_to_next_stage);

always@(posedge clock)
begin
addr_to_next_stage=addr_mux_out;
end
endmodule


