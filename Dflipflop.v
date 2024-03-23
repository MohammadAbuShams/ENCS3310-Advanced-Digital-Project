module DFF (CLK,RST,D,Q);
	output reg [3:0] Q;
	input [3:0] D;
	input CLK,RST;
	
	always @ (posedge CLK or negedge RST)
		
		if (RST==0)
			  
			Q=4'b0000;
	  else 	
		  Q=D; 
	  endmodule
	  
	  
	  module tstdff ();	
		  reg [3:0] D;
		  reg CLK,RST;
		  wire [3:0] Q;
		  
		  DFF df (CLK,RST,D,Q);
		  initial 
			  begin
				  CLK=0;
				  RST=1;
		{D[0],D[1],D[2],D[3]}= 4'b0000;
		repeat (15)   
		#30ns D=D +1;
			    RST=1;
				 
				 #400ns $finish;
			  end  	
			  always #15ns CLK=~CLK;	
			  endmodule