module Timer(clock, reset, set, pronto);

input clock, reset;
input[1:0] set;
output reg pronto;

reg state;
reg next_state;
reg [16:0] timer;

parameter inicio = 1'b0, cont = 1'b1;

always @(*) begin
	case(state)
		inicio:begin
			if(set == 2'b01)begin
				next_state = cont;
			end
			else if(set == 2'b10)begin
				next_state = cont;
			end
			else if(set == 2'b11)begin
				next_state = cont;
			end			
		end
		
		cont:begin
			if(set == 2'b00)
				next_state = inicio;
			else if(timer > 14'b0)begin //comeca contagem
				next_state = cont;
			end
			else begin
				next_state = inicio;
			end
		end

		default:
			next_state = inicio;
	endcase
end

always @(posedge clock) begin
   if(reset) begin
		state <= inicio;
	end
	else begin
		state <= next_state;
		
		case(state)
			inicio:begin
				if(set == 2'b01)begin
					timer <= 10000;	
					pronto <= 1'b0;
				end
				else if(set == 2'b10)begin
					timer <= 20000;
					pronto <= 1'b0;
				end
				else if(set == 2'b11)begin
					timer <= 100000;
					pronto <= 1'b0;
				end			
				else begin
					timer <= 0;
					pronto <= 0;
				end
			end
		
			cont:begin
				if(timer > 14'b0)begin //comeca contagem
					timer <= timer - 1;
				end
				else begin
					pronto <= 1'b1;
					timer <= 0;
				end
			end
		endcase
	end	
end
	
endmodule 	
