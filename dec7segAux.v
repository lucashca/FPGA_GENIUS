//////////////////////////////////////////////////////////////////////////////////
// João Bittencourt
// Nov 2018
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module dec7segAux(
   input  [5:0] X,
   output [6:0] segment7,
   output [6:0] segment6
   );

	reg [6:0] seg7,seg6;
	
	always@ (*) begin
	
		case(X)
			0:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b0111111);
			end
			1:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b0000110);
			end
			2:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1011011);
			end
			3:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1001111);
			end
			4:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1100110);
			end
			5:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1101101);
			end
			6:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1111101);
			end
			7:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b0000111);
			end
			8:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1111111);
			end
			9:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b1101111);
			end
			10:begin 
				seg7 = ~(7'b0111111);
				seg6 = ~(7'b0111111);
			end
			11:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b0000110);
			end
			12:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1011011);
			end
			13:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1001111);
			end
			14:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1100110);
			end
			15:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1101101);
			end
			16:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1111101);
			end
			17:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b0000111);
			end
			18:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1111111);
			end
			19:begin 
				seg7 = ~(7'b0000110);
				seg6 = ~(7'b1101111);
			end
			20:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b0111111);
			end
			21:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b0000110);
			end
			22:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1011011);
			end
			23:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1001111);
			end
			24:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1100110);
			end
			25:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1101101);
			end
			26:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1111101);
			end
			27:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b0000111);
			end
			28:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1111111);
			end
			29:begin 
				seg7 = ~(7'b1011011);
				seg6 = ~(7'b1101111);
			end
			30:begin 
				seg7 = ~(7'b1001111);
				seg6 = ~(7'b0111111);
			end
			31:begin 
				seg7 = ~(7'b1001111);
				seg6 = ~(7'b0000110);
			end
			32:begin
				seg7 = ~(7'b1001111);
				seg6 = ~(7'b1011011);
			end
			33:begin 
				seg7 = ~(7'b1111001);
				seg6 = ~(7'b1010000);
			end
			34:begin 
				seg7 = ~(7'b1101101);
				seg6 = ~(7'b1101101);
			end
			
		
	
		endcase
	end
	
	assign segment7 = seg7;
	assign segment6 = seg6;


endmodule
