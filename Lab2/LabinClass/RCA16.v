`include "RCA4.v"

module RCA16(
    input  [15:0] a,
    input  [15:0] b,
    output [15:0] sum,
    output overflow
);
wire [3:0]carry_wire;
wire in0,in1,a_msb,b_msb,result_msb;
// put your design here
RCA4 id0(.a(a[3:0]), .b(b[3:0]), .cin(1'b0),.sum(sum[3:0]),.cout(carry_wire[0]));
RCA4 id1(.a(a[7:4]), .b(b[7:4]), .cin(carry_wire[0]),.sum(sum[7:4]),.cout(carry_wire[1]));
RCA4 id2(.a(a[11:8]), .b(b[11:8]), .cin(carry_wire[1]),.sum(sum[11:8]),.cout(carry_wire[2]));
RCA4 id3(.a(a[15:12]), .b(b[15:12]), .cin(carry_wire[2]),.sum(sum[15:12]),.cout(carry_wire[3]));
not(a_msb,a[15]);
not(b_msb,b[15]);
not(result_msb,sum[15]);
and(in0,a_msb,b_msb,sum[15]);
and(in1,a[15],b[15],result_msb);
or(overflow,in0,in1);
endmodule