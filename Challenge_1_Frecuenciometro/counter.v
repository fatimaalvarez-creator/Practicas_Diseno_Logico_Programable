// módulo contador de frecuencia
module counter (
    input clk,              // reloj
    input rst,              // reset
    input signal_in,        // señal de entrada a medir
    input enable,           // habilitación
    output reg [27:0] count_out // contador de pulsos de la señal
);

// auxiliares
reg signal_reg, signal_delayed;
wire signal_edge;
reg [27:0] counter;

// detector de flancos para la señal de entrada
always @(posedge clk or posedge rst) begin
    if (rst) begin
        signal_reg <= 1'b0;
        signal_delayed <= 1'b0;
    end else begin
        signal_reg <= signal_in;
        signal_delayed <= signal_reg;
    end
end

// auxiliar - detección de flanco ascendente
assign signal_edge = signal_reg & ~signal_delayed;

// contador de pulsos
always @(posedge clk or posedge rst) begin
    if (rst) begin
        counter <= 28'd0;
    end else if (~enable) begin
        counter <= 28'd0;
    end else if (signal_edge) begin
        counter <= counter + 1'b1;
    end
end

// salida del contador
always @(posedge clk or posedge rst) begin
    if (rst) begin
        count_out <= 28'd0;
    end else begin
        count_out <= counter;
    end
end

endmodule
