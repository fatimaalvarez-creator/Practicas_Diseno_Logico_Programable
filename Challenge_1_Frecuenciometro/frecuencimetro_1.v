// módulo frecuencímetro
module frecuencimetro_1 (
    input clk,               // reloj
    input rst,               // reset
    input signal_in,         // señal de entrada
    input enable,            // habilitación
    input [27:0] count_in,   // entrada del contador
    output reg [27:0] freq_calculated // frecuencia calculada
);

// parámetros
localparam SAMPLE_TIME = 28'd100000000; // 1 segundo a 100MHz
    
// auxiliares
reg [27:0] counter_time; // contador de tiempo de muestreo
reg sample_done;         // bandera de muestreo completado
reg [27:0] count_latch;  // registro para almacenar el conteo actual

// contador de tiempo de muestreo
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
            count_latch <= count_in; // guarda el valor actual del contador
        end
    end
end

// cálculo de frecuencia
always @(posedge clk or posedge rst) begin
    if (rst) begin
        freq_calculated <= 28'd0;
    end else if (~enable) begin
        freq_calculated <= 28'd0;
    end else if (sample_done) begin
        freq_calculated <= count_latch; // la frecuencia es igual al conteo en 1 segundo
    end
end

endmodule
