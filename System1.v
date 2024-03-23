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
	  
	  		   module full_adder ( x,y,cin,sum,cout);		
			   input x,y,cin;
			   output sum,cout;
			   wire w1,w2,w3;
			   xor #11ns gate1(w1,x,y);
			   and #7ns gate2(w2,x,y); 
			   xor #11ns gate3(sum,w1,cin); 
			   and #7ns gate4(w3,w1,cin); 
			   or #7ns gate5(cout,w3,w2);	
			   endmodule   
			   
			   
module four_bit_adder(x,y,cin,sum,cout);
	input [3:0] x,y;
	input cin;
	output [3:0] sum;
	output cout;
	wire[2:0]c;
	
	full_adder fl1(cin,x[0],y[0],sum[0],c[0]);
	full_adder fl2(c[0],x[1],y[1],sum[1],c[1]);
	full_adder fl3(c[1],x[2],y[2],sum[2],c[2]);
	full_adder fl4(c[2],x[3],y[3],sum[3],cout);
endmodule	
			   
			   
module system1 (A,S1,S0,B,Cin,D,Cout);
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
	four_bit_adder frb(A,Y,Cin,D,Cout); 
   endmodule  

   module tstsys1();
	   reg [3:0] A,B;
	   reg Cin,S1,S0;
	   wire [3:0] D;
	   wire Cout;
	   
	   system1 sys(A,S1,S0,B,Cin,D,Cout);
	   
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
			 
			   
	   
	   
	   