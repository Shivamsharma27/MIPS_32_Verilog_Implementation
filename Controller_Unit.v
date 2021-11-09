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
module Controller_Unit(input [31:0]IF_ID_instruction,
output reg add_control,
output reg sub_control,
output reg addi_control,
output reg and_control,
output reg or_control,
output reg sll_control,
output reg sra_control,
output reg sw_control,
output reg lw_control,
output reg branch_control,
output reg read_data_memory,          //two signals added for  read and write
output reg write_data_memory, 
output reg write_destination_reg,        // these two will work for load and store.
output reg [1:0]mux_control_signal);
wire [6:0]func_7;
wire [2:0]func_3;
parameter I_type=7'b0010011; //core instruction format 
parameter B_type=7'b1100011;
parameter S_type=7'b0100011;
parameter L_type=7'b0000011;  //although load is encoded in I format but to generate control signal i have used it here as separately bcz opcode is different even if encodiing is same.
parameter R_type=7'b0110011;

// above parameter will help to select data that has to be sent to ALU by sending suitable signals to the muxes.
//These parameters are encoded in final_value[6:0].
//mux A has A on zero and NPC on 1
//Mux B has B on 0 and sign extend on 1
assign func_7=IF_ID_instruction[31:25];
assign func_3=IF_ID_instruction[14:12];
always@ (*)
begin
case(IF_ID_instruction[6:0]) //case to select type of instruction
R_type:
begin
mux_control_signal=2'b00;
write_destination_reg=1;
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
branch_control=0;
lw_control=0;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
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
branch_control=0;
lw_control=0;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
end
3'b001:
begin
or_control=0;
and_control=0;
sll_control=1;
add_control=0;
sra_control=0;
lw_control=0;
addi_control=0;
sw_control=0;
branch_control=0;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
end
3'b000:
begin
or_control=0;
and_control=0;
sll_control=0;
add_control=1;
lw_control=0;
sra_control=0;
addi_control=0;
sw_control=0;
branch_control=0;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
end
endcase
end
7'b0100000:
begin
case(func_3)
3'b000:
begin
sub_control=1;
or_control=0;
and_control=0;
sll_control=0;
add_control=0;
sra_control=0;
lw_control=0;
sw_control=0;
addi_control=0;
branch_control=0;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
end
3'b101:
begin
or_control=0;
and_control=0;
sll_control=0;
add_control=0;
sra_control=1;
lw_control=0;
addi_control=0;
sw_control=0;
branch_control=0;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
end
endcase
end
endcase
end
I_type:
begin
mux_control_signal=2'b10;
read_data_memory=0;          //two signals added for  read and write
write_data_memory=0;
write_destination_reg=1;
case(func_3)  //more functionality can be applied by adding cases for different 
3'b000: 
begin
addi_control=1;
sub_control=0;
lw_control=0;
or_control=0;
and_control=0;
sw_control=0;
sll_control=0;
add_control=0;
sra_control=0;
branch_control=0;
end
endcase
end

//yet to define contrtol signals.
S_type:
begin
read_data_memory=0;          //two signals added for  read and write
write_data_memory=1;
mux_control_signal=2'b10; //mux_A will choose content of rs1 and mux_B will choose contents of the sign extended offset.
or_control=0;
and_control=0;
sll_control=0;
add_control=0;
sra_control=0;
lw_control=0;
addi_control=0;
sw_control=1; //add reg to transfer to send data to next stage
branch_control=0;
write_destination_reg=0;
end

//lw and sw signal will need to be transferred to the next memory stage to read and write
L_type:
begin
read_data_memory=1;          //two signals added for  read and write
write_data_memory=0;
mux_control_signal=2'b10; //mux_A will choose content of rs1 and mux_B will choose contents of the sign extended offset this will provide the addrress.
or_control=0;             //this address will be transferred to next staeg yo further store the ddata in memory along with the write signal.
and_control=0;
sll_control=0; 
add_control=0;
sra_control=0;
lw_control=1;
addi_control=0;
sw_control=0; //add reg to transfer to send data to next stage
branch_control=0;
write_destination_reg=1;        
end

B_type:
begin 
read_data_memory=0;          
write_data_memory=0;
mux_control_signal=2'b11;
or_control=0;
and_control=0;
lw_control=0;
sll_control=0;
add_control=0;
sra_control=0;
sw_control=0;
addi_control=0;
sub_control=0;
branch_control=1;
write_destination_reg=0;
end
default write_data_memory=0;       
endcase
end
endmodule