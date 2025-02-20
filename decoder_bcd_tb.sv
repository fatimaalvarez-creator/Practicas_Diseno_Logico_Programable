`timescale 1ns/100ps

module decoder_bcd_tb
#(parameter N=10, ITERACIONES=10)();

// entradas 10 switches es reg 
reg [N-1:0] BCD_in_sw_tb;

// salidas 4 bits son los segmentos es wire
wire [0:6] display_unidades;
wire [0:6] display_decenas;
wire [0:6] display_centenas;
wire [0:6] display_miles;

// instancia
decoder_bcd DUT(
	.BCD_in_sw(BCD_in_sw_tb),
	.D_unidades(display_unidades),
	.D_decenas(display_decenas),
	.D_centenas(display_centenas),
	.D_miles(display_miles)
);

// creamos un tarea para generar números randoms
task set_input();
	BCD_in_sw_tb = $urandom_range(0,2**N-1); // números random dede 0 a 1023
	$display("Valor a probar = %d", BCD_in_sw_tb);
	#10;

endtask

// variable para usar en el `for`
integer i;

initial
begin
	for (i=0; i<ITERACIONES; i=i+1) // declaramos la condición 
	begin
		set_input(); // task de números radoms
	end
end

endmodule