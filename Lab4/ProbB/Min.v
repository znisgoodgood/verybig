`define D_DataSize 10

module Min(d_0,
			d_1,
			d_2,
			d_3,
			d_4,
			d_5,
			d_6,
			d_7,
			out_index,
			out_distance);

  // ---------------------- input  ---------------------- //
  input  [`D_DataSize-1:0] d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7;

  // ---------------------- output ---------------------- //
  output [`D_DataSize-1:0] out_distance;
  output [2:0] out_index;

  // ---------------------- Write down Your design below  ---------------------- //
	reg [2:0] out_index;
	reg [`D_DataSize-1:0] out_distance;
	reg [`D_DataSize-1:0] temp[5:0];
	always@(*)begin
		temp[0] = d_0<d_1?d_0:d_1;
		temp[1] = d_2<d_3?d_2:d_3;
		temp[2] = d_4<d_5?d_4:d_5;
		temp[3] = d_6<d_7?d_6:d_7;
		temp[4] = temp[0]<temp[1]?temp[0]:temp[1];
		temp[5] = temp[2]<temp[3]?temp[2]:temp[3];
		out_distance = temp[4]<temp[5]?temp[4]:temp[5];
		if(out_distance==d_0)
			out_index = 3'd0;
		else if(out_distance==d_1)
			out_index = 3'd1;
		else if(out_distance==d_2)
			out_index = 3'd2;
		else if(out_distance==d_3)
			out_index = 3'd3;
		else if(out_distance==d_4)
			out_index = 3'd4;
		else if(out_distance==d_5)
			out_index = 3'd5;
		else if(out_distance==d_6)
			out_index = 3'd6;
		else if(out_distance==d_7)
			out_index = 3'd7;
	end



  endmodule
