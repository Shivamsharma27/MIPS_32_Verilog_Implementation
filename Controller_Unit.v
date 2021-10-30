`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2021 10:52:23 PM
// Design Name: 
// Module Name: Controller_Unit
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


module Controller_Unit(input [31:0]IF_ID_instruction,output reg add_control,
output reg sub_control,
output reg addi_control,

output reg and_control,
output reg or_control,
output reg sll_control,
output reg sra_control,
output reg sw_control,
output reg [1:0]mux_control_signal);
reg func_7;
reg func_3;
parameter I_type=7'b0010011; //core instruction format 
parameter B_type=7'b1100011;
parameter S_type=7'b0100011;
parameter R_type=7'b0110011;

// above parameter will help to select data that has to be sent to ALU by sending suitable signals to the muxes.
//These parameters are encoded in final_value[6:0].
//mux A has A on zero and NPC on 1
//Mux B has B on 0 and sign extend on 1
always@ (*)
begin
assign func_7=IF_ID_instruction[31:25];
assign func_3=IF_ID_instruction[14:12];
 
case(IF_ID_instruction[6:0]) //case to select type of instruction
R_type:
begin
mux_control_signal=2'b00;

case(func_7)

7'b0000000:
begin
case(func_3)
3'b111:
begin
and_control=1;
or_control=0;
sll_control=0;
add_control=0;
sra_control=0;
addi_control=0;
sw_control=0;
end
3'b110:
begin
or_control=1;
and_control=0;
sll_control=0;
add_control=0;
sra_control=0;
addi_control=0;
sw_control=0;
end
3'b001:
begin
or_control=0;
and_control=0;
sll_control=1;
add_control=0;
sra_control=0;
addi_control=0;
sw_control=0;
end
3'b000:
begin
or_control=0;
and_control=0;
sll_control=0;
add_control=1;
sra_control=0;
addi_control=0;
sw_control=0;
end
3'b101:
begin
or_control=0;
and_control=0;
sll_control=0;
add_control=0;
sra_control=1;
addi_control=0;
sw_control=0;
end
endcase
end
7'b0100000:
begin
sub_control=1;
or_control=0;
and_control=0;
sll_control=0;
add_control=0;
sra_control=0;
sw_control=0;
addi_control=0;
end
endcase
end
I_type:
begin
mux_control_signal=2'b01;
case(func_3)  //more functionality can be applied by adding cases for different 
3'b000: 
begin
addi_control=1;
sub_control=0;
or_control=0;
and_control=0;
sw_control=0;
sll_control=0;
add_control=0;
sra_control=0;
end
endcase
end

//yet to define contrtol signals.
S_type:
begin
mux_control_signal=2'b00;


end
B_type:
begin 
mux_control_signal=2'b11;
or_control=0;
and_control=0;
sll_control=0;
add_control=0;
sra_control=0;
sw_control=0;
addi_control=0;
sub_control=0;
end
endcase

end
endmodule
