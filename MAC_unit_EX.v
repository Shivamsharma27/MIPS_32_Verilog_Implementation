`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 06:47:25 PM
// Design Name: 
// Module Name: MAC_unit_EX
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


module MAC_unit_EX(input [31:0]mac_input1,
input [31:0]mac_input2,input [31:0]mac_input3,
input mac_unit_activation_signal,
output reg[31:0]mac_unit_output);
reg[31:0] i;
reg [31:0]A;reg [31:0]B;reg [31:0]C;reg [31:0]P;

initial
begin
P=32'd0;
C=32'd0;
i=B;
end
always@(*)
begin

if (mac_unit_activation_signal==1)
begin

A=mac_input1;
B=mac_input2;
if ((A==0)||(B==0))
begin
P=32'd0;
end
else 
begin
for (i=B;i>=1;i=i-1)
begin
C<=P+A;
#0.5P=C;
//P<=C;
end


    /*if (i>=1)
      begin
        C<=P+A;
        P<=C;
        i<=i-1;
      end
  end*/

mac_unit_output=(P+mac_input3);
end
end
end
endmodule


