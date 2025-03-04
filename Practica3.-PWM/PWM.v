// módulo de PWM que sirve para controlar un servomotor
module PWM(
    input pb_inc, // botón incrementar duty cycle
          pb_dec, // botón decrementar duty cycle
          clk,    // reloj (50MHz)
          rst,    // reset
    output reg pwm_out // salida de PWM
);


// negamos las entradas de incremento y decremento porque los botones funcionan al revés
wire neg_pb_inc = ~pb_inc;
wire neg_pb_dec = ~pb_dec;

 
 
// auxiliares
wire slow_clk;
wire debouncer_pb_inc; // señales de botones después de pasar por un eliminador de rebotes (debouncer)
wire debouncer_pb_dec;
 
	 
// registro de duty cycle para servomotor
// con una frecuencia de 50Hz (periodo 20ms)
// 1ms = 50,000 ciclos (5% DC)
// 2ms = 100,000 ciclos (10% DC)
reg [31:0] DC = 32'd75_000; // posición inicial 75,000 ciclos (90°)
reg [31:0] counter = 32'd0; // counter para la señal PWM 


// límites de pulso para el servomotor
parameter MIN_DC = 32'd50_000;  // 1 ms (0°)
parameter MAX_DC = 32'd120_000; // 2.4ms (180°)
parameter STEP = 32'd2_500;     // incremento de 5 grados de rotación (0.05ms)



// generamos parámetros para calcular el periodo
parameter freq_base = 32'd50_000_000; // frecuencia base (50 MHz)
parameter freq_final = 32'd50; // frecuencia final (50 Hz)
parameter periodo = freq_base / freq_final; // periodo



// instanciamos clk divider
// clkdiv: Divisor de reloj que genera slow_clk a 20Hz, utilizado para controlar la velocidad 
// de incremento/decremento
clkdiv_PWM #(.frec(20)) CLKDIV(
  .clk(clk), 
  .rst(rst), 
  .clk_div(slow_clk)
);
// 20 Hz para control gradual del servo


// instanciamos debounccer para eliminar rebotes de los botones
debouncer_PWM D_INC(
  .pb_in(pb_inc), 
  .clk(slow_clk), 
  .pb_out(debouncer_pb_inc)
); // para incrementar
debouncer_PWM D_DEC(
  .pb_in(pb_dec), 
  .clk(slow_clk), 
  .pb_out(debouncer_pb_dec)
); // para decrementar


// control del duty cycle con límites específicos para servomotor
always @(posedge slow_clk or posedge rst)
begin
  if (rst) begin
		DC <= 32'd75_000; // Reset a posición central (90°)
  end
  else begin
		if (debouncer_pb_inc == 1) begin
			 // incrementa pero limita al máximo
			 if (DC < MAX_DC)
				  DC <= DC + STEP;
		end
		else if (debouncer_pb_dec == 1) begin
			 // decrementa pero limita al mínimo
			 if (DC > MIN_DC)
				  DC <= DC - STEP;
		end
  end
end
	  
   
// generamos la señal de PWM 
// reloj rápido para contral la amplitud
// este bloque incrementa un contador y lo reinicia al alcanzar el periodo. La salida PWM es:
// 1 cuando el contador es menor o igual que DC
// 0 cuando el contador es mayor que DC
always @(posedge clk or posedge rst)
begin
  if (rst) 
	begin
		counter <= 32'd0;
		pwm_out <= 1'b0;
  end
  else 
	begin
		// incrementamos el contador
		counter <= counter + 32'd1;
		
		// reiniciamos el contador al completar un periodo
		if (counter >= periodo)
			 counter <= 32'd0;
		
		// generamos la salida PWM
		if (counter < DC)
			 pwm_out <= 1'b1;
		else
			 pwm_out <= 1'b0;
  end
end
  
endmodule

// va a contar 1,000,000 (de 0 a 999,999)
// periodo (1/frecuencia) de 1/50 seg, porque la frecuencia son 50Hz