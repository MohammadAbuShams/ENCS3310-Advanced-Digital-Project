	module DF (CLK,D,Q);
		parameter n=5;
	output reg [n-1:0] Q;
	input [n-1:0] D;
	input CLK;
	
	always @ (negedge CLK)
	begin	
		Q=D; 	
		end
	  endmodule
	  
	  
	  module tstdf ();
		  parameter n=4;
		  reg [n-1:0] D;
		  reg CLK;
		  wire [n-1:0] Q;
		  
		  DFF df (CLK,D,Q);
		  initial 
			  begin
				  CLK=0;
				 
		{D[0],D[1],D[2],D[3]}= 4'b0000;
		repeat (15)   
		#30ns D=D +1;
				 
				 #400ns $finish;
			  end  	
			  always #40ns CLK=~CLK;	
			  endmodule