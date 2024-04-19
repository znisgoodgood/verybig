`include "CLA8.v"

module CLA32(
    input  [31:0] a,
    input  [31:0] b,
    output [31:0] sum,
    output overflow);
wire [2:0]carry_wire;
// put your design here
CLA8 id0(a[7:0],b[7:0],1'b0,sum[7:0],carry_wire[0]);
CLA8 id1(a[15:8],b[15:8],carry_wire[0],sum[15:8],carry_wire[1]);
CLA8 id2(a[23:16],b[23:16],carry_wire[1],sum[23:16],carry_wire[2]);
CLA8 id3(a[31:24],b[31:24],carry_wire[2],sum[31:24]);

wire a_msb,b_msb,result_msb;
not(a_msb,a[31]);
not(b_msb,b[31]);
not(result_msb,sum[31]);
wire in0,in1;
and(in0,a_msb,b_msb,sum[31]);
and(in1,a[31],b[31],result_msb);
or(overflow,in0,in1);
endmodule
