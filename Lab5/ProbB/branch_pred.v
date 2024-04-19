module branch_pred(clk, rst, taken,p_taken);

input       clk, rst;
input       taken;
output      p_taken;

parameter s0 = 3'b000,
          s1 = 3'b001,
          s2 = 3'b010,
          s3 = 3'b011,
          s4 = 3'b100;

reg [2:0]cs,ns;
reg p_taken;

always@(posedge clk)begin
        if(rst) begin
            cs <= s4;
        end          
        else 
            cs <= ns;
end
always @(cs or taken) begin
    case(cs)
        s4:
            ns = s0;
        s0:begin//taken1
            if(taken==1'b1)
                ns = s1;
            else
                ns = s3;
        end
        s1:begin//taken2
            if(taken==1'b1)
                ns = s1;
            else
                ns = s0;
        end
        s2:begin//not taken1
            if(taken==1'b1)
                ns = s1;
            else
                ns = s3;
        end
        s3:begin//not taken2
            if(taken==1'b1)
                ns = s2;
            else
                ns = s3;
        end
        default:
            ns = s4;
    endcase
end

always @(cs) begin
    case(cs)
        s4: begin
          
        end
            
        s0:
            p_taken = 1'b1;
        s1:
            p_taken = 1'b1;
        s2:
            p_taken = 1'b0;
        s3:
            p_taken = 1'b0;
        default:
            p_taken = 1'b1;    
    endcase
end



endmodule
