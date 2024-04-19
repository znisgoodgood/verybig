module fixedpoint_s(
    input  [7:0] in1, // signed integer[7:4], decimal[3:0]
    input  [7:0] in2, // signed integer[7:4], decimal[3:0]
    output reg  [7:0] out // 8 bit signed integer[7:0]
);

reg [15:0]temp;
reg [15:0]inv_temp;
//
always@(*)begin
   temp = $signed(in1)*$signed(in2);
   //out = temp[15:8];                             
   if(temp[15]==1'b1)begin
       inv_temp = ~temp;
       inv_temp = inv_temp + 16'd1;
       if(temp[7]==1'b1)
           inv_temp =  inv_temp + 16'h0080; 
       inv_temp = inv_temp -16'd1;
       temp = ~inv_temp;
       out = temp[15:8];  
   end
   
        else begin
            if(temp[7]==1'b1)
                temp =  temp + 16'h0080;
                inv_temp = 16'd0;
            out = temp[15:8];       
        end 
        
   end
   
endmodule
