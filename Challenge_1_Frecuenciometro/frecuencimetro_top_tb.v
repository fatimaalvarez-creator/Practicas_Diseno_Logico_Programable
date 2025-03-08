`timescale 1ns / 1ps

module frecuencimetro_top_tb();

    // Señales para los puertos
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
    
    // Instanciar el DUT (Device Under Test)
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
    
    // Generación de reloj (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    // Generación de señal de entrada (1 MHz)
    initial begin
        signal_in = 0;
        forever #500 signal_in = ~signal_in;
    end
    
    // Secuencia de prueba básica
    initial begin
        // Inicialización
        rst = 1;
        enable = 0;
        
        // Esperar 10 ciclos de reloj
        #100;
        
        // Liberar reset
        rst = 0;
        #50;
        
        // Habilitar el frecuencímetro
        enable = 1;
        
        // Esperar tiempo suficiente para medición (100 ms)
        #100_000_000;
        
        // Desactivar y hacer reset
        enable = 0;
        #100;
        rst = 1;
        #100;
        rst = 0;
        
        // Finalizar simulación después de un poco más de tiempo
        #1000;
        $finish;
    end

endmodule