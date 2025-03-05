// módulo de contador con debouncer para evitar las fluctuaciones

module counter_debouncer #(parameter N_MAX = 5000)
	(input clk,
			 rst_a_p, // a - asíncrono, p - positivo
			 
	output reg [ceillog2(N_MAX) - 1: 0] counter_out, // se parametriza en automático por la función
	output reg counter_match
);

// 
always @(posedge clk or posedge rst_a_p) // depende los flancos positivos del clk o reset 
	begin
		if(rst_a_p) // rst_a_p o rst_a_p == 1 es lo mismo porque arriba pusimos los flancos positivos
			begin
				counter_out <= 0;
				counter_match <= 0;
			end
		else
			begin
				if(counter_out >= N_MAX -1) // checar que el contador no pase de 5000
					begin
						counter_out <= 0;
						counter_match <= 1;
					end
				else
					begin
						counter_out <= counter_out + 1;
						counter_match <= 0; // para poner un flip-flop interno que este cambiando, 
													//sino se pone un latch que siempre está prendido 
					end
			end
	end


	// log function
	function integer ceillog2;
		input integer data;
		integer i, result;
		begin
			for(i = 0; 2**i < data; i = i + 1)
				result = i + 1;
			ceillog2 = result;
		end
	
	endfunction

endmodule