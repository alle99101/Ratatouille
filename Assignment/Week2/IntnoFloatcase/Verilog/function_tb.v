module function_tb();
reg clk;
reg [7:0] rin, gin, bin;
wire [7:0] rout, gout, bout;
integer fr,fg,fb,r,g,b;

Rmulti rmulti(rout,rin);
Gmulti gmulti(gout,gin);
Bmulti bmulti(bout,bin);
always begin
  #20 clk = ~clk;
 end // clock
 initial begin
	fr = $fopen("redvalue.txt","r");
	fg = $fopen("greenvalue.txt","r");
	fb = $fopen("bluevalue.txt","r");
	r = $fopen("outputred.txt","w");
	g = $fopen("outputgreen.txt","w");
	b = $fopen("outputblue.txt","w");
	while (! $feof(fr)) begin
	#10;
		$fscanf(fr,"%b\n",rin);
		#10;
		$fdisplay(r,"%b",rout);
		#10;
	end
	while (! $feof(fg)) begin
		$fscanf(fg,"%b\n",gin);
		$fdisplay(g,"%b",gout);
		#10;
	end
	while (! $feof(fb)) begin
		$fscanf(fb,"%b\n",bin);
		$fdisplay(b,"%b",bout);
		#10;
	end
 $fclose(fr);
 $fclose(fg);
 $fclose(fb);
 $fclose(r);
 $fclose(g);
 $fclose(b);
 #100;
 $stop;
 end
 
 endmodule