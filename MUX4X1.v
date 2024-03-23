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
	  
	  			
	  module tstmux();
		  reg x,y,z,v,s1,s0;
		  wire f;	 
		  
		  mux_4x1 mux(x,y,z,v,s1,s0,f);
		  initial 
			  begin 
				 {x,y,z,v,s1,s0}= 6'b000000;  
				 repeat (63)
				 
				  	#100ns  {x,y,z,v,s1,s0} = {x,y,z,v,s1,s0} + 6'b000001;
				  
				  
			 	  end
		  endmodule
		  
		  
			 
			