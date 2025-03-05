// contador BCD con up/down
module counter_up_down(
    input clk, 
    input rst, 
    input enable,
    input switch, // 0: down (de 127 a 0), 1: up (de 0 a 127)
    output reg [6:0] count // 7 bits para contar desde 0 a 127
);

always @(posedge clk or posedge rst) 
	begin
		 if (rst == 1)  
			  count <= 7'b0000000;  // reset en 0 (7 bits)
		 else if (enable == 1)  // sólo cuenta si 'enable' está activo
		 begin
			  if (switch == 1)  
					count <= count + 1; // incrementa
			  else  
					count <= count - 1;  // decrementa
		 end
	end
	
endmodule