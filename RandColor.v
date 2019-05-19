module RandColor(
  input  clk,
  input  enable,
  output reg [5:0] data,
  output reg [3:0] signal,
  output reg colorPronto
);

reg [5:0] data_next;

reg [1:0] rand;
reg off = 1;


always @(*) begin
  data_next[4] = data[4]^data[1];
  data_next[3] = data[3]^data[0];
  data_next[2] = data[2]^data_next[4];
  data_next[1] = data[1]^data_next[3];
  data_next[0] = data[0]^data_next[2];
  
  rand[0] = data_next[1];
  rand[1] = data_next[3];
	 
end


always @(posedge clk) begin
  if (~enable) begin
    data <= data + signal + 4'hc;
	 off = 1;
	 colorPronto <= 0;
	 end
  else begin
		  case(rand) 
			 2'b00: begin
				signal = 4'b0001; 
			 end
			 2'b01: begin
				signal = 4'b0010; 
			 end
			 2'b10: begin
				signal = 4'b0100;
			 end
			 2'b11: begin
				signal = 4'b0011;
			
			 end
			 
		  endcase
		  colorPronto <= 1;
		  data <= data_next;
	end
end
 

endmodule

