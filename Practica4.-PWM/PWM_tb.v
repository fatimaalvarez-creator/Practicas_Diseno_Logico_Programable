// test bench opcional para simulación
module PWM_tb();
    reg clk = 0;
    reg rst = 0;
    reg pb_inc = 1;  // botones inactivos
    reg pb_dec = 1;
    wire pwm_out;
    
// instancia del módulo PWM
PWM DUT(
  .clk(clk),
  .rst(rst),
  .pb_inc(pb_inc),
  .pb_dec(pb_dec),
  .pwm_out(pwm_out)
);

// generador de reloj de 50MHz (periodo de 20ns)
always #10 clk = ~clk;

// secuencia de prueba
initial 
	begin
	  // reset 
	  rst = 1;
	  #100;
	  rst = 0;
	  #1000;
  
	  // incrementar posición
	  pb_inc = 0; // presionar botón (activo bajo)
	  #200;
	  pb_inc = 1; // soltar botón
	  #1000;
  
	  // decrementar posición
	  pb_dec = 0; // presionar botón
	  #200;
	  pb_dec = 1; // soltar botón
	  #1000;
	end

endmodule