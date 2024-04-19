/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Fri Mar 29 13:52:46 2024
/////////////////////////////////////////////////////////////


module branch_pred ( clk, rst, taken, p_taken );
  input clk, rst, taken;
  output p_taken;
  wire   N15, N16, N17, N56, N57, n1, n2, n3, n4, n5, n6, n7;
  wire   [2:0] cs;

  DFQD2BWP16P90LVT \cs_reg[0]  ( .D(N15), .CP(clk), .Q(cs[0]) );
  DFQD2BWP16P90LVT \cs_reg[1]  ( .D(N16), .CP(clk), .Q(cs[1]) );
  DFQD2BWP16P90LVT \cs_reg[2]  ( .D(N17), .CP(clk), .Q(cs[2]) );
  LHQD2BWP16P90LVT p_taken_reg ( .E(N56), .D(N57), .Q(p_taken) );
  CKND1BWP16P90LVT U15 ( .I(cs[2]), .ZN(n1) );
  AOI211D1BWP16P90LVT U16 ( .A1(n7), .A2(cs[0]), .B(rst), .C(cs[2]), .ZN(N15)
         );
  XOR2D1BWP16P90LVT U17 ( .A1(taken), .A2(n2), .Z(n7) );
  CKND1BWP16P90LVT U18 ( .I(cs[1]), .ZN(n2) );
  NR2D1BWP16P90LVT U19 ( .A1(cs[0]), .A2(cs[1]), .ZN(n5) );
  NR3D1BWP16P90LVT U20 ( .A1(n6), .A2(rst), .A3(cs[2]), .ZN(N16) );
  MAOI22D1BWP16P90LVT U21 ( .A1(cs[0]), .A2(cs[1]), .B1(cs[0]), .B2(taken), 
        .ZN(n6) );
  OAI21D1BWP16P90LVT U22 ( .A1(n5), .A2(n1), .B(n3), .ZN(N17) );
  CKND1BWP16P90LVT U23 ( .I(rst), .ZN(n3) );
  OAI21D1BWP16P90LVT U24 ( .A1(n1), .A2(n2), .B(n4), .ZN(N57) );
  OAI21D1BWP16P90LVT U25 ( .A1(cs[0]), .A2(n1), .B(n2), .ZN(n4) );
  ND2D1BWP16P90LVT U26 ( .A1(n5), .A2(cs[2]), .ZN(N56) );
endmodule

