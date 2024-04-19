module fixedpoint(
	input [7:0] in1, // integer[7:5], decimal[4:0]
	input [7:0] in2, // integer[7:5], decimal[4:0]
	output reg [7:0] out // integer[7:2], decimal[1:0]
);
reg [15:0]temp;
reg [15:0]inv_temp;
always@(*)begin
   temp = in1*in2; 
   out[7:2] = temp[15:10];
   if(temp[7]==1'b1)begin
	   temp[8] = temp[8] + 1'b1;
	   out[1:0] = temp[9:8];
   end
   else
	   out[1:0] = temp[9:8];        
   end
endmodule
