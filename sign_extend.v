`timescale 1ns / 1ps

module sign_extend(immediate_in, sign_extend );

    input [13:0] immediate_in;
    output reg[15:0] sign_extend;
	
	   /* add your design */   
       always @(*)
        begin
            if(immediate_in[13]==1'b0)  //if leftest is 0 is postitvie
                assign sign_extend = {2'b00,immediate_in};
            else
                assign sign_extend = {2'b11,immediate_in};
        end

	
endmodule
