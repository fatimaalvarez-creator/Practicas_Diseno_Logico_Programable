// Módulo contador de frecuencia
module counter (
    input clk,              // Reloj del sistema
    input rst,              // Reset
    input signal_in,        // Señal de entrada a medir
    input enable,           // Habilitación
    output reg [27:0] count_out // Contador de pulsos de la señal
);

    reg signal_reg, signal_delayed;
    wire signal_edge;
    reg [27:0] counter;

    // Detector de flancos para la señal de entrada
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            signal_reg <= 1'b0;
            signal_delayed <= 1'b0;
        end else begin
            signal_reg <= signal_in;
            signal_delayed <= signal_reg;
        end
    end

    // Detección de flanco ascendente
    assign signal_edge = signal_reg & ~signal_delayed;

    // Contador de pulsos
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 28'd0;
        end else if (~enable) begin
            counter <= 28'd0;
        end else if (signal_edge) begin
            counter <= counter + 1'b1;
        end
    end

    // Salida del contador
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count_out <= 28'd0;
        end else begin
            count_out <= counter;
        end
    end

endmodule