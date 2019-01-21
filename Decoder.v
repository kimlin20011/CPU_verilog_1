`timescale 1ns / 1ps

module Decoder( OP, Reg_WE, DM_WE, ALU_OP, ALU_src,MEM_to_REG,REG_Dst,funct);
	input [5:0] OP;
	input [5:0] funct;
	output reg Reg_WE, DM_WE, ALU_src,MEM_to_REG,REG_Dst;
	output reg [1:0] ALU_OP;

	//reg _Reg_WE, _DM_WE, _ALU_src, _MEM_to_REG,_REG_Dst;
      //  reg [1:0] _ALU_OP;

     always@(OP or funct)
       begin  
       case(OP) //this is for r t-ype
        6'b000000:  
        if(funct == 6'b100000 | funct == 6'b100010 | funct == 6'b101010)begin
        Reg_WE=1;
        DM_WE =0;
        ALU_src = 0;
        MEM_to_REG = 0;
        REG_Dst = 1;
        ALU_OP = 2'b10;
          end

		/*I-type*/

	6'b100011: begin  //lw
	  REG_Dst = 0;
          ALU_src = 1;
          MEM_to_REG = 1;
          Reg_WE = 1;
	  DM_WE = 0;
          ALU_OP = 2'b00;
		end
	6'b101011: begin  //sw
          REG_Dst = 0; //
	  ALU_src = 1;
	  MEM_to_REG = 0; //x
          Reg_WE = 0;
          DM_WE = 1;
          ALU_OP = 2'b00;
		end

       default: begin
       Reg_WE = 0;
       DM_WE =0;
       ALU_src = 0;
       MEM_to_REG = 0;
       REG_Dst = 0;
       ALU_OP = 2'b00;    //
       end
     endcase
    end

   /* add your design */   	
  
	
	
endmodule
