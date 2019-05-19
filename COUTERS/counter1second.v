`timescale 1ns / 1ps

module counter1second (
	input clock,    // Clock
	input [1:0] velocidade,
	input enable,
	output [3:0] y
);
	
	reg [31:0] value;
	reg saida;


always @(posedge clock) begin
	
	
	value <= enable ? (value + 1'b1) : 4'b0000 ;
	
	if(velocidade == 1) begin 	saida <= value [25];  end 
	if(velocidade == 2) begin 	saida <= value [26];  end 

end
	
	assign y = saida;

endmodule