module Comparator(
    input                   clk,
    input                   rst,
    input                   enable,
    input   [7:0]           histcount,
    input                   dcu_valid,
    input   [17:0]          distance,
    input   [4:0]           id,

    output  reg             id_ren,
    output  reg [7:0]       id_counter,
    output  reg             dcu_enable,
    output  reg [4:0]       label,
    output  reg [17:0]      minDistance,
    output  reg [20:0]      hist_addr_offset,
    output  reg             done
);
reg [2:0]cs,ns;
parameter idle = 3'd0,dcu = 3'd1,fight = 3'd2,store = 3'd3,store2 = 3'd4,out = 3'd5;
reg [7:0]counter,counter1;	
reg [17:0]distance_temp;
reg [4:0] id_temp;
	// put your design here
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
					ns = dcu;
				else	
					ns = idle;
			dcu:
				if(dcu_valid)
					ns = fight;
				else	
					ns = dcu;
			fight:
				if(counter == 0)
					ns = store;
				else
					ns = dcu;
			store:
				ns = store2;
			store2:
				ns = out;
			out:
				ns = idle;
			default:
				ns = idle;
		endcase
	end
	
	always@(*)begin
		case(cs)
			idle:begin
				id_ren = 1'd0;						
				done = 1'd0;
				dcu_enable = 1'd0;
			end
			dcu:begin
				done = 1'd0;
				dcu_enable = 1'd1;
				id_ren = 1'd1;				
			end
			fight:begin
				done = 1'd0;
				dcu_enable = 1'd0;
				id_ren = 1'd1;
			end
			store:begin
				id_ren = 1'd0;				
				dcu_enable = 1'd0;
				done = 1'd0;
			end
			store2:begin
				id_ren = 1'd0;				
				dcu_enable = 1'd0;
				done = 1'd0;
			end
			out:begin
				id_ren = 1'd0;						
				dcu_enable = 1'd0;
				done = 1'd1;
			end
			default:begin
				id_ren = 1'd0;						
				dcu_enable = 1'd0;
				done = 1'd1;			
			end
		endcase
	end
	
	always@(posedge clk)begin
		if(cs == fight)begin
			if(counter == (histcount))begin
				distance_temp <= distance;
				id_temp <= id;
			end
			else if(distance<distance_temp)begin
				distance_temp <= distance;
				id_temp <= id;				
			end
		end	
	end
	always@(posedge clk)begin
		if(cs == store)begin
			minDistance <= distance_temp;
			label <= id_temp;
		end
	end
	//hist_addr_offset
	always@(posedge clk)begin
		if(cs == dcu||cs == idle)begin
			hist_addr_offset <= ({13'd0,id_counter}<<14);
		end
	end
	always@(posedge clk)begin
		if(cs == idle)
			id_counter <= 8'd0;
		else if(cs == fight&&counter<histcount)
			id_counter <= id_counter + 8'd1;
	end
	
	always@(posedge clk)begin
		if(cs == idle)
			counter <= histcount +8'd1;
		if(cs == dcu)
			if(dcu_valid)
				counter <= counter - 8'd1;
	end
	endmodule