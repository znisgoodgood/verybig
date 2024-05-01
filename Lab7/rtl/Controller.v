module Controller(
    input               clk,
    input               rst,
    input               mode,
    input               enable,
    input               valid,
    input   [4:0]       id,

    // ID RAM 
    output  reg [7:0]   id_addr,
    output  reg [4:0]   id_wdata,
    output  reg         id_wen,

    // CLBP I/O
	output	reg			lbp_enable,
	input   			lbp_finish,
	output  reg			ram_clbp,
	
    // HCU I/O
    input   [3:0]       gridX_i,     
    input   [3:0]       gridY_i,        
    output  reg         hcu_enable,
    output  reg [3:0]   gridX_o,
    output  reg [3:0]   gridY_o,  
    input               hcu_finish,      
    // Comparator I/O
    input               comparator_finish,
    output  reg         comparator_enable,
    output  reg         ram_comp
);
parameter idle = 3'd0,train_lbp = 3'd1,train_hcu = 3'd2,pred_lbp = 3'd3,pred_hcu = 3'd4,comparator = 3'd5;
reg [2:0]cs,ns;
   // put your design here
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
				ns = train_lbp;
			else
				ns = idle;
		end
		train_lbp:begin
			if(lbp_finish)
				ns = train_hcu;
			else
				ns = train_lbp;
		end
		train_hcu:begin
			if(hcu_finish)
				if(mode == 1'd1)
					ns = pred_lbp;
				else	
					ns = train_lbp;
			else	
				ns = train_hcu;
		end		
		pred_lbp:begin
			if(lbp_finish)
				ns = pred_hcu;
			else
				ns = pred_lbp;
		end
		pred_hcu:begin
			if(hcu_finish)
				ns = comparator;
			else	
				ns = pred_hcu;
		end	
		comparator:begin
			if(comparator_finish)
				ns = pred_lbp;
			else
				ns = comparator;
		end
		default:
			ns = idle;
	endcase	
end

always@(*)begin
	case(cs)
		idle:begin
			id_wen = 1'd0;		
			comparator_enable = 1'd0;
			ram_clbp = 1'd0;
			ram_comp = 1'd1;
			lbp_enable = 1'd0;	
			hcu_enable = 1'd0;			
		end
		train_lbp:begin
			comparator_enable = 1'd0;		
			id_wen = 1'd1;
			ram_clbp = 1'd1;
			lbp_enable = 1'd1;
			hcu_enable = 1'd0;
			ram_comp = 1'd1;
		end
		train_hcu:begin
			comparator_enable = 1'd0;		
			id_wen = 1'd0;
			lbp_enable = 1'd0;
			hcu_enable = 1'd1;
			ram_clbp = 1'd0;
			ram_comp = 1'd1;
		end
		pred_lbp:begin
			comparator_enable = 1'd0;
			id_wen = 1'd0;
			ram_clbp = 1'd1;
			lbp_enable = 1'd1;
			hcu_enable = 1'd0;
			ram_comp = 1'd0;
		end
		pred_hcu:begin
			comparator_enable = 1'd0;		
			id_wen = 1'd0;
			lbp_enable = 1'd0;
			hcu_enable = 1'd1;
			ram_clbp = 1'd0;
			ram_comp = 1'd1;
		end
		comparator:begin
			id_wen = 1'd0;		
			lbp_enable = 1'd0;
			hcu_enable = 1'd0;
			ram_clbp = 1'd0;
			ram_comp = 1'd0;
			comparator_enable = 1'd1;
		end
		default: begin
			id_wen = 1'd0;		
			lbp_enable = 1'd0;
			hcu_enable = 1'd0;
			ram_clbp = 1'd0;
			ram_comp = 1'd0;
			comparator_enable = 1'd1;		
		end		
	endcase	
end

always@(posedge clk)begin
	if(cs == idle)begin
		id_addr <= 8'd0;
		id_wdata <= 5'd1;
	end	
	else if(cs == train_lbp)begin
		if(id>0&&mode == 1'd0)begin
			id_wdata <= id;   
			id_addr <= id_addr + 8'd1;
		end
	end	
end
endmodule