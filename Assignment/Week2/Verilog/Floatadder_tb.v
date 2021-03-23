module Floatadder_tb();
reg clk;
reg [31:0] x,y;
wire [31:0] data_out;


Floatadder adder(data_out, x, y);

always begin
  #20 clk = ~clk;
 end // clock
 
 initial begin
  x = 32'b01000001001000100000000000000000; //10.125
  y = 32'b01000000101010000000000000000000; //5.25
  end
  endmodule