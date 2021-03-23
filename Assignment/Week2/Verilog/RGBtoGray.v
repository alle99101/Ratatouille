module RGBtoGray (r, g, b, grayout);
  input [31:0] r,g,b;
  output [31:0] grayout;
 
ALU ALU1(r,g,b, grayout);      
endmodule           