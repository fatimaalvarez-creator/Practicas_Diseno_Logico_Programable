// módulo para eliminar rebotes de botones "debouncer"
module debouncer_PWM(
    input pb_in,  // entrada del botón
    input clk,    // reloj (slow_clk)
    output reg pb_out // salida limpia
);

// registros para detectar flancos
reg pb_prev = 1'b0;

always @(posedge clk) begin
  // detectamos cambio en el estado del botón
  if (pb_in != pb_prev) begin
		pb_prev <= pb_in;   // actualizamos el estado previo
		pb_out <= pb_in;    // actualizamos la salida
  end
  else begin
		pb_out <= 1'b0;     // sin cambio, no activamos la salida
  end
end
 
endmodule