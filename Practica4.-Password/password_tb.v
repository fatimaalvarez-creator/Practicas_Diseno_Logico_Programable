// tiempo
`timescale 1ns/100ps

// testbench del módulo de password
module password_tb();

// auxiliares
reg clk; // reloj
reg rst; // reset 
reg [9:0] SW; // switches
wire [6:0] HEX0, HEX1, HEX2, HEX3; // displays

// instanciamos el módulo password
password PASSWORD (
  .clk(clk),
  .rst(rst),
  .SW(SW),
  .HEX0(HEX0),
  .HEX1(HEX1),
  .HEX2(HEX2),
  .HEX3(HEX3)
);

// generación del reloj
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

// pruebas
initial 
	begin
		// inicializamos
		clk = 0;
		rst = 0;
		SW = 0; // inicializamos los switch

		// secuencia de reset
		#10 rst = 1;
		#10 rst = 0;
      #10;

		// caso 1: secuencia correcta de contraseña

		  SW = 2; // 2 (SW[2] = 1)
        #20;
        #20;
        SW = 0; // 0 (SW[0] = 1)
        #20;
        #20;
        SW = 1; // 1 (SW[1] = 1)
        #20;
        #20;
        SW = 8; // 8 (SW[8] = 1)
        #20;
        #20;
		  
		  
	  
	end
endmodule