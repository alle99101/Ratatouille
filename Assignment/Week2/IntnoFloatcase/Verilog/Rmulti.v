module Rmulti(rout,rin);
input [7:0] rin;
output reg [7:0] rout;
reg [7:0] ins [0:7];

always@(rin)
	begin
		rout = rin*0.299;
	end
endmodule