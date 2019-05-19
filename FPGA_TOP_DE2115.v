//------------------------------------------------------------------------------
//	Module:	FPGA_TOP_DE2115
//	Desc:	Top level interface from a DE2-115 FPGA board
//------------------------------------------------------------------------------

module FPGA_TOP_DE2115
	(
		////////////////////	Clock Input	 	////////////////////	 
		input CLOCK_50,	//	50 MHz
		input CLOCK2_50,
		input reset,	
		////////////////////	Push Button		////////////////////
		input [3:0] KEY,
		////////////////////	DPDT Switch		////////////////////
		input [17:0] SW,		//Reset Toggle Switch
		////////////////////	RGB LED		    ////////////////////
		output [7:0] 	LEDG,								//	Green LEDs
		output [17:0]	LEDR,		
		output VGA_CLK,
		output VGA_SYNC_N,
		output VGA_BLANK_N,
		output [7:0] VGA_R,
		output [7:0] VGA_G,
		output [7:0] VGA_B,
		output VGA_HS,
		output VGA_VS,
		output [6:0] HEX0,
		output [6:0] HEX1,
		output [6:0] HEX2,
		output [6:0] HEX3,
		output [6:0] HEX4,
		output [6:0] HEX5,
		output [6:0] HEX6,
		output [6:0] HEX7
	


   

	


		//	Red LEDs
	);

	assign LockReset = SW[0];
	
	////////////////////////	Clock Input	 	////////////////////////
				//	50 MHz
	////////////////////////	Push Button		////////////////////////
								//	Pushbutton[3:0]
	////////////////////////	DPDT Switch		////////////////////////
								//	Toggle Switch[3:0]
	////////////////////////	  LEDs		   ////////////////////////
							//	Red LEDs

	wire	[4:0]				State;
	wire	[2:0]				DebugState;
	wire						timerPronto;
	wire						colorPronto;
	wire						setTimerOn;
	wire						pulseSeq;
	wire						setColor;
	
	wire						btn0; 
	wire						btn1;
	wire						btn2;
	wire						btn3;
	wire						Open;
	wire						Fail;
	wire	[3:0]				Digit;
	wire						LockReset;

	wire [1:0] velSelecionada;
	wire [1:0] difSelecionada;
	wire [1:0] modeSelecionada;
	
	wire	colorPulse;
	wire [3:0] signalcolor;
	wire [3:0] signalButton;
	wire [3:0] signalRand;
	wire [3:0] color_fsm;
	wire [3:0] red, green, blue;
	wire [3:0] code;
	wire [3:0] codeScr;
	wire [5:0] codeAux;
	wire [5:0] codeAux2;
	wire [5:0] auxData;
	

	//	For Audio CODEC
	wire		   AUD_CTRL_CLK;	//	For Audio Controller

	wire		   VGA_CTRL_CLK;

	wire		   DLY_RST;

//	For VGA Controller
	wire			mVGA_CLK;


 	//--------------------------------------------------------------------------
	//	Parse input from buttons
	//--------------------------------------------------------------------------

	
	LevelToPulse	LockEnterPulse0	(	
						.Clock(				CLOCK_50),
						.Reset(				LockReset),
						.Level(				KEY[0]),
						.Pulse(				btn0));		
	LevelToPulse	LockEnterPulse1	(	
						.Clock(				CLOCK_50),
						.Reset(				LockReset),
						.Level(				KEY[1]),
						.Pulse(				btn1));		
	LevelToPulse	LockEnterPulse2	(	
						.Clock(				CLOCK_50),
						.Reset(				LockReset),
						.Level(				KEY[2]),
						.Pulse(				btn2));	

	LevelToPulse	LockEnterPulse3	(	
						.Clock(				CLOCK_50),
						.Reset(				LockReset),
						.Level(				KEY[3]),
						.Pulse(				btn3));		


	/*Lab2Lock		Lab2LockFSM (
						.Clock(				CLOCK_50),
						.Reset(				LockReset),
						.Enter(				Enter),
						.Digit(				Digit),
						.State(				State),
						.Open(				Open),
						.Fail(				Fail));
	*/

	fsm_genius FSM(.clock(CLOCK_50),
		.reset(LockReset),
		.key(KEY),
		.btn0(btn0),
		.btn1(btn1),
		.btn2(btn2),
		.btn3(btn3),
		.timerPronto(timerPronto),
		.colorPronto(colorPronto),
		.colorSeq(signalRand),
		.color_out(color_fsm),
		.disp7(code),
		.disp7Scr(codeScr),
		.disp7Aux(codeAux),
		.pulseSeq(pulseSeq),
		.exibeCor(setColor),
		.setTimerOn(setTimerOn),
		.velocity(velSelecionada)
		);


	assign signalButton[0] = btn0;
	assign signalButton[1] = btn1;
	assign signalButton[2] = btn2;
	assign signalButton[3] = btn3;
	assign colorPulse = !pulseSeq | setColor;
	
	assign signalcolor = setColor ? color_fsm : signalRand ;
   assign LEDG[1:0] ={btn0,btn0} ;
	assign LEDG[3:2] ={btn1,btn1} ;
	assign LEDG[5:4] ={btn2,btn2} ;
	assign LEDG[7:6] ={btn3,btn3} ;


	
	
	RandColor rand(.clk(CLOCK_50), .enable(pulseSeq),.data(auxData),.signal(signalRand),.colorPronto(colorPronto));
	
	/*
	VGADriver VGADriver_Top
	(
		.clock (CLOCK_50),
		.signal(color_fsm),
		.enable(1),
		.red   (red),
		.green (green),
		.blue  (blue),
		.hsync (VGA_HS),
		.vsync (VGA_VS),
		.avideo(VGA_BLANK_N)
	);*/
	

	counter1second contador (.clock(CLOCK_50),.velocidade(velSelecionada), .enable(setTimerOn),.y(timerPronto));
 
	dec7seg dec7segDisplay (.X(code), .segment0(HEX0),.segment1(HEX1),.segment2(HEX2),.segment3(HEX3));
	//dec7segScr dec7segScrDisplay (.X(codeScr), .segment7(HEX7),.segment6(HEX6),.segment5(HEX5),.segment4(HEX4));
	dec7segScr dec7segScrDisplay (.X(codeScr),.segment5(HEX5),.segment4(HEX4));
	dec7segAux dec7segScrDisplayAux (.X(codeAux),.segment7(HEX7),.segment6(HEX6));
 
 	

//	Reset Delay Timer
Reset_Delay			r0	(	.iCLK(CLOCK_50),.oRESET(DLY_RST)	);

VGA_Audio_PLL 		p1	(	.areset(~DLY_RST),.inclk0(CLOCK2_50),.c0(VGA_CTRL_CLK),.c1(AUD_CTRL_CLK),.c2(mVGA_CLK)	);

//	VGA Controller
//assign VGA_BLANK_N = !cDEN;
assign VGA_CLK = VGA_CTRL_CLK;
vga_controller vga_ins(.iRST_n(DLY_RST),
                      .iVGA_CLK(VGA_CTRL_CLK),
							 .codeColor(color_fsm),
                      .oBLANK_n(VGA_BLANK_N),
                      .oHS(VGA_HS),
                      .oVS(VGA_VS),
                      .b_data(VGA_B),
                      .g_data(VGA_G),
                      .r_data(VGA_R)
							);
					

	//assign VGA_R = {red,4'b0000};
	//assign VGA_G = {green,4'b0000};
	//assign VGA_B = {blue,4'b0000};
	//assign VGA_CLK = CLOCK_50;

endmodule
