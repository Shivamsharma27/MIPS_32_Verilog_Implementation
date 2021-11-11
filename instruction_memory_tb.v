`timescale 1ps / 1ps
module instruction_memory_tb;
reg clock;
reg wr;
wire [11:0]y;
wire [11:0]x;
//wire [11:0]x_stall;
wire [11:0]z;
wire [31:0]data_out;
wire [31:0]data_in;

wire [31:0]final_value;
//wire [31:0]final_value_EX;
//wire [31:0]final_value_MEM;

//wire do_stall;
//wire[31:0]instruction_to_be_decoded;
wire branch_control_instruction; //declare this from control unit...no connection till now
wire do_addition;
wire do_subtraction;
wire do_and;
wire do_or;
wire do_lw;
wire do_sw;
wire take_branch;
wire do_sll;
wire do_sra;
wire do_immediate_add;
wire [1:0]mux_select_line;
wire do_read_data_memory;
wire do_write_data_memory;
wire do_write_destination_reg;
wire [11:0] P;
wire [11:0] P_to_EX_stage;
wire [4:0]EX_M_destination_reg;
wire [1:0]EX_mux_select_line;
wire branch_control_instruction_out;

wire [31:0]sign_extended_32_bit_data;
wire EX_addition;
wire EX_addi;
wire EX_and;
wire EX_or;
wire EX_sub;
wire EX_lw;
wire EX_sw;
wire EX_sll;
wire EX_sra;

wire EX_read_data_memory;
wire EX_write_data_memory;
wire EX_write_destination_reg;
wire [31:0]A_data;
wire [31:0]B_data;
wire [31:0]A_ID_EX_data;
wire [31:0]B_ID_EX_data;
wire [31:0]ALU_out_result;
wire [31:0] A_data_ALU;
wire [31:0] B_data_ALU;
wire [4:0]ID_EX_destination_reg;
//wire wr_from_wb;
wire [31:0] ID_EX_offset_data_sign_extended;
wire [31:0]write_data_from_wb; //This will be the data coming from the writeback stage to write back in the register.
wire [4:0]adress_from_wb; //destination address will also be available after the write back stage and will be carried along so that it wont change with the new instruction.




//


//


//made this file only to generate IF schematic.
//wires for execution stage


//wires for mem stage
wire M_read_data_memory;
wire M_write_data_memory;
wire M_write_destination_reg;
wire [31:0]B_EX_M_data;
wire [31:0]data_memory_data_out;
wire [31:0]ALU_out_result_Mem;
//wire for wb stage
wire WB_write_destination_reg;
wire mem_lw;
wire [31:0]data_for_reg_bank;
//wire [31:0]data_out_through_nop_unit;


/* Instruction fetch stage*/
NPC_REG npc_inst(.PC_reg_out(x),.NPC_reg_out(y));// y is the output of NPC

//z is output addr of mux
//and it will be input to pc
  IF_ID_stage_addr inst_for_decode(.addr_mux_out(z),.clock(clock),.addr_to_next_stage(P));

instruction_memory ins11(.addr(x),.data_in(data_in),.data_out(data_out),.wr(wr));
//instruction_reg instr_inst(.memory_data(data_out),.instruction_reg_out(main_IR_out));
IF_ID_stage ins4(.instruction_reg_out(data_out),.full_instruction(final_value),.clock(clock));





/*decoding stage starts here final value is the fetched instruction here*/
register_bank reg_bank_instance(.source_1(final_value[19:15]),.source_2(final_value[24:20]),.source1_data(A_data),.source2_data(B_data),.write(WB_write_destination_reg),.wr_data(write_data_from_wb),.destination_register(adress_from_wb));
ID_EX_B_32 A_reg(.clock(clock),.source_data(A_data),.source_reg_data(A_ID_EX_data)); // ID_EX source_register 1 data to execute stage
ID_EX_B_32 B_reg(.clock(clock),.source_data(B_data),.source_reg_data(B_ID_EX_data)); // ID_EX source_register 2 data to execute_stage
//Pass full instruction here and sign extend according to the opcode.
sign_extend_12bit_32bit sign_extend_instance(.immediate_data(final_value[31:0]),.sign_extended_data(sign_extended_32_bit_data),.beq_signal(branch_control_instruction),.sw_D_signal(do_sw)); //sign_extended_data
ID_EX_B_32 immediate_data_instance(.clock(clock),.source_data(sign_extended_32_bit_data),.source_reg_data(ID_EX_offset_data_sign_extended)); // ID_EX 32bit immediate_data to execution stage
destination_reg_address dest_reg_instance_for_EX_stage(.dest_addr_input(final_value[11:7]),.destination_addr_output(ID_EX_destination_reg),.clock(clock)); //destination addr to ex_stage
IF_ID_stage_addr addr_inst_for_ex(.addr_mux_out(P),.clock(clock),.addr_to_next_stage(P_to_EX_stage));
//Till here my code can execute immediate and register-register operation.
//instruction format will be standard as in RV32I.


// control unit starts
Controller_Unit control_unit_instance(.IF_ID_instruction(final_value[31:0]),.add_control(do_addition),.sub_control(do_subtraction),.and_control(do_and),.or_control(do_or),.addi_control(do_immediate_add),.sll_control(do_sll),.sra_control(do_sra),.branch_control(branch_control_instruction),.sw_control(do_sw),.lw_control(do_lw),.mux_control_signal(mux_select_line),. read_data_memory(do_read_data_memory),.write_data_memory(do_write_data_memory),.write_destination_reg(do_write_destination_reg));
//control unit ends
//stalling
//ID_EX_instruction_for_stalling ID_EX_instruction_for_stalling_instance(.instruction_reg_out(final_value),.full_instruction_EX_stage(final_value_EX),.clock(clock));
//ID_EX_instruction_for_stalling EX_MEM_instruction_for_stalling_instance(.instruction_reg_out(final_value_EX),.full_instruction_EX_stage(final_value_MEM),.clock(clock));
//stall_logic_unit stall_logic_unit_instance(.D_instruction(instruction_to_be_decoded),.EX_instruction(final_value_EX),.MEM_instruction(final_value_MEM),.stall_control_signal(do_stall));
//nop_unit nop_unit_instance(.instruction_memory_out(data_out),.stall_control(do_stall),.instruction_to_next_stage(data_out_through_nop_unit));
//ID_EX_instruction_for_stalling ID_EX_instruction_data_memory_stalling_instance(.instruction_reg_out(data_out),.full_instruction_EX_stage(instruction_to_be_decoded),.clock(clock));
//unit to stop pc from incrementing

//mux_to_stop_pc_increment mux_to_stop_pc_increment_instance(.addr_mux_out(z),.addr_PC(P),.stall_control(do_stall),.addr_to_pc(x_stall));

PC_reg_synchronous pc_inst(.addr_mux_reg_out(z),.PC_reg_out(x),.clock(clock));

addr_mux addr_mux_instance(.NPC_addr(y),.Branch_addr(ALU_out_result[11:0]),.select_addr_mux(take_branch),.addr_to_PC(z));  ///mistake may be here bcz32 bit is given for 10 bit...upper bits might get chipped off.

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//registers to transfer control signals to the EX_stage from the controller along with the clock.
mux_line_ID_EX mux_line_inst_ID_EX(.mux_line_input(mux_select_line),.mux_line_output(EX_mux_select_line),.clock(clock));
branch_control_reg branch_control_instruction_reg_instance (.branch_control_reg_in(branch_control_instruction),.clock(clock),.branch_control_reg_out(branch_control_instruction_out));
addi_control_ID_EX_stage addi_control_ID_EX_stage_inst(.signal_addi(do_immediate_add),.clock(clock),.out_addi_control_reg(EX_addi));
add_control_ID_EX_stage add_control_ID_EX_stage_inst(.signal_add(do_addition),.clock(clock),.out_add_control_reg(EX_addition));
sub_control_ID_EX_stage sub_control_ID_EX_stage_inst(.signal_sub(do_subtraction),.clock(clock),.out_sub_control_reg(EX_sub));
and_control_ID_EX_stage and_control_ID_EX_stage_inst(.signal_and(do_and),.clock(clock),.out_and_control_reg(EX_and));
or_control_ID_EX_stage or_control_ID_EX_stage_inst(.signal_or(do_or),.clock(clock),.out_or_control_reg(EX_or));
sw_control_ID_EX_stage sw_control_ID_EX_stage_inst(.signal_sw(do_sw),.clock(clock),.out_sw_control_reg(EX_sw));
lw_control_ID_EX_stage lw_control_ID_EX_stage_inst(.signal_lw(do_lw),.clock(clock),.out_lw_control_reg(EX_lw));
sra_control_ID_EX_stage sra_control_ID_EX_stage_inst(.signal_sra(do_sra),.clock(clock),.out_sra_control_reg(EX_sra));
sll_control_ID_EX_stage sll_control_ID_EX_stage_inst(.signal_sll(do_sll),.clock(clock),.out_sll_control_reg(EX_sll));
write_data_memory_ID_EX write_data_memory_ID_EX_inst(.signal_write_data_memory(do_write_data_memory),.clock(clock),.out_write_data_memory(EX_write_data_memory));
read_data_memory_ID_EX_stage read_data_memory_ID_EX_inst(.signal_read_data_memory(do_read_data_memory),.clock(clock),.out_read_data_memory(EX_read_data_memory));
write_destination_reg_ID_EX_stage write_destination_reg_ID_EX_stage_inst(.signal_write_destination_reg(do_write_destination_reg),.clock(clock),.out_write_destination_reg(EX_write_destination_reg));
//end of control transfer
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//EXecution stage components

mux_A Mux_instA(.A1(A_ID_EX_data),.A2(P_to_EX_stage),.mux_lines(EX_mux_select_line),.A_data(A_data_ALU));
ID_EX_B_32 B_M_reg(.clock(clock),.source_data(B_ID_EX_data),.source_reg_data(B_EX_M_data));

//use B_ID_EX_data signal to transfer further for memory write operation


mux_B Mux_instB(.B1(B_ID_EX_data),.B2(ID_EX_offset_data_sign_extended),.mux_lines(EX_mux_select_line),.B_data(B_data_ALU));
ALU ALU_inst(.A_ALU(A_data_ALU),.B_ALU(B_data_ALU),.add_control_ALU(EX_addition),.sub_control_ALU(EX_sub),.addi_control_ALU(EX_addi),.and_control_ALU(EX_and),.or_control_ALU(EX_or),.sll_control_ALU(EX_sll),.sra_control_ALU(EX_sra),.sw_control_ALU(EX_sw),.lw_control_ALU(EX_lw),.branch_taken_decision(take_branch),.ALU_result(ALU_out_result));



destination_reg_address dest_reg_instance_for_M_stage(.dest_addr_input(ID_EX_destination_reg),.destination_addr_output(EX_M_destination_reg),.clock(clock));
comaparator_to_check_branch comparator_inst(.first_input(A_ID_EX_data),.second_input(B_ID_EX_data),.check_for_branch(branch_control_instruction_out),.branch_decision(take_branch));

//ALU_out from Ex to Mem
write_data_memory_ID_EX write_data_memory_EX_M_inst(.signal_write_data_memory(EX_write_data_memory),.clock(clock),.out_write_data_memory(M_write_data_memory));
read_data_memory_ID_EX_stage read_data_memory_EX_M_inst(.signal_read_data_memory(EX_read_data_memory),.clock(clock),.out_read_data_memory(M_read_data_memory));
write_destination_reg_ID_EX_stage write_destination_reg_EX_M_stage_instance(.signal_write_destination_reg(EX_write_destination_reg),.clock(clock),.out_write_destination_reg(M_write_destination_reg));
ALU_OUT_EX_MEM ALU_OUT_EX_MEM_Inst(.data_from_ALU(ALU_out_result),.clock(clock),.data_for_Mem_stage(ALU_out_result_Mem));
//memory stage starts here
//read write signal to memory (EX to Mem stage)

data_memory data_memory_inst(.addr(ALU_out_result_Mem[11:0]),.data_in(B_EX_M_data),.data_out(data_memory_data_out),.wr(M_write_data_memory),.r(M_read_data_memory));
lw_control_ID_EX_stage lw_control_EX_Mem_stage_inst(.signal_lw(EX_lw),.clock(clock),.out_lw_control_reg(mem_lw));
MUX_mem_stage MUX_mem_stage_instance(.A_mem_1(ALU_out_result_Mem),.A_mem_2(data_memory_data_out),.mux_mem_line(mem_lw),.A_mem_data(data_for_reg_bank));




//wb stage starts here
write_destination_reg_ID_EX_stage write_destination_reg_M_WB_stage_instance(.signal_write_destination_reg(M_write_destination_reg),.clock(clock),.out_write_destination_reg(WB_write_destination_reg));
destination_reg_address dest_reg_instance_for_M_WB_stage(.dest_addr_input(EX_M_destination_reg),.destination_addr_output(adress_from_wb),.clock(clock));
M_WB_stage_data M_WB_stage_data_instance(.data_from_mem_mux(data_for_reg_bank),.clock(clock),.data_for_wb(write_data_from_wb));


always #10 clock=~clock;
initial
begin
#1clock=0;
#1wr=0;
end
endmodule

