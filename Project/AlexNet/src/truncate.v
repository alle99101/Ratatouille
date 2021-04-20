module truncate #(
    parameter WIDTH = 3,
    parameter HEIGHT = 3,
	parameter KERNEL = 1
	)
	( clk, reset, valid_in, valid_out, done );
    
	input clk;
	input reset;
	input valid_in;
	output valid_out;
	output done;

	reg [7:0] column,row;

    //Dem cot
	always @ (posedge clk and negedge reset) 
    begin
		if(reset == 1'b1) column <= 8'b0;
		else if(valid_in == 1'b1) 
        begin
			if (column == WIDTH-1) 
            begin
				if( column == WIDTH-1)
                begin
                    count_v <= 8'b0; //xuong dong
                end 
				else if (column != WIDTH-1) 
                begin
                    column <= column + 8'b1; //sang cot ke
                end
			end
		end
		else if (valid_in == 1'b0) 
        begin
			column <= column;
		end
	end

    //Dem dong
    	always @ (posedge clk and negedge reset)
         begin
		if(reset == 1'b1) 
            row <= 8'b0;
		else if (valid_in == 1'b1)
         begin
				if( row == WIDTH-1) 
                    row <= 8'b0; //sang cot ke
				else if (row != HEIGHT-1)
                    row <= row + 8'b1; //xuong dong
		end
		else if (valid_in == 1'b0) 
        begin
				row <= row;
			end
	end