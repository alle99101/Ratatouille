`timescale 1ns/1ps
module RGBtoGray_tb ();
	reg CLK;
  
  reg [31:0] r,g,b;
  wire [31:0] gray;
  reg [31:0] red [249999:0];
  reg [31:0] green [249999:0];
  reg [31:0] blue [249999:0];
  reg [31:0] gurei;

integer i;           
always begin
  #20 CLK = ~CLK;
 end // clock		   
RGBtoGray RGBtoGray0(r, g, b, gray);
initial begin 
    
    //open file 
    $readmemb("redfloat.txt", red);
    $readmemb("greenfloat.txt", green);
    $readmemb("bluefloat.txt", blue);
    gurei=$fopen("grayfloat.txt");
	for (i=0;i<=250000;i = i + 1)
		begin
			r = red[i];
			g = green[i];
			b = blue[i];
			$fdisplay(gurei,"%b",gray);
			#100;
		end
		$finish;
 
end

endmodule 