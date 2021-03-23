module Bmulti(bout,bin);
input [7:0] bin;
output reg [7:0] bout;
reg [7:0] ins [0:7];

always@(bin)
	begin
		bout = bin*0.114;
	end
endmodule