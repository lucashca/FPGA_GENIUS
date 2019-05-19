////////////////////////////////////////////////////////////////////////////////
// Joao Bittencourt
// Nov 6, 2018
////////////////////////////////////////////////////////////////////////////////
module XYCounter #(
	parameter width, height
	)(
	input clock,   
	input enable,  
	output reg [$clog2(width)-1:0] x = -1,
	output reg [$clog2(height)-1:0] y = 0
	);

	always @(posedge clock) begin
		/* Place your code here */
		x <= ~enable ? x : (x == width-1) ? 1'b0 :(x + 1'b1);
		y <= ~enable ? y : (x == width-1 && y == height-1) ? 1'b0 : (x == width-1)?(y + 1'b1):y; 
		end
	
	
endmodule
