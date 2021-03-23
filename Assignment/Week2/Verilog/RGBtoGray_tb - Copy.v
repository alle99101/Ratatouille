`timescale 1ns/1ps
module RGBtoGray_tb ();
  
  reg [31:0] r,g,b;
  wire [31:0] gray;
  parameter cycle=1;
  integer sr,sg,sb,sgray, wr,wg,wb;
  reg WE, CLK;
  reg [31:0] i;
  RGBtoGray RGBtoGray0(r, g, b, gray);
           
always begin
  #20 CLK = ~CLK;
 end // clock		   

initial begin 
    
    //open file 
    sr=$fopen("redfloat.txt","r");
    sg=$fopen("greenfloat.txt","r");
    sb=$fopen("bluefloat.txt","r");
    sgray=$fopen("grayfloat.txt","w");
   
	 while (! $feof(sr)) begin while (! $feof(sg)) begin while (! $feof(sb)) begin
      wr=$fscanf(sr,"%b\n",r); 
      wg=$fscanf(sg,"%b\n",g); 
      wb=$fscanf(sb,"%b\n",b);  
     $fdisplay(sgray,"%b\n",gray); 
	 #10;
	 end
	 end
	 end 
$fclose(sr);
$fclose(sg);
$fclose(sb);  
$fclose(sgray);  
#100;
$stop;
end
//always @(posedge clk) begin
//  if(Gray!= 8'hx) begin  end
//end

endmodule 