// módulo de divisor de reloj
// genera una señal de reloj de menor frecuencia a partir del reloj principal
module clkdiv_PWM #(
    parameter frec = 20 // frecuencia deseada (20Hz)
)(
    input clk,      // reloj de entrada (50MHz)
    input rst,      // reset
    output reg clk_div  // reloj dividido de salida
);

// calculamos el valor límite para el contador
// (50MHz / (2*frec_deseada)) - 1
localparam limit = (50_000_000 / (2*frec)) - 1;

// contador para la división
reg [31:0] counter = 32'd0;

always @(posedge clk or posedge rst) begin
  if (rst) begin
		counter <= 32'd0;
		clk_div <= 1'b0;
  end
  else begin
		if (counter >= limit) begin
			 counter <= 32'd0;
			 clk_div <= ~clk_div; // invertimos la salida
		end
		else begin
			 counter <= counter + 32'd1;
		end
  end
end

endmodule
