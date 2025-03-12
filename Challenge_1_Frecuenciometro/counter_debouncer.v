module counter_debouncer #(parameter DEBOUNCE_THRESHOLD = 5000)(
	input clk,                                          // Señal de reloj (sincroniza el debounce)
    output reg [ceillog2(DEBOUNCE_THRESHOLD)-1:0] counter_out = 0,
    output reg counter_match                            // Señal que indica si la entrada ha sido estable por DEBOUNCE_THRESHOLD ciclos
);

// Lógica del contador
always @(posedge clk) //Depende de los flancos de subida del reloj
begin
    if(counter_out >= DEBOUNCE_THRESHOLD - 1) // Si el contador llega a DEBOUNCE_THRESHOLD entonces:
    begin
        counter_out <= 0;   // Reinicia el contador
        counter_match <= 1; // Activa la señal de estabilidad
    end
    else
    begin
        counter_out <= counter_out + 1; // Incremento de contador
        counter_match <= 0;             // Mantiene la señal de estabilidad en 0
    end
end

// Función para calcular el número de bits necesarios para el contador
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
