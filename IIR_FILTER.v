`timescale 1ns / 1ps
module IIR_FILTER (x_in, clk, rst, y_out);

    parameter a = 4'b0111; //7
    input clk, rst;
    input [3:0] x_in;
    output signed [7:0] y_out;  //  7*x_n + y_n-4
    
    reg signed [7:0] y1,y2,y3,y4;
    wire signed [7:0] baugh_prod;
    
    Baugh_Woolay_mult bm(a,x_in,baugh_prod);
    
    always@(posedge clk) begin
     y4 = rst ? 'b0 : y3;
        y3 = rst ? 'b0 : y2;
         y2 = rst ? 'b0 : y1;
          y1 = rst ? 'b0 : y_out;
    end
    
    assign y_out = y4 + baugh_prod;

endmodule
