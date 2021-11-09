`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 10:16:29 PM
// Design Name: 
// Module Name: M_WB_stage_data
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


module M_WB_stage_data(input [31:0]data_from_mem_mux,input clock,output reg [31:0]data_for_wb);
always@(posedge clock)
begin
data_for_wb=data_from_mem_mux;
end

endmodule
