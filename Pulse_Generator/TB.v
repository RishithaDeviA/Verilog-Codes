`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 21:18:55
// Design Name: 
// Module Name: Tb
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


module Tb;
reg signal,clk,rst;
wire rising_edge,falling_edge;

pulse_generator uut(
.clk(clk),
.rst(rst),
.signal(signal),
.rising_edge(rising_edge),
.falling_edge(falling_edge));

initial begin
clk<=0;
forever #5 clk<=~clk;
end
initial begin
 rst<=0;
 signal<=0;
 #2
 rst<=1;
 #10;
 rst<=0;
 #10;
 signal<=1;
 #20;
 signal<=0;
 #10;
 signal <=1;
 #30;
 signal<=0;
 #40;
 signal <=1;
#20;
$finish;
end
endmodule
