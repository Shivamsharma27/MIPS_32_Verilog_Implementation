`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2021 09:07:27 AM
// Design Name: 
// Module Name: addr_mux
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


module addr_mux(input [11:0]NPC_addr,input [11:0]Branch_addr, output reg[11:0]addr_to_PC,input select_addr_mux);
always @(*)
begin
if (select_addr_mux==1)
begin
addr_to_PC[11:0]=Branch_addr[11:0];
end
else 
addr_to_PC[11:0]=NPC_addr[11:0];
end
endmodule
