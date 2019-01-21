`timescale 1ns / 1ps

module ALU_ctrl( funct, ALU_OP,ALU_CTRL);

    input [5:0] funct;
	input [1:0] ALU_OP;
   // output [3:0] ALU_CTRL;
     output reg[3:0] ALU_CTRL;  //should change to reg type

    reg [3:0] reg_funct;
	   /* add your design */
     always @(*) begin		
    
      case(funct[5:0])
       6'b100000:  reg_funct = 4'd2;	
       /* add */
			
       6'b100010:  reg_funct = 4'd6;	
       /* sub */

       6'b101010: reg_funct = 4'd7;	
       /* slt */
			
       default: reg_funct = 4'd0;
		
       endcase
	
end

    always @(*) begin
		
     case(ALU_OP)

///need to modifity		
      2'd2: ALU_CTRL = reg_funct;     //r-type		

      default: ALU_CTRL = 0;
		
     endcase
end


	
	


endmodule
