/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Fri Mar 29 10:22:28 2024
/////////////////////////////////////////////////////////////


module moore ( clk, rst, din, qout );
  input clk, rst, din;
  output qout;
  wire   \cs[0] , n1, n2, n3, n4;
  wire   [1:0] ns;

  DFCNQD1BWP16P90LVT \cs_reg[0]  ( .D(ns[0]), .CP(clk), .CDN(n1), .Q(\cs[0] )
         );
  DFCNQD1BWP16P90LVT \cs_reg[1]  ( .D(ns[1]), .CP(clk), .CDN(n1), .Q(qout) );
  INVD1BWP16P90LVT U3 ( .I(rst), .ZN(n1) );
  ND2D1BWP16P90LVT U9 ( .A1(din), .A2(qout), .ZN(n3) );
  XNR2D1BWP16P90LVT U10 ( .A1(qout), .A2(din), .ZN(n2) );
  OAI21D1BWP16P90LVT U11 ( .A1(\cs[0] ), .A2(n2), .B(n3), .ZN(ns[1]) );
  XNR2D1BWP16P90LVT U12 ( .A1(n4), .A2(n2), .ZN(ns[0]) );
  ND2D1BWP16P90LVT U13 ( .A1(\cs[0] ), .A2(n3), .ZN(n4) );
endmodule

