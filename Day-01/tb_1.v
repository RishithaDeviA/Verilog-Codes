`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 12:52:38
// Design Name: 
// Module Name: tb_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_1;

parameter N = 4;

reg [N-1:0] a, b;
wire [N-1:0] sum,carry_out,overflow;

n_bit_adder #(.N(N)) uut (
        .a(a),
        .b(b),
        .sum(sum),
        .carry_out(carry_out),
        .overflow(overflow)
    );
 initial begin
 a=4'd3;b=4'd4;#10;
 a=4'd2;b=4'd7;#10;
 a=4'b1110;b=4'b1100;#10;
 a=4'b1011;b=4'b1010;#10;
 a=4'b1101;b=4'b0010;#10;
  end  
endmodule
