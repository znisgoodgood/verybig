`define DATA_SIZE  32
`define OP_SIZE  5

`define ADD    5'b00000
`define SUB    5'b00001
`define OR     5'b00010
`define AND    5'b00011
`define XOR    5'b00100
`define NOT    5'b00101
`define NAND   5'b00110
`define NOR    5'b00111

`define SLT    5'b01000
`define SLTU   5'b01001
`define SRA    5'b01010
`define SLA    5'b01011
`define SRL    5'b01100
`define SLL    5'b01101
`define ROTR   5'b01110
`define ROTL   5'b01111
`define MUL    5'b10000
`define MULH   5'b10001
`define MULHSU 5'b10010
`define MULHU  5'b10011

module ALU (
		input      [`OP_SIZE-1:0]   alu_op,
		input      [`DATA_SIZE-1:0] src1,
		input      [`DATA_SIZE-1:0] src2,
		output reg [`DATA_SIZE-1:0] alu_out,
		output reg                  alu_overflow
);
reg [63:0] temp;
reg [31:0] temp1;
always@(*)begin
		case(alu_op)
				`ADD:begin
						alu_out = src1 + src2;
						//alu_overflow = (src1[`DATA_SIZE-1]&src2[`DATA_SIZE-1]&(~alu_out[`DATA_SIZE-1]))|((~(src1[`DATA_SIZE-1]|src2[`DATA_SIZE-1]))&alu_out[`DATA_SIZE-1]);
						if((src1[`DATA_SIZE-1]==1'b0)&(src2[`DATA_SIZE-1]==1'b0)&(alu_out[`DATA_SIZE-1]==1'b1))
								alu_overflow = 1'b1;
						else if((src1[`DATA_SIZE-1]==1'b1)&(src2[`DATA_SIZE-1]==1'b1)&(alu_out[`DATA_SIZE-1]==1'b0))
								alu_overflow = 1'b1;
						else
								alu_overflow = 1'b0;        
				end     
				`SUB:begin
								alu_out = $signed(src1 - src2);
								if((src1[`DATA_SIZE-1]==1'b0)&(src2[`DATA_SIZE-1]==1'b1)&(alu_out[`DATA_SIZE-1]==1'b1))
										alu_overflow = 1'b1;
								else if((src1[`DATA_SIZE-1]==1'b1)&(src2[`DATA_SIZE-1]==1'b0)&(alu_out[`DATA_SIZE-1]==1'b0))
										alu_overflow = 1'b1;
								else
										alu_overflow = 1'b0;
								end
				`OR:begin
								alu_out = src1|src2;
								alu_overflow = 1'b0;
								end
				`AND:begin
								alu_out = src1&src2;
								alu_overflow = 1'b0;
								end
				`XOR:begin
								alu_out = src1^src2;
								alu_overflow = 1'b0;
								end
				`NOT:begin
								alu_out = ~src1;
								alu_overflow = 1'b0;
								end
				`NAND:begin
								alu_out = ~(src1&src2);
								alu_overflow = 1'b0;
								end
				`NOR:begin
								alu_out = ~(src1|src2);
								alu_overflow = 1'b0;
								end
				`SLT:begin      
						alu_out = ($signed(src1)<$signed(src2))?32'd1:32'd0;
						alu_overflow = 1'b0;            
						end
				`SLTU:begin
						alu_out = (src1<src2)?32'd1:32'd0;
						alu_overflow = 1'b0;
						end
				`SRA:begin
						alu_out = $signed(src1) >>> src2;
						alu_overflow = 1'd0;
						end
				`SLA:begin
						alu_out = $signed(src1) <<< src2;
						alu_overflow = 1'd0;
						end
				`SRL:begin
						alu_out = src1 >> src2;
						alu_overflow = 1'd0;
						end
				`SLL:begin
						alu_out = src1 << src2;
						alu_overflow = 1'd0;
						end
				`ROTR:begin
					alu_out = (src1<<(32-src2))|(src1>>(src2));
					alu_overflow = 1'd0;               	                   
						end             
				`ROTL:begin
					alu_out = (src1<<(src2))|(src1>>(32-src2));
					alu_overflow = 1'd0; 
						end
				`MUL:begin
						temp = $signed(src1) * $signed(src2);
						alu_out = temp[31:0];
				end
				`MULH:begin
					 temp = $signed(src1) * $signed(src2);
					 alu_out = temp[63:32];   
				end
				`MULHSU:begin
						temp = $signed(src1)*$signed({1'b0,src2});
						alu_out = temp[63:32]; 
						alu_overflow = 1'd0; 
						end
				`MULHU:begin
						temp = (src1) * (src2);
						alu_out = temp[63:32];
						alu_overflow =1'd0;  
						end
				default:begin
					   alu_out = 32'd0;
					   alu_overflow = 1'd0;
				end
		endcase
end
endmodule