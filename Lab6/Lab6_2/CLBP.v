module CLBP
#(
    parameter INT_WIDTH     = 9,
    parameter FRAC_WIDTH    = 16
)
(
    input                                       clk,
    input                                       rst,
    input                                       enable,
    output reg  [11:0]                          gray_addr,
    output reg                                  gray_OE,
    input       [7:0]                           gray_data,
    output reg  [11:0]                          lbp_addr,
    output reg                                  lbp_WEN,
    output reg  [7:0]                           lbp_data,
    output reg  [(INT_WIDTH+FRAC_WIDTH)-1:0]    theta, // in radian
    output reg                                  theta_valid,
    input       [(INT_WIDTH+FRAC_WIDTH)-1:0]    cos_data,
    input                                       cos_valid,
    input       [(INT_WIDTH+FRAC_WIDTH)-1:0]    sin_data,
    input                                       sin_valid,
    output reg                                  finish
    ); 
parameter idle = 3'd0,write_0 = 3'd1,read = 3'd2,compute = 3'd3,store = 3'd4,store2 = 3'd5,	write= 3'd6,done = 3'd7;
reg [2:0]cs,ns;
reg [31:0]counter1,counter,counter2;
reg [11:0]x,y,x0,y0;
reg [24:0]pre2[32:0];
reg [7:0]post[7:0];
reg [49:0]pre[7:0];
integer i;
//theat_cal
reg [49:0]calculate,theta_calculate;
reg [24:0] rx[7:0],ry[7:0],x1[7:0],x2[7:0],y1[7:0],y2[7:0],tx[7:0],ty[7:0];
reg [49:0] w1[7:0],w2[7:0],w3[7:0],w4[7:0];
wire [24:0]R;
wire [24:0]pi_2;
wire [24:0]k[7:0];
assign R = {9'd3,16'd0};
assign pi_2 = 25'b0000001100100100001111110;
assign k[0] = 25'd0;
assign k[1] = {9'd1,16'd0};
assign k[2] = {9'd2,16'd0};
assign k[3] = {9'd3,16'd0};
assign k[4] = {9'd4,16'd0};
assign k[5] = {9'd5,16'd0};
assign k[6] = {9'd6,16'd0};
assign k[7] = {9'd7,16'd0};
//FSM
always@(posedge clk or posedge rst)begin
	if(rst)
		cs <= idle;
	else 
		cs <= ns;
end

always@(*)begin
	case(cs)
		idle:
			if(enable == 1'd1)
				ns = write_0;
			else
				ns = idle;
		write_0:
			if(counter == 32'd4096)
				ns = read;
			else	
				ns = write_0;
		read:
			if(counter1 == 32'd37)
				ns = compute;
			else	
				ns = read;
		compute:
			ns = store;
		store:
			ns = store2;
		store2:
			ns = write;
		write:
			if(counter2 == 32'd3363)
				ns = done;
			else	
				ns = read;
		done:
			ns = done;
	endcase
end

always@(*)begin
	case(cs)
		idle:begin
			gray_OE = 1'd0;
			lbp_WEN = 1'd0;
			finish = 1'd0;
		end
		write_0:begin
			gray_OE = 1'd0;
			lbp_WEN = 1'd1;
			finish = 1'd0;
		end
		read: begin
			lbp_WEN = 1'd0;
			gray_OE = 1'd1;
			finish = 1'd0;
		end
		compute: begin
			lbp_WEN = 1'd0;
			gray_OE = 1'd0;
			finish = 1'd0;
		end
		store:begin
			lbp_WEN = 1'd0;
			gray_OE = 1'd0;
			finish = 1'd0;
		end
		store2:begin
			lbp_WEN = 1'd0;
			gray_OE = 1'd0;
			finish = 1'd0;
		end
		write:begin
			lbp_WEN = 1'd1;
			gray_OE = 1'd0;
			finish = 1'd0;
		end
		done:begin
			lbp_WEN = 1'd0;
			gray_OE = 1'd0;
			finish = 1'd1;
		end
		default:
			finish = 1'd1;
	endcase
end		
//read
always@(posedge clk)begin
	if(cs == write_0)begin
		x <= 12'd3;
		y <= 12'd3;
	end	
	if(cs == write)begin
		if(counter2%58 == 57)begin
			y <= y + 12'd1;
			x <= x - 12'd57;
		end
		else 
			x <= x + 12'd1;
	end
end

always@(posedge clk)begin
	if(cs == read)begin
		if(counter1 < 34)begin
		case(counter1%33)
			32'd0:begin
				x0 <= x;
				y0 <= y;
			end
			32'd1:begin
				x0 <= x + {{3{x1[0][24]}},x1[0][24:16]};
				y0 <= y + {{3{y1[0][24]}},y1[0][24:16]};
			end
			32'd2:begin
				x0 <= x + {{3{x1[0][24]}},x1[0][24:16]};
				y0 <= y + {{3{y2[0][24]}},y2[0][24:16]};
			end
			32'd3:begin
				x0 <= x + {{3{x2[0][24]}},x2[0][24:16]};
				y0 <= y + {{3{y1[0][24]}},y1[0][24:16]};
			end
			32'd4:begin
				x0 <= x + {{3{x2[0][24]}},x2[0][24:16]};
				y0 <= y + {{3{y2[0][24]}},y2[0][24:16]};
			end
			32'd5:begin
				x0 <= x + {{3{x1[1][24]}},x1[1][24:16]};
				y0 <= y + {{3{y1[1][24]}},y1[1][24:16]};
			end
			32'd6:begin
				x0 <= x + {{3{x1[1][24]}},x1[1][24:16]};
				y0 <= y + {{3{y2[1][24]}},y2[1][24:16]};
			end
			32'd7:begin
				x0 <= x + {{3{x2[1][24]}},x2[1][24:16]};
				y0 <= y + {{3{y1[1][24]}},y1[1][24:16]};
			end
			32'd8:begin
				x0 <= x + {{3{x2[1][24]}},x2[1][24:16]};
				y0 <= y + {{3{y2[1][24]}},y2[1][24:16]};
			end
			32'd9:begin
				x0 <= x + {{3{x1[2][24]}},x1[2][24:16]};
				y0 <= y + {{3{y1[2][24]}},y1[2][24:16]};
			end
			32'd10:begin
				x0 <= x + {{3{x1[2][24]}},x1[2][24:16]};
				y0 <= y + {{3{y2[2][24]}},y2[2][24:16]};
			end
			32'd11:begin
				x0 <= x + {{3{x2[2][24]}},x2[2][24:16]};
				y0 <= y + {{3{y1[2][24]}},y1[2][24:16]};
			end
			32'd12:begin
				x0 <= x + {{3{x2[2][24]}},x2[2][24:16]};
				y0 <= y + {{3{y2[2][24]}},y2[2][24:16]};
			end
			32'd13:begin
				x0 <= x + {{3{x1[3][24]}},x1[3][24:16]};
				y0 <= y + {{3{y1[3][24]}},y1[3][24:16]};
			end
			32'd14:begin
				x0 <= x + {{3{x1[3][24]}},x1[3][24:16]};
				y0 <= y + {{3{y2[3][24]}},y2[3][24:16]};
			end
			32'd15:begin
				x0 <= x + {{3{x2[3][24]}},x2[3][24:16]};
				y0 <= y + {{3{y1[3][24]}},y1[3][24:16]};
			end
			32'd16:begin
				x0 <= x + {{3{x2[3][24]}},x2[3][24:16]};
				y0 <= y + {{3{y2[3][24]}},y2[3][24:16]};
			end	
			32'd17:begin
				x0 <= x + {{3{x1[4][24]}},x1[4][24:16]};
				y0 <= y + {{3{y1[4][24]}},y1[4][24:16]};
			end
			32'd18:begin
				x0 <= x + {{3{x1[4][24]}},x1[4][24:16]};
				y0 <= y + {{3{y2[4][24]}},y2[4][24:16]};
			end
			32'd19:begin
				x0 <= x + {{3{x2[4][24]}},x2[4][24:16]};
				y0 <= y + {{3{y1[4][24]}},y1[4][24:16]};
			end
			32'd20:begin
				x0 <= x + {{3{x2[4][24]}},x2[4][24:16]};
				y0 <= y + {{3{y2[4][24]}},y2[4][24:16]};
			end
			32'd21:begin
				x0 <= x + {{3{x1[5][24]}},x1[5][24:16]};
				y0 <= y + {{3{y1[5][24]}},y1[5][24:16]};
			end
			32'd22:begin
				x0 <= x + {{3{x1[5][24]}},x1[5][24:16]};
				y0 <= y + {{3{y2[5][24]}},y2[5][24:16]};
			end
			32'd23:begin
				x0 <= x + {{3{x2[5][24]}},x2[5][24:16]};
				y0 <= y + {{3{y1[5][24]}},y1[5][24:16]};
			end
			32'd24:begin
				x0 <= x + {{3{x2[5][24]}},x2[5][24:16]};
				y0 <= y + {{3{y2[5][24]}},y2[5][24:16]};
			end
			32'd25:begin
				x0 <= x + {{3{x1[6][24]}},x1[6][24:16]};
				y0 <= y + {{3{y1[6][24]}},y1[6][24:16]};
			end
			32'd26:begin
				x0 <= x + {{3{x1[6][24]}},x1[6][24:16]};
				y0 <= y + {{3{y2[6][24]}},y2[6][24:16]};
			end
			32'd27:begin
				x0 <= x + {{3{x2[6][24]}},x2[6][24:16]};
				y0 <= y + {{3{y1[6][24]}},y1[6][24:16]};
			end
			32'd28:begin
				x0 <= x + {{3{x2[6][24]}},x2[6][24:16]};
				y0 <= y + {{3{y2[6][24]}},y2[6][24:16]};
			end
			32'd29:begin
				x0 <= x + {{3{x1[7][24]}},x1[7][24:16]};
				y0 <= y + {{3{y1[7][24]}},y1[7][24:16]};
			end
			32'd30:begin
				x0 <= x + {{3{x1[7][24]}},x1[7][24:16]};
				y0 <= y + {{3{y2[7][24]}},y2[7][24:16]};
			end
			32'd31:begin
				x0 <= x + {{3{x2[7][24]}},x2[7][24:16]};
				y0 <= y + {{3{y1[7][24]}},y1[7][24:16]};
			end
			32'd32:begin
				x0 <= x + {{3{x2[7][24]}},x2[7][24:16]};
				y0 <= y + {{3{y2[7][24]}},y2[7][24:16]};
			end					
			default:
				gray_addr <= 12'd0;
		endcase
		end
		if(counter1==0)
			gray_addr <= 12'd0;
		else	
			gray_addr <= x0 + (y0<<6);
	end
end
always@(posedge clk)begin
	if(cs == write_0)begin
		for(i=0;i<33;i=i+1)begin
			pre2[i] <= 25'd0;
		end
	end
	else if(cs == read)begin
		case(counter1%36)
			32'd0:begin
			end
			32'd1:begin
			end
			32'd2:begin
			end
			32'd3:
				pre2[0][23:16] <= gray_data;
			32'd4:	
				pre2[1][23:16] <= gray_data;
			32'd5:
				pre2[2][23:16] <= gray_data;
			32'd6:
				pre2[3][23:16] <= gray_data;
			32'd7:	
				pre2[4][23:16] <= gray_data;
			32'd8:
				pre2[5][23:16] <= gray_data;
			32'd9:
				pre2[6][23:16] <= gray_data;
			32'd10:	
				pre2[7][23:16] <= gray_data;
			32'd11:
				pre2[8][23:16] <= gray_data;
			32'd12:
				pre2[9][23:16] <= gray_data;
			32'd13:	
				pre2[10][23:16] <= gray_data;
			32'd14:
				pre2[11][23:16] <= gray_data;
			32'd15:
				pre2[12][23:16] <= gray_data;
			32'd16:	
				pre2[13][23:16] <= gray_data;
			32'd17:
				pre2[14][23:16] <= gray_data;
			32'd18:
				pre2[15][23:16] <= gray_data;
			32'd19:	
				pre2[16][23:16] <= gray_data;
			32'd20:
				pre2[17][23:16] <= gray_data;		
			32'd21:
				pre2[18][23:16] <= gray_data;
			32'd22:
				pre2[19][23:16] <= gray_data;
			32'd23:	
				pre2[20][23:16] <= gray_data;
			32'd24:
				pre2[21][23:16] <= gray_data;
			32'd25:
				pre2[22][23:16] <= gray_data;
			32'd26:	
				pre2[23][23:16] <= gray_data;
			32'd27:
				pre2[24][23:16] <= gray_data;
			32'd28:
				pre2[25][23:16] <= gray_data;
			32'd29:	
				pre2[26][23:16] <= gray_data;
			32'd30:
				pre2[27][23:16] <= gray_data;
			32'd31:
				pre2[28][23:16] <= gray_data;
			32'd32:	
				pre2[29][23:16] <= gray_data;
			32'd33:
				pre2[30][23:16] <= gray_data;		
			32'd34:
				pre2[31][23:16] <= gray_data;
			32'd35:	
				pre2[32][23:16] <= gray_data;
			default:
				pre2[0] <= gray_data;
		endcase
	end
end
//compute
always@(posedge clk)begin
	if(cs == compute)begin
		pre[0] <= pre2[1]*w1[0][40:16] + pre2[2]*w2[0][40:16] + pre2[3]*w3[0][40:16] + pre2[4]*w4[0][40:16];
		pre[1] <= pre2[5]*w1[1][40:16] + pre2[6]*w2[1][40:16] + pre2[7]*w3[1][40:16] + pre2[8]*w4[1][40:16];
		pre[2] <= pre2[9]*w1[2][40:16] + pre2[10]*w2[2][40:16] + pre2[11]*w3[2][40:16] + pre2[12]*w4[2][40:16];
		pre[3] <= pre2[13]*w1[3][40:16] + pre2[14]*w2[3][40:16] + pre2[15]*w3[3][40:16] + pre2[16]*w4[3][40:16];
		pre[4] <= pre2[17]*w1[4][40:16] + pre2[18]*w2[4][40:16] + pre2[19]*w3[4][40:16] + pre2[20]*w4[4][40:16];
		pre[5] <= pre2[21]*w1[5][40:16] + pre2[22]*w2[5][40:16] + pre2[23]*w3[5][40:16] + pre2[24]*w4[5][40:16];
		pre[6] <= pre2[25]*w1[6][40:16] + pre2[26]*w2[6][40:16] + pre2[27]*w3[6][40:16] + pre2[28]*w4[6][40:16];
		pre[7] <= pre2[29]*w1[7][40:16] + pre2[30]*w2[7][40:16] + pre2[31]*w3[7][40:16] + pre2[32]*w4[7][40:16];		
	end
end

always@(posedge clk)begin
	if(cs == read)
		counter1 <= counter1 +32'd1;
	else
		counter1 <= 32'd0;
		
end
//write

always@(posedge clk)begin
	if(cs == store)begin
		post[0] <= (pre[0][40:16]>pre2[0])?8'd1:8'd0;
		post[1] <= (pre[1][40:16]>pre2[0])?8'd2:8'd0;
		post[2] <= (pre[2][40:16]>pre2[0])?8'd4:8'd0;
		post[3] <= (pre[3][40:16]>pre2[0])?8'd8:8'd0;
		post[4] <= (pre[4][40:16]>pre2[0])?8'd16:8'd0;
		post[5] <= (pre[5][40:16]>pre2[0])?8'd32:8'd0;
		post[6] <= (pre[6][40:16]>pre2[0])?8'd64:8'd0;
		post[7] <= (pre[7][40:16]>pre2[0])?8'd128:8'd0;		
	end
end

always@	(posedge clk)begin
	if(cs == store2)
		lbp_data <= post[0] + post[1] + post[2] + post[3] + post[4] + post[5] + post[6] + post[7];
	else if(cs == idle)
		lbp_data <= 8'd0;
end

always@(posedge clk)begin
	if(cs == write)
		counter2 <= counter2 + 32'd1;
	else if(cs == write_0)
		counter2 <= 32'd0;
end

//theta cal
always@(posedge clk)begin
	if(cs == write_0)
		if(counter > 32'd20)
			theta_valid <= 1'd0;
		else
			theta_valid <= 1'd1;
	else 
		theta_valid <= 1'd0;	
end

always@(posedge clk)begin
	if(cs == write_0)begin
		if(counter < 32'd22)begin
			case(counter%22)
				32'd0:begin
					calculate <= R*cos_data;
					//rx[0] <= calculate[40:16];
				end
				32'd1:begin
					calculate <= R*cos_data;
					//rx[1] <= calculate[40:16];				
				end
				32'd2:begin
					calculate <= R*cos_data;
					//rx[2] <= calculate[40:16];				
				end		
				32'd3:begin
					calculate <= R*cos_data;
					//rx[3] <= calculate[40:16];
				end
				32'd4:begin
					calculate <= R*cos_data;
					rx[0] <= calculate[40:16];				
				end
				32'd5:begin
					calculate <= R*cos_data;
					rx[1] <= calculate[40:16];	
					if(rx[0][15:0]==16'd0)begin
						x1[0] <= rx[0];
						x2[0] <= rx[0];
					end
				end		
				32'd6:begin
					calculate <= R*cos_data;
					rx[2] <= calculate[40:16];
					if(rx[1][15:0]==16'd0)begin
						x1[1] <= rx[1];
						x2[1] <= rx[1];
					end
					else begin
						x1[1] <= {rx[1][24:16],16'd0};
						x2[1] <= {rx[1][24:16]+9'd1,16'd0};
					end
					tx[0] <= rx[0] - x1[0];
				end
				32'd7:begin
					calculate <= R*cos_data;
					rx[3] <= calculate[40:16];	
					if(rx[2][15:0]==16'd0)begin
						x1[2] <= rx[2];
						x2[2] <= rx[2];
					end
					else begin
						x1[2] <= {rx[2][24:16],16'd0};
						x2[2] <= {rx[2][24:16]+9'd1,16'd0};
					end		
					tx[1] <= rx[1] - x1[1];					
				end		
				32'd8:begin
					calculate <= R*cos_data;
					if(calculate[40:16] == 25'h1fd0003)
						rx[4] <= {calculate[40:32],16'd0};
					else
						rx[4] <= calculate[40:16];		
					if(rx[3][15:0]==16'd0)begin
						x1[3] <= rx[3];
						x2[3] <= rx[3];
					end
					else begin
						x1[3] <= {rx[3][24:16],16'd0};
						x2[3] <= {rx[3][24:16]+9'd1,16'd0};
					end		
					tx[2] <= rx[2] - x1[2];					
				end
				32'd9:begin
					calculate <= R*cos_data;
					rx[5] <= calculate[40:16];	
					if(rx[4][15:0]==16'd0)begin
						x1[4] <= rx[4];
						x2[4] <= rx[4];
					end
					else begin
						x1[4] <= {rx[4][24:16],16'd0};
						x2[4] <= {rx[4][24:16]+9'd1,16'd0};
					end				
					tx[3] <= rx[3] - x1[3];					
				end		
				32'd10:begin
					calculate <= R*cos_data;
					rx[6] <= calculate[40:16];
					if(rx[5][15:0]==16'd0)begin
						x1[5] <= rx[5];
						x2[5] <= rx[5];
					end
					else begin
						x1[5] <= {rx[5][24:16],16'd0};
						x2[5] <= {rx[5][24:16]+9'd1,16'd0};
					end				
					tx[4] <= rx[4] - x1[4];					
				end
				32'd11:begin
					calculate <= -R*sin_data;
					rx[7] <= calculate[40:16];
					if(rx[6][15:0]==16'd0)begin
						x1[6] <= rx[6];
						x2[6] <= rx[6];
					end
					else begin
						x1[6] <= {rx[6][24:16],16'd0};
						x2[6] <= {rx[6][24:16]+9'd1,16'd0};
					end	
					tx[5] <= rx[5] - x1[5];					
				end	
				32'd12:begin
					calculate <= -R*sin_data;
					ry[0] <= calculate[40:16];	
					if(rx[7][15:0]==16'd0)begin
						x1[7] <= rx[7];
						x2[7] <= rx[7];
					end
					else begin
						x1[7] <= {rx[7][24:16],16'd0};
						x2[7] <= {rx[7][24:16]+9'd1,16'd0};
					end			
					tx[6] <= rx[6] - x1[6];					
				end
				32'd13:begin
					calculate <= -R*sin_data;
					ry[1] <= calculate[40:16];	
					if(ry[0][15:0]==16'd0)begin
						y1[0] <= ry[0];
						y2[0] <= ry[0];
					end
					else begin
						y1[0] <= {ry[0][24:16],16'd0};
						y2[0] <= {ry[0][24:16]+9'd1,16'd0};
					end			
					tx[7] <= rx[7] - x1[7];					
				end
				32'd14:begin
					calculate <= -R*sin_data;
					if(calculate[40:16] == 25'h1fd0003)
						ry[2] <= {calculate[40:32],16'd0};
					else
						ry[2] <= calculate[40:16];
					if(ry[1][15:0]==16'd0)begin
						y1[1] <= ry[1];
						y2[1] <= ry[1];
					end
					else begin
						y1[1] <= {ry[1][24:16],16'd0};
						y2[1] <= {ry[1][24:16]+9'd1,16'd0};
					end			
					ty[0] <= ry[0] - y1[0];					
				end
				32'd15:begin
					calculate <= -R*sin_data;
					ry[3] <= calculate[40:16];
					if(ry[2][15:0]==16'd0)begin
						y1[2] <= ry[2];
						y2[2] <= ry[2];
					end
					else begin
						y1[2] <= {ry[2][24:16],16'd0};
						y2[2] <= {ry[2][24:16]+9'd1,16'd0};
					end		
					ty[1] <= ry[1] - y1[1];						
				end
				32'd16:begin
					calculate <= -R*sin_data;
					ry[4] <= calculate[40:16];			
					if(ry[3][15:0]==16'd0)begin
						y1[3] <= ry[3];
						y2[3] <= ry[3];
					end
					else begin
						y1[3] <= {ry[3][24:16],16'd0};
						y2[3] <= {ry[3][24:16]+9'd1,16'd0};
					end		
					ty[2] <= ry[2] - y1[2];						
				end
				32'd17:begin
					calculate <= -R*sin_data;
					ry[5] <= calculate[40:16];	
					if(ry[4][15:0]==16'd0)begin
						y1[4] <= ry[4];
						y2[4] <= ry[4];
					end
					else begin
						y1[4] <= {ry[4][24:16],16'd0};
						y2[4] <= {ry[4][24:16]+9'd1,16'd0};
					end	
					ty[3] <= ry[3] - y1[3];						
				end
				32'd18:begin
					calculate <= -R*sin_data;
					if(calculate[40:16] == 25'h002fffd)
						ry[6] <= {calculate[40:32]+9'd1,16'd0};
					else
						ry[6] <= calculate[40:16];
					if(ry[5][15:0]==16'd0)begin
						y1[5] <= ry[5];
						y2[5] <= ry[5];
					end
					else begin
						y1[5] <= {ry[5][24:16],16'd0};
						y2[5] <= {ry[5][24:16]+9'd1,16'd0};
					end			
					ty[4] <= ry[4] - y1[4];						
				end		
				32'd19:begin
					calculate <= -R*sin_data;
					ry[7] <= calculate[40:16];
					if(ry[6][15:0]==16'd0)begin
						y1[6] <= ry[6];
						y2[6] <= ry[6];
					end
					else begin
						y1[6] <= {ry[6][24:16],16'd0};
						y2[6] <= {ry[6][24:16]+9'd1,16'd0};
					end				
					ty[5] <= ry[5] - y1[5];						
				end	
				32'd20:begin
					if(ry[7][15:0]==16'd0)begin
						y1[7] <= ry[7];
						y2[7] <= ry[7];
					end
					else begin
						y1[7] <= {ry[7][24:16],16'd0};
						y2[7] <= {ry[7][24:16]+9'd1,16'd0};
					end		
					ty[6] <= ry[6] - y1[6];	
				end
				32'd21:
					ty[7] <= ry[7] - y1[7];	
			endcase
		end	
	end
end

always@(posedge clk)begin
	if(cs == write_0)begin
		if(counter>22&&counter<32)begin
			case(counter%8)
				32'd0:begin
					w1[0] <= ({9'd1,16'd0}-tx[0])*({9'd1,16'd0}-ty[0]);
					w2[0] <= tx[0]*({9'd1,16'd0}-ty[0]);
					w3[0] <= ({9'd1,16'd0}-tx[0])*ty[0];
					w4[0] <= tx[0]*ty[0];
				end
				32'd1:begin
					w1[1] <= ({9'd1,16'd0}-tx[1])*({9'd1,16'd0}-ty[1]);
					w2[1] <= tx[1]*({9'd1,16'd0}-ty[1]);
					w3[1] <= ({9'd1,16'd0}-tx[1])*ty[1];
					w4[1] <= tx[1]*ty[1];
				end
				32'd2:begin
					w1[2] <= ({9'd1,16'd0}-tx[2])*({9'd1,16'd0}-ty[2]);
					w2[2] <= tx[2]*({9'd1,16'd0}-ty[2]);
					w3[2] <= ({9'd1,16'd0}-tx[2])*ty[2];
					w4[2] <= tx[2]*ty[2];
				end
				32'd3:begin
					w1[3] <= ({9'd1,16'd0}-tx[3])*({9'd1,16'd0}-ty[3]);
					w2[3] <= tx[3]*({9'd1,16'd0}-ty[3]);
					w3[3] <= ({9'd1,16'd0}-tx[3])*ty[3];
					w4[3] <= tx[3]*ty[3];
				end
				32'd4:begin
					w1[4] <= ({9'd1,16'd0}-tx[4])*({9'd1,16'd0}-ty[4]);
					w2[4] <= tx[4]*({9'd1,16'd0}-ty[4]);
					w3[4] <= ({9'd1,16'd0}-tx[4])*ty[4];
					w4[4] <= tx[4]*ty[4];
				end
				32'd5:begin
					w1[5] <= ({9'd1,16'd0}-tx[5])*({9'd1,16'd0}-ty[5]);
					w2[5] <= tx[5]*({9'd1,16'd0}-ty[5]);
					w3[5] <= ({9'd1,16'd0}-tx[5])*ty[5];
					w4[5] <= tx[5]*ty[5];
				end
				32'd6:begin
					w1[6] <= ({9'd1,16'd0}-tx[6])*({9'd1,16'd0}-ty[6]);
					w2[6] <= tx[6]*({9'd1,16'd0}-ty[6]);
					w3[6] <= ({9'd1,16'd0}-tx[6])*ty[6];
					w4[6] <= tx[6]*ty[6];
				end
				32'd7:begin
					w1[7] <= ({9'd1,16'd0}-tx[7])*({9'd1,16'd0}-ty[7]);
					w2[7] <= tx[7]*({9'd1,16'd0}-ty[7]);
					w3[7] <= ({9'd1,16'd0}-tx[7])*ty[7];
					w4[7] <= tx[7]*ty[7];
				end				
			endcase
		end
	end
end

always@(posedge clk)begin
	if(cs == write_0)begin
		if(counter < 32'd20)begin
			case(counter%8)
				32'd0:begin
					theta_calculate <= (k[0]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd1:begin
					theta_calculate <= (k[1]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd2:begin
					theta_calculate <= (k[2]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd3:begin
					theta_calculate <= (k[3]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd4:begin
					theta_calculate <= (k[4]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd5:begin
					theta_calculate <= (k[5]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd6:begin
					theta_calculate <= (k[6]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end
				32'd7:begin
					theta_calculate <= (k[7]*pi_2)>>3;
					theta <= theta_calculate[40:16];
				end			
			endcase	
		end	
	end	
end


always@(posedge clk)begin
	if(cs == idle)
		lbp_addr <= 12'd0;
	else if(cs == write_0)
		lbp_addr <= lbp_addr + 12'd1;
	else 
		lbp_addr <= x + (y<<6);
end

always@(posedge clk)begin
	if(cs == write_0)
		counter <= counter + 32'd1;
	else	
		counter <= 32'd0;
end				
endmodule
