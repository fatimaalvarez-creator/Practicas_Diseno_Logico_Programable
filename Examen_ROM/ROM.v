// módulo de memoria tipo ROM (Read Only Memory)
module ROM #(parameter DATA_WIDTH = 8, ADDRESS_WIDTH = 4)
(
	input clk, // clk
	input rst, // rst 
	input ce, // clk enable 
	input read_en, // read enable
   input [DATA_WIDTH-1:0] data_in, // dato de entrada
	output [ADDRESS_WIDTH - 1:0] address_out, // dirección 8 bits para acceder a los 256
	output [DATA_WIDTH - 1:0] data_out, // salida de datos 8 bits 
	output reg hit, // indica si el dato y el address fue encontrado
	
	// displays 
	output reg [6:0] display_data_unidades,    // Display 7 segmentos para unidades de ms
	output reg [6:0] display_data_decenas,     // Display 7 segmentos para decenas de ms
	output reg [6:0] display_data_centenas,    // Display 7 segmentos para centenas de ms
	output reg [6:0] display_data_miles  // Display 7 segmentos para unidades de segundos

);


// memoria ROM
reg [DATA_WIDTH - 1:0] ROM_MEMORY [0:2**(ADDRESS_WIDTH) -1]; // inicia en el address 0 y va al 255, es de 8 bits

initial
	begin
		$readmemh("Mem_hex.hex", ROM_MEMORY); // sirve para que lea un archivo y lo asocie a la memoria
		// $readmemh -> hexadecimal
		// $readmemb -> binario
				
	end
	
assign data = (ce && read_en)? ROM_MEMORY[address_out & data_out]: 0;
// asignamos a data que cuando el clk enable y el read enable estén en 1 se vaya al address que damos, sino no hace nada
// address del registro en la memoria 
	

// lógica para buscar el dato máximo
integer i;
	
always @(posedge clk or posedge rst) 
	begin
    if (rst) 
		begin
        hit <= 0;
        address_out <= 0;
        data_out <= 0;
		end 
	else if (ce && read_en)
		begin
        // inicializar con el primer elemento
        data_out <= ROM_MEMORY[0];
        address_out <= 0;
        hit <= 1;
        
        // buscar el valor máximo
        for (i = 1; i < 2**ADDRESS_WIDTH; i = i + 1) 
				begin
					if (ROM_MEMORY[i] > data_out) 
						begin
						 data_out <= ROM_MEMORY[i];
						 address_out <= i;
						end
				end
		end
end

// Variables para separar dígitos
    reg [3:0] data_unidades;
    reg [3:0] data_decenas;
    reg [3:0] data_centenas;
    reg [3:0] data_miles;


// Lógica para separar los dígitos
    always @(*) begin
        // Separar dígitos de milisegundos
        data_unidades = data_out % 10;
        data_decenas = (data_out / 10) % 10;
        data_centenas = (data_out / 100) % 10;
        data_miles = (data_out / 1000) % 10;
        
        // Convertir a display de 7 segmentos
        case(data_unidades)
            4'd0: display_data_unidades = 7'b1000000; // 0
            4'd1: display_data_unidades = 7'b1111001; // 1
            4'd2: display_data_unidades = 7'b0100100; // 2
            4'd3: display_data_unidades = 7'b0110000; // 3
            4'd4: display_data_unidades = 7'b0011001; // 4
            4'd5: display_data_unidades = 7'b0010010; // 5
            4'd6: display_data_unidades = 7'b0000010; // 6
            4'd7: display_data_unidades  = 7'b1111000; // 7
            4'd8: display_data_unidades = 7'b0000000; // 8
            4'd9: display_data_unidades = 7'b0010000; // 9
            default: display_data_unidades = 7'b1111111; // apagado
        endcase
        
        case(data_decenas)
            4'd0: display_data_decenas = 7'b1000000;
            4'd1: display_data_decenas = 7'b1111001;
            4'd2: display_data_decenas = 7'b0100100;
            4'd3: display_data_decenas = 7'b0110000;
            4'd4: display_data_decenas = 7'b0011001;
            4'd5: display_data_decenas = 7'b0010010;
            4'd6: display_data_decenas = 7'b0000010;
            4'd7: display_data_decenas = 7'b1111000;
            4'd8: display_data_decenas = 7'b0000000;
            4'd9: display_data_decenas = 7'b0010000;
            default: display_data_decenas = 7'b1111111;
        endcase
        
        case(data_centenas)
            4'd0: display_data_centenas = 7'b1000000;
            4'd1: display_data_centenas = 7'b1111001;
            4'd2: display_data_centenas = 7'b0100100;
            4'd3: display_data_centenas = 7'b0110000;
            4'd4: display_data_centenas = 7'b0011001;
            4'd5: display_data_centenas = 7'b0010010;
            4'd6: display_data_centenas = 7'b0000010;
            4'd7: display_data_centenas = 7'b1111000;
            4'd8: display_data_centenas = 7'b0000000;
            4'd9: display_data_centenas = 7'b0010000;
            default: display_data_centenas = 7'b1111111;
        endcase
        
        case(data_miles)
            4'd0: display_data_miles = 7'b1000000;
            4'd1: display_data_miles = 7'b1111001;
            4'd2: display_data_miles = 7'b0100100;
            4'd3: display_data_miles = 7'b0110000;
            4'd4: display_data_miles = 7'b0011001;
            4'd5: display_data_miles = 7'b0010010;
            4'd6: display_data_miles = 7'b0000010;
            4'd7: display_data_miles = 7'b1111000;
            4'd8: display_data_miles = 7'b0000000;
            4'd9: display_data_miles = 7'b0010000;
            default: display_data_miles = 7'b1111111;
        endcase
    end
endmodule