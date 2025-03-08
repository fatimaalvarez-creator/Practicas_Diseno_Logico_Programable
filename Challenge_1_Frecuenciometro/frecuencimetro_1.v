// Módulo frecuencímetro
module frecuencimetro_1 (
    input clk,               // Reloj del sistema
    input rst,               // Reset
    input signal_in,         // Señal de entrada
    input enable,            // Habilitación
    input [27:0] count_in,   // Entrada del contador
    output reg [27:0] freq_calculated // Frecuencia calculada
);

    // Constantes
    localparam SAMPLE_TIME = 28'd100000000; // 1 segundo a 100MHz
    
    // Registros
    reg [27:0] counter_time; // Contador de tiempo de muestreo
    reg sample_done;         // Bandera de muestreo completado
    reg [27:0] count_latch;  // Registro para almacenar el conteo actual

    // Contador de tiempo de muestreo
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter_time <= 28'd0;
            sample_done <= 1'b0;
            count_latch <= 28'd0;
        end else if (~enable) begin
            counter_time <= 28'd0;
            sample_done <= 1'b0;
            count_latch <= 28'd0;
        end else begin
            if (counter_time < SAMPLE_TIME - 1) begin
                counter_time <= counter_time + 1'b1;
                sample_done <= 1'b0;
            end else begin
                counter_time <= 28'd0;
                sample_done <= 1'b1;
                count_latch <= count_in; // Captura el valor actual del contador
            end
        end
    end

    // Cálculo de frecuencia
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            freq_calculated <= 28'd0;
        end else if (~enable) begin
            freq_calculated <= 28'd0;
        end else if (sample_done) begin
            freq_calculated <= count_latch; // La frecuencia es igual al conteo en 1 segundo
        end
    end

endmodule
