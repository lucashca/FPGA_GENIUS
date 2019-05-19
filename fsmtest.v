module fsm_genius(		//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  input reset,				//reset
  input clock, 				//clock
  input btn0,
  input btn1,
  input btn2,
  input btn3,
  input timerPronto,
  input colorPronto,
  input [3:0] colorSeq,
  input [3:0]key, //Entradas dos botões,
  output [3:0] disp7,
  output [6:0] disp7Scr,
  output [5:0] disp7Aux,
  output [3:0]color_out,
  output exibeCor,
  output pulseSeq,
  output setTimerOn,
  output [1:0] velocity
);

  	//Variaves
  reg [3:0]color = 4'b0000;
  reg [3:0]code = 4'b0000;
  reg [6:0]codeScr = 6'b000000;
  reg [5:0]codeAux = 4'b0000;
 
  reg [5:0] state;							//Registrador de estados	
  reg [5:0] next_state;			//Variável de estado futuro
  
  reg [1:0] dificuldade;
  reg [1:0] velocidade;
  reg [1:0] modo;
  reg [5:0] qtd_cores;			//Ponteiro para a ultima cor computada em seq
  reg [5:0] indSeq ;
  
  reg [1:0] cor;				    //Guarda cor atual
 
  reg [5:0] max_cor;				//Quantidade maxima de cores a serem computadas
  reg [4:0] cor_atual;			//Ponteiro para a posicao atual em seq
  			//Variavel para percorrer o array
  reg [3:0] seq[31:0];	    //Vetor de 32 posicoes contendo a sequencia de cores (2 bits)
  reg pulse;					      //Variavel sincrona para dar sensibilidade aos blocos assincronos
  reg next_player;
  reg p1 = 1;	//Variavel que impede o acrescimo em loop de P
  
  
  reg stateTimer = 0;
  reg stateColor = 0;
  
  
  reg geraSeq = 0;
  reg setColor = 0;
  reg startTimer = 0;
 
  reg btn0on = 0;
  reg btn1on = 0;
  reg btn2on = 0;
  reg btn3on = 0;
  
  
  
	//Estados
	parameter off=                  1,
				 menu=                 2,
	 			 dif1=                 3,
				 dif2=                 4,
				 dif3=                 5,
				 vel1=                 6,
				 vel2=                 7,
				 mode1=                8,
				 mode2=                9,
 				 gen_sequence=         10,
				 exibe_sequencia=      11,
				 errou=             	  12,
 				 acertou=              13,
 				 player_gera=          14,
 				 continuar=				  15,
				 player_responde=      16,
				 ganhou=					  17;	
				 /*
				 apaga_pvp=            5'b01111,
 				 player_responde=      5'b10000,
 				 muda_player=          5'b10001,
 				 pvp=                  5'b10010,
	 			 liga_cor_pvp=         5'b10011,
 				 apaga_cor_gera=       5'b10100,
 				 entra_cor=            5'b10101,
 				 apaga_cor_responde=   5'b10110,
 				 compara_cor_gera=     5'b10111,
 				 compara_cor_responde= 5'b11000,
	 			 fim=                  5'b11001,
 				 resultado=            5'b11010,
 				 continuar=            5'b11011,
				 ganhou = 				  5'b11100;
				 /*
  //Parametrização de cores
  /*
  parameter green=2'b00,
  					red=2'b01,
  					blue=2'b10,
  					yellow=2'b11;
 
	//DPE-Decodificador de próximo estado-----------------------------------------------------------------------------------------------------------------------------------------------
  */
  
  always @(posedge clock) begin

		if(!reset) begin
			state <= off;
		end

		else state <= next_state;

		//codeAux = state;
	end
  
  
  
  always @(posedge clock) begin
  
	
  
	  case(state)
  	  //Menu Inicial
    	off:	begin 
			setColor = 1;
			color = 4'b0101;
			dificuldade=0;
			velocidade=0;
			modo =0;
			qtd_cores = 0;
			code = 0;
			codeAux = 0;
			codeScr = 0;
			
			indSeq <= 0;
			
			next_state <= off;
			if(btn0) begin //botão de ligar		
				//setColor = 0;
				next_state <= menu;
			end
		end
			
		menu:	begin
				next_state <= dif1;
				btn0on = 1;
		end
		
		
      dif1: begin 
			max_cor = 8;
			dificuldade = 1;
			code <= 1;	
			if(btn0 && !btn0on) begin 	
				btn0on = 1; next_state <= dif2;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= vel1;
			end
			if(!btn1) begin btn1on = 0; end
      end
		
		dif2:begin
			max_cor = 16;
			dificuldade = 2;
			code <= 2;
			if(btn0 && !btn0on) begin 	
				btn0on = 1; next_state <= dif3;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= vel1;
			end
			if(!btn1) begin btn1on = 0; end
		end
		
      dif3:begin
			max_cor = 32;
			dificuldade = 3;
			code <= 3;
			if(btn0 && !btn0on) begin //botão de ligar	
				btn0on = 1; next_state <= dif1;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= vel1;
			end
			if(!btn1) begin btn1on = 0; end
			
		end
		
		vel1:begin
			velocidade = 1;
			code <= 4;
			if(btn0 && !btn0on) begin //botão de ligar	
				btn0on = 1; next_state <= vel2;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= mode1;
			end
			if(!btn1) begin btn1on = 0; end
			
		end
		
		vel2:begin
			velocidade = 2;
			code <= 5;
			if(btn0 && !btn0on) begin //botão de ligar	
				btn0on = 1; next_state <= vel1;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= mode1;
			end
			if(!btn1) begin btn1on = 0; end
		end
		
		mode1: begin
			modo = 1;
			code <= 6;
			if(btn0 && !btn0on) begin //botão de ligar	
				btn0on = 1; next_state <= mode2;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= gen_sequence;
			end
			if(!btn1) begin btn1on = 0; end
			
		end
		
		mode2: begin 
			modo = 2;
			code <= 7;
			if(btn0 && !btn0on) begin //botão de ligar	
				btn0on = 1; next_state <= mode1;
			end
			if(!btn0) begin btn0on = 0; end
			if(btn1 && !btn1on) begin 
				btn1on = 1; next_state <= player_gera;
			end
			if(!btn1) begin btn1on = 0; end
		
		end
		
		gen_sequence: begin
		
		
	
			if(colorPronto) begin 
				stateColor = 1;
				seq[qtd_cores] = colorSeq;
				geraSeq = 0;
				
				next_state <= gen_sequence;
			
			end  
			else begin 
				if(!colorPronto && stateColor)begin 
					geraSeq = 0; 
					stateColor = 0; 
				
					if(max_cor > qtd_cores)begin 
						qtd_cores = qtd_cores + 1;
						next_state <= exibe_sequencia;
						
					end else begin 
						if(qtd_cores == max_cor) begin 
							qtd_cores = 0;
							next_state <= ganhou;
							
						end
					end 
				end
				else begin geraSeq = 1; end
			
			end
				
				codeScr = (qtd_cores * 2)-2;
			
				if(velocidade == 2) begin 
					codeScr = qtd_cores;	
				end
					
				
				
			end
	
	 
	  exibe_sequencia: begin
	  
		code <= 12;
		
	  if(timerPronto)begin 
		color = seq[indSeq];
		stateTimer = 1;
		code <= 13;
	  end else begin 
			
		  if(!timerPronto && stateTimer)begin 
				stateTimer = 0;
				
				indSeq = indSeq + 1;
				
				startTimer = 0;
				
				if(qtd_cores > indSeq) begin 
					next_state <= exibe_sequencia; 	
				end else begin 
					if(indSeq == qtd_cores) begin 
					indSeq = 0;
					color = 4'b0110;  
					next_state <= player_responde;
					end
	
				end 

		  end else 	begin 
				startTimer = 1;
				color = 4'b1111; 
			
			end
	  
	  end
	  
	  
	
		end
		
		 continuar: begin 
			//next_state <= continuar; 
			 
			 if(btn0 && !btn0on) begin //botão de ligar
					btn0on = 1; 
					next_state <= gen_sequence; 
			 end
			 if(!btn0) begin btn0on = 0; end
		 
      end
			
		player_responde: begin 
		
			code <= 11;
		
			if(btn0 && !btn0on) begin color = 4'b0011; end // BTN Amarelo
			if(btn1 && !btn1on) begin color = 4'b0100; end // BTN Azul
			if(btn2 && !btn2on) begin color = 4'b0010; end // BTN Verde
			if(btn3 && !btn3on) begin color = 4'b0001; end // BTN Vermelho
	
			if(!btn0) begin btn0on = 0; end
			if(!btn1) begin btn1on = 0; end
			if(!btn2) begin btn2on = 0; end
			if(!btn3) begin btn3on = 0; end
			
			if( (btn0 && !btn0on)||(btn1 && !btn1on)||(btn2 && !btn2on)||(btn3 && !btn3on) ) begin 
				btn0on = 1 ;
				btn1on = 1 ;
				btn2on = 1 ;
				btn3on = 1 ;
			
				if(seq [indSeq] == color)begin 
					indSeq = indSeq +1;
				
					if(indSeq < qtd_cores)begin
					
						next_state <= player_responde;
					end else begin  
						if(indSeq == qtd_cores)begin
							indSeq = 0;
							color = 4'b1111;
							next_state <= acertou;
						end
					end	
				end else if(seq [indSeq] != color)begin 
					next_state <= errou;
				end
			
			end
			
				codeAux <= indSeq;
			
			
		end
		
		acertou: begin 
			
			
			startTimer = 1;
			if(timerPronto) begin
				startTimer = 0;
				code <= 9; // SUSS
				if(modo == 1) begin next_state <= gen_sequence;end
				if(modo == 2) begin next_state <= player_gera; end	
			end 
			
		end
		
		errou: begin 
			codeAux <= 33;
			code <= 14;
			
			if(btn0 && !btn0on) begin //botão de ligar
				qtd_cores = 0;
				btn0on = 1; 
				next_state <= gen_sequence;
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				qtd_cores = 0;
				btn1on = 1; next_state <= off;
			end
			if(!btn1) begin btn1on = 0; end
			
			
		

		end
		
		ganhou:begin 
			codeAux <= 34;
			code <= 14; // SUSS
			if(btn0 && !btn0on) begin //botão de ligar
				qtd_cores = 0;
				btn0on = 1; 
				if(modo == 1) begin 
					next_state <= gen_sequence;
				end
				if(modo == 2) begin 
					next_state <= player_gera;
				end
				
			end
			if(!btn0) begin btn0on = 0; end
			
			if(btn1 && !btn1on) begin 
				qtd_cores = 0;
				btn1on = 1; next_state <= off;
			end
			if(!btn1) begin btn1on = 0; end
		
		
		end
		
		
		player_gera: begin 
			
			p1 = ~p1;
			code <= 10;
			
			if(btn0 && !btn0on) begin color = 4'b0011; end // BTN Amarelo
			if(btn1 && !btn1on) begin color = 4'b0100; end // BTN Azul
			if(btn2 && !btn2on) begin color = 4'b0010; end // BTN Verde
			if(btn3 && !btn3on) begin color = 4'b0001; end // BTN Vermelho
	
			if(!btn0) begin btn0on = 0; end
			if(!btn1) begin btn1on = 0; end
			if(!btn2) begin btn2on = 0; end
			if(!btn3) begin btn3on = 0; end
			
			if( (btn0 && !btn0on)||(btn1 && !btn1on)||(btn2 && !btn2on)||(btn3 && !btn3on) ) begin 
				btn0on = 1 ;
				btn1on = 1 ;
				btn2on = 1 ;
				btn3on = 1 ;
			
				
				seq[qtd_cores] = color;
					
				if(max_cor > qtd_cores)begin 
					qtd_cores = qtd_cores + 1;
					next_state <= exibe_sequencia;
						
				end else begin 
					if(qtd_cores == max_cor) begin 
						qtd_cores = 0;
						next_state <= ganhou;
							
					end
				end 
				
			
			
			end
				codeScr = (qtd_cores * 2)-2;
			
				if(velocidade == 2) begin 
					codeScr = qtd_cores;	
				end
					
		end
		
		default: next_state <= off;
		
	
	
	  endcase
	  
	  end
	  
	  assign color_out[3:0]   = color;
	  assign disp7[3:0]   = code;
	  assign disp7Scr[6:0]   = codeScr;
	  assign disp7Aux[5:0]   = codeAux;
	  assign pulseSeq = geraSeq;
	  assign setTimerOn = startTimer;
	  assign velocity = velocidade;
	  assign exibeCor = setColor;
	  
	  
	  endmodule
	  