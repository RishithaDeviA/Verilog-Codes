`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2025 12:34:49
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
parameter width=4;
parameter n=4;
reg  [n*width-1:0]in;
reg [n-1:0]req;
wire [n-1:0]grant;
wire [width-1:0]out;
parameterized_mux #(
width,n)
 uut(
.in(in),
.req(req),
.grant(grant),
.out(out));
task apply_test;
  input [n*width-1:0] in_val;
  input [n-1:0] req_val;
begin
  in = in_val;
  req = req_val;
end
endtask
initial
begin
$display("                Time\t req\tgrant\tout");
$monitor("%t\t%b\t%b\t%h",$time,req,grant,out);

     apply_test({4'hA,4'hB,4'hC,4'hD},4'b0010);
#10; apply_test({4'hA,4'hB,4'hC,4'hD},4'b1001);
#10; apply_test({4'hA,4'hB,4'hC,4'hD},4'b0100);
#10; apply_test({4'hA,4'hB,4'hC,4'hD},4'b0000);
#10; apply_test({4'hA,4'hB,4'hC,4'hD},4'b1111);
#10;
$finish;
end
endmodule
