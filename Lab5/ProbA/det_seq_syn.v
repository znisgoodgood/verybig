/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Fri Mar 29 08:57:04 2024
/////////////////////////////////////////////////////////////


module det_seq ( clk, rst, d, q, num );
  output [2:0] num;
  input clk, rst, d;
  output q;
  wire   N29, N30, N31, N32, N33, N34, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17;
  wire   [2:0] cs;

  DFQD2BWP16P90LVT \cs_reg[0]  ( .D(N29), .CP(clk), .Q(cs[0]) );
  DFQD2BWP16P90LVT \cs_reg[1]  ( .D(N30), .CP(clk), .Q(cs[1]) );
  DFQD2BWP16P90LVT \cs_reg[2]  ( .D(N31), .CP(clk), .Q(cs[2]) );
  DFQD2BWP16P90LVT \num_reg[0]  ( .D(N32), .CP(clk), .Q(num[0]) );
  DFQD2BWP16P90LVT \num_reg[1]  ( .D(N33), .CP(clk), .Q(num[1]) );
  DFQD2BWP16P90LVT \num_reg[2]  ( .D(N34), .CP(clk), .Q(num[2]) );
  NR2D1BWP16P90LVT U27 ( .A1(n12), .A2(cs[0]), .ZN(q) );
  ND2D1BWP16P90LVT U28 ( .A1(d), .A2(n3), .ZN(n16) );
  ND2D1BWP16P90LVT U29 ( .A1(q), .A2(num[0]), .ZN(n9) );
  ND2D1BWP16P90LVT U30 ( .A1(cs[2]), .A2(cs[1]), .ZN(n12) );
  AOI211D1BWP16P90LVT U31 ( .A1(cs[0]), .A2(cs[2]), .B(n6), .C(rst), .ZN(N29)
         );
  NR2D1BWP16P90LVT U32 ( .A1(rst), .A2(n15), .ZN(N30) );
  AOI32D1BWP16P90LVT U33 ( .A1(n16), .A2(n4), .A3(cs[0]), .B1(n17), .B2(n5), 
        .ZN(n15) );
  CKND1BWP16P90LVT U34 ( .I(cs[0]), .ZN(n5) );
  OAI22D1BWP16P90LVT U35 ( .A1(d), .A2(n12), .B1(n4), .B2(n16), .ZN(n17) );
  CKND1BWP16P90LVT U36 ( .I(cs[1]), .ZN(n4) );
  CKND1BWP16P90LVT U37 ( .I(d), .ZN(n6) );
  AOI21D1BWP16P90LVT U38 ( .A1(n7), .A2(n8), .B(rst), .ZN(N34) );
  IND4D1BWP16P90LVT U39 ( .A1(num[2]), .B1(num[1]), .B2(num[0]), .B3(q), .ZN(
        n8) );
  OAI21D1BWP16P90LVT U40 ( .A1(n1), .A2(n9), .B(num[2]), .ZN(n7) );
  AOI21D1BWP16P90LVT U41 ( .A1(n13), .A2(n14), .B(rst), .ZN(N31) );
  ND3D1BWP16P90LVT U42 ( .A1(cs[2]), .A2(n4), .A3(d), .ZN(n13) );
  ND4D1BWP16P90LVT U43 ( .A1(cs[0]), .A2(cs[1]), .A3(n3), .A4(n6), .ZN(n14) );
  CKND1BWP16P90LVT U44 ( .I(num[1]), .ZN(n1) );
  CKND1BWP16P90LVT U45 ( .I(cs[2]), .ZN(n3) );
  NR2D1BWP16P90LVT U46 ( .A1(rst), .A2(n10), .ZN(N33) );
  AOI32D1BWP16P90LVT U47 ( .A1(q), .A2(n1), .A3(num[0]), .B1(num[1]), .B2(n9), 
        .ZN(n10) );
  NR2D1BWP16P90LVT U48 ( .A1(rst), .A2(n11), .ZN(N32) );
  MAOI22D1BWP16P90LVT U49 ( .A1(q), .A2(n2), .B1(n2), .B2(q), .ZN(n11) );
  CKND1BWP16P90LVT U50 ( .I(num[0]), .ZN(n2) );
endmodule

