`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.08.2025 11:57:19
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
reg clk_in;
reg rst_n;
reg [15:0] total_cycles;
reg [15:0] high_cycles;
wire clk_out;

clock_divider uut(
.clk_in(clk_in),
.rst_n(rst_n),
.total_cycles(total_cycles),
.high_cycles(high_cycles),
.clk_out(clk_out)
);
initial clk_in<=1'b0;
always #5 clk_in=~clk_in;

initial begin 
rst_n<=1'b0;
#10;
rst_n<=1'b1;
end

initial begin
total_cycles<=16'h0014;
high_cycles<=16'h0000;
#1000;
high_cycles<=16'h0005;

#1000;
high_cycles<=16'h000a;

#1000;
high_cycles<=16'h000f;

#1000;
total_cycles<=16'h000a;
high_cycles<=16'h0005;

#1000;
high_cycles<=16'h0003;

#1000;
$finish;
end
endmodule
