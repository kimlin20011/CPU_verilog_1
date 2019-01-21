`timescale 1ns / 1ps
module MUX_2_to_1(data0_i,data1_i,select_i,data_o);
    parameter size = 0;	
    input  [size-1:0] data0_i;          
    input  [size-1:0] data1_i;
    input             select_i;
    output reg[size-1:0] data_o; 


	    //this is control
	    /* add your design */   
    always @(data0_i or data1_i or select_i)
     begin	
     case(select_i)
//not sure if it is true
     1'b0: data_o = data0_i;   
     1'b1: data_o = data1_i;
     endcase
    end  


endmodule
