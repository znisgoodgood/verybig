module DCU(
    input               clk,
    input               rst,
    input               enable,
    input   [20:0]      hist_addr_offset,

    output  reg [20:0]  hist_addr_train,
    output  reg         hist_ren_train,
    input   [7:0]       hist_rdata_train,

    output  reg [13:0]  hist_addr_predict,
    output  reg         hist_ren_predict,
    input   [7:0]       hist_rdata_predict,

    output  reg [17:0]  distance,
    output  reg         valid
);
    // put your design here
	parameter idle = 2'd0,compute = 2'd1,store = 2'd2,exit = 2'd3;
	reg [1:0]cs,ns;
	reg [14:0]counter;
	reg [17:0]temp;
	
	always@(posedge clk or posedge rst)begin
		if(rst)
			cs <= idle;
		else
			cs <= ns;
	end
	
	always@(*)begin
		case(cs)
			idle:
				if(enable)
					ns = compute;
				else
					ns = idle;
			compute:
				if(counter == 16385)
					ns = store;
				else
					ns = compute;
			store:
				ns = exit;
			exit:
				ns = idle;
		endcase
	end
	always@(*)begin
		case(cs)
			idle:begin
				valid = 1'd0; 
				hist_ren_train = 1'd0;
				hist_ren_predict = 1'd0;
			end
			compute:begin
				valid = 1'd0; 			
				hist_ren_predict = 1'd1;
				hist_ren_train = 1'd1;
			end
			store:begin
				valid = 1'd0; 			
				hist_ren_train = 1'd0;
				hist_ren_predict = 1'd0;
			end
			exit:begin
				hist_ren_train = 1'd0;
				hist_ren_predict = 1'd0;			
				valid = 1'd1;
			end
		endcase
	end
	
//compute
	always@(posedge clk)begin
		if(cs == compute&&counter == 0)begin
			hist_addr_train <= hist_addr_offset;
			hist_addr_predict <= 14'd0;
		end
		else if(cs == compute&&counter < 16384)begin
			hist_addr_predict <= hist_addr_predict + 14'd1;	
			hist_addr_train <= hist_addr_train + 21'd1;
		end
	end	
	
	always@(posedge clk)begin
		if(cs == idle)
			temp <= 18'd0;
		else if(cs == compute&&counter >2)begin
					temp <= temp + (hist_rdata_predict - hist_rdata_train)*(hist_rdata_predict - hist_rdata_train);
		end	
	end
	
	always@(posedge clk)begin
		if(cs == store)
			distance <= temp;
	end
//counter
	always@(posedge clk)begin
		if(cs == idle)
			counter <= 15'd0;
		else if(cs == compute)
			counter <= counter + 15'd1;
	end
	
endmodule   