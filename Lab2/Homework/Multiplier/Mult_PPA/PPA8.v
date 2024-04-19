// ================================================ // 
//  Course:      IVCAD 2024 Spring                  //                       
//  Auther:      Zong-Jin CAI (Leo)                 //                         
//  Filename:    PPA.v                              //                               
//  Description: Parallel Prefix Adder              //                 
//  Version:     1.0                                // 
//  Date:        2024/02/22                         //     
//  Reference:   Yong-Sheng Liu (David)             //
// ================================================ //   
`include "black_cell.v"
`include "blue_cell.v"
`include "FA.v"

module PPA8(A, B, Cin, Sum, Cout);
input  [7:0] A, B;
input        Cin;
output [7:0] Sum;
output Cout;

wire [7:0]p;
wire [7:0]g;
wire [8:0]c;
//p g generation
pg_generation p0(A[0],B[0],p[0],g[0]);
pg_generation p1(A[1],B[1],p[1],g[1]);
pg_generation p2(A[2],B[2],p[2],g[2]);
pg_generation p3(A[3],B[3],p[3],g[3]);
pg_generation p4(A[4],B[4],p[4],g[4]);
pg_generation p5(A[5],B[5],p[5],g[5]);
pg_generation p6(A[6],B[6],p[6],g[6]);
pg_generation p7(A[7],B[7],p[7],g[7]);
// put your design here
//c1
or(c[1],g[0],0);
//c2
blue_cell id0(p[1],g[0],g[1],c[2]);//p2g1g2G
//c3
wire c3g,c3p;
black_cell id1(p[1],p[2],g[1],g[2],c3g,c3p);//p1g1p2g2GP
blue_cell id2(c3p,g[0],c3g,c[3]);
//c4
wire c4g;
wire c4p;
black_cell id3(p[2],p[3],g[2],g[3],c4g,c4p);
blue_cell id4(c4p,c[2],c4g,c[4]);
//c5
wire [1:0]c5g;
wire [1:0]c5p;
black_cell id5(p[3],p[4],g[3],g[4],c5g[0],c5p[0]);
black_cell id6(c3p,c5p[0],c3g,c5g[0],c5g[1],c5p[1]);
blue_cell id7(c5p[1],c[1],c5g[1],c[5]);
//c6
wire [1:0]c6g;
wire [1:0]c6p;
black_cell id8(p[4],p[5],g[4],g[5],c6g[0],c6p[0]);
black_cell id9(c4p,c6p[0],c4g,c6g[0],c6g[1],c6p[1]);
blue_cell id10(c6p[1],c[2],c6g[1],c[6]);
//c7
wire [1:0]c7g;
wire [1:0]c7p;
black_cell id11(p[5],p[6],g[5],g[6],c7g[0],c7p[0]);
black_cell id12(c5p[0],c7p[0],c5g[0],c7g[0],c7g[1],c7p[1]);
blue_cell id13(c7p[1],c[3],c7g[1],c[7]);
//c8
wire [1:0]c8g;
wire [1:0]c8p;
black_cell id14(p[6],p[7],g[6],g[7],c8g[0],c8p[0]);
black_cell id15(c6p[0],c8p[0],c6g[0],c8g[0],c8g[1],c8p[1]);
blue_cell id16(c8p[1],c[4],c8g[1],Cout);

//FA
wire  [7:0]garb;
FA fa0(A[0],B[0],Cin,Sum[0],garb[0]);
FA fa1(A[1],B[1],c[1],Sum[1],garb[1]);
FA fa2(A[2],B[2],c[2],Sum[2],garb[2]);
FA fa3(A[3],B[3],c[3],Sum[3],garb[3]);
FA fa4(A[4],B[4],c[4],Sum[4],garb[4]);
FA fa5(A[5],B[5],c[5],Sum[5],garb[5]);
FA fa6(A[6],B[6],c[6],Sum[6],garb[6]);
FA fa7(A[7],B[7],c[7],Sum[7],garb[7]);
wire [3:0]sh;
and(sh[0],garb[0],garb[1]);
and(sh[1],garb[2],garb[3]);
and(sh[2],garb[4],garb[5]);
and(sh[3],garb[6],garb[7]);

endmodule

module pg_generation(a,b,p,g);
input a;
input b;
output p;
output g;

or(p,a,b);
and(g,a,b);
endmodule
