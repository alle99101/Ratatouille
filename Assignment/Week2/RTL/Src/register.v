module register(data_out, data_in, clk, en, valid_out, rst);

	output reg [31:0] data_out;
	output reg valid_out;
	input [31:0] data_in;
	input clk,en,rst;
		
	always @(posedge clk)
	begin
	if (rst==1'b1 || en == 1'b0) begin
		data_out <= 32'b0;
		end
		else if(en==1'b1) begin
		  	data_out <= data_in;
			valid_out <= 1'b1;
        end
	end
endmodule
		