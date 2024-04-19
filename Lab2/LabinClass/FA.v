module FA(
    input  a,
    input  b,
    input  cin, 
    output sum,
    output cout
);
	wire wi0,wi1,wi2;
	// put your design here
	and(wi0,a,b);
	and(wi1,b,cin);
	and(wi2,a,cin);
	or(cout,wi0,wi1,wi2);
	xor(sum,a,b,cin);
endmodule