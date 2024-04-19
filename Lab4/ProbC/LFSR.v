module LFSR(
       input clk,
       input rst,
       input seed_val,
       input [7:0] seed,//if rst=1, d=8'd0
       output reg [7:0] d// d[0] = (d[7]^d[5]) ^ (d[4] ^ d[2])
);
always@(posedge clk)begin
       if(rst)begin
               d <= 8'd0;      
       end
       else begin
               if(seed_val)
                       d <= seed;
               else
                       d <= {d[6:0],(d[7]^d[5])^(d[4]^d[2])};
       end     
end            
endmodule

