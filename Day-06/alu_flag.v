`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 10:17:32
// Design Name: 
// Module Name: alu_flag
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


module alu_flag#(
parameter data_width=8,
parameter shift_width =$clog2(data_width)
    )(
 input wire[data_width-1:0]a,
 input wire[data_width-1:0]b,
 input wire[2:0]alu_opcode,
 output reg [data_width-1:0]result,
 output reg zero,negative,overflow,carryahead);
 wire [shift_width-1:0] shift_amt; 
 assign shift_amt=b[shift_width-1:0];
 always@* begin
  result     = {data_width{1'b0}};
  carryahead     = 1'b0;
  overflow   = 1'b0;
  zero       = 1'b0;
  negative   = 1'b0;

 case(alu_opcode) 
    3'b000://add
      begin
        {carryahead, result} = a + b;
         overflow = (a[data_width-1] == b[data_width-1]) &&
                    (result[data_width-1] != a[data_width-1]);
          negative=result[data_width-1];  
      end
    3'b001://sub
      begin
         {carryahead, result} = a - b;
         overflow = (a[data_width-1] != b[data_width-1]) &&
                    (result[data_width-1] != a[data_width-1]);
         negative=result[data_width-1];  
      end
    3'b010:result=a&b;//and
    3'b011:result=a|b;//or  
    3'b100:result=a^b;//xor
    3'b101:
       begin
         result=($signed(a)<$signed(b))?1:0; 
         negative=result[data_width-1];  //slt
       end
    3'b110:
      begin 
        result=$signed(a)>>shift_amt;//sra
        negative=result[data_width-1];  
        end
    default:begin
         result=a;
           end
  endcase   
  zero=(result==0);
 
 end
endmodule
