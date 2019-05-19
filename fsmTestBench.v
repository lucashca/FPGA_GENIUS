`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Self Checking Test
//
//////////////////////////////////////////////////////////////////////////////////
module fsmTestBench;

  // Inputs
   
   reg reset;
   reg btn0;
   reg btn1;
   reg btn2;
   reg btn3;
   reg timerPronto;
   reg colorPronto;
   reg [3:0] colorSeq;
   reg [3:0]key; //Entradas dos botões,
   reg [3:0]valorEsperado;

   reg erroDisp;

   // Outputs
   wire [3:0] disp7;
   wire [6:0] disp7Scr;
   wire [3:0] disp7aux;
   wire [3:0]color_out;
   wire exibeCor;
   wire pulseSeq;
   wire setTimerOn;
   wire [1:0] velSelecionada;
 
 
   // Instantiate the Design Under Test (DUT)
   
   parameter Halfcycle = 5; //half period is 5ns

   localparam Cycle = 2*Halfcycle;

   reg clock;

   initial clock = 0;
   always #(Halfcycle) clock = ~clock;
   
   fsm_genius FSM(
      .clock(clock),
      .reset(reset),
      .key(key),
      .btn0(btn0),
      .btn1(btn1),
      .btn2(btn2),
      .btn3(btn3),
      .timerPronto(timerPronto),
      .colorPronto(colorPronto),
      .colorSeq(colorSeq),
      .color_out(color_out),
      .disp7(disp7),
      .disp7Scr(disp7Scr),
      .disp7Aux(disp7aux),
      .pulseSeq(pulseSeq),
      .exibeCor(exibeCor),
      .setTimerOn(setTimerOn),
      .velocity(velSelecionada)
      );

   
   initial begin      	// Definição dos estados iniciais da maquina de stados
	 #0
	 reset = 1;		  	// Reset trabalha em nivel lógico baixo, logo não está ativo
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;		  	// Botão solto
	 btn2 = 0;		  	// Botão solto
	 btn3 = 0;		  	// Botão solto
	 timerPronto = 0; 	// Flag de tempo
	 colorPronto = 0; 	// Flag de Cor
	 colorSeq = 0;    	// Codigo da Cor
     key = 0;	      	// Valor axuiliar
	 valorEsperado = 0; // state = OFF
	
	
	//***********************************************************
	//Neste trecho de código representa o teste da seleção da dificuldade 1, velocidade 1 e modo de jogo PC.
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	//*************************************************************	
	
	//Resetar os estados
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 1, velocidade 1 e modo de jogo PVP.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	#100;
	 btn1 = 0;			// Apertou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 7; // state = PC
	
	//******************************************************************
	
	//Resetar os estados
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 1, velocidade 2 e modo de jogo PC.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 5; // state = Vel2
	#100;
	 btn0 = 0;			// Apertou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	
	//******************************************************************
	
	//Resetar os estados
	
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 1, velocidade 2 e modo de jogo PVP.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 5; // state = Vel2
	#100;
	 btn0 = 0;			// Apertou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	#100;
	 btn1 = 0;			// Apertou o botão de seleção
	#100;
	 btn0 = 1;
	 valorEsperado = 7; // state = PVP
	#100;
	 btn0 = 0;
	#100;
	
	//******************************************************************
	
	//Resetar os estados
	
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	
	//**********************************************************

	//Neste trecho de código representa o teste da seleção da dificuldade 2, velocidade 1 e modo de jogo PC.
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	//*************************************************************	
	
	//Resetar os estados
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 2, velocidade 1 e modo de jogo PVP.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	#100;
	 btn1 = 0;			// Apertou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 7; // state = PC
	
	//******************************************************************
	
	//Resetar os estados
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 2, velocidade 2 e modo de jogo PC.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 5; // state = Vel2
	#100;
	 btn0 = 0;			// Apertou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	
	//******************************************************************
	
	//Resetar os estados
	
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 2, velocidade 2 e modo de jogo PVP.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 5; // state = Vel2
	#100;
	 btn0 = 0;			// Apertou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	#100;
	 btn1 = 0;			// Apertou o botão de seleção
	#100;
	 btn0 = 1;
	 valorEsperado = 7; // state = PVP
	#100;
	 btn0 = 0;
	#100;
	
	//******************************************************************
	
	//Resetar os estados
	
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************

	
	//Neste trecho de código representa o teste da seleção da dificuldade 3, velocidade 1 e modo de jogo PC.
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	btn0 = 1;
	valorEsperado = 3; // state = Dif3	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	//*************************************************************	
	
	//Resetar os estados
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************

	//Neste trecho de código representa o teste da seleção da dificuldade 3, velocidade 1 e modo de jogo PVP.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	btn0 = 1;
	valorEsperado = 3; // state = Dif3	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	#100;
	 btn1 = 0;			// Apertou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 7; // state = PC
	
	//******************************************************************
	
	//Resetar os estados
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 3, velocidade 2 e modo de jogo PC.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	btn0 = 1;
	valorEsperado = 3; // state = Dif3	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 5; // state = Vel2
	#100;
	 btn0 = 0;			// Apertou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	
	//******************************************************************
	
	//Resetar os estados	
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************
	
	//Neste trecho de código representa o teste da seleção da dificuldade 3, velocidade 2 e modo de jogo PVP.
	
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 1; // state = Dif1
	#100;
	btn0 = 0;			//Soltou o botão de seleção
	#100;
	btn0 = 1;
	valorEsperado = 2; // state = Dif2	
	#100;
	btn0 = 0;
	#100;
	btn0 = 1;
	valorEsperado = 3; // state = Dif3	
	#100;
	btn0 = 0;
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 4; // state = Vel1
	#100;
	btn1 = 0;			//Soltou o botão de seleção
	#100;
	 btn0 = 1;			// Apertou o botão de seleção
	 valorEsperado = 5; // state = Vel2
	#100;
	 btn0 = 0;			// Apertou o botão de seleção
	#100;
	 btn1 = 1;			// Apertou o botão de seleção
	 valorEsperado = 6; // state = PC
	#100;
	 btn1 = 0;			// Apertou o botão de seleção
	#100;
	 btn0 = 1;
	 valorEsperado = 7; // state = PVP
	#100;
	 btn0 = 0;
	#100;
	
	//******************************************************************
	
	//Resetar os estados
	
	#100;
	 reset = 0;			
	 btn0 = 0;		  	// Botão solto
	 btn1 = 0;			// Botão solto
	 valorEsperado = 0; // state = OFF
	#100;
	 reset = 1;			// Reset trabalha em nivel lógico baixo, logo não está ativo
	//**********************************************************

	


	
   end
   
   initial begin
      #400000 $finish;
   end
   
	
endmodule

