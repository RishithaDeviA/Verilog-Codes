`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 11:15:00
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
parameter data_width=8;
parameter shift_width=$clog2(data_width);
reg [data_width-1:0]a;
reg [data_width-1:0]b;
reg [2:0]alu_opcode;
wire [data_width-1:0]result;
wire zero,negative,overflow,carryahead;
alu_flag #(data_width,shift_width)uut(
.a(a),
.b(b),
.alu_opcode(alu_opcode),
.result(result),
.zero(zero),
.negative(negative),
.overflow(overflow),
.carryahead(carryahead));
initial begin
a=8'b10101011;
b=8'b01010100;
alu_opcode=3'b000;
forever begin
        #100 alu_opcode = alu_opcode + 1;  
        if (alu_opcode == 3'b111) begin
            #100;  
            $stop; 
        end
    end
end
endmodule
