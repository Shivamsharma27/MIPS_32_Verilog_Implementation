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
input [11:0]addr,
input wr,
input [31:0]data_in,
output [31:0]data_out);

reg [7:0]mem[4095:0]; //memory 4KB

reg [7:0]data_out_reg1;
reg [7:0]data_out_reg2;
reg [7:0]data_out_reg3;
reg [7:0]data_out_reg4;
//integer k;
//tri [7:0]bus;
assign data_out=(~wr)?{data_out_reg1,data_out_reg2,data_out_reg3,data_out_reg4}:32'hzzzzzzzz;
initial
begin
$readmemb("memory_cont.mem",mem);
end
always@(addr)
begin
if (wr==1)
begin
mem[addr]=data_in;
end
else if (wr==0)
begin
/*for(k=0;k<=3;k=k+1)
begin
#1data_out_reg=mem[addr+k];
end*/
data_out_reg1=mem[addr];
data_out_reg2=mem[addr+1];
data_out_reg3=mem[addr+2];
data_out_reg4=mem[addr+3];
end
end
endmodule