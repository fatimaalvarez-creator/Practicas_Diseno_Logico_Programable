module frecuencimetro_top(
    input clk,
            rst,
            signal_in,
            enable,
    output [6:0] D_unidades,   // display (unidades)
    output [6:0] D_decenas,    // display (decenas)
    output [6:0] D_centenas,   // display (centenas)
    output [6:0] D_miles,      // display (millares)
    output [6:0] D_decenas_miles,      // display (decenas de millar)
    output [6:0] D_centenas_miles,      // display (centenas de millar)
    output [27:0] freq_out     // frecuencia calculada
);
    
// señales auxiliares
wire [27:0] count_out;     // salida del contador
    
// intstanciamos el contador de frecuencia
counter COUNTER (
    .clk(clk),
    .rst(rst),
    .signal_in(signal_in),
    .enable(enable),
    .count_out(count_out)
);
    
// instanciamos frecuencímetro (top)
frecuencimetro_1 FREQ (
    .clk(clk),
    .rst(rst),
    .signal_in(signal_in),
    .enable(enable),
    .count_in(count_out),
    .freq_calculated(freq_out)
);

// instanciamos el decoder BCD para convertir el valor binario a decimal
decoder_bcd #(
    .N(28),
    .SEGMENTOS(7)
) BCD (
    .BCD_in(freq_out),
    .D_unidades(D_unidades),
    .D_decenas(D_decenas),
    .D_centenas(D_centenas),
    .D_miles(D_miles),
    .D_decenas_miles(D_decenas_miles),
    .D_centenas_miles(D_centenas_miles)
);
endmodule
