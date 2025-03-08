// tiempo
`timescale 1ns / 1ps

// testbench del frecuencimetro
module frecuencimetro_top_tb();

// señales del frecuencimetro_top
reg clk;
reg rst;
reg signal_in;
reg enable;
wire [6:0] D_unidades;
wire [6:0] D_decenas;
wire [6:0] D_centenas;
wire [6:0] D_miles;
wire [6:0] D_decenas_miles;
wire [6:0] D_centenas_miles;
wire [27:0] freq_out;
    
// instanciamos el frecuencimetro_top
frecuencimetro_top FREQ_TOP (
    .clk(clk),
    .rst(rst),
    .signal_in(signal_in),
    .enable(enable),
    .D_unidades(D_unidades),
    .D_decenas(D_decenas),
    .D_centenas(D_centenas),
    .D_miles(D_miles),
    .D_decenas_miles(D_decenas_miles),
    .D_centenas_miles(D_centenas_miles),
    .freq_out(freq_out)
);
    
// generación de reloj (100 MHz)
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// generación de señal de entrada (1 MHz)
initial begin
    signal_in = 0;
    forever #500 signal_in = ~signal_in;
end

// pruebas
initial 
    begin
    // inicialización de variables
    rst = 1;
    enable = 0;
    #100;
        
    // liberar reset
    rst = 0;
    #50;
    
    // habilitar el frecuencímetro
    enable = 1;
    #100_000_000;  // esperar tiempo de  (100 ms)
        
    // desactivar y hacer reset
    enable = 0;
    #100;
    rst = 1;
    #100;
    rst = 0;
    
    // finalizar
    #1000;
    $finish;
    end

endmodule
