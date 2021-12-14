`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2021 10:34:55 AM
// Design Name: 
// Module Name: execution_unit_result_selection
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


module execution_unit_result_selection(input [31:0]mem_mux_out,input [31:0]mac_out,input mac_control_mem,output reg[31:0]mem_final_mux);

always@(*)
begin
if ( mac_control_mem==1)
begin
mem_final_mux=mac_out;
end
else 
mem_final_mux=mem_mux_out;


end
endmodule
