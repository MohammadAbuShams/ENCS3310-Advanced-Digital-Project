	 module mux_4x1 ( x,y,z,v,s1,s0,f) ;
	  input x,y,z,v,s1,s0;
	  output f;
	  wire w0,w1,w2,w3,w4,w5;
	  not #3ns gate1(w0,s0);
	  not #3ns gate2(w1,s1);   
	  and #7ns gate3(w2,x,w0,w1);	
	  and #7ns gate4(w3,y,s0,w1);
	  and #7ns gate5(w4,z,w0,s1);
	  and #7ns gate6(w5,v,s0,s1); 
	  or #7ns gate7(f,w2,w3,w4,w5);	
	 endmodule
	 
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
		 
	
		 
		 			   
module system2 (A,S1,S0,B,Cin,D,Cout);
	input [3:0] A,B;
	input Cin,S1,S0;
	output [3:0] D;
	output Cout;   
	wire [3:0] Y;
	wire [3:0] BP;
	not #3ns g1(BP[0],B[0]);
	not #3ns g2(BP[1],B[1]);
	not #3ns g3(BP[2],B[2]);
	not #3ns g4(BP[3],B[3]);   
	mux_4x1 m1(B[0],BP[0],1'b0,1'b1,S1,S0,Y[0]);  
	mux_4x1 m2(B[1],BP[1],1'b0,1'b1,S1,S0,Y[1]); 
	mux_4x1 m3(B[2],BP[2],1'b0,1'b1,S1,S0,Y[2]); 
	mux_4x1 m4(B[3],BP[3],1'b0,1'b1,S1,S0,Y[3]); 
	carry_add cr (A,Y,Cin,D,Cout);
endmodule	   





module tstsys2();
		 reg [3:0] A,B;
	   reg Cin,S1,S0;
	   wire [3:0] D;
	   wire Cout;
	   
	   system2 sys2(A,S1,S0,B,Cin,D,Cout);
	   
	   initial 
		   begin 
			   
			 {A[0],A[1],A[2],A[3],S1,S0,B[0],B[1],B[2],B[3],Cin} =11'b00000000000;
			repeat (15)	 
			  begin
			#50ns 	{A[0],A[1],A[2],A[3]} = {A[0],A[1],A[2],A[3]}  +  4'b0001 ;	
			
		#50ns 	{B[0],B[1],B[2],B[3]} = {B[0],B[1],B[2],B[3]}  +  4'b0001 ;	
			 end
		   end
		   always #100ns {S1,S0, Cin}={S1,S0, Cin}+1;
			
		  
		   endmodule
	
	