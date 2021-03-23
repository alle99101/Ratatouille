module ALU (r,g,b,gray);
input [31:0] r,g,b;
output [31:0] gray;

wire [31:0] rout,gout,bout,t;
//0.299*R
Floatmulti multir (rout, 32'b00111110100110010001011010000111, r);

//0.587*G
Floatmulti multig (gout, 32'b00111111000101100100010110100010, g);

//0.114*B
Floatmulti multib (bout, 32'b00111101111010010111100011010101, b);
//0.299*R + 0.587*G
Floatadder addrg(t, gout, rout);

//0.299*R + 0.587*G + 0.114*B
Floatadder addrgb(gray, bout , t);

endmodule 