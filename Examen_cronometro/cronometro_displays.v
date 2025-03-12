// módulo de cronometro
module cronometro_displays (
    input clk,        // reloj
    input rst,        // reset - switch
    input enable,     // habilitador - switch
    output reg [9:0] ms,   // contador de milisegundos (0-999)
    output reg [5:0] sec,  // contador de segundos (0-59)
    
    // salidas para displays
    output reg [6:0] display_ms_unidades,    // display 7 segmentos para unidades de ms
    output reg [6:0] display_ms_decenas,     // display 7 segmentos para decenas de ms
    output reg [6:0] display_ms_centenas,    // display 7 segmentos para centenas de ms
    output reg [6:0] display_sec_unidades,   // display 7 segmentos para unidades de segundos
    output reg [6:0] display_sec_decenas     // display 7 segmentos para decenas de segundos
);

// auxiliares
reg [25:0] count;  // contador de ciclos de reloj (50 millones para 1 segundo)

// variables para separar dígitos
reg [3:0] ms_unidades;
reg [3:0] ms_decenas;
reg [3:0] ms_centenas;
reg [3:0] sec_unidades;
reg [3:0] sec_decenas;
 
   
// lógica de; contador
always @(posedge clk or posedge rst) 
	begin
		if (rst) 
			begin
				count <= 0;
				ms <= 0;
				sec <= 0;	
			end 
		else if (enable) 
			begin
				count <= count + 1;
				
				// 50,000 ciclos = 1 ms (50MHz / 1000)
				if (count >= 50000) 
					begin
						count <= 0;
						ms <= ms + 1;

				// si ms llega a 1000, se reinicia y aumenta los segundos
				if (ms == 999) 
					begin
						ms <= 0;
						sec <= sec + 1;

				// si segundos llega a 60, se reinicia
				if (sec == 59) 
					begin
						sec <= 0;
					end
					end
					end
			end
	end
 
// lógica para separar los dígitos
always @(*) 
	begin
		// dígitos de milisegundos
		ms_unidades = ms % 10;
		ms_decenas = (ms / 10) % 10;
		ms_centenas = (ms / 100) % 10;

		// dígitos de segundos
		sec_unidades = sec % 10;
		sec_decenas = sec / 10;

	  // convertir a display de 7 segmentos
	  case(ms_unidades)
			4'd0: display_ms_unidades = 7'b1000000; // 0
			4'd1: display_ms_unidades = 7'b1111001; // 1
			4'd2: display_ms_unidades = 7'b0100100; // 2
			4'd3: display_ms_unidades = 7'b0110000; // 3
			4'd4: display_ms_unidades = 7'b0011001; // 4
			4'd5: display_ms_unidades = 7'b0010010; // 5
			4'd6: display_ms_unidades = 7'b0000010; // 6
			4'd7: display_ms_unidades = 7'b1111000; // 7
			4'd8: display_ms_unidades = 7'b0000000; // 8
			4'd9: display_ms_unidades = 7'b0010000; // 9
			default: display_ms_unidades = 7'b1111111; // apagado
	  endcase
	  
	  case(ms_decenas)
			4'd0: display_ms_decenas = 7'b1000000;
			4'd1: display_ms_decenas = 7'b1111001;
			4'd2: display_ms_decenas = 7'b0100100;
			4'd3: display_ms_decenas = 7'b0110000;
			4'd4: display_ms_decenas = 7'b0011001;
			4'd5: display_ms_decenas = 7'b0010010;
			4'd6: display_ms_decenas = 7'b0000010;
			4'd7: display_ms_decenas = 7'b1111000;
			4'd8: display_ms_decenas = 7'b0000000;
			4'd9: display_ms_decenas = 7'b0010000;
			default: display_ms_decenas = 7'b1111111;
	  endcase
	  
	  case(ms_centenas)
			4'd0: display_ms_centenas = 7'b1000000;
			4'd1: display_ms_centenas = 7'b1111001;
			4'd2: display_ms_centenas = 7'b0100100;
			4'd3: display_ms_centenas = 7'b0110000;
			4'd4: display_ms_centenas = 7'b0011001;
			4'd5: display_ms_centenas = 7'b0010010;
			4'd6: display_ms_centenas = 7'b0000010;
			4'd7: display_ms_centenas = 7'b1111000;
			4'd8: display_ms_centenas = 7'b0000000;
			4'd9: display_ms_centenas = 7'b0010000;
			default: display_ms_centenas = 7'b1111111;
	  endcase
	  
	  case(sec_unidades)
			4'd0: display_sec_unidades = 7'b1000000;
			4'd1: display_sec_unidades = 7'b1111001;
			4'd2: display_sec_unidades = 7'b0100100;
			4'd3: display_sec_unidades = 7'b0110000;
			4'd4: display_sec_unidades = 7'b0011001;
			4'd5: display_sec_unidades = 7'b0010010;
			4'd6: display_sec_unidades = 7'b0000010;
			4'd7: display_sec_unidades = 7'b1111000;
			4'd8: display_sec_unidades = 7'b0000000;
			4'd9: display_sec_unidades = 7'b0010000;
			default: display_sec_unidades = 7'b1111111;
	  endcase
	  
	  case(sec_decenas)
			4'd0: display_sec_decenas = 7'b1000000;
			4'd1: display_sec_decenas = 7'b1111001;
			4'd2: display_sec_decenas = 7'b0100100;
			4'd3: display_sec_decenas = 7'b0110000;
			4'd4: display_sec_decenas = 7'b0011001;
			4'd5: display_sec_decenas = 7'b0010010;
			default: display_sec_decenas = 7'b1111111;
	  endcase
	end
endmodule