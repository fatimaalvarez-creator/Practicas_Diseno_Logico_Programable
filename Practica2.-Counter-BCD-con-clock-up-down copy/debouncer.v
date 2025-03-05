// módulo de debouncer para evitar las fluctuaciones
// filtra los rebotes mecánicos del enable
module debouncer #(parameter N_MAX = 50_000_000)
	(input clk,
			 rst_a_p, // a - asíncrono, p - positivo
			 debouncer_in, // entrada del debouncer
			 
	output reg debouncer_out // salida del debouncer
);

// señales auxiliares
	wire [ceillog2(N_MAX) - 1: 0] counter_out; // se parametriza en automático por la función
	wire counter_match;

// instanciamos el módulo counter_debouncer
counter_debouncer #(.N_MAX(N_MAX)) CONTADOR_PARA_RATE(
	.clk(clk),
	.rst_a_p(rst_a_p),
	.counter_out(counter_out),
	.counter_match(counter_match)
);

//
always @(posedge counter_match or posedge rst_a_p) // depende los flancos positivos del counter_match o reset
	begin
		if(rst_a_p)
			debouncer_out <= 0; //
		else
			if(counter_match)
				debouncer_out <= debouncer_in; //
			else
				debouncer_out <= debouncer_out;
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