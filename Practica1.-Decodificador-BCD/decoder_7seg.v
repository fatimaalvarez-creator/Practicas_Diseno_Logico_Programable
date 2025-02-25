// módulo de display de 7 segmentos 
module decoder_7seg(
	input [3:0] decoder_in,
	output reg [0:6] decoder_out
);

always @(*)
	begin
		case(decoder_in)
		0: decoder_out = 7'h01;
		1: decoder_out = 7'h4F;
		2: decoder_out = 7'h12;
		3: decoder_out = 7'h06;
		4: decoder_out = 7'h4C;
		5: decoder_out = 7'h24;
		6: decoder_out = 7'h20;
		7: decoder_out = 7'h0F;
		8: decoder_out = 7'h00;
		9: decoder_out = 7'h04;
		10: decoder_out = 7'h08;
		11: decoder_out = 7'h10;
		12: decoder_out = 7'h18;
		13: decoder_out = 7'h30;
		14: decoder_out = 7'h40;
		15: decoder_out = 7'h7F;
		default: decoder_out = 7'hFF;
		endcase
	
	end

endmodule