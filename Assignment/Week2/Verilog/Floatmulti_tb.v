module Floatmulti_tb();
reg clk;
reg [31:0] x,y;
wire [31:0] data_out;


Floatmulti multi(data_out, x, y);

always begin
  #20 clk = ~clk;
 end // clock
 
 initial begin
  x = 32'b01000001001000100000000000000000; //10.125
  y = 32'b00111110100110010001011010000111; //0.299
  end
  endmodule