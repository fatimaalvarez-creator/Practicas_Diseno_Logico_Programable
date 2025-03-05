// tiempo
`timescale 1ns / 100ps

module counterBCD_clk_up_down_tb();

// parámetros
parameter N = 10; // parámetro para contador
parameter SEGMENTOS = 7; // parámetro para los 7 segmentos

// entradas
reg clk; // reloj
reg rst; // reset
reg enable; // habilitador para el contador
reg switch; // 0 baja, 1 sube (up/down) -> dirección del contador 
reg load; // cargar
reg [5:0] load_switch; // sirve para almacenar los datos a cargar 

// salidas
wire [0:6] D_unidades;
wire [0:6] D_decenas;
wire [0:6] D_centenas;
wire [0:6] D_miles;
 
// instanciamos el counterBCD_clk_up_down
counterBCD_clk_up_down #(N, SEGMENTOS) COUNTERBCD_CLK_UP_DOWN (
  .clk(clk),
  .rst(rst),
  .enable(enable),
  .switch(switch),
  .load(load),
  .load_switch(load_switch),
  .D_unidades(D_unidades),
  .D_decenas(D_decenas),
  .D_centenas(D_centenas),
  .D_miles(D_miles)
);
 
// generación del clock
always #5 clk = ~clk; // período

// prueba
initial 
	begin
	  // inicialización de señales
	  clk = 0;  // inicia clk en 0
	  rst = 1; // reset activo
	  enable = 0; // deshabilitado el contador
	  switch = 0; // iniciamos el contador en modo descendiente (baja)
	  load = 0; // no cargamos ningún valor
	  load_switch = 6'd0; // cargamos el 0
	  
	  #10 rst = 0; // desactivar reset
	  
	  #10 enable = 1; // activar el contador
	  switch = 1; // contador en modo ascendente (sube)
	  
	  #100 switch = 0; // cambiar a modo descendente (baja)
	  
	  #50 load = 1; // activamos la carga de un valor específico
	  load_switch = 6'd25; // cargamos el valor 25
	  #10 load = 0; // desactivamos la señal de carga 
	  
	end

endmodule