`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.08.2025 13:11:23
// Design Name: 
// Module Name: TB
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


module TB;
parameter WIDTH=4;
reg [WIDTH-1:0]A,B;
reg is_signed;
wire greater_than,less_than,equal; 
  
config_comp#(4)uut(
.A(A),
.B(B),
.is_signed(is_signed),
.greater_than(greater_than),
.less_than(less_than),
.equal(equal)
);
initial begin

A=4'B1000;B=4'B0011;is_signed=0; #10;
A=4'B0010;B=4'B1001;is_signed=0; #10;
A=4'B1110;B=4'B1110;is_signed=0; #10;
A=4'B1101;B=4'B1110;is_signed=1; #10;
A=4'B1011;B=4'B1010;is_signed=1; #10;
A=4'B1010;B=4'B1010;is_signed=1; #10;

end
endmodule
