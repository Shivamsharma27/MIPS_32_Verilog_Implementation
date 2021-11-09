`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 07:06:41 AM
// Design Name: 
// Module Name: comaparator_to_check_branch
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


module comaparator_to_check_branch(input [31:0]first_input,input[31:0]second_input,input check_for_branch,output reg branch_decision);
reg [31:0]equality_check;
always@(*)
begin
equality_check=first_input-second_input;
if(check_for_branch==1)
begin
if (equality_check==0)
begin

branch_decision=1;

end
end

else

begin
branch_decision=0;
end

end
endmodule