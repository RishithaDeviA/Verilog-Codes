`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 21:13:50
// Design Name: 
// Module Name: pulse_generator
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


module pulse_generator(
input wire clk,rst,signal,
output reg rising_edge,falling_edge );
reg prev;
always@(posedge clk)
if(rst)begin
 prev<=0;
 rising_edge<=0;
 falling_edge<=0;
 end
 else begin
 rising_edge<=(~prev & signal);
 falling_edge<=(prev & ~signal);
 prev<=signal;
 end
endmodule
