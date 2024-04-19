module pattern_gen(clk, rst, en, sel, pattern, valid);

input clk, rst;
input en;
input [2:0] sel;
output  pattern;
output  valid;
parameter s0 = 3'b000, 
          s1 = 3'b001, 
          s2 = 3'b010,
          s3 = 3'b011, 
          s4 = 3'b100;
reg [2:0] ns ,cs;
reg  pattern;
reg valid;
always @(posedge clk)begin
    if(rst)begin
        cs <= s0;
    end
    else begin
        cs <= ns;
    end
end
always@(*)begin
    case(cs)
        s0: begin
            if(en)begin
                ns = s1;
            end
            else begin
                ns = s0;
            end
        end
        s1:
            ns = s2;
        s2:
            ns = s3;
        s3:
            ns = s4;
        s4:
            ns = s0; 
        default:
            ns = s0;   
    endcase
end    
always@(*)begin
    case(cs)
        s0: 
            pattern = 1'b0;
        s1: 
            pattern = sel[2];
        s2:
            pattern = sel[2];
        s3:
            pattern = sel[1];
        s4: 
            pattern = sel[0];
        default:
            pattern = 1'b0;           
    endcase
end    
always@(*)begin
    if(cs != s0)
        valid = 1'b1;
    else
        valid = 1'b0;
end    
endmodule
