module carry_add (x,y,cin,S,cout);
	input [3:0] x,y;
	input cin;
	output [3:0] S  ;
	output cout;
	wire [3:0] G,P;
	wire [3:0] F; 
	or (C[0],cin,1'b0);
	wire [4:0] C;	  

	genvar i;
	generate 
	for (i=0;i<=3;i=i+1)
		begin: mohammad
			and #7ns (G[i],x[i],y[i]);
			xor #11ns (P[i],x[i],y[i]);
		and #7ns (F[i],C[i],P[i]);
   	    or #7ns (C[i+1],F[i],G[i]);  
		 xor #11ns (S[i],P[i],C[i]);
			end
		endgenerate		  
  	 or (cout,C[4],1'b0);
		 endmodule
		 
		 
		  	 module tstcar ();
			   reg [3:0] x,y;
			   reg cin;
			   wire [3:0] S;
			   wire cout;
			   carry_add ca(x,y,cin,S,cout);
			   initial
				   
				   begin 
					 
					     
			 {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin} =9'b000000000;
			repeat (15)	 
			  begin
			#50ns 	{x[0],x[1],x[2],x[3]} = {x[0],x[1],x[2],x[3]}  +  4'b0001 ;	
			
		#50ns 	{y[0],y[1],y[2],y[3]} = {y[0],y[1],y[2],y[3]}  +  4'b0001 ;	
			 end
		   end
		   always #100ns cin=cin+1;
			   endmodule
		 
			   
		 