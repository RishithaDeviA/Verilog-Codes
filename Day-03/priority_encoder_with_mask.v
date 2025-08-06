`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.08.2025 14:14:43
// Design Name: 
// Module Name: priority_encoder_with_mask
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


module priority_encoder_with_mask #(
parameter WIDTH=16,
parameter OUT_WIDTH=$clog2(WIDTH))(
    input  wire [WIDTH-1:0] data_in,  
    input  wire [WIDTH-1:0] mask,        
    output reg  [OUT_WIDTH-1:0] encoded_out, 
    output reg  valid 
    );
 integer i;
 reg found;
 wire [WIDTH-1:0]masked_in=data_in&mask;
always@* begin
 valid=0;
 found=0;
 encoded_out=0;
   for(i=WIDTH-1;i>=0;i=i-1) 
     begin
       if (!found&&masked_in[i])
         begin
            encoded_out=i[OUT_WIDTH-1:0];
            valid=1;
            found=1;
         end
      end
 end
endmodule

  
