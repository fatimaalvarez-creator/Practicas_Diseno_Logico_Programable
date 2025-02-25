// módulo de counter BCD con clok up-down 
// incrementa o decrementa el valor en formato BCD.
module counterBCD_clk_up_down#(parameter N=7, SEGMENTOS = 7)(
	input clk,
		  rst,
		  enable,
		  switch, //0 baja, 1 sube (up/down)
	output [0:SEGMENTOS-1] D_unidades,
									D_decenas,
									D_centenas,
									D_miles
);


// auxiliares
wire clk_div_to_clk_counter;
wire [7:0] counter_to_BCD;
wire enable_debouncer_to_counter;

// auxiliares display
wire[N-1:0] unidades_wire;
wire[N-1:0] decenas_wire;
wire[N-1:0] centenas_wire;
wire[N-1:0] miles_wire;

// instanciamos
// instanciamos clk_div
clkdiv CLK_DIV(
	.clk(clk),
	.rst(rst), // si queremos resetear
	.clk_div(clk_div_to_clk_counter)
);

// instanciamos el debouncer
debouncer DEB(
	.clk(clk),
	.rst_a_p(rst), // si queremos resetear
	.debouncer_in(enable),
	.debouncer_out(enable_debouncer_to_counter)
);

// instanciamos el counter
counter_up_down COUNTER_UP_DOWN(
	.clk(clk_div_to_clk_counter),
	.rst(rst),
	.enable(enable),
	.switch(switch),
	.count(counter_to_BCD)
);

// instanciamos el BCD
decoder_bcd BCD(
	.BCD_in_sw(counter_to_BCD)
);

// cálculos de cada dígito (unidades, decenas, centenas y unidades de millar) 
assign unidades_wire = counter_to_BCD % 10;
assign decenas_wire = counter_to_BCD % 100 / 10;
assign centenas_wire = counter_to_BCD % 1000 / 100;
assign miles_wire = counter_to_BCD / 1000;

// instanciamos
// display unidades
decoder_7seg DISPLAY_U(
	.decoder_in(unidades_wire),
	.decoder_out(D_unidades)
);

// display decenas
decoder_7seg DISPLAY_D(
	.decoder_in(decenas_wire),
	.decoder_out(D_decenas)
);

// display centenas
decoder_7seg DISPLAY_C(
	.decoder_in(centenas_wire),
	.decoder_out(D_centenas)
);

// display miles
decoder_7seg DISPLAY_M(
	.decoder_in(miles_wire),
	.decoder_out(D_miles)
);


endmodule