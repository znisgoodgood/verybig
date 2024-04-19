`include "FA.v"

module CLA8(A, B, Cin, Sum, Cout);

	input  [7:0] A;
	input  [7:0] B;
	input 	     Cin;
	output [7:0] Sum;
	output       Cout;
wire [6:0]p;
wire [6:0]g;
wire [7:0]c;
// put your design here

//p g generation
pg_generation p0(A[0],B[0],p[0],g[0]);
pg_generation p1(A[1],B[1],p[1],g[1]);
pg_generation p2(A[2],B[2],p[2],g[2]);
pg_generation p3(A[3],B[3],p[3],g[3]);
pg_generation p4(A[4],B[4],p[4],g[4]);
pg_generation p5(A[5],B[5],p[5],g[5]);
pg_generation p6(A[6],B[6],p[6],g[6]);
//pg_generation p7(A[7],B[7],p[7],g[7]);

//carry generation
//c1
and(c[0],p[0],Cin);
or(c[1],c[0],g[0]);
//c2
wire c1;
and(c1,p[1],c[1]);
or(c[2],c1,g[1]);
//c3
wire c2;
and(c2,p[2],c[2]);
or(c[3],c2,g[2]);
//c4
wire c3;
and(c3,p[3],c[3]);
or(c[4],c3,g[3]);
//c5
wire c4;
and(c4,p[4],c[4]);
or(c[5],c4,g[4]);
//c6
wire c5;
and(c5,p[5],c[5]);
or(c[6],c5,g[5]);
//c7
wire c6;
and(c6,p[6],c[6]);
or(c[7],c6,g[6]);

//FA
wire [6:0]garb;
FA fa0(A[0],B[0],Cin,Sum[0],garb[0]);
FA fa1(A[1],B[1],c[1],Sum[1],garb[1]);
FA fa2(A[2],B[2],c[2],Sum[2],garb[2]);
FA fa3(A[3],B[3],c[3],Sum[3],garb[3]);
FA fa4(A[4],B[4],c[4],Sum[4],garb[4]);
FA fa5(A[5],B[5],c[5],Sum[5],garb[5]);
FA fa6(A[6],B[6],c[6],Sum[6],garb[6]);
FA fa7(A[7],B[7],c[7],Sum[7],Cout);
wire [3:0]sh;
and(sh[0],garb[0],garb[1]);   
and(sh[1],garb[2],garb[3]);  
and(sh[2],garb[4],garb[5]);  
and(sh[3],garb[6],0);               
endmodule

module pg_generation(a,b,p,g);
input a;
input b;
output p;
output g;

or(p,a,b);
and(g,a,b);

endmodule