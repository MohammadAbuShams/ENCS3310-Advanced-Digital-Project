module carry_ahead_adder (x,y,cin,S,cout);
	input [3:0] x,y;
	input cin;
	output [3:0] S  ;
	output cout;
	wire [3:0] G,P;
	wire [3:0] F;
	wire [3:1] C;
   and #7ns c1 (G[0],x[0],y[0]);		
   xor #11ns c2 (P[0],x[0],y[0]);
	
	  and #7ns c3 (G[1],x[1],y[1]);		
   xor #11ns c4 (P[1],x[1],y[1]); 
   
	 and #7ns c5 (G[2],x[2],y[2]);		
   xor #11ns c6 (P[2],x[2],y[2]); 
   
	 and #7ns c7 (G[3],x[3],y[3]);		
   xor #11ns c8 (P[3],x[3],y[3]);	  
    
   
   	and #7ns c10 (F[0],cin,P[0]);
   	  or #7ns c11 (C[1],F[0],G[0]);
   		
		  	and #7ns c12 (F[1],C[1],P[1]);
   	  or #7ns c13 (C[2],F[1],G[1]);
   
		  	and #7ns c14 (F[2],C[2],P[2]);
   	  or #7ns c15 (C[3],F[2],G[2]);
   
		  	and #7ns c16 (F[3],C[3],P[3]);
   	  or #7ns c17 (Cout,F[3],G[3]);
		 
		 xor #11ns c9 (S[0],P[0],cin);	
		 xor #11ns c18 (S[1],P[1],C[1]);	
		 xor #11ns c19 (S[2],P[2],C[2]);	
		 xor #11ns c20 (S[3],P[3],C[3]);	
		 
		 endmodule
		 
		 	 module tstca ();
			   reg [3:0] x,y;
			   reg cin;
			   wire [3:0] S;
			   wire cout;
			   carry_ahead_adder ca(x,y,cin,S,cout);
			   initial
				   
				   begin 
					  
					 {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin} =9'b000000000;
			 repeat (511)
			 #100ns 	 {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin} =   {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin} +  9'b000000001 ;
			     
				end
			   endmodule
			   
		 