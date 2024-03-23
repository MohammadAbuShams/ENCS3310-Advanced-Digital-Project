		   module full_adder (x,y,cin,sum,cout);		
			   input x,y,cin;
			   output sum,cout;
			   wire w1,w2,w3;
			   xor #11ns gate1(w1,x,y);
			   and #7ns gate2(w2,x,y); 
			   xor #11ns gate3(sum,w1,cin); 
			   and #7ns gate4(w3,w1,cin); 
			   or #7ns gate5(cout,w3,w2);	
		   endmodule  
		   
		   
		   module tstfa ();
			   reg x,y,cin;
			   wire sum,cout;
			   full_adder fa(x,y,cin,sum,cout);
			   initial
				   
				   begin 
					
					   
					  {x,y,cin} = 3'b000;
				   repeat (7)
				#700ns {x,y,cin} = {x,y,cin} + 3'b001;
				end
			   endmodule
			   
			   