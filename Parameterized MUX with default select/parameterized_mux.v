`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.08.2025 11:57:31
// Design Name: 
// Module Name: parameterized_mux
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


module parameterized_mux#(
parameter width=4,
parameter n=4
    )(
    input wire [n*width-1:0]in,
    input wire [n-1:0]req,
    output reg [n-1:0]grant,
    output reg [width-1:0]out);
   integer i;
   wire [width-1:0] in_flat [n-1:0];
  genvar j;
   generate
  for (j = 0; j < n; j = j + 1) begin
    assign in_flat[j] = in[(j+1)*width - 1 : j*width];
  end
  endgenerate
   always@* begin
    grant=0;
    out=0; 
    for(i=0;i<n;i=i+1) begin
      if(req[i]==1&&grant==0) begin
        grant=1<<i;
         out=in_flat[i];
      end
    end
   end
endmodule
