`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2025 11:11:25
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
parameter N=4;
reg [N-1:0] data_in;
reg clk,reset,enable,up_down,load;
wire [N-1:0]counter;
synchronous_counter #(N)uut(
.data_in(data_in),
.clk(clk),
.reset(reset),
.enable(enable),
.up_down(up_down),
.load(load),
.counter(counter)
);
initial begin
clk<=0;
forever #5 clk=~clk;
end
initial begin
reset<=1;
#2;
reset<=0;
#2;
reset<=1;
#12;
reset<=0;
end 
initial begin
data_in<=0;
enable<=0;
up_down<=0;
load<=0;

#10;

enable<=1;
up_down<=1;
#100;

up_down<=0;
#50;

load<=1;
data_in<=4'b1100;
up_down<=1;
#10;
load<=0;
#100;

load<=1;
data_in<=4'b0100;
up_down<=0;#10;
load<=0;
#70;
$finish;
end
endmodule
