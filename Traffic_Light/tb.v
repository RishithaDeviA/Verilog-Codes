`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 17:20:16
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
 parameter red_time=30;
 parameter yellow_time=5;
 parameter green_time=25;
 reg clk,reset;
 wire red_light,yellow_light,green_light;
 
traffic_controller #(
  .red_time(red_time),
  .yellow_time(yellow_time),
  .green_time(green_time)
) uut (
  .clk(clk),
  .reset(reset),
  .red_light(red_light),
  .yellow_light(yellow_light),
  .green_light(green_light)
);

 initial begin
   clk=1'b0;
   forever #5 clk=~clk; 
 end
 
 initial begin
   reset=1'b1;
   #20
   reset=1'b0;
 end
 
initial begin
  #1000;  // run simulation for 1000 ns
  $finish;
end

endmodule