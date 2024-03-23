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

		    module tstfba ();
			   reg [3:0] x,y;
			   reg cin;
			   wire [3:0] sum;
			   wire cout;
			   four_bit_adder fob(x,y,cin,sum,cout);
			   initial
				   
				   begin 
					
					   
					  {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin} = 9'b000000000;
				   repeat (511)
				#150ns   {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin}=  {x[0],x[1],x[2],x[3],y[0],y[1],y[2],y[3],cin} + 9'b000000001;
				end
			   endmodule