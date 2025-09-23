`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.08.2025 12:26:45
// Design Name: 
// Module Name: n_bit_adder
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


module n_bit_adder#(
parameter N=8
)(
input [N-1:0]a,[N-1:0]b,
output [N-1:0]sum,carry_out,overflow
    );
    assign {carry_out,sum}=a+b;
    assign overflow=(a[N-1]==b[N-1])&&((sum[N-1]!=b[N-1]));
endmodule
