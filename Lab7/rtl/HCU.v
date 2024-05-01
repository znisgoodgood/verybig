module HCU(
    input               clk,
    input               rst,
    input               mode,
    input               enable,
    input   [3:0]       gridX,
    input   [3:0]       gridY,
    output  reg         lbp_ren,
    output  reg [11:0]  lbp_addr,
    input       [7:0]   lbp_rdata,

    output  reg         hist_wen_train,
    output  reg [7:0]   hist_wdata_train,
    output  reg [20:0]  hist_addr_train,
    output  reg         hist_ren_train,
    input   [7:0]       hist_rdata_train,

    output  reg         hist_wen_predict,
    output  reg [7:0]   hist_wdata_predict,
    output  reg [13:0]  hist_addr_predict,
    output  reg         hist_ren_predict,
    input   [7:0]       hist_rdata_predict,

    output  reg         done
    );
	reg [7:0]calculate[255:0];
    // put your design here
	parameter idle = 3'd0,train_read = 3'd1,train_write = 3'd2,pred_read = 3'd3,pred_write = 3'd4,stop = 3'd5,exit =3'd6;
	reg [2:0] cs,ns;
	reg [11:0]x,y,x0,y0;
	reg [31:0]counter;
	reg [7:0]counter1;
	reg [5:0]counter2;
	reg [20:0]counter3;
	reg [13:0]counter4;
	integer i;
	
	always@(posedge clk or posedge rst)begin
		if(rst)
			cs <= idle;
		else	
			cs <= ns;
	end
	
	always@(*)begin
		case(cs)
			idle:begin
				if(enable)
					ns = mode?pred_read:train_read;
				else
					ns = idle;
			end
			train_read:begin
				if(counter == 66)
					ns = train_write;
				else	
					ns = train_read;
			end
			train_write:begin
				if(counter1 == 255)
					if(counter2 == 63)
						ns = stop;
					else
						ns = train_read;		
				else
					ns = train_write;
			end	
			pred_read:begin
				if(counter == 66)
					ns = pred_write;
				else	
					ns = pred_read;
			end
			pred_write:begin
				if(counter1 == 255)
					if(counter2 == 63)
						ns = stop;
					else
						ns = pred_read;
				else
					ns = pred_write;
			end
			stop:
				ns = exit;
			exit:
				ns = idle;
			default:
				ns = idle;
		endcase		
	end
	
	always@(*)begin
		case(cs)
			idle:begin
				done = 1'd0;
				hist_wen_train = 1'd0;
				hist_wen_predict = 1'd0;
				lbp_ren = 1'd0;				
			end
			train_read:begin
				done = 1'd0;			
				lbp_ren = 1'd1;
				hist_wen_train = 1'd0;
				hist_wen_predict = 1'd0;				
			end
			train_write:begin
				done = 1'd0;			
				lbp_ren = 1'd0;
				hist_wen_train = 1'd1;
				hist_wen_predict = 1'd0;				
			end
			pred_read:begin		
				done = 1'd0;			
				hist_wen_train=1'd0;
				lbp_ren = 1'd1;
				hist_wen_predict = 1'd0;
			end
			pred_write:begin		
				hist_wen_train=1'd0;			
				done = 1'd0;			
				lbp_ren = 1'd0;
				hist_wen_predict = 1'd1;
			end
			stop:begin	
				lbp_ren = 1'd0;			
				hist_wen_train = 1'd1;
				done = 1'd0;
				hist_wen_predict = 1'd1;				
			end			
			exit:begin
				lbp_ren = 1'd0;			
				hist_wen_train = 1'd0;
				done = 1'd1;
				hist_wen_predict = 1'd0;
			end
			default:begin
				lbp_ren = 1'd0;			
				hist_wen_train = 1'd0;
				done = 1'd1;
				hist_wen_predict = 1'd0;			
			end		
		endcase
	end
	
	//read lbp
	always@(posedge clk)begin
		if(cs == idle)begin
			x <= 12'd0;
			y <= 12'd0;
		end
		else if(cs == train_write||cs == pred_write)begin
			if((counter2)%8 == 7)begin
				if(counter1 == 255)begin
					x <= x - 12'd56;
					y <= y + 12'd8;
				end	
			end
			else
				if(counter1 == 255)
					x <= x + 12'd8;
		end			
	end
	always@(posedge clk)begin
		if(cs == idle)begin
			x0 <= 12'd0;
			y0 <= 12'd0;
		end
		else if(cs == train_read||cs == pred_read)begin
			if(counter<64)begin
				if(counter == 32'd0)begin
					x0 <= x;
					y0 <= y;
				end	
				else if((counter-1)%8 == 7)begin
					x0 <= x0 - 12'd7;
					y0 <= y0 + 12'd1;
				end
				else 
					x0 <= x0 + 12'd1;
			end
		end
	end
		
	always@(posedge clk)begin
		if(cs == idle)
			lbp_addr <= 12'd0;
		else if(cs == train_read||cs == pred_read)
			lbp_addr <= x0 + (y0<<6);
	end
	
	always@(posedge clk)begin
		if(cs == train_read||cs == pred_read)begin
			if(counter == 0)
				for(i = 0;i<256;i=i+1)begin
					calculate[i] <= 8'd0;
				end
			else if(counter > 2)begin
				/*case(lbp_rdata)
					8'd0:
						calculate[0] <= calculate[0] + 8'd1;
					8'd1:
						calculate[1] <= calculate[1] + 8'd1;
					8'd2:
						calculate[2] <= calculate[2] + 8'd1;
					8'd3:
						calculate[3] <= calculate[3] + 8'd1;
					8'd4:
						calculate[4] <= calculate[4] + 8'd1;
					8'd5:
						calculate[5] <= calculate[5] + 8'd1;	
					8'd6:
						calculate[6] <= calculate[6] + 8'd1;
					8'd7:
						calculate[7] <= calculate[7] + 8'd1;
					8'd8:
						calculate[8] <= calculate[8] + 8'd1;
					8'd9:
						calculate[9] <= calculate[9] + 8'd1;
					8'd10:
						calculate[10] <= calculate[10] + 8'd1;
					8'd11:
						calculate[11] <= calculate[11] + 8'd1;		
					8'd12:
						calculate[12] <= calculate[12] + 8'd1;
					8'd13:
						calculate[13] <= calculate[13] + 8'd1;
					8'd14:
						calculate[14] <= calculate[14] + 8'd1;
					8'd15:
						calculate[15] <= calculate[15] + 8'd1;
					8'd16:
						calculate[16] <= calculate[16] + 8'd1;
					8'd17:
						calculate[17] <= calculate[17] + 8'd1;	
					8'd18:
						calculate[18] <= calculate[18] + 8'd1;
					8'd19:
						calculate[19] <= calculate[19] + 8'd1;
					8'd20:
						calculate[20] <= calculate[20] + 8'd1;
					8'd21:
						calculate[21] <= calculate[21] + 8'd1;
					8'd22:
						calculate[22] <= calculate[22] + 8'd1;
					8'd23:
						calculate[23] <= calculate[23] + 8'd1;	
					8'd24:
						calculate[24] <= calculate[24] + 8'd1;
					8'd25:
						calculate[25] <= calculate[25] + 8'd1;
					8'd26:
						calculate[26] <= calculate[26] + 8'd1;
					8'd27:
						calculate[27] <= calculate[27] + 8'd1;
					8'd28:
						calculate[28] <= calculate[28] + 8'd1;
					8'd29:
						calculate[29] <= calculate[29] + 8'd1;	
					8'd30:
						calculate[30] <= calculate[30] + 8'd1;
					8'd31:
						calculate[31] <= calculate[31] + 8'd1;
					8'd32:
						calculate[32] <= calculate[32] + 8'd1;
					8'd33:
						calculate[33] <= calculate[33] + 8'd1;
					8'd34:
						calculate[34] <= calculate[34] + 8'd1;
					8'd35:
						calculate[35] <= calculate[35] + 8'd1;		
					8'd36:
						calculate[36] <= calculate[36] + 8'd1;
					8'd37:
						calculate[37] <= calculate[37] + 8'd1;
					8'd38:
						calculate[38] <= calculate[38] + 8'd1;
					8'd39:
						calculate[39] <= calculate[39] + 8'd1;
					8'd40:
						calculate[40] <= calculate[40] + 8'd1;
					8'd41:
						calculate[41] <= calculate[41] + 8'd1;	
					8'd42:
						calculate[42] <= calculate[42] + 8'd1;
					8'd43:
						calculate[43] <= calculate[43] + 8'd1;
					8'd44:
						calculate[44] <= calculate[44] + 8'd1;
					8'd45:
						calculate[45] <= calculate[45] + 8'd1;
					8'd46:
						calculate[46] <= calculate[46] + 8'd1;
					8'd47:
						calculate[47] <= calculate[47] + 8'd1;
					default:
						calculate[48] <= calculate[48] + 8'd1;
				endcase*/
				calculate[lbp_rdata] <= calculate[lbp_rdata] + 8'd1;
			end	
		end	
	end
	
	//train_write
	always@(posedge clk)begin
		if(cs == idle)begin
			hist_wdata_train <= 8'd0; 
		end	
		else if(cs == train_write)
			hist_wdata_train <= calculate[counter1];
	end
	always@(posedge clk)begin
		if(cs == idle)
			hist_addr_train <= (counter3<<14);
		else if(cs == train_write)
			if(counter1 == 0)
				hist_addr_train <= (counter3<<14) + ({15'd0,counter2}<<8); 
			else
				hist_addr_train <= hist_addr_train + 21'd1;
	end
	
	//pred_write
	always@(posedge clk)begin
		if(cs == idle)begin
			hist_wdata_predict <= 8'd0; 
		end	
		else if(cs == pred_write)
			hist_wdata_predict <= calculate[counter1];
	end
	always@(posedge clk)begin
		if(cs == idle)
			hist_addr_predict <= 14'd0;//(counter4<<14);
		else if(cs == pred_write)
			if(counter1 == 0)
				hist_addr_predict <=  ({8'd0,counter2}<<8); 
			else
				hist_addr_predict <= hist_addr_predict + 12'd1;
	end
	
	//counter using
	always@(posedge clk)begin
		if(cs == train_read||cs == pred_read)
			counter <= counter + 32'd1;
		else	
			counter <= 32'd0;
	end
	
	always@(posedge clk)begin
		if(cs == train_write||cs == pred_write)
			counter1 <= counter1 + 32'd1;
		else
			counter1 <= 32'd0;
	end
	
	always@(posedge clk)begin
		if(cs == idle)
			counter2 <= 6'd0;
		else if(cs == train_write||cs == pred_write)
			if(counter1 == 255)
				counter2 <= counter2 + 6'd1;
	end
	
	always@(posedge clk)begin
		if(rst)
			counter3 <= 21'd0;
		if(cs == exit)
			counter3 <= counter3 + 21'd1;
	end
	
	always@(posedge clk)begin
		if(rst)
			counter4 <= 12'd0;
		if((cs == exit)&&(mode == 1'd1))
			counter4 <= counter4 + 12'd1;
	end
endmodule