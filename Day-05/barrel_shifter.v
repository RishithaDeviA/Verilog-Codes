`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2025 12:52:10
// Design Name: 
// Module Name: barrel_shifter
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


module barrel_shifter#(
parameter data_width=8,
parameter shift_width=$clog2(data_width))(
input wire [data_width-1:0]in_data,
input wire [shift_width-1:0]shift_amount,
input wire shift_direction,
input wire [1:0]shift_type,
output reg [data_width-1:0]out_data
    );
reg  msb;
reg [data_width-1:0] logical_shift ; 
reg [data_width-1:0] sign_extend_mask;
always@* begin 
 if (shift_amount!=0)
  begin 
    case (shift_type)
      2'b00:
        begin 
          if(shift_direction==0)
            begin 
             out_data=in_data<<shift_amount;
            end
          else
            begin
              out_data=in_data>>shift_amount;
            end
         end
       2'b01:
          begin 
            if (shift_amount!=0)
              begin
               msb=in_data[data_width-1];
               logical_shift = in_data >> shift_amount;
               sign_extend_mask = {data_width{msb}}<<(data_width-shift_amount);
               out_data=sign_extend_mask | logical_shift;
              end
          end
       2'b10:
         begin 
           if(shift_direction==0)
             begin 
               out_data=(in_data<<shift_amount)|(in_data>>(data_width-shift_amount));
             end
           else
             begin
               out_data=(in_data<<(data_width-shift_amount))|(in_data>>shift_amount);
             end
         end
       default:
         begin
           out_data=in_data;
         end
    endcase
  end 
  else
    begin
      out_data=in_data;
    end
end
endmodule
