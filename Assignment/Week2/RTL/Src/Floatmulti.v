module Floatmulti (data_out,x,y,valid_in,valid_out,clk);
output reg [31:0] data_out;
output reg valid_out;
input [31:0] x,y;
input valid_in;
input clk;

 reg [47:0] mz;
 reg [23:0] mx,my;
 
 always @(posedge clk) 
 begin
	if (valid_in==1'b1)
	begin
		if (x[31] == y[31] ) begin
			data_out[31] = 0;  
			end
			else begin
			data_out[31] = 1;
			end
		
			data_out[30:23] = x [30:23] + y [30:23] - 8'd127; 
		
			mx = {1'b1,x[22:0]};				
			my = {1'b1,y[22:0]};
			mz = mx * my;
		
			if (mz[47] == 0) 
			begin		
				data_out[22:0] = mz[45:23];
			end
			else
			begin		
				data_out[30:23] = data_out[30:23] + 1;
				data_out[22:0] = mz[46:24];
			end
		valid_out = 1'b1;
	end
	else begin
		data_out[31:0] = 31'b0;
		valid_out = 1'b0;
	end
end
endmodule 