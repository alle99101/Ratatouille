module RGBtoGray (r, g, b, valid_in, clk , rst , grayout);
  input [31:0] r,g,b;
  wire [31:0] rout, gout, bout;
  input valid_in, clk, rst;
  output [31:0] grayout;
  wire valid_outr,valid_outg,valid_outb;
  
register regr(rout,r,clk,valid_in,valid_outr, rst);
register regg(gout,g,clk,valid_in,valid_outg, rst);
register regb(bout,b,clk,valid_in,valid_outb, rst);
 
ALU ALU1(rout,gout,bout,clk,valid_outr,valid_outg,valid_outb, grayout);      
endmodule           