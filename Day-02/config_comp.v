`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 13:03:54
// Design Name: 
// Module Name: config_comp
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


module config_comp#(
parameter WIDTH=4)(
input [WIDTH-1:0]A,
input [WIDTH-1:0]B,
input is_signed,
output greater_than,less_than,equal
    );
wire signed [WIDTH-1:0] A_signed=A;
wire signed [WIDTH-1:0] B_signed=B;

assign greater_than=is_signed?A_signed>B_signed:A>B;
assign less_than=is_signed?A_signed<B_signed:A<B;
assign equal=(A==B);

endmodule
