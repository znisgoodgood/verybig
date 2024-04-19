// ================================================ // 
//  Course:      IVCAD 2024 Spring                  //                       
//  Auther:      Zong-Jin CAI (Leo)                 //                         
//  Filename:    Multiplier_CLA.v                   //                               
//  Description: 8*8-bit Multiplier using CLA       //                 
//  Version:     1.0                                // 
//  Date:        2024/02/22                         //     
// ================================================ //    

`include "CLA8.v"

module Multiplier_CLA(
    input   [7:0]   A,
    input   [7:0]   B,
    output  [15:0]  Product
);
   // put your design here

//stage1
wire [7:0]stage1;
and_ab id0(A[7:0],B[0],stage1[7:0]);
or(Product[0],stage1[0],1'b0);

//stage2
wire [7:0]sum2;
wire [7:0]stage2;
wire [7:0]temp2;
wire cout2;

and_ab id1(A[7:0],B[1],stage2[7:0]);
assign temp2 = {1'b0,stage1[7:1]};
CLA8 id2(stage2[7:0],temp2[7:0],1'b0,sum2[7:0],cout2);
or(Product[1],sum2[0],1'b0);

//Stage3
wire [7:0]sum3;
wire [7:0]stage3;
wire [7:0]temp3;
wire cout3;

and_ab id3(A[7:0],B[2],stage3[7:0]);
assign temp3 = {cout2,sum2[7:1]};
CLA8 id4(stage3[7:0],temp3[7:0],1'b0,sum3[7:0],cout3);
or(Product[2],sum3[0],1'b0);

//Stage4
wire [7:0]sum4;
wire [7:0]stage4;
wire [7:0]temp4;
wire cout4;

and_ab id5(A[7:0],B[3],stage4[7:0]);
assign temp4 = {cout3,sum3[7:1]};
CLA8 id6(stage4[7:0],temp4[7:0],1'b0,sum4[7:0],cout4);
or(Product[3],sum4[0],1'b0);

//Stage5
wire [7:0]sum5;
wire [7:0]stage5;
wire [7:0]temp5;
wire cout5;

and_ab id7(A[7:0],B[4],stage5[7:0]);
assign temp5 = {cout4,sum4[7:1]};
CLA8 id8(stage5[7:0],temp5[7:0],1'b0,sum5[7:0],cout5);
or(Product[4],sum5[0],1'b0);

//Stage6
wire [7:0]sum6;
wire [7:0]stage6;
wire [7:0]temp6;
wire cout6;

and_ab id9(A[7:0],B[5],stage6[7:0]);
assign temp6 = {cout5,sum5[7:1]};
CLA8 id10(stage6[7:0],temp6[7:0],1'b0,sum6[7:0],cout6);
or(Product[5],sum6[0],1'b0);

//Stage7
wire [7:0]sum7;
wire [7:0]stage7;
wire [7:0]temp7;
wire cout7;

and_ab id11(A[7:0],B[6],stage7[7:0]);
assign temp7 = {cout6,sum6[7:1]};
CLA8 id12(stage7[7:0],temp7[7:0],1'b0,sum7[7:0],cout7);
or(Product[6],sum7[0],1'b0);

//Stage7
wire [7:0]sum8;
wire [7:0]stage8;
wire [7:0]temp8;
wire cout8;

and_ab id13(A[7:0],B[7],stage8[7:0]);
assign temp8 = {cout7,sum7[7:1]};
CLA8 id14(stage8[7:0],temp8[7:0],1'b0,sum8[7:0],cout8);
assign Product[15:7] = {cout8,sum8[7:0]};


endmodule

module and_ab(a,b,ab_out);

input [7:0] a;
input b;
output [7:0] ab_out;
and(ab_out[0],a[0],b);
and(ab_out[1],a[1],b);
and(ab_out[2],a[2],b);
and(ab_out[3],a[3],b);
and(ab_out[4],a[4],b);
and(ab_out[5],a[5],b);
and(ab_out[6],a[6],b);
and(ab_out[7],a[7],b);

endmodule