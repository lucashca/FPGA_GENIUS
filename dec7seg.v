//////////////////////////////////////////////////////////////////////////////////
// João Bittencourt
// Nov 2018
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module dec7seg(
   input  [3:0] X,
   output [6:0] segment0,
   output [6:0] segment1,
   output [6:0] segment2,
   output [6:0] segment3
);

	reg [6:0] seg0,seg1,seg2,seg3;
	
	always@ (*) begin
		case(X)
		0:begin // OFF
		seg0 = ~(7'b0000000);
		seg1 = ~(7'b1110001);
		seg2 = ~(7'b1110001);
		seg3 = ~(7'b0111111);
		end
		1:begin // DIF1
		seg0 = ~(7'b0000110);
		seg1 = ~(7'b1110001);
		seg2 = ~(7'b0000110);
		seg3 = ~(7'b1011110);
		end
		2:begin // DIF2
		seg0 = ~(7'b1011011);
		seg1 = ~(7'b1110001);
		seg2 = ~(7'b0000110);
		seg3 = ~(7'b1011110);
		end
		
		3:begin // DIF3
		seg0 = ~(7'b1001111);
		seg1 = ~(7'b1110001);
		seg2 = ~(7'b0000110);
		seg3 = ~(7'b1011110);
		end
		4:begin // VEL1
		seg0 = ~(7'b0000110);
		seg1 = ~(7'b0111000);
		seg2 = ~(7'b1111001);
		seg3 = ~(7'b0111110);
		end
		5:begin // VEL 2
		seg0 = ~(7'b1011011);
		seg1 = ~(7'b0111000);
		seg2 = ~(7'b1111001);
		seg3 = ~(7'b0111110);
		end
		6:begin //PC
		seg0 = ~(7'b0000000);
		seg1 = ~(7'b0000000);
		seg2 = ~(7'b0111001);
		seg3 = ~(7'b1110011);
		end
		7:begin	// PVP
		seg0 = ~(7'b0000000);
		seg1 = ~(7'b1110011);
		seg2 = ~(7'b0111110);
		seg3 = ~(7'b1110011);
		end
		8:begin	// Erro
		seg0 = ~(7'b1011100);
		seg1 = ~(7'b1010000);
		seg2 = ~(7'b1010000);
		seg3 = ~(7'b1111001);
		end
		9:begin	// Suss
		seg0 = ~(7'b1101101);
		seg1 = ~(7'b1101101);
		seg2 = ~(7'b0111110);
		seg3 = ~(7'b1101101);
		end
		10:begin // Digi
		seg0 = ~(7'b0000110);
		seg1 = ~(7'b1111101);
		seg2 = ~(7'b0000110);
		seg3 = ~(7'b1011110);
		end
		11:begin	// Resp
		seg0 = ~(7'b1110011);
		seg1 = ~(7'b1101101);
		seg2 = ~(7'b1111001);
		seg3 = ~(7'b1010000);
		end
		12:begin //0000
		seg0 = ~(7'b1111111);
		seg1 = ~(7'b1111111);
		seg2 = ~(7'b1111111);
		seg3 = ~(7'b1111111);
		end
		13:begin //Desligado
		seg0 = ~(7'b0000000);
		seg1 = ~(7'b0000000);
		seg2 = ~(7'b0000000);
		seg3 = ~(7'b0000000);
		end
		14:begin //Cont
		seg0 = ~(7'b0110001);
		seg1 = ~(7'b1010100);
		seg2 = ~(7'b1011100);
		seg3 = ~(7'b0111001);
		end
		
	
		endcase
	end
	
	assign segment0 = seg0;
	assign segment1 = seg1;
	assign segment2 = seg2;
	assign segment3 = seg3;


endmodule
