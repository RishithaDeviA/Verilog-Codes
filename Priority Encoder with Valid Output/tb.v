`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 15:15:25
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
parameter WIDTH=16;
parameter OUT_WIDTH=$clog2(WIDTH);
 reg [WIDTH-1:0] data_in;  
 reg [WIDTH-1:0] mask;     
 wire [OUT_WIDTH-1:0] encoded_out; 
 wire valid ;
  priority_encoder_with_mask uut(
  .data_in(data_in),
  .encoded_out(encoded_out),
  .mask(mask),
  .valid(valid)
  );
 initial
 begin
 data_in=16'b0010_0010_1100_1111;
 mask=16'b0000_0000_1000_1100;
 #10;
 
 data_in=16'b1110_0010_1100_1111;
 mask=16'b0000_1110_1000_1100;
 #10;
 
 data_in=16'b0000_0000_0000_0001;
 mask=16'b0000_0000_1000_1100;
 #10;
 
 data_in=16'b0000_0010_1100_1111;
 mask=16'b0000_0000_1000_1100;
 #10;
 
 data_in=16'b0000_0010_0000_0011;
 mask=16'b0000_0000_1000_1110;
 #10;
  $finish;
 end

endmodule
