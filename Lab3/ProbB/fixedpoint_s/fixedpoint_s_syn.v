/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06
// Date      : Mon Mar 18 21:55:13 2024
/////////////////////////////////////////////////////////////


module fixedpoint_s_DW_mult_tc_0 ( a, b, product );
  input [7:0] a;
  input [7:0] b;
  output [15:0] product;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n17,
         n18, n19, n20, n21, n23, n24, n25, n26, n27, n28, n29, n30, n31, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246;

  FA1D1BWP16P90LVT U2 ( .A(n61), .B(n15), .CI(n2), .CO(n1), .S(product[14]) );
  FA1D1BWP16P90LVT U3 ( .A(n17), .B(n195), .CI(n3), .CO(n2), .S(product[13])
         );
  FA1D1BWP16P90LVT U4 ( .A(n19), .B(n18), .CI(n4), .CO(n3), .S(product[12]) );
  FA1D1BWP16P90LVT U5 ( .A(n20), .B(n23), .CI(n5), .CO(n4), .S(product[11]) );
  FA1D1BWP16P90LVT U6 ( .A(n24), .B(n27), .CI(n6), .CO(n5), .S(product[10]) );
  FA1D1BWP16P90LVT U7 ( .A(n28), .B(n33), .CI(n7), .CO(n6), .S(product[9]) );
  FA1D1BWP16P90LVT U8 ( .A(n34), .B(n39), .CI(n8), .CO(n7), .S(product[8]) );
  FA1D1BWP16P90LVT U9 ( .A(n40), .B(n45), .CI(n9), .CO(n8), .S(product[7]) );
  FA1D1BWP16P90LVT U10 ( .A(n46), .B(n49), .CI(n10), .CO(n9) );
  FA1D1BWP16P90LVT U11 ( .A(n50), .B(n53), .CI(n11), .CO(n10) );
  FA1D1BWP16P90LVT U12 ( .A(n54), .B(n55), .CI(n12), .CO(n11) );
  FA1D1BWP16P90LVT U13 ( .A(n56), .B(n59), .CI(n13), .CO(n12) );
  FA1D1BWP16P90LVT U14 ( .A(n91), .B(n84), .CI(n14), .CO(n13) );
  HA1D2BWP16P90LVT U15 ( .A(n60), .B(n92), .CO(n14) );
  FA1D1BWP16P90LVT U17 ( .A(n62), .B(n21), .CI(n69), .CO(n17), .S(n18) );
  FA1D1BWP16P90LVT U18 ( .A(n197), .B(n63), .CI(n25), .CO(n19), .S(n20) );
  FA1D1BWP16P90LVT U20 ( .A(n29), .B(n77), .CI(n26), .CO(n23), .S(n24) );
  FA1D1BWP16P90LVT U21 ( .A(n70), .B(n31), .CI(n64), .CO(n25), .S(n26) );
  FA1D1BWP16P90LVT U22 ( .A(n35), .B(n37), .CI(n30), .CO(n27), .S(n28) );
  FA1D1BWP16P90LVT U23 ( .A(n65), .B(n71), .CI(n199), .CO(n29), .S(n30) );
  FA1D1BWP16P90LVT U25 ( .A(n41), .B(n38), .CI(n36), .CO(n33), .S(n34) );
  FA1D1BWP16P90LVT U26 ( .A(n85), .B(n72), .CI(n43), .CO(n35), .S(n36) );
  FA1D1BWP16P90LVT U29 ( .A(n47), .B(n44), .CI(n42), .CO(n39), .S(n40) );
  FA1D1BWP16P90LVT U30 ( .A(n67), .B(n79), .CI(n73), .CO(n41), .S(n42) );
  HA1D2BWP16P90LVT U31 ( .A(n86), .B(n57), .CO(n43), .S(n44) );
  FA1D1BWP16P90LVT U32 ( .A(n51), .B(n74), .CI(n48), .CO(n45), .S(n46) );
  FA1D1BWP16P90LVT U33 ( .A(n87), .B(n68), .CI(n80), .CO(n47), .S(n48) );
  FA1D1BWP16P90LVT U34 ( .A(n75), .B(n81), .CI(n52), .CO(n49), .S(n50) );
  HA1D2BWP16P90LVT U35 ( .A(n88), .B(n58), .CO(n51), .S(n52) );
  FA1D1BWP16P90LVT U36 ( .A(n89), .B(n76), .CI(n82), .CO(n53), .S(n54) );
  HA1D2BWP16P90LVT U37 ( .A(n90), .B(n83), .CO(n55), .S(n56) );
  CKND1BWP16P90LVT U145 ( .I(n1), .ZN(product[15]) );
  CKND1BWP16P90LVT U146 ( .I(n15), .ZN(n195) );
  CKND1BWP16P90LVT U147 ( .I(n21), .ZN(n197) );
  CKND1BWP16P90LVT U148 ( .I(n31), .ZN(n199) );
  ND2D1BWP16P90LVT U149 ( .A1(n212), .A2(n244), .ZN(n214) );
  ND2D1BWP16P90LVT U150 ( .A1(n221), .A2(n245), .ZN(n223) );
  ND2D1BWP16P90LVT U151 ( .A1(n231), .A2(n246), .ZN(n233) );
  ND2D1BWP16P90LVT U152 ( .A1(a[1]), .A2(n202), .ZN(n204) );
  XNR2D1BWP16P90LVT U153 ( .A1(a[2]), .A2(a[1]), .ZN(n212) );
  XNR2D1BWP16P90LVT U154 ( .A1(a[4]), .A2(a[3]), .ZN(n221) );
  XNR2D1BWP16P90LVT U155 ( .A1(a[6]), .A2(a[5]), .ZN(n231) );
  CKND1BWP16P90LVT U156 ( .I(a[3]), .ZN(n200) );
  CKND1BWP16P90LVT U157 ( .I(a[5]), .ZN(n198) );
  CKND1BWP16P90LVT U158 ( .I(a[7]), .ZN(n196) );
  CKND1BWP16P90LVT U159 ( .I(b[0]), .ZN(n203) );
  CKND1BWP16P90LVT U160 ( .I(a[1]), .ZN(n201) );
  CKND1BWP16P90LVT U161 ( .I(a[0]), .ZN(n202) );
  OAI22D1BWP16P90 U162 ( .A1(b[0]), .A2(n204), .B1(n205), .B2(n202), .ZN(n92)
         );
  OAI22D1BWP16P90 U163 ( .A1(n205), .A2(n204), .B1(n206), .B2(n202), .ZN(n91)
         );
  XNR2D1BWP16P90 U164 ( .A1(b[1]), .A2(a[1]), .ZN(n205) );
  OAI22D1BWP16P90 U165 ( .A1(n206), .A2(n204), .B1(n207), .B2(n202), .ZN(n90)
         );
  XNR2D1BWP16P90 U166 ( .A1(b[2]), .A2(a[1]), .ZN(n206) );
  OAI22D1BWP16P90 U167 ( .A1(n207), .A2(n204), .B1(n208), .B2(n202), .ZN(n89)
         );
  XNR2D1BWP16P90 U168 ( .A1(b[3]), .A2(a[1]), .ZN(n207) );
  OAI22D1BWP16P90 U169 ( .A1(n208), .A2(n204), .B1(n209), .B2(n202), .ZN(n88)
         );
  XNR2D1BWP16P90 U170 ( .A1(b[4]), .A2(a[1]), .ZN(n208) );
  OAI22D1BWP16P90 U171 ( .A1(n209), .A2(n204), .B1(n210), .B2(n202), .ZN(n87)
         );
  XNR2D1BWP16P90 U172 ( .A1(b[5]), .A2(a[1]), .ZN(n209) );
  OAI22D1BWP16P90 U173 ( .A1(n210), .A2(n204), .B1(n211), .B2(n202), .ZN(n86)
         );
  XNR2D1BWP16P90 U174 ( .A1(b[6]), .A2(a[1]), .ZN(n210) );
  AO21D1BWP16P90 U175 ( .A1(n202), .A2(n204), .B(n211), .Z(n85) );
  XOR2D1BWP16P90 U176 ( .A1(b[7]), .A2(n201), .Z(n211) );
  NR2D1BWP16P90 U177 ( .A1(n212), .A2(n203), .ZN(n84) );
  OAI22D1BWP16P90 U178 ( .A1(n213), .A2(n214), .B1(n212), .B2(n215), .ZN(n83)
         );
  XNR2D1BWP16P90 U179 ( .A1(a[3]), .A2(b[0]), .ZN(n213) );
  OAI22D1BWP16P90 U180 ( .A1(n215), .A2(n214), .B1(n212), .B2(n216), .ZN(n82)
         );
  XNR2D1BWP16P90 U181 ( .A1(b[1]), .A2(a[3]), .ZN(n215) );
  OAI22D1BWP16P90 U182 ( .A1(n216), .A2(n214), .B1(n212), .B2(n217), .ZN(n81)
         );
  XNR2D1BWP16P90 U183 ( .A1(b[2]), .A2(a[3]), .ZN(n216) );
  OAI22D1BWP16P90 U184 ( .A1(n217), .A2(n214), .B1(n212), .B2(n218), .ZN(n80)
         );
  XNR2D1BWP16P90 U185 ( .A1(b[3]), .A2(a[3]), .ZN(n217) );
  OAI22D1BWP16P90 U186 ( .A1(n218), .A2(n214), .B1(n212), .B2(n219), .ZN(n79)
         );
  XNR2D1BWP16P90 U187 ( .A1(b[4]), .A2(a[3]), .ZN(n218) );
  AO21D1BWP16P90 U188 ( .A1(n214), .A2(n212), .B(n220), .Z(n77) );
  NR2D1BWP16P90 U189 ( .A1(n221), .A2(n203), .ZN(n76) );
  OAI22D1BWP16P90 U190 ( .A1(n222), .A2(n223), .B1(n221), .B2(n224), .ZN(n75)
         );
  XNR2D1BWP16P90 U191 ( .A1(a[5]), .A2(b[0]), .ZN(n222) );
  OAI22D1BWP16P90 U192 ( .A1(n224), .A2(n223), .B1(n221), .B2(n225), .ZN(n74)
         );
  XNR2D1BWP16P90 U193 ( .A1(b[1]), .A2(a[5]), .ZN(n224) );
  OAI22D1BWP16P90 U194 ( .A1(n225), .A2(n223), .B1(n221), .B2(n226), .ZN(n73)
         );
  XNR2D1BWP16P90 U195 ( .A1(b[2]), .A2(a[5]), .ZN(n225) );
  OAI22D1BWP16P90 U196 ( .A1(n226), .A2(n223), .B1(n221), .B2(n227), .ZN(n72)
         );
  XNR2D1BWP16P90 U197 ( .A1(b[3]), .A2(a[5]), .ZN(n226) );
  OAI22D1BWP16P90 U198 ( .A1(n227), .A2(n223), .B1(n221), .B2(n228), .ZN(n71)
         );
  XNR2D1BWP16P90 U199 ( .A1(b[4]), .A2(a[5]), .ZN(n227) );
  OAI22D1BWP16P90 U200 ( .A1(n228), .A2(n223), .B1(n221), .B2(n229), .ZN(n70)
         );
  XNR2D1BWP16P90 U201 ( .A1(b[5]), .A2(a[5]), .ZN(n228) );
  AO21D1BWP16P90 U202 ( .A1(n223), .A2(n221), .B(n230), .Z(n69) );
  NR2D1BWP16P90 U203 ( .A1(n231), .A2(n203), .ZN(n68) );
  OAI22D1BWP16P90 U204 ( .A1(n232), .A2(n233), .B1(n231), .B2(n234), .ZN(n67)
         );
  XNR2D1BWP16P90 U205 ( .A1(a[7]), .A2(b[0]), .ZN(n232) );
  OAI22D1BWP16P90 U206 ( .A1(n235), .A2(n233), .B1(n231), .B2(n236), .ZN(n65)
         );
  OAI22D1BWP16P90 U207 ( .A1(n236), .A2(n233), .B1(n231), .B2(n237), .ZN(n64)
         );
  XNR2D1BWP16P90 U208 ( .A1(b[3]), .A2(a[7]), .ZN(n236) );
  OAI22D1BWP16P90 U209 ( .A1(n237), .A2(n233), .B1(n231), .B2(n238), .ZN(n63)
         );
  XNR2D1BWP16P90 U210 ( .A1(b[4]), .A2(a[7]), .ZN(n237) );
  OAI22D1BWP16P90 U211 ( .A1(n238), .A2(n233), .B1(n231), .B2(n239), .ZN(n62)
         );
  XNR2D1BWP16P90 U212 ( .A1(b[5]), .A2(a[7]), .ZN(n238) );
  AO21D1BWP16P90 U213 ( .A1(n233), .A2(n231), .B(n240), .Z(n61) );
  OAI21D1BWP16P90 U214 ( .A1(b[0]), .A2(n201), .B(n204), .ZN(n60) );
  OAI32D1BWP16P90 U215 ( .A1(n200), .A2(b[0]), .A3(n212), .B1(n200), .B2(n214), 
        .ZN(n59) );
  OAI32D1BWP16P90 U216 ( .A1(n198), .A2(b[0]), .A3(n221), .B1(n198), .B2(n223), 
        .ZN(n58) );
  OAI32D1BWP16P90 U217 ( .A1(n196), .A2(b[0]), .A3(n231), .B1(n196), .B2(n233), 
        .ZN(n57) );
  XNR2D1BWP16P90 U218 ( .A1(n241), .A2(n242), .ZN(n38) );
  OR2D1BWP16P90 U219 ( .A1(n241), .A2(n242), .Z(n37) );
  OAI22D1BWP16P90 U220 ( .A1(n234), .A2(n233), .B1(n231), .B2(n235), .ZN(n242)
         );
  XNR2D1BWP16P90 U221 ( .A1(b[2]), .A2(a[7]), .ZN(n235) );
  XNR2D1BWP16P90 U222 ( .A1(b[1]), .A2(a[7]), .ZN(n234) );
  OAI22D1BWP16P90 U223 ( .A1(n219), .A2(n214), .B1(n212), .B2(n243), .ZN(n241)
         );
  XNR2D1BWP16P90 U224 ( .A1(b[5]), .A2(a[3]), .ZN(n219) );
  OAI22D1BWP16P90 U225 ( .A1(n243), .A2(n214), .B1(n212), .B2(n220), .ZN(n31)
         );
  XNR2D1BWP16P90 U226 ( .A1(b[7]), .A2(a[3]), .ZN(n220) );
  XNR2D1BWP16P90 U227 ( .A1(n200), .A2(a[2]), .ZN(n244) );
  XNR2D1BWP16P90 U228 ( .A1(b[6]), .A2(a[3]), .ZN(n243) );
  OAI22D1BWP16P90 U229 ( .A1(n229), .A2(n223), .B1(n221), .B2(n230), .ZN(n21)
         );
  XNR2D1BWP16P90 U230 ( .A1(b[7]), .A2(a[5]), .ZN(n230) );
  XNR2D1BWP16P90 U231 ( .A1(n198), .A2(a[4]), .ZN(n245) );
  XNR2D1BWP16P90 U232 ( .A1(b[6]), .A2(a[5]), .ZN(n229) );
  OAI22D1BWP16P90 U233 ( .A1(n239), .A2(n233), .B1(n231), .B2(n240), .ZN(n15)
         );
  XNR2D1BWP16P90 U234 ( .A1(b[7]), .A2(a[7]), .ZN(n240) );
  XNR2D1BWP16P90 U235 ( .A1(n196), .A2(a[6]), .ZN(n246) );
  XNR2D1BWP16P90 U236 ( .A1(b[6]), .A2(a[7]), .ZN(n239) );
endmodule


module fixedpoint_s ( in1, in2, out );
  input [7:0] in1;
  input [7:0] in2;
  output [7:0] out;
  wire   N9, N10, N11, N12, N13, N14, N15, N16, N17, N69, N70, N71, N72, N73,
         N74, N75, N87, N88, N89, N90, N91, N92, N93, N94, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, \add_25/carry[9] , \add_25/carry[10] ,
         \add_25/carry[11] , \add_25/carry[12] , \add_25/carry[13] ,
         \add_25/carry[14] , \add_25/carry[15] , n28;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6;

  AN2D1BWP16P90LVT U22 ( .A1(N9), .A2(n28), .Z(n19) );
  fixedpoint_s_DW_mult_tc_0 mult_11 ( .a(in1), .b(in2), .product({N17, N16, 
        N15, N14, N13, N12, N11, N10, N9, SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, SYNOPSYS_UNCONNECTED__6}) );
  OAI21D1BWP16P90LVT U25 ( .A1(N70), .A2(n28), .B(n26), .ZN(out[1]) );
  CKND1BWP16P90LVT U26 ( .I(N11), .ZN(N70) );
  AOI22D1BWP16P90LVT U27 ( .A1(N11), .A2(n21), .B1(N88), .B2(n19), .ZN(n26) );
  OAI21D1BWP16P90LVT U28 ( .A1(N71), .A2(n28), .B(n25), .ZN(out[2]) );
  CKND1BWP16P90LVT U29 ( .I(N12), .ZN(N71) );
  AOI22D1BWP16P90LVT U30 ( .A1(N12), .A2(n21), .B1(N89), .B2(n19), .ZN(n25) );
  OAI21D1BWP16P90LVT U31 ( .A1(N72), .A2(n28), .B(n24), .ZN(out[3]) );
  CKND1BWP16P90LVT U32 ( .I(N13), .ZN(N72) );
  AOI22D1BWP16P90LVT U33 ( .A1(N13), .A2(n21), .B1(N90), .B2(n19), .ZN(n24) );
  OAI21D1BWP16P90LVT U34 ( .A1(N73), .A2(n28), .B(n23), .ZN(out[4]) );
  CKND1BWP16P90LVT U35 ( .I(N14), .ZN(N73) );
  AOI22D1BWP16P90LVT U36 ( .A1(N14), .A2(n21), .B1(N91), .B2(n19), .ZN(n23) );
  OAI21D1BWP16P90LVT U37 ( .A1(N74), .A2(n28), .B(n22), .ZN(out[5]) );
  CKND1BWP16P90LVT U38 ( .I(N15), .ZN(N74) );
  AOI22D1BWP16P90LVT U39 ( .A1(N15), .A2(n21), .B1(N92), .B2(n19), .ZN(n22) );
  CKND1BWP16P90LVT U40 ( .I(N17), .ZN(n28) );
  OAI21D1BWP16P90LVT U41 ( .A1(N69), .A2(n28), .B(n27), .ZN(out[0]) );
  CKND1BWP16P90LVT U42 ( .I(N10), .ZN(N69) );
  AOI22D1BWP16P90LVT U43 ( .A1(N10), .A2(n21), .B1(N87), .B2(n19), .ZN(n27) );
  OAI21D1BWP16P90LVT U44 ( .A1(N75), .A2(n28), .B(n20), .ZN(out[6]) );
  CKND1BWP16P90LVT U45 ( .I(N16), .ZN(N75) );
  AOI22D1BWP16P90LVT U46 ( .A1(N16), .A2(n21), .B1(N93), .B2(n19), .ZN(n20) );
  NR2D1BWP16P90LVT U47 ( .A1(N17), .A2(N9), .ZN(n21) );
  IOA22D1BWP16P90LVT U48 ( .B1(n28), .B2(n28), .A1(N94), .A2(n19), .ZN(out[7])
         );
  XOR2D1BWP16P90 U49 ( .A1(N17), .A2(\add_25/carry[15] ), .Z(N94) );
  AN2D1BWP16P90 U50 ( .A1(\add_25/carry[14] ), .A2(N16), .Z(\add_25/carry[15] ) );
  XOR2D1BWP16P90 U51 ( .A1(N16), .A2(\add_25/carry[14] ), .Z(N93) );
  AN2D1BWP16P90 U52 ( .A1(\add_25/carry[13] ), .A2(N15), .Z(\add_25/carry[14] ) );
  XOR2D1BWP16P90 U53 ( .A1(N15), .A2(\add_25/carry[13] ), .Z(N92) );
  AN2D1BWP16P90 U54 ( .A1(\add_25/carry[12] ), .A2(N14), .Z(\add_25/carry[13] ) );
  XOR2D1BWP16P90 U55 ( .A1(N14), .A2(\add_25/carry[12] ), .Z(N91) );
  AN2D1BWP16P90 U56 ( .A1(\add_25/carry[11] ), .A2(N13), .Z(\add_25/carry[12] ) );
  XOR2D1BWP16P90 U57 ( .A1(N13), .A2(\add_25/carry[11] ), .Z(N90) );
  AN2D1BWP16P90 U58 ( .A1(\add_25/carry[10] ), .A2(N12), .Z(\add_25/carry[11] ) );
  XOR2D1BWP16P90 U59 ( .A1(N12), .A2(\add_25/carry[10] ), .Z(N89) );
  AN2D1BWP16P90 U60 ( .A1(\add_25/carry[9] ), .A2(N11), .Z(\add_25/carry[10] )
         );
  XOR2D1BWP16P90 U61 ( .A1(N11), .A2(\add_25/carry[9] ), .Z(N88) );
  AN2D1BWP16P90 U62 ( .A1(N9), .A2(N10), .Z(\add_25/carry[9] ) );
  XOR2D1BWP16P90 U63 ( .A1(N10), .A2(N9), .Z(N87) );
endmodule

