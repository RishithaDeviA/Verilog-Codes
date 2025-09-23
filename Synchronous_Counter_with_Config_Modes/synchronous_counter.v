`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.08.2025 10:53:24
// Design Name: 
// Module Name: synchronous_counter
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


module synchronous_counter #(
parameter N=4)(
input wire [N-1:0]data_in,
input wire clk,reset,enable,up_down,load,
output reg [N-1:0]counter
    );
always @(posedge clk) begin
  if (reset) begin
     counter<=0;
  end
  else if (load) begin
    counter <= data_in;
  end
  else begin
         counter<=enable?up_down?
         ((counter=={N{1'b1}})?0:counter+1)://up
         ((counter==0)?{N{1'b1}}:counter-1)://down
         counter;
  end
end
endmodule
