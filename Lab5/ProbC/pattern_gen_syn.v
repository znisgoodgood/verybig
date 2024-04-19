/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Fri Mar 29 10:08:42 2024
/////////////////////////////////////////////////////////////


module pattern_gen ( clk, rst, en, sel, pattern, valid );
  input [2:0] sel;
  input clk, rst, en;
  output pattern, valid;
  wire   N16, N17, N18, N57, n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [2:0] cs;
  assign valid = N57;

  DFQD2BWP16P90LVT \cs_reg[0]  ( .D(N16), .CP(clk), .Q(cs[0]) );
  DFQD2BWP16P90LVT \cs_reg[1]  ( .D(N17), .CP(clk), .Q(cs[1]) );
  DFQD2BWP16P90LVT \cs_reg[2]  ( .D(N18), .CP(clk), .Q(cs[2]) );
  OR2D1BWP16P90LVT U13 ( .A1(rst), .A2(cs[2]), .Z(n8) );
  CKND1BWP16P90LVT U17 ( .I(n5), .ZN(n2) );
  NR2D1BWP16P90LVT U18 ( .A1(n7), .A2(n8), .ZN(N18) );
  NR2D1BWP16P90LVT U19 ( .A1(n2), .A2(n8), .ZN(N17) );
  ND2D1BWP16P90LVT U20 ( .A1(cs[1]), .A2(cs[0]), .ZN(n7) );
  XOR2D1BWP16P90LVT U21 ( .A1(cs[0]), .A2(cs[1]), .Z(n5) );
  NR2D1BWP16P90LVT U22 ( .A1(n8), .A2(n9), .ZN(N16) );
  OAI21D1BWP16P90LVT U23 ( .A1(cs[1]), .A2(en), .B(n3), .ZN(n9) );
  CKND1BWP16P90LVT U24 ( .I(cs[0]), .ZN(n3) );
  OAI32D1BWP16P90LVT U25 ( .A1(n4), .A2(n1), .A3(n5), .B1(cs[2]), .B2(n6), 
        .ZN(pattern) );
  ND2D1BWP16P90LVT U26 ( .A1(sel[0]), .A2(cs[2]), .ZN(n4) );
  AOI22D1BWP16P90LVT U27 ( .A1(sel[1]), .A2(n1), .B1(sel[2]), .B2(n5), .ZN(n6)
         );
  CKND1BWP16P90LVT U28 ( .I(n7), .ZN(n1) );
  IND3D1BWP16P90LVT U29 ( .A1(cs[2]), .B1(n7), .B2(n2), .ZN(N57) );
endmodule

