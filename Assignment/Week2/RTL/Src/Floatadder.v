module Floatadder(data_out,x,y,valid_inx,valid_iny,valid_out,clk);
  input [31:0] x,y;
  input clk, valid_inx, valid_iny;
  output reg valid_out;
  output reg [31:0] data_out;
  
reg [7:0] ex, ey;
reg [23:0] mx, my;
reg [24:0] mout;
reg [7:0] bias;


always @(posedge clk) 
begin
if ((valid_inx == 1'b1) && (valid_iny == 1'b1)) begin
  mx = {1'd1, x[22:0]};
  my = {1'd1, y[22:0]};
  ex = x[30:23];
  ey = y[30:23];

if (ex < ey) 
  begin
    bias = ey - ex;
    ex = ey;
    mx = my >> bias;
  end

else 
  begin
    bias = ex - ey;
    ey = ex;
    my = mx >> bias;
  end


if (x[31]==y[31]) 
  begin
    mout = mx + my;
    data_out[31] = x[31];
  end
else
  
    if (mx > my)
      begin
        mout = mx - my;
        data_out[31] = x[31];
      end
else
  if (mx < my) 
    begin
      mout = my - mx;
      data_out[31]= y[31];
    end
else
  begin
    mout = mx - my;
    data_out[31] = 1'd0;
  end
    if (mout[24] == 1) begin		
				data_out[22:0] = mout[23:1];
				data_out[30:23] = ex+8'd1;
		end
		else if(mout[23] == 1) begin 					
				data_out[22:0] = mout[22:0];
				data_out[30:23] = ex;
		end
		else if (mout[22] == 1) begin
					data_out[22:0] = {mout[21:0],1'd0};
					data_out[30:23] = ex - 1;
				end
		else if (mout[21] == 1) begin
					data_out[22:0] = {mout[20:0],2'd0};
					data_out[30:23] = ex - 2;	
				end
		else if (mout[20] == 1) begin
					data_out[22:0] = {mout[19:0],3'd0};
					data_out[30:23] = ex - 3;	
				end
		else if (mout[19] == 1) begin
					data_out[22:0] = {mout[18:0],4'd0};
					data_out[30:23] = ex - 4;
				end
		else if (mout[18] == 1) begin
					data_out[22:0] = {mout[17:0],5'd0};
					data_out[30:23] = ex - 5;
				end
		else if (mout[17] == 1) begin
					data_out[22:0] = {mout[16:0],6'd0};
					data_out[30:23] = ex - 6;
				end		
		else if (mout[16] == 1) begin
					data_out[22:0] = {mout[15:0],7'd0};
					data_out[30:23] = ex - 7;
				end		
		else if (mout[15] == 1) begin
					data_out[22:0] = {mout[14:0],8'd0};
					data_out[30:23] = ex - 8;
				end
		else if (mout[14] == 1) begin
					data_out[22:0] = {mout[13:0],9'd0};
					data_out[30:23] = ex - 9;
				end
		else if (mout[13] == 1) begin
					data_out[22:0] = {mout[12:0],10'd0};
					data_out[30:23] = ex - 10;
				end
		else if (mout[12] == 1) begin
					data_out[22:0] = {mout[11:0],11'd0};
					data_out[30:23] = ex - 11;
				end
		else if (mout[11] == 1) begin
					data_out[22:0] = {mout[10:0],12'd0};
					data_out[30:23] = ex - 12;
				end
		else if (mout[10] == 1) begin
					data_out[22:0] = {mout[9:0],13'd0};
					data_out[30:23] = ex - 13;
				end
		else if (mout[9] == 1) begin
					data_out[22:0] = {mout[8:0],14'd0};
					data_out[30:23] = ex - 14;
				end
		else if (mout[8] == 1) begin
					data_out[22:0] = {mout[7:0],15'd0};
					data_out[30:23] = ex - 15;
				end
		else if (mout[7] == 1) begin
					data_out[22:0] = {mout[6:0],16'd0};
					data_out[30:23] = ex - 16;
				end
		else if (mout[6] == 1) begin
					data_out[22:0] = {mout[5:0],17'd0};
					data_out[30:23] = ex - 17;
				end
		else if (mout[5] == 1) begin
					data_out[22:0] = {mout[4:0],18'd0};
					data_out[30:23] = ex - 18;
				end
		else if (mout[4] == 1) begin
					data_out[22:0] = {mout[3:0],19'd0};
					data_out[30:23] = ex - 19;
				end
		else if (mout[3] == 1) begin
					data_out[22:0] = {mout[2:0],20'd0};
					data_out[30:23] = ex - 20;
				end
		else if (mout[2] == 1) begin
					data_out[22:0] = {mout[1:0],21'd0};
					data_out[30:23] = ex - 21;
				end
		else if (mout[1] == 1) begin
					data_out[22:0] = {mout[0],22'd0};
					data_out[30:23] = ex - 22;
				end
		else if (mout[0] == 1) begin
					data_out[22:0] = {23'd0};
					data_out[30:23] = ex - 23;
				end
		else data_out[30:0] = 0;	
end
else begin
valid_out = 1'b0;
data_out[31:0] = 1'b0;
end
end
endmodule
      
    
  
  
