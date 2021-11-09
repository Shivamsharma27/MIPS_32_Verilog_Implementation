`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 09:40:35 PM
// Design Name: 
// Module Name: register_bank
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


module register_bank(input [4:0]source_1,
input [4:0]source_2,
input write,
input [31:0]wr_data,
input [4:0]destination_register,output [31:0]source1_data,output [31:0]source2_data);
reg [31:0] reg_file[31:0];
assign source1_data=reg_file[source_1];
assign source2_data=reg_file[source_2];

initial
begin
$readmemb("register_bank_load.mem",reg_file);
end
always@(*)
begin
if (write==1)
begin
reg_file[destination_register]=wr_data;
end
end
endmodule
