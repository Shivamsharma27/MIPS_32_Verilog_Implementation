`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2021 03:28:40 PM
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(
input [9:0]addr,
input wr,
input [7:0]data_in,
output [7:0]data_out);
reg [7:0]mem[1023:0];reg [7:0]data_out_reg;
integer k;
//tri [7:0]bus;
assign data_out=(~wr)?data_out_reg:8'hzz;
initial
begin
$readmemb("memory_cont.mem",mem);
end
always@(*)
begin
if (wr==1)
begin
mem[addr]=data_in;
end
else if (wr==0)
begin
for(k=0;k<=3;k=k+1)
begin
#1data_out_reg=mem[addr+k];
end
end
end
endmodule
