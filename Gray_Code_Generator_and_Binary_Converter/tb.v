`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 23:17:22
// Design Name: 
// Module Name: tb
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


module tb;
 parameter N = 4;
 reg [N-1:0] bin_in; 
 reg [N-1:0] gray_in;
 wire [N-1:0] gray_out;
 wire [N-1:0] bin_out;
  gray_code_converter #(N) uut(
  .bin_in(bin_in),
  .gray_in(gray_in),
  .gray_out(gray_out),
  .bin_out(bin_out));
  initial begin
  
   bin_in<=4'b0110;
   gray_in<=4'b0110;
   #10;
   bin_in<=4'b1110;
   gray_in<=4'b0010;
   #10;
   bin_in<=4'b0000;
   gray_in<=4'b0111;
   #10;
   $finish;
  end
endmodule
