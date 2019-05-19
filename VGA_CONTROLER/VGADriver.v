//////////////////////////////////////////////////////////////////////////////////
//
// VGA Driver Controller
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`include "Display640x480.vh"

module VGADriver(
    input clock,
    input  [3:0] signal,
	 input enable,
	output [3:0] red,
	output [3:0] green,
	output [3:0] blue,
    output hsync, vsync, avideo
    );

   wire [`xbits-1:0] x;
   wire [`ybits-1:0] y;
   wire activevideo;
	
   reg [3:0]auxRed = 4'b0000;
   reg [3:0]auxGreen = 4'b0000;
   reg [3:0]auxBlue = 4'b0000;

   reg [`ybits-1:0] oldy;
   assign avideo = activevideo;

   VGASyncTimer myVGATimer (clock, hsync, vsync, activevideo, x, y);

   reg [1:0] clock_count = -1;




   

	always @(posedge clock) begin 
		
		if(enable) begin 
		
	case (signal)
		4'b0001: begin // Vermelho
			auxRed <= 4'b1111;	
			auxGreen <= 4'b0000;
			auxBlue <= 4'b000;	
		end
		4'b0101: begin // Roxo
			auxRed <= 4'b1111;	
			auxGreen <= 4'b0000;
			auxBlue <= 4'b1111;	
		end
		4'b0010: begin // Verde
			auxRed <= 4'b0000;	
			auxGreen <= 4'b1111;
			auxBlue <= 4'b0000;	
		end
		4'b0100: begin // Azul
			auxRed <= 4'b0000;	
			auxGreen <= 4'b0000;
			auxBlue <= 4'b1111;	
		end
		4'b0110: begin // Azul Claro
			auxRed <= 4'b0000;	
			auxGreen <= 4'b1111;
			auxBlue <= 4'b1111;	
		end
		4'b0011: begin // Amarelo
			auxRed <= 4'b1111;	
			auxGreen <= 4'b1111;
			auxBlue <= 4'b0000;	
		end
		default:begin
			auxRed <= 4'b1111;	
			auxGreen <= 4'b1111;
			auxBlue <= 4'b1111;	
		end
	endcase
	
	end else begin 
			auxRed <= 4'b1111;	
			auxGreen <= 4'b1111;
			auxBlue <= 4'b1111;	
	end 
	
	

		
	end
	
		//	assign red[3:0]   = (activevideo == 1) ? ((x > 60) && (y >60) ? auxRed:4'b0000):4'b0000;
		//	assign red[3:0]   = (activevideo == 1) ? ((x > 60) && (y >60) ? auxRed:4'b0000):4'b0000;
		//	assign red[3:0]   = (activevideo == 1) ? ((x > 60) && (y >60) ? auxRed:4'b0000):4'b0000;
	

	
		assign red[3:0]   = (activevideo == 1) ? auxRed:4'b0000;
		assign green[3:0] = (activevideo == 1) ?auxGreen:4'b0000; 
		assign blue[3:0] = (activevideo == 1) ? auxBlue:4'b0000;
			
    //assign red[3:0]   = ~(activevideo == 1) ? 4'b0 : (x == 0) ? 4'b0000 :(x%4 == 0) ? (red[3:0] + 4'b0001): red[3:0] ;

	//assign green[3:0] = (activevideo == 1) ? auxGreen : 4'b0; 

	//assign blue[3:0] = (activevideo == 1) ? auxBlue : 4'b0; 
	
	//assign red[3:0]   = (activevideo == 1) ? auxRed : 4'b0;
	//assign red = x;  
	//assign green = y;
  
   //assign red[3:0]   = (activevideo == 1) ? x[3:0] : 4'b0;
   //assign green[3:0] = (activevideo == 1) ? {x[2:1],y[1:0]} : 4'b0;
   //assign blue[3:0]  = (activevideo == 1) ? {y[2:0],1'b0} : 4'b0;

endmodule
