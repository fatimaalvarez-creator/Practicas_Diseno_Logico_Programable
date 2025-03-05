// módulo de decodificar BCD (binario-decimal)
module decoder_bcd
	#(parameter N=10, SEGMENTOS = 7)
	(input [N-1:0] BCD_in_sw,
	output [0:SEGMENTOS-1] D_unidades,
									D_decenas,
									D_centenas,
									D_miles
);

// auxiliares
wire[N-1:0] unidades_wire;
wire[N-1:0] decenas_wire;
wire[N-1:0] centenas_wire;
wire[N-1:0] miles_wire;

// cálculos de cada dígito (unidades, decenas, centenas y unidades de millar) 
assign unidades_wire = BCD_in_sw % 10;
assign decenas_wire = BCD_in_sw % 100 / 10;
assign centenas_wire = BCD_in_sw % 1000 / 100;
assign miles_wire = BCD_in_sw / 1000;

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