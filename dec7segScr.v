//////////////////////////////////////////////////////////////////////////////////
// João Bittencourt
// Nov 2018
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module dec7segScr(
   input  [6:0] X,
  // output [6:0] segment7,
   //output [6:0] segment6,
   output [6:0] segment5,
   output [6:0] segment4
);

	reg [6:0] seg5,seg4;
	
	always@ (*) begin
	//	seg7 = ~(7'b1101101);
	//	seg6 = ~(7'b0111001);
		
		case(X)
			6'd0:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b0111111);
			end
			6'd1:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b0000110);
			end
			6'd2:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1011011);
			end
			6'd3:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1001111);
			end
			6'd4:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1100110);
			end
			6'd5:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1101101);
			end
			6'd6:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1111101);
			end
			6'd7:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b0000111);
			end
			6'd8:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1111111);
			end
			6'd9:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b1101111);
			end
			6'd10:begin 
				seg5 = ~(7'b0111111);
				seg4 = ~(7'b0111111);
			end
			6'd11:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b0000110);
			end
			6'd12:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1011011);
			end
			6'd13:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1001111);
			end
			6'd14:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1100110);
			end
			6'd15:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1101101);
			end
			6'd16:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1111101);
			end
			6'd17:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b0000111);
			end
			6'd18:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1111111);
			end
			6'd19:begin 
				seg5 = ~(7'b0000110);
				seg4 = ~(7'b1101111);
			end
			6'd20:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b0111111);
			end
			6'd21:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b0000110);
			end
			6'd22:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1011011);
			end
			6'd23:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1001111);
			end
			6'd24:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1100110);
			end
			6'd25:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1101101);
			end
			6'd26:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1111101);
			end
			6'd27:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b0000111);
			end
			6'd28:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1111111);
			end
			6'd29:begin 
				seg5 = ~(7'b1011011);
				seg4 = ~(7'b1101111);
			end
			6'd30:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b0111111);
			end
			6'd31:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b0000110);
			end
			6'd32:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1011011);
			end
			6'd33:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1001111);
			end
			6'd34:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1100110);
			end
			6'd35:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1101101);
			end
			6'd36:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1111101);
			end
			6'd37:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b0000111);
			end
			6'd38:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1111111);
			end
			6'd39:begin 
				seg5 = ~(7'b1001111);
				seg4 = ~(7'b1101111);
			end
			6'd40:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b0111111);
			end
			6'd41:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b0000110);
			end
			6'd42:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b1011011);
			end
			6'd43:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b0000110);
			end
			6'd44:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b1100110);
			end
			6'd45:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b1101101);
			end
			6'd46:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b1111101);
			end
			6'd47:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b0000111);
			end
			6'd48:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b1111111);
			end
			6'd49:begin 
				seg5 = ~(7'b1100110);
				seg4 = ~(7'b1101111);
			end
			6'd50:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b0111111);
			end
			6'd51:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b0000110);
			end
			6'd52:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b1011011);
			end
			6'd53:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b0000110);
			end
			6'd54:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b1100110);
			end
			6'd55:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b0000110);
			end
			6'd56:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b1111101);
			end
			6'd57:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b0000111);
			end
			6'd58:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b1111111);
			end
			6'd59:begin 
				seg5 = ~(7'b1101101);
				seg4 = ~(7'b1101111);
			end
			6'd60:begin 
				seg5 = ~(7'b1111101);
				seg4 = ~(7'b0111111);
			end
			6'd61:begin 
				seg5 = ~(7'b1111101);
				seg4 = ~(7'b0000110);
			end
			6'd62:begin 
				seg5 = ~(7'b1111101);
				seg4 = ~(7'b1011011);
			end
			6'd63:begin 
				seg5 = ~(7'b1111101);
				seg4 = ~(7'b0000110);
			end
			6'd64:begin 
				seg5 = ~(7'b1111101);
				seg4 = ~(7'b1100110);
			end
			
			
	
		endcase
	end
	
	
	assign segment5 = seg5;
	assign segment4 = seg4;


endmodule
