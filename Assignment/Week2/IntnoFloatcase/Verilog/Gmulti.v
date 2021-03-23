module Gmulti(gout,gin);
input [7:0] gin;
output reg [7:0] gout;
reg [7:0] ins [0:7];

always@(gin)
	begin
		gout = gin*0.587;
	end
endmodule