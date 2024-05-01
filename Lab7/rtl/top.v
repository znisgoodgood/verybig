`include "../rtl/CLBP.v"
`include "../rtl/HCU.v"
`include "../rtl/DCU.v"
`include "../rtl/Comparator.v"
`include "../rtl/Controller.v"

module top(
    input           clk,
    input           rst,
    input           enable,
    input           mode,
    input           valid, 
    input   [4:0]   id,
    input   [3:0]   gridX,
    input   [3:0]   gridY,

    // CLBP I/O & LBP RAM
	output 	[11:0]	gray_addr,
	output			gray_ren,
	input	[7:0]	gray_rdata,
    output  [11:0]  lbp_addr,
    output          lbp_wen,
	output			lbp_ren,
    input   [7:0]   lbp_rdata,
	output	[7:0] 	lbp_wdata,
	output	[24:0]	theta,
	output			theta_valid,
	input	[24:0]	cos_data,
	input			cos_valid,
	input	[24:0]	sin_data,
	input			sin_valid,
	output			lbp_finish,
	
    // ID RAM I/O
    output  [7:0]   id_addr,
    output  [4:0]   id_wdata,
    output          id_wen,
    output          id_ren,
    input   [4:0]   id_rdata,

    // HIST TRAIN RAM I/O
    output  [20:0]  hist_addr_train,
    output  [7:0]   hist_wdata_train,
    output          hist_wen_train,
    output          hist_ren_train,
    input   [7:0]   hist_rdata_train,

    // HIST PREDICT RAM I/O
    output  [13:0]  hist_addr_predict,
    output  [7:0]   hist_wdata_predict,
    output          hist_wen_predict,
    output          hist_ren_predict,
    input   [7:0]   hist_rdata_predict,  

    output          hcu_finish,
    output          done,
    output  [4:0]   label,
    output  [17:0]  minDistance
);
	wire [20:0]hist_addr_offset,hist_addr_train_hcu,hist_addr_train_dcu;
	wire [13:0]hist_addr_predict_hcu,hist_addr_predict_dcu;
	wire [11:0]lbp_addr_clbp,lbp_addr_hcu;
	wire lbp_enable,hcu_enable,ram_clbp,ram_comp,comparator_enable,comparator_finish,dcu_enable,hist_ren_train_hcu,hist_ren_train_dcu,hist_ren_predict_hcu,hist_ren_predict_dcu;
	wire [3:0]gridX_i,gridX_o,gridY_i,gridY_o;
	wire [7:0]id_addr_con,id_counter;
	wire [17:0]distance;
    // put your design here
	assign lbp_addr = ram_clbp?lbp_addr_clbp:lbp_addr_hcu;
	assign hist_addr_train[20:0] = ram_comp?hist_addr_train_hcu[20:0]:hist_addr_train_dcu[20:0];
	assign hist_ren_train = ram_comp?hist_ren_train_hcu:hist_ren_train_dcu;
	assign hist_addr_predict[13:0] = ram_comp?hist_addr_predict_hcu[13:0]:hist_addr_predict_dcu[13:0];
	assign hist_ren_predict = ram_comp?hist_ren_predict_hcu:hist_ren_predict_dcu;	
	assign id_addr = ram_comp?id_addr_con:id_counter;
	
	HCU h1(	clk,
			rst,
			mode,
			hcu_enable,
			gridX,
			gridY,
			lbp_ren,
			lbp_addr_hcu[11:0],
			lbp_rdata[7:0],
			hist_wen_train,
			hist_wdata_train[7:0],
			hist_addr_train_hcu[20:0],
			hist_ren_train_hcu,
			hist_rdata_train[7:0],
			hist_wen_predict,
			hist_wdata_predict[7:0],
			hist_addr_predict_hcu[13:0],
			hist_ren_predict_hcu,
			hist_rdata_predict[7:0],
			hcu_finish);	
	
	DCU d1( clk,
		    rst,
			dcu_enable,
			hist_addr_offset[20:0],
			hist_addr_train_dcu[20:0],
			hist_ren_train_dcu,
			hist_rdata_train[7:0],
			hist_addr_predict_dcu[13:0],
			hist_ren_predict_dcu,
			hist_rdata_predict[7:0],
			distance[17:0],
			dcu_valid);	
			
	Comparator co1( clk,
				   rst,
				   comparator_enable,
				   id_addr_con[7:0],
				   dcu_valid,
				   distance[17:0],
				   id_rdata[4:0],
				   id_ren,
				   id_counter[7:0],
				   dcu_enable,
				   label[4:0],
				   minDistance[17:0],
				   hist_addr_offset[20:0],
				   done);	
				   
	CLBP a1(clk,
            rst,
            lbp_enable,
			gray_addr[11:0],
			gray_ren,
			gray_rdata[7:0],
			lbp_addr_clbp[11:0],
			lbp_wen,
			lbp_wdata,
			theta,
			theta_valid,
			cos_data[24:0],
			cos_valid,
			sin_data[24:0],
			sin_valid,
			lbp_finish);
	
	Controller c1(clk,
				  rst,
				  mode,
				  enable,
				  valid,
				  id[4:0],
				  id_addr_con[7:0],
				  id_wdata[4:0],
				  id_wen,
				  lbp_enable,
				  lbp_finish,
				  ram_clbp,
				  gridX_i[3:0],
				  gridY_i[3:0],
				  hcu_enable,
				  gridX_o[3:0],
				  gridY_o[3:0],
				  hcu_finish,
				  done,
				  comparator_enable,
				  ram_comp);
				  
endmodule