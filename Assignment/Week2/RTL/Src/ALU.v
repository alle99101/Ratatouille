module ALU (r,g,b,clk,valid_inr,valid_ing,valid_inb,gray);
input [31:0] r,g,b;
input clk, valid_inr,valid_ing,valid_inb;
wire valid_outmulr, valid_outmulg, valid_outmulb;
wire valid_out, valid_unused;
output [31:0] gray;


wire [31:0] rout,gout,bout,t;
//0.299*R
Floatmulti multir (rout, 32'b00111110100110010001011010000111, r, valid_inr, valid_outmulr, clk);

//0.587*G
Floatmulti multig (gout, 32'b00111111000101100100010110100010, g, valid_ing, valid_outmulg, clk);

//0.114*B
Floatmulti multib (bout, 32'b00111101111010010111100011010101, b, valid_inb, valid_outmulb, clk);
//0.299*R + 0.587*G
Floatadder addrg(t, gout, rout, valid_outmulg, valid_outmulr, valid_out, clk);

//0.299*R + 0.587*G + 0.114*B
Floatadder addrgb(gray, bout , t, valid_outmulb, valid_out, valid_unused, clk);

endmodule 