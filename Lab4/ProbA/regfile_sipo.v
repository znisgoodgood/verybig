`timescale 1ns/10ps

// ---------------------- define ---------------------- //
`define AddrSize  7
`define DataSize  32
`define RegSize   128

// ---------------------------------------------------- //
module regfile_sipo(clk, rst, reg_enable, reg_write, src_addr,
                                write_addr, write_data, src1, src2, src3, src4, src5);

// ---------------------- input  ---------------------- //
input clk;
input rst;
input reg_enable;
input reg_write;

input [`AddrSize-1:0] src_addr;
input [`AddrSize-1:0] write_addr;
input [`DataSize-1:0] write_data;

// ---------------------- output ---------------------- //
output [`DataSize-1:0] src1;
output [`DataSize-1:0] src2;
output [`DataSize-1:0] src3;
output [`DataSize-1:0] src4;
output [`DataSize-1:0] src5;

// ----------------------  reg   ---------------------- //
reg [`DataSize-1:0] src1;
reg [`DataSize-1:0] src2;
reg [`DataSize-1:0] src3;
reg [`DataSize-1:0] src4;
reg [`DataSize-1:0] src5;
reg [`DataSize-1:0] R [`RegSize-1:0];
// ----------please write your code here--------------- //
integer i;
always@(posedge clk)begin
                if(rst)begin    
                        src1 <= src1 & 32'd0;
                        src2 <= src2 & 32'd0;
                        src3 <= src3 & 32'd0;
                        src4 <= src4 & 32'd0;
                        src5 <= src5 & 32'd0;
                        for(i=0;i<`RegSize;i=i+1)begin
                                        R[i] <= R[i] &32'd0;
                        end
                end 
                if(reg_enable)begin
                    if(reg_write)begin
                            for(i=0;i<`RegSize;i=i+1)begin
                                    if(i==write_addr)
                                            R[i] <= write_data;           
                            end     
                    end
                    else begin
                        for(i=0;i<`RegSize-4;i = i + 1)begin
                                if(i==src_addr)begin
                                        src1 <= R[i];
                                        src2 <= R[i+1];
                                        src3 <= R[i+2];
                                        src4 <= R[i+3];
                                        src5 <= R[i+4];
                                end  
                        end     
                    end     
            end 
end
endmodule
