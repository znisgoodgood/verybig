module FA(
    input  a,
    input  b,
    input  Cin, 
    output Sum,
    output cout);

wire wi0,wi1,wi2;
// put your design here
and(wi0,a,b);
and(wi1,b,Cin);
and(wi2,a,Cin);
or(cout,wi0,wi1,wi2);
xor(Sum,a,b,Cin);
endmodule