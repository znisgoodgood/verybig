module moore (clk, rst, din, qout);
	input clk, rst, din;
	output qout;
	reg qout;
	reg [1:0] cs, ns; //next state current state

	parameter s0 = 2'b00,
              s1 = 2'b01,
              s2 = 2'b10,
              s3 = 2'b11;

	always @(posedge clk or posedge rst) begin
		if (rst)
			cs <= s0;
		else
			cs <= ns;
	end

	always @(cs or din) begin//ns case
		case (cs)
		//
		//please write your code here according to the assignment
		s0:begin
			if(din == 1'b1)
				ns = s2;
			else
				ns = s1;
		end
		s1:begin
			if(din == 1'b1)
				ns = s1;
			else
				ns = s0;
		end	
		s2:begin
			if(din == 1'b1)
				ns = s3;
			else
				ns = s2;
		end
		s3:begin
			if(din == 1'b1)
				ns = s3;
			else
				ns = s1;
		end	
		default:
			ns = s0;
		//
		endcase
	end

	always @(cs) begin//qout case, only depend on current state
		case (cs)
		//
		//please write your code here according to the assignment
		s0: 
			qout = 1'b0;
		s1: 
			qout = 1'b0;
		s2:
			qout = 1'b1;
		s3:	
			qout = 1'b1;
		default:
			qout = 1'b0;
		//
		endcase
	end

endmodule

