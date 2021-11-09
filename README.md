# MIPS_32_Verilog_Implementation
This repository contains all  the modules and test benches related to our work on implementation of RISC V based RV32I processor.


1.INSTRUCTION FETCH STAGE:- The following five files together make our fetch unit.  
          1.PC_reg_synchronous.v     
          //Transfer the NPC addr to the memory as soon as the clock arrives.
          
          2.NPC_REG.v
          
          //PC+4 unit is included in this module itself.
          
          3.instruction_memory.v 
          
          //4KB memory with 1BYTE word length.
          
          4.addr_mux.v  
          
          //Introduces the Capability to select address for the branch instruction.
          
          5.IF_ID_stage.v
          
          // reg files to transfer full fetched 32 bit instruction to the decoding stage.
          
          6.IF_ID_stage_addr.v
          
          //reg file to transfer the address to the next stages for the possibilty of branch.
          
     
2. INSTRUCTION DECODE STAGE:- Decode stage is comprised of the following submodules-
          1.register_bank.v                           //32 bit register file containing 32 registers.
          2.ID_EX_B_32.v                             /*This reg module reused again  to transfer 32 bit data to the next stage on the arrival of the clock pulse.
                                                     (used for rs1 data ,rs2 data and mmediate 32 bit data)*/
          3.sign_extend_12bit_32bit.v             //Sign Extend the data offset based on the instruction type i.e branch,sw or addi.
          4.destination_reg_address.v            //Reg file to transfer the address of the destination register for the writeback stage on the arrival of the clock pulse.
          5.IF_ID_stage_addr.v                  //Reused module for reg file to transfer the address to the next stages for the possibilty of branch. 
          6. Controller_Unit.v             //Generates instructions and send the instructions to the  register modules so that clock pulse can trigger them to the next stage.
          Modules to transfer controls from controller_Unit to the Execution stage
                      a.mux_line_ID_EX.v
                      b.branch_control_reg.v
                      c.addi_control_ID_EX_stage.v
                      d.add_control_ID_EX_stage.v
                      e.sub_control_ID_EX_stage.v
                      f.and_control_ID_EX_stage.v
                      g.or_control_ID_EX_stage.v
                      h.sw_control_ID_EX_stage.v
                      i.lw_control_ID_EX_stage.v
                      j.sra_control_ID_EX_stage.v
                      k.sll_control_ID_EX_stage.v
                      l.write_data_memory_ID_EX.v
                      m.read_data_memory_ID_EX_stage.v
                      n.write_destination_reg_ID_EX_stage.v
                      
EXECUTION_UNIT:-

            
                    
                  
          
                   
        
          
          
                    
          
          
          
Currently only IF stage and deceoding stage has been implemented and that too without branch instruction..so currently modifying these codes to accomodate all the instructions.
