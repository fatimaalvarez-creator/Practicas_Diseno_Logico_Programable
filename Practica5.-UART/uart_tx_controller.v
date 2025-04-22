module uart_tx_controller #(
    parameter DATA_BITS = 8,
    parameter FREQ_TRANSMIT_TX = 1_000  // Frecuencia de transmisión en Hz
)(
    input wire clk,
    input wire rst,
    input wire send_data_tx,  // Señal de inicio de transmisión
    input wire tx_done,  // Indica que el UART terminó de enviar un byte
    output reg [DATA_BITS-1:0] tx_data,  // Byte a enviar
    output reg tx_send,  // Señal para activar uart_tx
    output reg busy  // Indica si está en transmisión
);

// Definición de estados
localparam IDLE = 2'b00;
localparam SEND_BYTE = 2'b01;
localparam WAIT_TX_DONE = 2'b10;
localparam WAIT_DELAY = 2'b11;  // Nuevo estado para manejar la frecuencia

reg [1:0] active_state = IDLE;
reg [3:0] byte_index = 0;  // Contador para seleccionar cada byte

// Frecuencia del sistema (ajustar según el hardware)
localparam CLK_FREQ = 50_000_000;
localparam DELAY_COUNT = (CLK_FREQ / FREQ_TRANSMIT_TX); // Ajuste de la frecuencia de transmisión
reg [31:0] delay_counter; // Contador para manejar el retardo

// Comandos predefinidos para el DOBOT
reg [7:0] command_sequence [0:12];

initial begin
    command_sequence[0]  = 8'hAA;  // Header
    command_sequence[1]  = 8'hAA;
    command_sequence[2]  = 8'h08;  // Tamaño del paquete
    command_sequence[3]  = 8'h03;  // Comando de movimiento
    command_sequence[4]  = 8'h00;
    command_sequence[5]  = 8'hC8;  // X = 200 mm
    command_sequence[6]  = 8'h00;
    command_sequence[7]  = 8'h00;
    command_sequence[8]  = 8'h00;
    command_sequence[9]  = 8'h32;  // Z = 50 mm
    command_sequence[10] = 8'h00;
    command_sequence[11] = 8'h00;
    command_sequence[12] = 8'h64;  // Checksum
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        active_state <= IDLE;
        byte_index <= 0;
        tx_send <= 0;
        busy <= 0;
        delay_counter <= 0;
    end else begin
        case (active_state)
            IDLE: begin
                if (send_data_tx) begin
                    byte_index <= 0;
                    busy <= 1;
                    delay_counter <= 0;
                    active_state <= SEND_BYTE;
                end
            end

            SEND_BYTE: begin
                tx_data <= command_sequence[byte_index];  // Cargar el byte a enviar
                tx_send <= 1;  // Activar la señal de transmisión
                active_state <= WAIT_TX_DONE;
            end

            WAIT_TX_DONE: begin
                if (tx_done) begin  // Esperar confirmación de que el byte fue transmitido
                    tx_send <= 0;  // Desactivar tx_send después de la transmisión completa
                    if (byte_index < 12) begin
                        byte_index <= byte_index + 1;
                        active_state <= WAIT_DELAY;  // Ir al estado de retardo antes de enviar el siguiente byte
                    end else begin
                        busy <= 0;  // Marcar como terminado
                        active_state <= IDLE;
                    end
                end
            end

            WAIT_DELAY: begin
                if (delay_counter < DELAY_COUNT) begin
                    delay_counter <= delay_counter + 1;
                end else begin
                    delay_counter <= 0;
                    active_state <= SEND_BYTE;  // Enviar el siguiente byte
                end
            end

            default: active_state <= IDLE;
        endcase
    end
end

endmodule
