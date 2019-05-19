//////////////////////////////////////////////////////////////////////////////////
//
// VGA Sync Generator
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
`include "Display640x480.vh"

module VGASyncTimer (
	input clock, 
	output hsync,
	output vsync,
	output activevideo,
	output [`xbits-1:0] x,
	output [`ybits-1:0] y
	);

	// These lines below allow you to count every 2nd clock tick
	// This is because, depending on the display mode, we may need to count at 50 MHz or 25 MHz

	reg [1:0] clock_count = -1;

	
	
		
	always @(posedge clock) begin : proc_clock_count
		clock_count <= clock_count + 1'b1;
		
		
	end
	
	


	wire Every2ndTick;
	wire OtherTick;
	
	assign Every2ndTick = (clock_count[0] == 1'b1);
	assign OtherTick = (clock_count[1] == 1'b1);
	
	
	// This part instantiates an xy-counter using the appropriate clock tick counter
	//XYCounter #(`WholeLine, `WholeFrame) xy (clock, 1'b1, x, y); // Count at 50 MHz
	XYCounter #(`WholeLine, `WholeFrame) xy (clock, Every2ndTick , x, y); // Count at 25 MHz
	//YCounter #(`WholeLine, `WholeFrame) xy (Every2ndTick, OtherTick , x, y); 
	 
	
      
   assign activevideo 		= (x < `hVisible &&  y < `vVisible); /* Place your assignment here */
   assign hsync 			= ~(x >= `hSyncStart && x <= `hSyncEnd)  ;/* Place your assignment here */
   assign vsync 			= ~(y >= `vSyncStart && y <= `vSyncEnd) ;/* Place your assignment here */
   //assign hsync 			= Every2ndTick;
   //assign vsync 			= OtherTick ;/* Place your assignment here */
  
endmodule
