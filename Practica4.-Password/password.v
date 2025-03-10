// módulo para password, mi password es '2018', si se levantan los sw correctos manda 'done', sino 'error'
module password(
    input clk,           // reloj
    input rst,           // reset
    input [9:0] SW,      // 10 bits, switches
    
    // display outputs
    output reg [6:0] HEX0, 
    output reg [6:0] HEX1, 
    output reg [6:0] HEX2, 
    output reg [6:0] HEX3
);

// instancia de clkdiv
clkdiv CLKDIV(
	.clk(clk),
	.rst(!rst),  // negamos el reset
	.clk_div(clk_div)
);	  

// definir parámetros - todos los estados involucrados
localparam IDLE = 0;     // estado inicial
localparam P_DIG = 1;    // primer dígito (2)
localparam S_DIG = 2;    // segundo dígito (0)
localparam T_DIG = 3;    // tercer dígito (1)
localparam DONE = 4;     // estado de 'done'
localparam ERROR = 5;    // estado de 'error'

// definir los códigos para los números y caracteres
parameter D     = 7'b0100001; // d
parameter O     = 7'b1000000; // o
parameter N     = 7'b1001000; // n
parameter E     = 7'b0000110; // E
parameter R     = 7'b0101111; // r
parameter BLANK = 7'b1111111; // todos en blanco
parameter GUION = 7'b0111111; // guión 

// declarar registros para el estado
reg [3:0] current_state; // 3 bits
reg [3:0] next_state;    // 3 bits
wire [9:0] sw_one_shot;  // señales de one-shot para los switches

// primer always (MEMORIA), depende del reloj, actualiza el current_state 
always @(posedge clk_div or negedge rst)
begin
    if(!rst)             // cuando reset es activo (0)
        current_state <= IDLE; // volvemos al estado inicial
    else
        current_state <= next_state;
end

// segundo always, lógica para calcular el siguiente estado
always @(*)
begin
    next_state = current_state;
    
    case (current_state)
        IDLE: 
        begin
            if (sw_one_shot == 0)  // cuando no hay ningún switch
                next_state = IDLE; // se mantiene en estado ideal
            else
            begin
                if (sw_one_shot[2] == 1 && sw_one_shot[9:3] == 0 && sw_one_shot[1:0] == 0) // Solo switch 2 activo
                    next_state = P_DIG; 
                else
                    next_state = ERROR; 
            end
        end
        
        P_DIG: 
        begin
            if (sw_one_shot==0)  // cuando no hay ningún switch
                next_state = P_DIG; // se mantiene en P_DIG
            else
            begin
                if (sw_one_shot[0] == 1 && sw_one_shot[9:1] == 0) // Solo switch 0 activo
                    next_state = S_DIG; // se va al S_DIG
                else
                    next_state = ERROR; 
            end
        end     
                 
        S_DIG: 
        begin
            if (sw_one_shot == 0)  // cuando no hay ningún switch
                next_state = S_DIG; // se mantiene en S_DIG
            else
            begin
                if (sw_one_shot[1] == 1 && sw_one_shot[9:2] == 0 && sw_one_shot[0] == 0) // Solo switch 1 activo
                    next_state = T_DIG; // se va al T_DIG
                else
                    next_state = ERROR; 
            end
        end     
                 
        T_DIG: 
        begin
            if (sw_one_shot == 0)  // cuando no hay ningún switch
                next_state = T_DIG; // se mantiene en T_DIG
            else
            begin
                if (sw_one_shot[8] == 1 && sw_one_shot[9] == 0 && sw_one_shot[7:0] == 0) // Solo switch 8 activo (cambiado de 6 a 8)
                    next_state = DONE; 
                else
                    next_state = ERROR; 
            end
        end     
        
		  
        DONE: 
        begin
            if (sw_one_shot == 0)  // cuando no hay ningún switch
                next_state = IDLE; // se va a IDLE
            else 
                next_state = DONE; // se mantiene en DONE mientras hay switches activos
        end
                 
        ERROR: 
        begin
            if (sw_one_shot == 0)  // cuando no hay ningún switch
                next_state = IDLE; // se va a IDLE
            else 
                next_state = ERROR; // se mantiene en ERROR mientras hay switches activos
        end
     
        default: 
            next_state = IDLE;
    endcase
end
 
// tercer always, actualiza las señales de salida
always @(*)
		begin
			// display current digit entry progress
			case (current_state)
			  0:
			  begin
					//LEDS[0] <= 1;
					HEX0 <= BLANK;
					HEX1 <= BLANK;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
			  
			  1:
			  begin
					//LEDS[1] <= 1;
					HEX0 <= GUION;
					HEX1 <= BLANK;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
			  
			  2:
			  begin
					//LEDS[2] <= 1;
					HEX0 <= GUION;
					HEX1 <= GUION;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
			  
			  3:
			  begin
					//LEDS[3] <= 1;
					HEX0 <= GUION;
					HEX1 <= GUION;
					HEX2 <= GUION;
					HEX3 <= BLANK;
			  end

			  
			  4:
			  begin
					//LEDS[4] <= 1;
					HEX0 <= E;
					HEX1 <= N;
					HEX2 <= O;
					HEX3 <= D;
			  end
			  
			  5:
			  begin
					//LEDS[5] <= 1;
					HEX0 <= O;
					HEX1 <= R;
					HEX2 <= R;
					HEX3 <= E;
			  end
			  
			  default:
			  begin
					//LEDS[0] <= 1;
					HEX0 <= BLANK;
					HEX1 <= BLANK;
					HEX2 <= BLANK;
					HEX3 <= BLANK;
			  end
    endcase
end
     
	  
// generación de one-shots para cada switch
genvar i;
generate
    for (i = 0; i < 10; i = i + 1) 
    begin: ONE_SHOT_INSTANCIADO
        one_shot ONE_(
            .clk(clk_div),
            .button_a(SW[i]),
            .button_one_shot(sw_one_shot[i])
        );
    end
endgenerate

endmodule