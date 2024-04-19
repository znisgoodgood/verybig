`timescale 1ns/10ps
`define RGB_DataSize 24
`define D_DataSize   10
// ---------------------- define ---------------------- //

module Manhattan(clk,
                                 rst,
                                 clear,
                                 c_en,
                                 if_en,
                                 c_in0,
                                 c_in1,
                                 c_in2,
                                 c_in3,
                                 c_in4,
                                 c_in5,
                                 c_in6,
                                 c_in7,
                                 if_in,
                                 d_0,
                                 d_1,
                                 d_2,
                                 d_3,
                                 d_4,
                                 d_5,
                                 d_6,
                                 d_7);

  // ---------------------- input  ---------------------- //
  input  clk;
  input  rst;
  input  clear;
  input  c_en;
  input  if_en;
  input  [`RGB_DataSize-1:0] c_in0, c_in1, c_in2, c_in3, c_in4, c_in5, c_in6, c_in7;
  input  [`RGB_DataSize-1:0] if_in;
  integer i;
  // ---------------------- output ---------------------- //
  output [`D_DataSize-1:0]   d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7;

  // ---------------------- Write down Your design below  ---------------------- //
  reg [`D_DataSize-1:0]   d_0, d_1, d_2, d_3, d_4, d_5, d_6, d_7;
  reg [`RGB_DataSize-1:0] temp[7:0];
  reg [`RGB_DataSize-1:0]ifin;
  reg [`RGB_DataSize-1:0]c_in[7:0];

  always@(posedge clk)begin
          if(rst)begin
                        d_0 <= 10'd0;
                        d_1 <= 10'd0;
                        d_2 <= 10'd0;
                        d_3 <= 10'd0;
                        d_4 <= 10'd0;
                        d_5 <= 10'd0;
                        d_6 <= 10'd0;
                        d_7 <= 10'd0;
                        for(i=0;i<8;i=i+1)begin
                                //temp[i] <= 24'd0;
                                //c_in[i] <= 24'd0;
                                //ifin <= 24'd0;
                        end
          end
          else begin
        if(clear)begin
                  d_0 <= 10'd0;
                  d_1 <= 10'd0;
                  d_2 <= 10'd0;
                  d_3 <= 10'd0;
                  d_4 <= 10'd0;
                  d_5 <= 10'd0;
                  d_6 <= 10'd0;
                  d_7 <= 10'd0;
                  for(i=0;i<8;i=i+1)begin
                          //temp[i] <= 24'd0;
                          //c_in[i] <= 24'd0;
                          //ifin <= 24'd0;
                  end
          end 
          else begin
                d_0 <= temp[0][7:0]+temp[0][15:8]+temp[0][23:16];
                d_1 <= temp[1][7:0]+temp[1][15:8]+temp[1][23:16];
                d_2 <= temp[2][7:0]+temp[2][15:8]+temp[2][23:16];
                d_3 <= temp[3][7:0]+temp[3][15:8]+temp[3][23:16];
                d_4 <= temp[4][7:0]+temp[4][15:8]+temp[4][23:16];
                d_5 <= temp[5][7:0]+temp[5][15:8]+temp[5][23:16];
                d_6 <= temp[6][7:0]+temp[6][15:8]+temp[6][23:16];
                d_7 <= temp[7][7:0]+temp[7][15:8]+temp[7][23:16];
          end   
  end  
  end
  
  always@(*)begin
   if(if_en)
                          ifin <= if_in;
                  else
                          ifin <= ifin;        
                  if(c_en)begin
                          c_in[0] <= c_in0;
                          c_in[1] <= c_in1;
                          c_in[2] <= c_in2;
                          c_in[3] <= c_in3;
                          c_in[4] <= c_in4;
                          c_in[5] <= c_in5;
                          c_in[6] <= c_in6;
                          c_in[7] <= c_in7;
                  end
                  else begin
                          c_in[0] <= c_in[0];
                          c_in[1] <= c_in[1];
                          c_in[2] <= c_in[2];
                          c_in[3] <= c_in[3];
                          c_in[4] <= c_in[4];
                          c_in[5] <= c_in[5];
                          c_in[6] <= c_in[6];
                          c_in[7] <= c_in[7];
                  end
         

  for(i=0;i<8;i=i+1)begin
          temp[i][7:0] <= (ifin[7:3]>c_in[i][7:3])?ifin[7:0]-c_in[i][7:0]:c_in[i][7:0]-ifin[7:0];
          temp[i][15:8] <= (ifin[15:11]>c_in[i][15:11])?ifin[15:8]-c_in[i][15:8]:c_in[i][15:8]-ifin[15:8];
          temp[i][23:16] <= (ifin[23:19]>c_in[i][23:19])?ifin[23:16]-c_in[i][23:16]:c_in[i][23:16]-ifin[23:16];
  end   
        
  end   
endmodule
