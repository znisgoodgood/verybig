module LBP
(
                                input                           clk,
                                input                           rst,
                                input                           enable,
                                output  reg     [11:0]  gray_addr,
                                output  reg             gray_OE,
                                input           [7:0]   gray_data,
                                output  reg     [11:0]  lbp_addr,
                                output  reg         lbp_WEN,
                                output  reg [7:0]       lbp_data,
                                output  reg                     finish
);
parameter s0 = 4'd0,//clear
	 s1 = 4'd1,//read
	 s2 = 4'd2,
	 s3 = 4'd3,
	 s4 = 4'd4,
	 s5 = 4'd5;
reg [3:0]cs,ns;
reg [31:0]counter,counter1;
reg [31:0] i;
reg [11:0]inside_using;
reg [7:0]temp[8:0];
reg [7:0]temp2[7:0];
always@(posedge clk or posedge rst) begin
	if(rst) begin
		cs<=s0;
	end
	else begin
		cs<=ns;
	end        
end
always@(*)begin
case(cs)
	s0: begin//idle
		if(enable==1'd1)
			ns = s1;    
		else 
			ns = s0;
	end    
	s1: begin//clear
		if(counter == 32'd4096) 
			ns = s2;
		else 
			ns = s1;
	end
	s2: begin//clear
		if(i==32'd11)     
			ns = s3;
		else
			ns = s2;
	end

	s3:begin
		ns = s4;                                                                                                         
	end
	s4:begin
	if(counter1 == 32'd3844)
		ns = s5;
	else
		ns = s2;
	end
	s5:
		ns = s5;
	default:
		ns = s0;
endcase
end
always@(posedge clk)begin
	if(cs == s0)begin
		counter <=32'd0;
	end
	else if(cs == s1)begin
		counter <= counter + 32'd1;
	end
	else	
		counter <= 32'd0;
end
always@(posedge clk)begin
        if(cs==s0)
                gray_addr<=12'd65;
        else if(cs == s2)begin
					case(i%12)
					32'd0:
									gray_addr <= inside_using;
					32'd1:begin
									gray_addr <= inside_using - 12'd65;
					end
					32'd2:begin     
									gray_addr <= inside_using - 12'd64;
					end
					32'd3:begin
									gray_addr <= inside_using - 12'd63;
					end
					32'd4:begin
									gray_addr <= inside_using - 12'd1;
					end
					32'd5:begin
									gray_addr <= inside_using + 12'd1; 

					end
					32'd6:begin     
									gray_addr <= inside_using + 12'd63; 
					end
					32'd7:begin
									gray_addr <= inside_using + 12'd64; 
					end
					32'd8:begin
									gray_addr <= inside_using + 12'd65;
					end
					32'd9:begin
									 
					end
					32'd10:begin    
									//inside_gray = inside_using + 12'd65;  
									end
					32'd11:begin
                end
				default: begin
				end
                                                                
			endcase
                end
end
always@(posedge clk)begin
		if(cs == s2)begin
			      case(i%12)
		32'd0:begin
		end
		32'd1:begin
		end
		32'd2:begin     
						temp[0] <= gray_data;
		end
		32'd3:begin
						temp[1] <= gray_data;
		end
		32'd4:begin
						temp[2] <= gray_data;
		end
		32'd5:begin
						temp[3] <= gray_data;
		end
		32'd6:begin     
						temp[4] <= gray_data;
		end
		32'd7:begin
						temp[5] <= gray_data;
		end
		32'd8:begin
						temp[6] <= gray_data;
		end
		32'd9:begin
						temp[7] <= gray_data;
		end
		32'd10:begin    
						temp[8] <= gray_data;
						end
		32'd11:begin
		end
		default: begin
		end
                                endcase
		end
end
always@(posedge clk)begin
	if(cs == s0)
		counter1<=32'd0;
	else if(cs == s3)
		counter1 <= counter1 +32'd1;	
end
always@(posedge clk)begin
	if(cs == s1)
		lbp_addr <= lbp_addr + 12'd1;
	else if(cs == s2)
		lbp_addr <= inside_using;
	else if(cs == s0)
		lbp_addr <= 12'd0;
end
always@(posedge clk)begin

	if(cs == s1)
		inside_using <= 12'd65;
	else if(cs == s3)begin
		if(counter1%62==61)               
			inside_using <= inside_using + 12'd3;
		else
			inside_using <= inside_using + 12'd1;  
	end
	else if(cs == s0)
		inside_using <= 12'd0;
end
always@(posedge clk)begin
	if(cs == s3) begin
		temp2[0] <= (temp[1]>temp[0]||temp[1]==temp[0])?8'd1:8'd0;            
		temp2[1] <= (temp[2]>temp[0]||temp[2]==temp[0])?8'd2:8'd0;
		temp2[2] <= (temp[3]>temp[0]||temp[3]==temp[0])?8'd4:8'd0;
		temp2[3] <= (temp[4]>temp[0]||temp[4]==temp[0])?8'd8:8'd0;
		temp2[4] <= (temp[5]>temp[0]||temp[5]==temp[0])?8'd16:8'd0;
		temp2[5] <= (temp[6]>temp[0]||temp[6]==temp[0])?8'd32:8'd0;
		temp2[6] <= (temp[7]>temp[0]||temp[7]==temp[0])?8'd64:8'd0;
		temp2[7] <= (temp[8]>temp[0]||temp[8]==temp[0])?8'd128:8'd0;  
	end
end
always@(posedge clk)begin
	if(cs == s2)
		i <= i + 32'd1;
	else 
		i <= 32'd0;
end
always@(*)begin
case(cs)
	s0: begin
		lbp_WEN = 1'd0;
		gray_OE = 1'd0;
		lbp_data = 8'd0;
		finish = 1'd0;
	end
	s1:begin
		finish = 1'd0;
		gray_OE =1'd0;
		lbp_WEN = 1'd1;
		lbp_data = 8'd0;
	end
	s2:begin
		finish = 1'd0;
		gray_OE =1'd1;
		lbp_WEN = 1'd0;
		lbp_data = 8'd0;
	end
	s3:begin
		gray_OE = 1'd0;
		finish = 1'd0;
		lbp_WEN = 1'd0;
	    lbp_data = 8'd0;
	end 
	s4:begin
		lbp_data = temp2[0]+temp2[1]+temp2[2]+temp2[3]+temp2[4]+temp2[5]+temp2[6]+temp2[7];
		lbp_WEN = 1'd1;
		gray_OE = 1'd0;
		finish = 1'd0;
		//if(counter1 == 3844)begin
			//lbp_WEN = 1'd0;
		//end                                                                                                   
	end
	s5:begin
			finish = 1'd1;
			gray_OE =1'd0;
			lbp_WEN = 1'd0;
			lbp_data = 8'd0;	
	end   
	default: begin
			finish = 1'd0;
			gray_OE =1'd0;
			lbp_WEN = 1'd0;
			lbp_data = 8'd0;	                                                            
	end                                                                        
endcase
end
endmodule
