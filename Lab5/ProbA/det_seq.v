module det_seq(clk, rst, d, q, num);


input clk, rst;
input d;
output  q;
output  [2:0] num;
parameter s0 = 3'b000,
                  s1 = 3'b001,
                  s2 = 3'b010,
                  s3 = 3'b011,
                  s4 = 3'b100,
                  s5 = 3'b101,
                  s6 = 3'b110;
reg q;
reg [2:0]cs,ns;
reg [2:0]num;

always@(posedge clk)begin
        if(rst) begin
                cs <= s0;
                num <= 3'b000;
        end        
        else begin
                cs <= ns;
                if(q==1'b1)
                        num <= num +3'd1;
                else
                        num <= num;
        end
end

always@(cs or d)begin
        case(cs)
                s0:begin//0
                    if(d==1'b1)
                            ns = s1;
                    else
                            ns = s0;
                end     
                s1:begin//1
                        if(d==1'b0)
                                ns = s2;
                        else
                                ns = s1;
                end
                s2:begin//10
                        if(d==1'b1)
                                ns = s3;
                        else
                                ns = s0;
                end
                s3:begin//101
                        if(d==1'b0)
                                ns = s4;
                        else
                                ns = s1;
                end
                s4:begin//1010
                        if(d==1'b1)
                                ns = s5;
                        else
                                ns = s0;
                end     
                s5:begin//10101
                    if(d==1'b1)
                        ns = s6;  
                    else
                        ns = s2;
                end
                s6:begin//101011
                    if(d==1'b1)
                        ns = s1;  
                    else
                        ns = s2;
                end
                default:
                        ns = s0;
        endcase
end     

always@(cs)begin
        case(cs)
                s0:begin
                        q = 1'b0;
                end     
                s1:begin
                        q = 1'b0;
                end     
                s2:begin
                        q = 1'b0;
                end     
                s3:begin
                        q = 1'b0;
                end     
                s4:begin
                        q = 1'b0;
                end                     
                s5:begin
                        q = 1'b0;
                end     
                s6:begin
                        q = 1'b1;
                end
                default:begin
                        q = 1'b0;  
                end     
        
        endcase
        
end     	

endmodule






















