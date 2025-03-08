// módulo de decodificar BCD (binario-decimal)
module decoder_bcd
    #(parameter N=28, SEGMENTOS = 7)
    (input [N-1:0] BCD_in,
    output [SEGMENTOS-1:0] D_unidades,
                          D_decenas,
                          D_centenas,
                          D_miles,
                          D_decenas_miles,
                          D_centenas_miles
    );
    // auxiliares - utilizamos solo 4 bits para cada dígito
    wire [3:0] unidades_wire;
    wire [3:0] decenas_wire;
    wire [3:0] centenas_wire;
    wire [3:0] miles_wire;
    wire [3:0] decenas_miles_wire;
    wire [3:0] centenas_miles_wire;
    
    // cálculos de cada dígito 
    assign unidades_wire = BCD_in % 10; // unidades
    assign decenas_wire = (BCD_in / 10) % 10; // decenas
    assign centenas_wire = (BCD_in / 100) % 10; // centenas
    assign miles_wire = (BCD_in / 1000) % 10; // miles
    assign decenas_miles_wire = (BCD_in / 10000) % 10; // decenas de miles
    assign centenas_miles_wire = (BCD_in / 100000) % 10; // centenas de miles
    
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
    // display decenas_miles
    decoder_7seg DISPLAY_DM(
        .decoder_in(decenas_miles_wire),
        .decoder_out(D_decenas_miles)
    );
    // display centenas_miles
    decoder_7seg DISPLAY_CM(
        .decoder_in(centenas_miles_wire),
        .decoder_out(D_centenas_miles)
    );
endmodule