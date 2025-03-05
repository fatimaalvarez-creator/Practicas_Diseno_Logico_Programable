// tiempo
`timescale 1ns / 100ps

// testbench PWM
module PWM_tb();

reg pb_inc; // botón incrementar duty cycle
reg pb_dec; // botón decrementar duty cycle
reg clk;  // reloj (50MHz)
reg rst;  // reset
wire pwm_out; // salida de PWM

// instanciamos el módulo PWM
PWM PWM_INSTANCIA (
  .pb_inc(pb_inc),
  .pb_dec(pb_dec),
  .clk(clk),
  .rst(rst),
  .pwm_out(pwm_out)
);


// generación de señales de reloj
always@(*)
	begin
	  clk = 0; // reloj no activo
	  #10;
	  clk = 1;  // reloj activo de 50 MHz
	end

// pruebas
initial 
	begin
	  // inicialización
	  rst = 1;   // reseteamos
	  pb_inc = 0;     // no presionamos el botón de incrementar al inicio
	  pb_dec = 0;     // no presionamos el botón de decrementar al inicio
	  #20 rst = 0;    // soltar reset

	  // prueba de incremento de duty cycle
	  #20 pb_inc = 1;  // presionar el botón incrementar
	  #40 pb_inc = 0;  // soltar el botón
	  #40 pb_inc = 1;  // presionar de nuevo el botón incrementar
	  #40 pb_inc = 0;  // soltar el botón

	  // prueba de decremento de duty cycle
	  #20 pb_dec = 1;  // presionar el botón decrementar
	  #40 pb_dec = 0;  // soltar el botón
	  #40 pb_dec = 1;  // presionar de nuevo el botón decrementar
	  #40 pb_dec = 0;  // soltar el botón
	  
	  #100;
	  
  end

endmodule
