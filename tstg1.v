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
	  				   
	  module analy(CLK,goodresult,myresult);
		  input CLK;
		  input [4:0] goodresult, myresult;
		  always @ (negedge CLK)
			  if (myresult!=goodresult)
				  
				  	   $display ("ERROR!");
				 	 
	  		   endmodule
	  
	  
	  
	  
/*module (A,S1,S0,B,Cin,D,Cout,CLK,RST);
	input [3:0] A;
	input S1,S0;
	input Cin,RST,CLK;
	input [3:0] B;
	output [3:0] D;
	output Cout;
	
	
	genvar 1;
	generate 
	for (i=0;i<=3;i=i+1)
		begin moha
			DFF d (CLK,RST,A[i],B[i]);*/