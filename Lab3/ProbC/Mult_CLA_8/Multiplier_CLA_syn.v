/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Mon Mar 18 21:24:33 2024
/////////////////////////////////////////////////////////////


module and_ab_0 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;
  wire   n1;

  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
  INR2D4BWP16P90LVT U3 ( .A1(a[2]), .B1(n1), .ZN(ab_out[2]) );
  AN2D2BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D8BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  INVD1BWP16P90LVT U6 ( .I(b), .ZN(n1) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U9 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
endmodule


module pg_generation_0 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90 U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module FA_0 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  XOR2D1BWP16P90LVT U1 ( .A1(Cin), .A2(a), .Z(n1) );
  AO22D1BWP16P90 U2 ( .A1(a), .A2(Cin), .B1(n1), .B2(b), .Z(cout) );
  XOR2D1BWP16P90LVT U3 ( .A1(b), .A2(n1), .Z(Sum) );
endmodule


module FA_49 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  IOA21D1BWP16P90 U1 ( .A1(a), .A2(Cin), .B(n1), .ZN(cout) );
  XOR3D2BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
endmodule


module FA_50 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90 U1 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U4 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
  XOR3D1BWP16P90LVT U5 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
endmodule


module FA_51 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D2BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(a), .ZN(n3) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_52 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90 U1 ( .I(a), .ZN(n3) );
  CKND1BWP16P90LVT U2 ( .I(Cin), .ZN(n2) );
  XOR3D2BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_53 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(Cin), .Z(n1) );
  OAI21D1BWP16P90 U2 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  XOR3D4BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U4 ( .I(n1), .ZN(n3) );
  INVD1BWP16P90 U5 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_54 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  BUFFD1BWP16P90LVT U1 ( .I(Cin), .Z(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90 U4 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  INVD1BWP16P90 U5 ( .I(n1), .ZN(n3) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_55 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  BUFFD1BWP16P90LVT U1 ( .I(Cin), .Z(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(n1), .ZN(n3) );
  INVD1BWP16P90 U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90 U5 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module pg_generation_43 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n3, n4;

  ND2D1BWP16P90LVT U1 ( .A1(n3), .A2(n4), .ZN(p) );
  NR2D1BWP16P90LVT U2 ( .A1(n4), .A2(n3), .ZN(g) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n4) );
  CKND1BWP16P90LVT U4 ( .I(b), .ZN(n3) );
endmodule


module pg_generation_44 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n3, n4;

  INVD1BWP16P90LVT U1 ( .I(a), .ZN(n4) );
  INVD1BWP16P90LVT U2 ( .I(b), .ZN(n3) );
  NR2D1BWP16P90LVT U3 ( .A1(n4), .A2(n3), .ZN(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n3), .A2(n4), .ZN(p) );
endmodule


module pg_generation_45 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_46 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  IND2D1BWP16P90LVT U1 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
  CKND2BWP16P90LVT U3 ( .I(a), .ZN(n1) );
endmodule


module pg_generation_47 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  IND2D4BWP16P90LVT U1 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
  CKND2BWP16P90LVT U3 ( .I(a), .ZN(n1) );
endmodule


module pg_generation_48 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  INVD1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module CLA8_0 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_0 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_48 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_47 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_46 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_45 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_44 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_43 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_0 fa0 ( .a(A[0]), .b(B[0]), .Cin(Cin), .Sum(Sum[0]) );
  FA_55 fa1 ( .a(n6), .b(B[1]), .Cin(c[1]), .Sum(Sum[1]) );
  FA_54 fa2 ( .a(A[2]), .b(B[2]), .Cin(c[2]), .Sum(Sum[2]) );
  FA_53 fa3 ( .a(A[3]), .b(B[3]), .Cin(c[3]), .Sum(Sum[3]) );
  FA_52 fa4 ( .a(A[4]), .b(B[4]), .Cin(c[4]), .Sum(Sum[4]) );
  FA_51 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_50 fa6 ( .a(A[6]), .b(B[6]), .Cin(c[6]), .Sum(Sum[6]) );
  FA_49 fa7 ( .a(A[7]), .b(B[7]), .Cin(c[7]), .Sum(Sum[7]), .cout(Cout) );
  ND3D2BWP16P90LVT U1 ( .A1(n1), .A2(n2), .A3(n32), .ZN(c[3]) );
  ND2D1BWP16P90LVT U2 ( .A1(p[1]), .A2(n7), .ZN(n17) );
  CKND1BWP16P90LVT U3 ( .I(n19), .ZN(n20) );
  OR2D1BWP16P90LVT U4 ( .A1(n34), .A2(n33), .Z(n1) );
  OR2D1BWP16P90LVT U5 ( .A1(n35), .A2(n33), .Z(n2) );
  OAI221D1BWP16P90LVT U6 ( .A1(n32), .A2(n8), .B1(n33), .B2(n8), .C(n21), .ZN(
        n9) );
  IND2D1BWP16P90LVT U7 ( .A1(g[0]), .B1(n37), .ZN(c[1]) );
  BUFFD1BWP16P90LVT U8 ( .I(A[1]), .Z(n6) );
  ND2D2BWP16P90LVT U9 ( .A1(n36), .A2(n35), .ZN(c[2]) );
  ND2D2BWP16P90LVT U10 ( .A1(n17), .A2(n18), .ZN(n31) );
  ND2D1BWP16P90LVT U11 ( .A1(p[1]), .A2(g[0]), .ZN(n34) );
  CKND2BWP16P90LVT U12 ( .I(n31), .ZN(n35) );
  CKND2BWP16P90LVT U13 ( .I(g[2]), .ZN(n32) );
  INVD1BWP16P90LVT U14 ( .I(g[5]), .ZN(n27) );
  INVD1BWP16P90LVT U15 ( .I(n11), .ZN(c[4]) );
  INVD1BWP16P90LVT U16 ( .I(p[3]), .ZN(n8) );
  INVD1BWP16P90LVT U17 ( .I(p[5]), .ZN(n24) );
  INVD1BWP16P90LVT U18 ( .I(p[4]), .ZN(n22) );
  INVD1BWP16P90LVT U19 ( .I(p[2]), .ZN(n33) );
  INVD1BWP16P90LVT U20 ( .I(g[4]), .ZN(n23) );
  INVD1BWP16P90LVT U21 ( .I(g[3]), .ZN(n21) );
  INVD1BWP16P90LVT U22 ( .I(g[1]), .ZN(n18) );
  IOAI21D1BWP16P90LVT U23 ( .A2(n28), .A1(n24), .B(n27), .ZN(n25) );
  AOI21D1BWP16P90LVT U24 ( .A1(n4), .A2(n3), .B(n30), .ZN(c[5]) );
  AN2D1BWP16P90LVT U25 ( .A1(n20), .A2(n34), .Z(n3) );
  OAI31D1BWP16P90LVT U26 ( .A1(n16), .A2(n15), .A3(n14), .B(n13), .ZN(c[7]) );
  CKND1BWP16P90LVT U27 ( .I(p[6]), .ZN(n14) );
  CKND1BWP16P90LVT U28 ( .I(n12), .ZN(n15) );
  ND2D1BWP16P90LVT U29 ( .A1(p[1]), .A2(g[0]), .ZN(n36) );
  ND2D1BWP16P90LVT U30 ( .A1(n32), .A2(n21), .ZN(n19) );
  AN3D1BWP16P90LVT U31 ( .A1(n23), .A2(n18), .A3(n17), .Z(n4) );
  OA21D1BWP16P90LVT U32 ( .A1(p[2]), .A2(g[2]), .B(p[3]), .Z(n5) );
  CKND1BWP16P90LVT U33 ( .I(n37), .ZN(n7) );
  OAI31D1BWP16P90LVT U34 ( .A1(n19), .A2(n10), .A3(n31), .B(n9), .ZN(n11) );
  INVD1BWP16P90LVT U35 ( .I(n36), .ZN(n10) );
  ND2D1BWP16P90LVT U36 ( .A1(p[0]), .A2(Cin), .ZN(n37) );
  AOI21D1BWP16P90LVT U37 ( .A1(p[4]), .A2(c[4]), .B(g[5]), .ZN(n16) );
  ND2D1BWP16P90LVT U38 ( .A1(n24), .A2(n27), .ZN(n12) );
  AOI31D1BWP16P90LVT U39 ( .A1(g[4]), .A2(p[6]), .A3(n12), .B(g[6]), .ZN(n13)
         );
  ND2D1BWP16P90LVT U40 ( .A1(n23), .A2(n21), .ZN(n29) );
  ND2D1BWP16P90LVT U41 ( .A1(n23), .A2(n22), .ZN(n28) );
  OAI31D1BWP16P90LVT U42 ( .A1(n5), .A2(g[5]), .A3(n29), .B(n25), .ZN(n26) );
  AOI31D1BWP16P90LVT U43 ( .A1(n4), .A2(n27), .A3(n3), .B(n26), .ZN(c[6]) );
  OAI21D1BWP16P90LVT U44 ( .A1(n5), .A2(n29), .B(n28), .ZN(n30) );
endmodule


module FA_1 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  OAI21D1BWP16P90LVT U1 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  IOA21D2BWP16P90LVT U2 ( .A1(Cin), .A2(a), .B(n1), .ZN(cout) );
  XOR3D4BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
endmodule


module FA_2 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90 U1 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U4 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
  XOR3D1BWP16P90LVT U5 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
endmodule


module FA_3 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  XOR2D4BWP16P90LVT U1 ( .A1(n2), .A2(Cin), .Z(n4) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n1) );
  INVD1BWP16P90 U3 ( .I(b), .ZN(n3) );
  XNR2D1BWP16P90LVT U4 ( .A1(b), .A2(n4), .ZN(Sum) );
  CKND1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(cout) );
endmodule


module FA_4 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  INVD1BWP16P90 U1 ( .I(Cin), .ZN(n1) );
  INVD1BWP16P90 U2 ( .I(b), .ZN(n3) );
  XNR2D1BWP16P90LVT U3 ( .A1(b), .A2(n4), .ZN(Sum) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n2) );
  XOR2D1BWP16P90LVT U5 ( .A1(n2), .A2(Cin), .Z(n4) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(cout) );
endmodule


module FA_5 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  XOR2D1BWP16P90LVT U1 ( .A1(n2), .A2(Cin), .Z(n4) );
  XNR2D1BWP16P90 U2 ( .A1(b), .A2(n4), .ZN(Sum) );
  INVD1BWP16P90 U3 ( .I(b), .ZN(n3) );
  INVD1BWP16P90 U4 ( .I(Cin), .ZN(n1) );
  CKND1BWP16P90LVT U5 ( .I(a), .ZN(n2) );
  OAI22D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B1(n2), .B2(n1), .ZN(cout) );
endmodule


module FA_6 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  XOR2D1BWP16P90 U1 ( .A1(b), .A2(n2), .Z(Sum) );
  AO22D1BWP16P90 U2 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U3 ( .A1(Cin), .A2(a), .Z(n2) );
endmodule


module FA_7 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  XOR2D1BWP16P90LVT U1 ( .A1(b), .A2(n2), .Z(Sum) );
  AO22D1BWP16P90 U2 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U3 ( .A1(Cin), .A2(a), .Z(n2) );
endmodule


module FA_8 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  AO22D1BWP16P90 U1 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U2 ( .A1(b), .A2(n2), .Z(Sum) );
  XOR2D1BWP16P90 U3 ( .A1(Cin), .A2(a), .Z(n2) );
endmodule


module pg_generation_1 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_2 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_3 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  AN2D2BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
  IND2D1BWP16P90LVT U3 ( .A1(b), .B1(n1), .ZN(p) );
endmodule


module pg_generation_4 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90 U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_5 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_6 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_7 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  INVD1BWP16P90 U2 ( .I(b), .ZN(n2) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module CLA8_1 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_7 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_6 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_5 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_4 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_3 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_2 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_1 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_8 fa0 ( .a(A[0]), .b(B[0]), .Cin(Cin), .Sum(Sum[0]) );
  FA_7 fa1 ( .a(A[1]), .b(n4), .Cin(n14), .Sum(Sum[1]) );
  FA_6 fa2 ( .a(A[2]), .b(B[2]), .Cin(n13), .Sum(Sum[2]) );
  FA_5 fa3 ( .a(A[3]), .b(B[3]), .Cin(n1), .Sum(Sum[3]) );
  FA_4 fa4 ( .a(A[4]), .b(B[4]), .Cin(c[4]), .Sum(Sum[4]) );
  FA_3 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_2 fa6 ( .a(A[6]), .b(B[6]), .Cin(c[6]), .Sum(Sum[6]) );
  FA_1 fa7 ( .a(A[7]), .b(B[7]), .Cin(n11), .Sum(Sum[7]), .cout(Cout) );
  CKND2D4BWP16P90LVT U1 ( .A1(n10), .A2(n9), .ZN(c[4]) );
  ND2D2BWP16P90LVT U2 ( .A1(p[3]), .A2(n12), .ZN(n10) );
  IOAI21D2BWP16P90LVT U3 ( .A2(p[6]), .A1(n6), .B(n5), .ZN(n11) );
  AO21D4BWP16P90LVT U4 ( .A1(p[2]), .A2(n13), .B(g[2]), .Z(n1) );
  AO21D2BWP16P90LVT U5 ( .A1(p[1]), .A2(n14), .B(g[1]), .Z(n13) );
  CKBD1BWP16P90 U6 ( .I(g[3]), .Z(n2) );
  AO21D1BWP16P90LVT U7 ( .A1(p[0]), .A2(Cin), .B(g[0]), .Z(n14) );
  AOI21D1BWP16P90LVT U8 ( .A1(p[6]), .A2(g[5]), .B(g[6]), .ZN(n5) );
  AO21D1BWP16P90LVT U9 ( .A1(c[4]), .A2(p[4]), .B(g[4]), .Z(c[5]) );
  BUFFD1BWP16P90LVT U10 ( .I(B[1]), .Z(n4) );
  OAI31D2BWP16P90LVT U11 ( .A1(n7), .A2(g[4]), .A3(n2), .B(n3), .ZN(n8) );
  OA21D2BWP16P90LVT U12 ( .A1(p[4]), .A2(g[4]), .B(p[5]), .Z(n3) );
  AO21D1BWP16P90LVT U13 ( .A1(p[2]), .A2(n13), .B(g[2]), .Z(n12) );
  OAI31D2BWP16P90LVT U14 ( .A1(g[4]), .A2(n2), .A3(n7), .B(n3), .ZN(n6) );
  IND2D2BWP16P90LVT U15 ( .A1(g[5]), .B1(n8), .ZN(c[6]) );
  INVD1BWP16P90LVT U16 ( .I(n10), .ZN(n7) );
  INVD1BWP16P90LVT U17 ( .I(g[3]), .ZN(n9) );
endmodule


module FA_9 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  IOA21D1BWP16P90LVT U2 ( .A1(a), .A2(Cin), .B(n1), .ZN(cout) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
endmodule


module FA_10 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_11 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_12 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  BUFFD1BWP16P90LVT U1 ( .I(Cin), .Z(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(n1), .ZN(n3) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U5 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_13 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(Cin), .Z(n1) );
  INVD1BWP16P90 U2 ( .I(n1), .ZN(n3) );
  XOR3D2BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U5 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_14 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  XOR2D1BWP16P90LVT U1 ( .A1(n1), .A2(Cin), .Z(Sum) );
  XOR2D1BWP16P90LVT U2 ( .A1(a), .A2(b), .Z(n1) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n3) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U5 ( .A1(Cin), .A2(a), .B(b), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_15 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(b), .Z(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(a), .A2(b), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n3) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90 U5 ( .A1(Cin), .A2(a), .B(n1), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_16 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  XOR2D1BWP16P90 U1 ( .A1(Cin), .A2(a), .Z(n2) );
  AO22D1BWP16P90 U2 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U3 ( .A1(b), .A2(n2), .Z(Sum) );
endmodule


module pg_generation_8 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_9 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_10 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  ND2D1BWP16P90LVT U2 ( .A1(n2), .A2(n1), .ZN(p) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U4 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_11 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90 U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_12 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90 U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_13 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  INVD1BWP16P90LVT U2 ( .I(b), .ZN(n2) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_14 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2, n3;

  DEL025D1BWP16P90 U1 ( .I(b), .Z(n1) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n2) );
  INVD1BWP16P90LVT U3 ( .I(n1), .ZN(n3) );
  AN2D1BWP16P90LVT U4 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .ZN(p) );
endmodule


module CLA8_2 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_14 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_13 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_12 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_11 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_10 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_9 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_8 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_16 fa0 ( .a(A[0]), .b(B[0]), .Cin(Cin), .Sum(Sum[0]) );
  FA_15 fa1 ( .a(A[1]), .b(B[1]), .Cin(c[1]), .Sum(Sum[1]) );
  FA_14 fa2 ( .a(A[2]), .b(B[2]), .Cin(c[2]), .Sum(Sum[2]) );
  FA_13 fa3 ( .a(A[3]), .b(B[3]), .Cin(c[3]), .Sum(Sum[3]) );
  FA_12 fa4 ( .a(A[4]), .b(B[4]), .Cin(c[4]), .Sum(Sum[4]) );
  FA_11 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_10 fa6 ( .a(A[6]), .b(B[6]), .Cin(n12), .Sum(Sum[6]) );
  FA_9 fa7 ( .a(A[7]), .b(B[7]), .Cin(c[7]), .Sum(Sum[7]), .cout(Cout) );
  ND3D1BWP16P90LVT U1 ( .A1(n7), .A2(n8), .A3(n3), .ZN(n1) );
  CKND1BWP16P90LVT U2 ( .I(g[3]), .ZN(n11) );
  CKND1BWP16P90LVT U3 ( .I(g[5]), .ZN(n3) );
  IOA21D1BWP16P90LVT U4 ( .A1(c[3]), .A2(p[3]), .B(n11), .ZN(c[4]) );
  AO21D2BWP16P90LVT U5 ( .A1(p[1]), .A2(c[1]), .B(g[1]), .Z(c[2]) );
  OAI211D2BWP16P90LVT U6 ( .A1(p[3]), .A2(g[3]), .B(n2), .C(p[4]), .ZN(n7) );
  ND2D2BWP16P90LVT U7 ( .A1(p[2]), .A2(c[2]), .ZN(n10) );
  ND2D2BWP16P90LVT U8 ( .A1(n10), .A2(n9), .ZN(c[3]) );
  AO21D2BWP16P90LVT U9 ( .A1(p[0]), .A2(Cin), .B(g[0]), .Z(c[1]) );
  ND3D1BWP16P90LVT U10 ( .A1(n7), .A2(n8), .A3(n3), .ZN(n6) );
  AN2D2BWP16P90LVT U11 ( .A1(n6), .A2(n5), .Z(n12) );
  ND2D1BWP16P90LVT U12 ( .A1(n7), .A2(n8), .ZN(c[5]) );
  INVD1BWP16P90LVT U13 ( .I(n4), .ZN(c[7]) );
  INVD1BWP16P90LVT U14 ( .I(g[2]), .ZN(n9) );
  INVD1BWP16P90LVT U15 ( .I(g[4]), .ZN(n8) );
  IND2D1BWP16P90LVT U16 ( .A1(p[5]), .B1(n3), .ZN(n5) );
  ND3D1BWP16P90LVT U17 ( .A1(n10), .A2(n9), .A3(n11), .ZN(n2) );
  AOI31D1BWP16P90LVT U18 ( .A1(p[6]), .A2(n5), .A3(n1), .B(g[6]), .ZN(n4) );
endmodule


module FA_17 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  IOA21D1BWP16P90 U1 ( .A1(a), .A2(Cin), .B(n1), .ZN(cout) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
endmodule


module FA_18 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  BUFFD1BWP16P90LVT U1 ( .I(Cin), .Z(n1) );
  OAI21D1BWP16P90 U2 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  XOR3D4BWP16P90LVT U3 ( .A1(a), .A2(b), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U4 ( .I(n1), .ZN(n3) );
  CKND1BWP16P90LVT U5 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_19 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_20 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90 U2 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_21 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D2BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_22 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8;

  DEL025D1BWP16P90 U1 ( .I(Cin), .Z(n1) );
  CKND2BWP16P90LVT U2 ( .I(n2), .ZN(n3) );
  OAI22D1BWP16P90 U3 ( .A1(n2), .A2(n8), .B1(n7), .B2(n6), .ZN(cout) );
  ND2D1BWP16P90 U4 ( .A1(b), .A2(n2), .ZN(n4) );
  XOR2D2BWP16P90LVT U5 ( .A1(Cin), .A2(n7), .Z(n2) );
  ND2D2BWP16P90LVT U6 ( .A1(n4), .A2(n5), .ZN(Sum) );
  ND2D1BWP16P90LVT U7 ( .A1(n8), .A2(n3), .ZN(n5) );
  INVD1BWP16P90 U8 ( .I(n1), .ZN(n6) );
  INVD1BWP16P90 U9 ( .I(b), .ZN(n8) );
  CKND1BWP16P90LVT U10 ( .I(a), .ZN(n7) );
endmodule


module FA_23 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D2BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90 U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_24 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  AO22D1BWP16P90LVT U1 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U2 ( .A1(b), .A2(n2), .Z(Sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .Z(n2) );
endmodule


module pg_generation_15 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  AN2D2BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(g) );
  INVD1BWP16P90LVT U2 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n1) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_16 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  ND2D1BWP16P90LVT U1 ( .A1(n2), .A2(n1), .ZN(p) );
  INVD1BWP16P90LVT U2 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U4 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_17 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_18 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_19 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_20 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_21 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90 U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module CLA8_3 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_21 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_20 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_19 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_18 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_17 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_16 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_15 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_24 fa0 ( .a(A[0]), .b(B[0]), .Cin(Cin), .Sum(Sum[0]) );
  FA_23 fa1 ( .a(A[1]), .b(B[1]), .Cin(c[1]), .Sum(Sum[1]) );
  FA_22 fa2 ( .a(A[2]), .b(B[2]), .Cin(n1), .Sum(Sum[2]) );
  FA_21 fa3 ( .a(A[3]), .b(B[3]), .Cin(c[3]), .Sum(Sum[3]) );
  FA_20 fa4 ( .a(A[4]), .b(B[4]), .Cin(n2), .Sum(Sum[4]) );
  FA_19 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_18 fa6 ( .a(A[6]), .b(B[6]), .Cin(c[6]), .Sum(Sum[6]) );
  FA_17 fa7 ( .a(A[7]), .b(B[7]), .Cin(n18), .Sum(Sum[7]), .cout(Cout) );
  ND2D1BWP16P90LVT U1 ( .A1(c[2]), .A2(p[2]), .ZN(n12) );
  IND2D1BWP16P90LVT U2 ( .A1(g[0]), .B1(n17), .ZN(c[1]) );
  OAI211D2BWP16P90LVT U3 ( .A1(p[4]), .A2(g[4]), .B(n7), .C(p[5]), .ZN(n10) );
  INVD1BWP16P90LVT U4 ( .I(n10), .ZN(n8) );
  IND2D2BWP16P90LVT U5 ( .A1(g[5]), .B1(n10), .ZN(c[6]) );
  OAI21D2BWP16P90LVT U6 ( .A1(n15), .A2(n14), .B(n13), .ZN(n2) );
  AOAI211D2BWP16P90LVT U7 ( .A1(n17), .A2(n5), .B(n4), .C(n3), .ZN(n1) );
  INVD1BWP16P90LVT U8 ( .I(p[1]), .ZN(n4) );
  AOAI211D1BWP16P90LVT U9 ( .A1(n17), .A2(n5), .B(n4), .C(n3), .ZN(c[2]) );
  ND2D1BWP16P90LVT U10 ( .A1(p[0]), .A2(Cin), .ZN(n17) );
  CKND2BWP16P90LVT U11 ( .I(n9), .ZN(n18) );
  OAI32D2BWP16P90LVT U12 ( .A1(n8), .A2(g[5]), .A3(g[6]), .B1(g[6]), .B2(p[6]), 
        .ZN(n9) );
  INVD1BWP16P90LVT U13 ( .I(c[3]), .ZN(n15) );
  INVD1BWP16P90 U14 ( .I(g[3]), .ZN(n13) );
  OAI21D1BWP16P90LVT U15 ( .A1(n15), .A2(n14), .B(n13), .ZN(n19) );
  INVD1BWP16P90LVT U16 ( .I(g[2]), .ZN(n11) );
  INVD1BWP16P90LVT U17 ( .I(p[3]), .ZN(n14) );
  INVD1BWP16P90LVT U18 ( .I(g[4]), .ZN(n16) );
  IOA21D1BWP16P90LVT U19 ( .A1(n19), .A2(p[4]), .B(n16), .ZN(c[5]) );
  OAI211D1BWP16P90LVT U20 ( .A1(n14), .A2(n12), .B(n16), .C(n6), .ZN(n7) );
  ND2D1BWP16P90LVT U21 ( .A1(n12), .A2(n11), .ZN(c[3]) );
  INVD1BWP16P90LVT U22 ( .I(g[0]), .ZN(n5) );
  INVD1BWP16P90LVT U23 ( .I(g[1]), .ZN(n3) );
  AOI21D1BWP16P90LVT U24 ( .A1(g[2]), .A2(p[3]), .B(g[3]), .ZN(n6) );
endmodule


module FA_25 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  IOA21D1BWP16P90LVT U1 ( .A1(a), .A2(Cin), .B(n1), .ZN(cout) );
  XOR3D2BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
endmodule


module FA_26 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_27 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  CKND1BWP16P90LVT U1 ( .I(n3), .ZN(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n3) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U5 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_28 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90LVT U1 ( .I(Cin), .ZN(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90 U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n2) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n1), .B(n2), .ZN(cout) );
endmodule


module FA_29 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D2BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_30 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  BUFFD1BWP16P90 U1 ( .I(Cin), .Z(n1) );
  CKND1BWP16P90LVT U2 ( .I(n1), .ZN(n3) );
  XOR3D2BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U5 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_31 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D2BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n3) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  OAI21D1BWP16P90 U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_32 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  XOR2D1BWP16P90 U1 ( .A1(Cin), .A2(a), .Z(n2) );
  AO22D1BWP16P90 U2 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U3 ( .A1(b), .A2(n2), .Z(Sum) );
endmodule


module pg_generation_22 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(g) );
  INVD1BWP16P90LVT U2 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n1) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_23 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_24 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_25 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_26 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90 U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_27 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_28 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  INVD1BWP16P90 U2 ( .I(b), .ZN(n2) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module CLA8_4 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_28 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_27 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_26 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_25 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_24 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_23 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_22 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_32 fa0 ( .a(A[0]), .b(n3), .Cin(Cin), .Sum(Sum[0]) );
  FA_31 fa1 ( .a(A[1]), .b(B[1]), .Cin(c[1]), .Sum(Sum[1]) );
  FA_30 fa2 ( .a(A[2]), .b(B[2]), .Cin(n14), .Sum(Sum[2]) );
  FA_29 fa3 ( .a(A[3]), .b(B[3]), .Cin(c[3]), .Sum(Sum[3]) );
  FA_28 fa4 ( .a(A[4]), .b(B[4]), .Cin(c[4]), .Sum(Sum[4]) );
  FA_27 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_26 fa6 ( .a(A[6]), .b(B[6]), .Cin(n13), .Sum(Sum[6]) );
  FA_25 fa7 ( .a(A[7]), .b(B[7]), .Cin(c[7]), .Sum(Sum[7]), .cout(Cout) );
  CKND1BWP16P90LVT U1 ( .I(g[5]), .ZN(n6) );
  OAI21D1BWP16P90LVT U2 ( .A1(g[2]), .A2(n4), .B(p[3]), .ZN(n5) );
  CKND1BWP16P90LVT U3 ( .I(n12), .ZN(n4) );
  IND2D1BWP16P90LVT U4 ( .A1(g[3]), .B1(n5), .ZN(c[4]) );
  AOI31D1BWP16P90LVT U5 ( .A1(p[6]), .A2(n8), .A3(n9), .B(g[6]), .ZN(n7) );
  IND2D2BWP16P90LVT U6 ( .A1(g[3]), .B1(n5), .ZN(n1) );
  INVD1BWP16P90LVT U7 ( .I(n7), .ZN(c[7]) );
  INVD1BWP16P90LVT U8 ( .I(g[4]), .ZN(n11) );
  ND2D1BWP16P90LVT U9 ( .A1(n11), .A2(n10), .ZN(c[5]) );
  IND2D1BWP16P90LVT U10 ( .A1(g[2]), .B1(n12), .ZN(c[3]) );
  AN2D1BWP16P90LVT U11 ( .A1(n9), .A2(n8), .Z(n13) );
  AO21D1BWP16P90LVT U12 ( .A1(p[1]), .A2(c[1]), .B(g[1]), .Z(n14) );
  ND2D1BWP16P90LVT U13 ( .A1(p[2]), .A2(n14), .ZN(n12) );
  AO21D1BWP16P90LVT U14 ( .A1(p[0]), .A2(Cin), .B(g[0]), .Z(c[1]) );
  INVD1BWP16P90 U15 ( .I(B[0]), .ZN(n2) );
  CKND1BWP16P90LVT U16 ( .I(n2), .ZN(n3) );
  IND2D1BWP16P90LVT U17 ( .A1(p[5]), .B1(n6), .ZN(n8) );
  ND2D1BWP16P90LVT U18 ( .A1(p[4]), .A2(n1), .ZN(n10) );
  ND3D1BWP16P90LVT U19 ( .A1(n6), .A2(n11), .A3(n10), .ZN(n9) );
endmodule


module FA_33 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  XOR3D2BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  IOA21D1BWP16P90 U2 ( .A1(a), .A2(Cin), .B(n1), .ZN(cout) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
endmodule


module FA_34 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  OAI21D1BWP16P90 U1 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_35 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  OAI21D1BWP16P90 U1 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_36 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_37 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(Cin), .Z(n1) );
  XOR3D4BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90 U3 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  INVD1BWP16P90 U4 ( .I(n1), .ZN(n3) );
  CKND1BWP16P90LVT U5 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_38 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90 U1 ( .I(Cin), .ZN(n2) );
  XOR3D2BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_39 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90 U1 ( .I(Cin), .ZN(n2) );
  XOR3D2BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_40 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  AO22D1BWP16P90 U1 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U2 ( .A1(b), .A2(n2), .Z(Sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .Z(n2) );
endmodule


module pg_generation_29 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_30 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_31 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_32 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  AN2D1BWP16P90 U1 ( .A1(b), .A2(a), .Z(g) );
  INVD1BWP16P90LVT U2 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U3 ( .I(a), .ZN(n1) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_33 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_34 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90 U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_35 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  IND2D1BWP16P90 U1 ( .A1(b), .B1(n1), .ZN(p) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module CLA8_5 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_35 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_34 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_33 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_32 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_31 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_30 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_29 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_40 fa0 ( .a(A[0]), .b(n2), .Cin(Cin), .Sum(Sum[0]) );
  FA_39 fa1 ( .a(A[1]), .b(B[1]), .Cin(n17), .Sum(Sum[1]) );
  FA_38 fa2 ( .a(A[2]), .b(B[2]), .Cin(c[2]), .Sum(Sum[2]) );
  FA_37 fa3 ( .a(A[3]), .b(B[3]), .Cin(c[3]), .Sum(Sum[3]) );
  FA_36 fa4 ( .a(A[4]), .b(B[4]), .Cin(c[4]), .Sum(Sum[4]) );
  FA_35 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_34 fa6 ( .a(A[6]), .b(B[6]), .Cin(c[6]), .Sum(Sum[6]) );
  FA_33 fa7 ( .a(A[7]), .b(B[7]), .Cin(c[7]), .Sum(Sum[7]), .cout(Cout) );
  AOAI211D2BWP16P90LVT U1 ( .A1(n15), .A2(n16), .B(n14), .C(n13), .ZN(c[3]) );
  CKND1BWP16P90LVT U2 ( .I(g[3]), .ZN(n9) );
  CKND1BWP16P90LVT U3 ( .I(p[4]), .ZN(n12) );
  ND2D1BWP16P90LVT U4 ( .A1(n16), .A2(n15), .ZN(c[2]) );
  ND2D1BWP16P90LVT U5 ( .A1(n10), .A2(n9), .ZN(c[4]) );
  INVD1BWP16P90 U6 ( .I(B[0]), .ZN(n1) );
  CKND1BWP16P90LVT U7 ( .I(n1), .ZN(n2) );
  AN2D1BWP16P90LVT U8 ( .A1(n10), .A2(n9), .Z(n3) );
  ND2D2BWP16P90LVT U9 ( .A1(p[1]), .A2(n17), .ZN(n15) );
  INVD1BWP16P90LVT U10 ( .I(p[2]), .ZN(n14) );
  INVD1BWP16P90LVT U11 ( .I(n8), .ZN(n6) );
  INVD1BWP16P90LVT U12 ( .I(g[4]), .ZN(n11) );
  INVD1BWP16P90LVT U13 ( .I(g[2]), .ZN(n13) );
  ND3D1BWP16P90 U14 ( .A1(n15), .A2(n16), .A3(n13), .ZN(n4) );
  INVD1BWP16P90LVT U15 ( .I(g[1]), .ZN(n16) );
  IND2D1BWP16P90LVT U16 ( .A1(g[5]), .B1(n8), .ZN(c[6]) );
  AO21D2BWP16P90LVT U17 ( .A1(p[0]), .A2(Cin), .B(g[0]), .Z(n17) );
  OAI211D1BWP16P90LVT U18 ( .A1(g[2]), .A2(p[2]), .B(n4), .C(p[3]), .ZN(n10)
         );
  AOI21D1BWP16P90LVT U19 ( .A1(n10), .A2(n9), .B(n12), .ZN(n5) );
  OAI21D1BWP16P90LVT U20 ( .A1(g[4]), .A2(n5), .B(p[5]), .ZN(n8) );
  AOI22D1BWP16P90LVT U21 ( .A1(p[6]), .A2(n6), .B1(p[6]), .B2(g[5]), .ZN(n7)
         );
  IND2D1BWP16P90LVT U22 ( .A1(g[6]), .B1(n7), .ZN(c[7]) );
  OAI21D1BWP16P90LVT U23 ( .A1(n3), .A2(n12), .B(n11), .ZN(c[5]) );
endmodule


module FA_41 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1;

  IOA21D1BWP16P90 U1 ( .A1(a), .A2(Cin), .B(n1), .ZN(cout) );
  XOR3D2BWP16P90LVT U2 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
endmodule


module FA_42 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  OAI21D1BWP16P90 U1 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  INVD1BWP16P90 U2 ( .I(Cin), .ZN(n2) );
  XOR3D2BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_43 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90 U2 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_44 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4, n5, n6, n7;

  ND2D2BWP16P90LVT U1 ( .A1(n3), .A2(n4), .ZN(Sum) );
  ND2D1BWP16P90LVT U2 ( .A1(n5), .A2(n2), .ZN(n3) );
  CKND1BWP16P90LVT U3 ( .I(Cin), .ZN(n2) );
  XOR2D1BWP16P90LVT U4 ( .A1(a), .A2(b), .Z(n5) );
  ND2D1BWP16P90LVT U5 ( .A1(n1), .A2(Cin), .ZN(n4) );
  INVD1BWP16P90LVT U6 ( .I(n5), .ZN(n1) );
  OAI21D1BWP16P90 U7 ( .A1(Cin), .A2(a), .B(b), .ZN(n6) );
  CKND1BWP16P90LVT U8 ( .I(a), .ZN(n7) );
  OAI21D1BWP16P90LVT U9 ( .A1(n7), .A2(n2), .B(n6), .ZN(cout) );
endmodule


module FA_45 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3, n4;

  DEL025D1BWP16P90 U1 ( .I(Cin), .Z(n1) );
  OAI21D1BWP16P90 U2 ( .A1(n1), .A2(a), .B(b), .ZN(n2) );
  XOR3D4BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  INVD1BWP16P90 U4 ( .I(n1), .ZN(n3) );
  CKND1BWP16P90LVT U5 ( .I(a), .ZN(n4) );
  OAI21D1BWP16P90LVT U6 ( .A1(n4), .A2(n3), .B(n2), .ZN(cout) );
endmodule


module FA_46 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  XOR3D4BWP16P90LVT U1 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90 U2 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  INVD1BWP16P90 U3 ( .I(Cin), .ZN(n2) );
  CKND1BWP16P90LVT U4 ( .I(a), .ZN(n3) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_47 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n1, n2, n3;

  INVD1BWP16P90 U1 ( .I(Cin), .ZN(n2) );
  INVD1BWP16P90 U2 ( .I(a), .ZN(n3) );
  XOR3D2BWP16P90LVT U3 ( .A1(b), .A2(a), .A3(Cin), .Z(Sum) );
  OAI21D1BWP16P90LVT U4 ( .A1(Cin), .A2(a), .B(b), .ZN(n1) );
  OAI21D1BWP16P90LVT U5 ( .A1(n3), .A2(n2), .B(n1), .ZN(cout) );
endmodule


module FA_48 ( a, b, Cin, Sum, cout );
  input a, b, Cin;
  output Sum, cout;
  wire   n2;

  AO22D1BWP16P90LVT U1 ( .A1(a), .A2(Cin), .B1(n2), .B2(b), .Z(cout) );
  XOR2D1BWP16P90 U2 ( .A1(b), .A2(n2), .Z(Sum) );
  XOR2D1BWP16P90LVT U3 ( .A1(Cin), .A2(a), .Z(n2) );
endmodule


module pg_generation_36 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1, n2;

  INVD1BWP16P90LVT U1 ( .I(b), .ZN(n2) );
  CKND1BWP16P90LVT U2 ( .I(a), .ZN(n1) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
  ND2D1BWP16P90LVT U4 ( .A1(n2), .A2(n1), .ZN(p) );
endmodule


module pg_generation_37 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_38 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90 U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_39 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_40 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90LVT U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_41 ( a, b, p, g );
  input a, b;
  output p, g;
  wire   n1;

  CKND1BWP16P90LVT U1 ( .I(a), .ZN(n1) );
  IND2D1BWP16P90LVT U2 ( .A1(b), .B1(n1), .ZN(p) );
  AN2D1BWP16P90LVT U3 ( .A1(b), .A2(a), .Z(g) );
endmodule


module pg_generation_42 ( a, b, p, g );
  input a, b;
  output p, g;


  OR2D1BWP16P90 U1 ( .A1(b), .A2(a), .Z(p) );
  AN2D1BWP16P90LVT U2 ( .A1(b), .A2(a), .Z(g) );
endmodule


module CLA8_6 ( A, B, Cin, Sum, Cout );
  input [7:0] A;
  input [7:0] B;
  output [7:0] Sum;
  input Cin;
  output Cout;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;
  wire   [6:0] p;
  wire   [6:0] g;
  wire   [7:0] c;

  pg_generation_42 p0 ( .a(A[0]), .b(B[0]), .p(p[0]), .g(g[0]) );
  pg_generation_41 p1 ( .a(A[1]), .b(B[1]), .p(p[1]), .g(g[1]) );
  pg_generation_40 p2 ( .a(A[2]), .b(B[2]), .p(p[2]), .g(g[2]) );
  pg_generation_39 p3 ( .a(A[3]), .b(B[3]), .p(p[3]), .g(g[3]) );
  pg_generation_38 p4 ( .a(A[4]), .b(B[4]), .p(p[4]), .g(g[4]) );
  pg_generation_37 p5 ( .a(A[5]), .b(B[5]), .p(p[5]), .g(g[5]) );
  pg_generation_36 p6 ( .a(A[6]), .b(B[6]), .p(p[6]), .g(g[6]) );
  FA_48 fa0 ( .a(A[0]), .b(B[0]), .Cin(Cin), .Sum(Sum[0]) );
  FA_47 fa1 ( .a(A[1]), .b(B[1]), .Cin(c[1]), .Sum(Sum[1]) );
  FA_46 fa2 ( .a(A[2]), .b(B[2]), .Cin(c[2]), .Sum(Sum[2]) );
  FA_45 fa3 ( .a(A[3]), .b(B[3]), .Cin(n21), .Sum(Sum[3]) );
  FA_44 fa4 ( .a(A[4]), .b(B[4]), .Cin(c[4]), .Sum(Sum[4]) );
  FA_43 fa5 ( .a(A[5]), .b(B[5]), .Cin(c[5]), .Sum(Sum[5]) );
  FA_42 fa6 ( .a(A[6]), .b(B[6]), .Cin(c[6]), .Sum(Sum[6]) );
  FA_41 fa7 ( .a(A[7]), .b(B[7]), .Cin(c[7]), .Sum(Sum[7]), .cout(Cout) );
  IND2D2BWP16P90LVT U1 ( .A1(g[5]), .B1(n6), .ZN(c[6]) );
  AOI21D2BWP16P90LVT U2 ( .A1(n19), .A2(n18), .B(n17), .ZN(n21) );
  CKND1BWP16P90LVT U3 ( .I(p[4]), .ZN(n10) );
  ND2D1BWP16P90LVT U4 ( .A1(p[0]), .A2(Cin), .ZN(n20) );
  IND2D1BWP16P90LVT U5 ( .A1(g[0]), .B1(n20), .ZN(c[1]) );
  OAI211D1BWP16P90LVT U6 ( .A1(g[4]), .A2(n7), .B(n5), .C(p[5]), .ZN(n6) );
  ND2D1BWP16P90LVT U7 ( .A1(n1), .A2(n11), .ZN(c[4]) );
  IND2D4BWP16P90LVT U8 ( .A1(n16), .B1(n14), .ZN(c[2]) );
  OAI211D2BWP16P90LVT U9 ( .A1(n13), .A2(n19), .B(n4), .C(n18), .ZN(n7) );
  CKND2BWP16P90LVT U10 ( .I(c[2]), .ZN(n13) );
  OR3D2BWP16P90LVT U11 ( .A1(n13), .A2(n12), .A3(n19), .Z(n1) );
  INVD1BWP16P90LVT U12 ( .I(p[3]), .ZN(n12) );
  ND2D1BWP16P90LVT U13 ( .A1(p[1]), .A2(g[0]), .ZN(n14) );
  INVD1BWP16P90LVT U14 ( .I(n14), .ZN(n15) );
  INVD1BWP16P90LVT U15 ( .I(n7), .ZN(n9) );
  INVD1BWP16P90LVT U16 ( .I(g[2]), .ZN(n18) );
  INVD1BWP16P90LVT U17 ( .I(g[3]), .ZN(n4) );
  INVD1BWP16P90LVT U18 ( .I(g[4]), .ZN(n8) );
  AN2D1BWP16P90LVT U19 ( .A1(n12), .A2(n4), .Z(n2) );
  OAI31D1BWP16P90LVT U20 ( .A1(n10), .A2(n2), .A3(n9), .B(n8), .ZN(c[5]) );
  AO21D1BWP16P90LVT U21 ( .A1(p[6]), .A2(c[6]), .B(g[6]), .Z(c[7]) );
  OAI21D1BWP16P90LVT U22 ( .A1(n2), .A2(n10), .B(n8), .ZN(n5) );
  INVD1BWP16P90LVT U23 ( .I(n20), .ZN(n3) );
  AO21D1BWP16P90LVT U24 ( .A1(p[1]), .A2(n3), .B(g[1]), .Z(n16) );
  CKND2BWP16P90LVT U25 ( .I(p[2]), .ZN(n19) );
  AOI21D1BWP16P90LVT U26 ( .A1(g[2]), .A2(p[3]), .B(g[3]), .ZN(n11) );
  NR3D1BWP16P90LVT U27 ( .A1(n16), .A2(g[2]), .A3(n15), .ZN(n17) );
endmodule


module and_ab_1 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;


  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  AN2D1BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D1BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D1BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
endmodule


module and_ab_2 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;


  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  AN2D1BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D1BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D1BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
endmodule


module and_ab_3 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;


  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  AN2D1BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D1BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D1BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
endmodule


module and_ab_4 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;


  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  AN2D1BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D1BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D1BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
endmodule


module and_ab_5 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;


  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  AN2D1BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D1BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D1BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
endmodule


module and_ab_6 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;


  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  AN2D1BWP16P90LVT U4 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
  AN2D1BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D1BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  AN2D1BWP16P90LVT U7 ( .A1(a[1]), .A2(b), .Z(ab_out[1]) );
  AN2D1BWP16P90LVT U8 ( .A1(b), .A2(a[0]), .Z(ab_out[0]) );
endmodule


module and_ab_7 ( a, b, ab_out );
  input [7:0] a;
  output [7:0] ab_out;
  input b;
  wire   n1;

  AN2D1BWP16P90LVT U1 ( .A1(b), .A2(a[7]), .Z(ab_out[7]) );
  AN2D1BWP16P90LVT U2 ( .A1(a[6]), .A2(b), .Z(ab_out[6]) );
  AN2D1BWP16P90LVT U3 ( .A1(a[5]), .A2(b), .Z(ab_out[5]) );
  INR2D2BWP16P90LVT U4 ( .A1(a[1]), .B1(n1), .ZN(ab_out[1]) );
  AN2D4BWP16P90LVT U5 ( .A1(a[3]), .A2(b), .Z(ab_out[3]) );
  AN2D8BWP16P90LVT U6 ( .A1(a[2]), .A2(b), .Z(ab_out[2]) );
  INVD1BWP16P90LVT U7 ( .I(b), .ZN(n1) );
  AN2D1BWP16P90LVT U8 ( .A1(a[0]), .A2(b), .Z(ab_out[0]) );
  AN2D1BWP16P90LVT U9 ( .A1(a[4]), .A2(b), .Z(ab_out[4]) );
endmodule


module Multiplier_CLA ( A, B, Product );
  input [7:0] A;
  input [7:0] B;
  output [15:0] Product;
  wire   \*Logic0* , \temp3[7] , \temp4[7] , \temp5[7] , \temp6[7] ,
         \temp7[7] , \temp8[7] ;
  wire   [7:0] stage1;
  wire   [7:0] stage2;
  wire   [7:0] sum2;
  wire   [7:0] stage3;
  wire   [7:0] sum3;
  wire   [7:0] stage4;
  wire   [7:0] sum4;
  wire   [7:0] stage5;
  wire   [7:0] sum5;
  wire   [7:0] stage6;
  wire   [7:0] sum6;
  wire   [7:0] stage7;
  wire   [7:0] sum7;
  wire   [7:0] stage8;
  assign Product[0] = stage1[0];
  assign Product[1] = sum2[0];
  assign Product[2] = sum3[0];
  assign Product[3] = sum4[0];
  assign Product[4] = sum5[0];
  assign Product[5] = sum6[0];
  assign Product[6] = sum7[0];

  and_ab_0 id0 ( .a(A), .b(B[0]), .ab_out(stage1) );
  and_ab_7 id1 ( .a(A), .b(B[1]), .ab_out(stage2) );
  CLA8_0 id2 ( .A(stage2), .B({\*Logic0* , stage1[7:1]}), .Cin(\*Logic0* ), 
        .Sum(sum2), .Cout(\temp3[7] ) );
  and_ab_6 id3 ( .a(A), .b(B[2]), .ab_out(stage3) );
  CLA8_6 id4 ( .A(stage3), .B({\temp3[7] , sum2[7:1]}), .Cin(\*Logic0* ), 
        .Sum(sum3), .Cout(\temp4[7] ) );
  and_ab_5 id5 ( .a(A), .b(B[3]), .ab_out(stage4) );
  CLA8_5 id6 ( .A(stage4), .B({\temp4[7] , sum3[7:1]}), .Cin(\*Logic0* ), 
        .Sum(sum4), .Cout(\temp5[7] ) );
  and_ab_4 id7 ( .a(A), .b(B[4]), .ab_out(stage5) );
  CLA8_4 id8 ( .A(stage5), .B({\temp5[7] , sum4[7:1]}), .Cin(\*Logic0* ), 
        .Sum(sum5), .Cout(\temp6[7] ) );
  and_ab_3 id9 ( .a(A), .b(B[5]), .ab_out(stage6) );
  CLA8_3 id10 ( .A(stage6), .B({\temp6[7] , sum5[7:1]}), .Cin(\*Logic0* ), 
        .Sum(sum6), .Cout(\temp7[7] ) );
  and_ab_2 id11 ( .a(A), .b(B[6]), .ab_out(stage7) );
  CLA8_2 id12 ( .A(stage7), .B({\temp7[7] , sum6[7:1]}), .Cin(\*Logic0* ), 
        .Sum(sum7), .Cout(\temp8[7] ) );
  and_ab_1 id13 ( .a(A), .b(B[7]), .ab_out(stage8) );
  CLA8_1 id14 ( .A(stage8), .B({\temp8[7] , sum7[7:1]}), .Cin(\*Logic0* ), 
        .Sum(Product[14:7]), .Cout(Product[15]) );
  TIELBWP20P90LVT U2 ( .ZN(\*Logic0* ) );
endmodule

