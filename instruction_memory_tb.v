`timescale 1ps / 1ps
module instruction_memory_tb;
wire [7:0]data_out;
reg [7:0]data_in;
wire [9:0]x;
wire [9:0]y;
reg clock;
reg wr;
wire [31:0]main_IR_out;
wire [31:0]final_value;

wire [31:0]A_data;
wire [31:0]B_data;
wire [31:0]sign_extended_32_bit_data;
wire [4:0]ID_EX_destination_reg;
wire wr_from_wb;
wire [31:0]write_data_from_wb; //This will be the data coming from the writeback stage to write back in the register.

wire [4:0]adress_from_wb; //destination address will also be available after the write back stage and will be carried along so that it wont change with the new instruction.

wire [31:0]A_ID_EX_data;
wire [31:0]B_ID_EX_data;
wire[31:0] ID_EX_immediate_data;

wire branch_control_instruction; //declare this from control unit...no connection till now
/* Instruction fetch stage*/
instruction_memory ins11(.addr(x),.data_in(data_in),.data_out(data_out),.wr(wr));
instruction_reg instr_inst(.memory_data(data_out),.instruction_reg_out(main_IR_out));

NPC_REG npc_inst(.PC_reg_out(x),.NPC_reg_out(y));
PC_reg_synchronous pc_inst(.NPC_reg_out(y),.PC_reg_out(x),.clock(clock));

IF_ID_stage ins4(.instruction_reg_out(main_IR_out),.full_instruction(final_value),.clock(clock));

/*decoding stage starts here final value is the fetched instruction here*/
register_bank reg_bank_instance(.source_1(final_value[19:15]),.source_2(final_value[24:20]),.source1_data(A_data),.source2_data(B_data),.write(wr_from_wb),.wr_data(write_data_from_wb),.destination_register(adress_from_wb));
ID_EX_B_32 A_reg(.clock(clock),.source_data(A_data),.source_reg_data(A_ID_EX_data)); // ID_EX source_register 1 data to execute stage
ID_EX_B_32 B_reg(.clock(clock),.source_data(B_data),.source_reg_data(B_ID_EX_data)); // ID_EX source_register 2 data to execute_stage


//Pass full instruction here and sign extend according to the opcode.
sign_extend_12bit_32bit sign_extend_instance(.immediate_data(final_value[31:0]),.sign_extended_data(sign_extended_32_bit_data),.beq_control(branch_control_instruction)); //sign_extended_data
ID_EX_B_32 immediate_data_instance(.clock(clock),.source_data(sign_extended_32_bit_data),.source_reg_data(ID_EX_immediate_data)); // ID_EX 32bit immediate_data to execution stage
destination_reg_address dest_reg_instance(.dest_addr_input(final_value[11:7]),.destination_addr_output(ID_EX_destination_reg),.clock(clock)); //destination addr to ex_stage

//Till here my code can execute immediate and register-register operation.
//instruction format will be standard as in RV32I.
Controller_Unit control_unit_instance(.IF_ID_instruction(final_value[31:0]),.add_control(),.sub_control(),.and_control(),.or_control(),.addi_control(),.sll_control(),.sra_control(),.beq_control(branch_control_instruction),.sw_control(),.lw_control());

always #8 clock=~clock;
initial
begin
#1clock=0;
#2wr=0;
end
endmodule
