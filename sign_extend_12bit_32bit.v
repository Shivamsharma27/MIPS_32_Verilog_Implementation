`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:08:27 AM
// Design Name: 
// Module Name: sign_extend_12bit_32bit
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


module sign_extend_12bit_32bit(input [31:0]immediate_data,output [31:0]sign_extended_data,input beq_signal);
reg [31:0] data_reg;
always@(*)
begin
if(beq_signal==1)
begin
data_reg={{21{immediate_data[31]}},immediate_data[7],immediate_data[30:25],immediate_data[11:8]};
end
else
begin
data_reg={{20{immediate_data[31]}},immediate_data[31:20]};
end
end

assign sign_extended_data[31:0]=data_reg[31:0];

endmodule
