`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 07:32:55 PM
// Design Name: 
// Module Name: data_memory
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


module data_memory(
input [11:0]addr,
input wr,input r,
input [31:0]data_in,
output [31:0]data_out);

reg [7:0]mem_data[4095:0]; //memory 4KB
reg [7:0]data_out_regm1;
reg [7:0]data_out_regm2;
reg [7:0]data_out_regm3;
reg [7:0]data_out_regm4;

assign data_out=(r)?{data_out_regm1,data_out_regm2,data_out_regm3,data_out_regm4}:32'hzzzzzzzz;

always@(*)
begin
if ((wr==1)&&(r==0))
begin
//mem_data[addr]=data_in;
mem_data[addr]=data_in[31:24];   //FIFO to store 8 bits at eeach successive location in FIFO format
mem_data[addr+12'd1]=data_in[23:16];
mem_data[addr+12'd2]=data_in[15:8];
mem_data[addr+12'd3]=data_in[7:0];
end

else if ((wr==0)&&(r==1))
begin
//data_out_reg1=mem_data[addr];
data_out_regm1=mem_data[addr];
data_out_regm2=mem_data[addr+12'd1];
data_out_regm3=mem_data[addr+12'd2];
data_out_regm4=mem_data[addr+12'd3];

end
end
endmodule