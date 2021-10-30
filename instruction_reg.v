`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2021 10:22:13 PM
// Design Name: 
// Module Name: instruction_reg
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


module instruction_reg(input [7:0]memory_data,output reg [31:0]instruction_reg_out);
reg [31:0]temp_reg;
/*initial
begin
instruction_reg_out=32'dz;
end*/
always @(memory_data)
begin
temp_reg=instruction_reg_out>>8;
instruction_reg_out[31:0]={memory_data[7:0],temp_reg[23:0]};
end
endmodule
