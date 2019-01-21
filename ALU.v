`timescale 1ns / 1ps

module ALU( source1,source2,ALU_CTRL,result);
    input [15:0] source1;
    input [15:0] source2;
    input [3:0] ALU_CTRL;
    output reg[15:0] result;  //should change to reg type
	 
	   /* add your design */   
    wire [15:0] sub_12;
    wire [15:0] add_12;
    wire oflow_add;
    wire oflow_sub;	
    wire oflow;	
    wire slt;

    
    assign sub_12 = source1 - source2;
    assign add_12 = source1 + source2;
	
    assign oflow_add = (source1[15] == source2[15] && add_12[15] != source1[15]) ? 1 : 0;    //????overflow
    assign oflow_sub = (source1[15] == source2[15] && sub_12[15] != source1[15]) ? 1 : 0;

	
    assign oflow = (ALU_CTRL == 4'b0010) ? oflow_add : oflow_sub;  //if add excute oflow_add

	
// set if less than, 2s compliment 15-bit numbers
	
    assign slt = oflow_sub ? ~(source1[15]) : source1[15]; //1

	
    always @(*) begin
		
    case (ALU_CTRL)
			
    4'd2:  result <= add_12;	//func=2	
    /* add */
			
    4'd7:  result <= {{15{1'b0}}, slt}; //func=7
    /* slt */
			
    4'd6:  result <= sub_12;	//funct=6			
    /* sub */
			
    default: result <= 0;
		
    endcase

    end
	
	

endmodule
