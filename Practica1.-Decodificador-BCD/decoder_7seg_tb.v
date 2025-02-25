// tiempo
`timescale 1ns / 1ps

// módulo para el testbench
module decoder_7seg_tb();

// auxiliares
reg [3:0] decoder_in;
wire [0:6] decoder_out;
    
    // instancia del módulo
    decoder_7seg DUT (
        .decoder_in(decoder_in),
        .decoder_out(decoder_out)
    );
    
 // iniciamos las pruebas
 initial 
	 begin
	  // probamos todos los valores posibles de entrada (0 a 15)
	  decoder_in = 0;  
	  #10;
	  decoder_in = 1;  
	  #10;
	  decoder_in = 2;  
	  #10;
	  decoder_in = 3;  
	  #10;
	  decoder_in = 4;  
	  #10;
	  decoder_in = 5;  
	  #10;
	  decoder_in = 6;  
	  #10;
	  decoder_in = 7;  
	  #10;
	  decoder_in = 8;  
	  #10;
	  decoder_in = 9;  
	  #10;
	  decoder_in = 10; 
	  #10;
	  decoder_in = 11; 
	  #10;
	  decoder_in = 12; 
	  #10;
	  decoder_in = 13; 
	  #10;
	  decoder_in = 14; 
	  #10;
	  decoder_in = 15; 
	  #10;
	  
	  $stop;
	  $finish;
    end

endmodule
