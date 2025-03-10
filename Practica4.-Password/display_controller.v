// módulo de display controller de 'done' y 'error'
module display_controller(
    input clk,
    input rst,
    input [9:0] SW,   // switches, para capturar los dígitos de la contraseña
    input [2:0] current_state, // estado actual
    output reg [6:0] HEX0, // display de 7 segmentos HEX0
    output reg [6:0] HEX1, // display de 7 segmentos HEX1
    output reg [6:0] HEX2, // display de 7 segmentos HEX2
    output reg [6:0] HEX3  // display de 7 segmentos HEX3
);

// definir los códigos para los números y caracteres
    parameter D     = 7'b1000010; // d
    parameter O     = 7'b1000000; // o 
    parameter N     = 7'b1001000; // n
    parameter E     = 7'b0000110; // E
    parameter R     = 7'b0101111; // r
    parameter BLANK = 7'b1111111; // todos en blanco
	 parameter GUION = 7'b0111111; // guión 


always @(*)
	begin
			// display current digit entry progress
			case (current_state)
			  0:
			  begin
					HEX0 <= BLANK;
					HEX1 <= BLANK;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
			  
			  1:
			  begin
					HEX0 <= GUION;
					HEX1 <= BLANK;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
			  
			  2:
			  begin
					HEX0 <= GUION;
					HEX1 <= GUION;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
			  
			  3:
			  begin
					HEX0 <= GUION;
					HEX1 <= GUION;
					HEX2 <= GUION;
					HEX3 <= BLANK;
			  end

			  
			  5:
			  begin
					HEX0 <= D;
					HEX1 <= O;
					HEX2 <= N;
					HEX3 <= E;
			  end
			  
			  6:
			  begin
					HEX0 <= E;
					HEX1 <= R;
					HEX2 <= O;
					HEX3 <= R;
			  end
			  
			  default:
			  begin
					HEX0 <= BLANK;
					HEX1 <= BLANK;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
    endcase
end

endmodule