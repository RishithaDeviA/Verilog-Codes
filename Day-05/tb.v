`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2025 14:52:53
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
reg [data_width-1:0]in_data;
reg [shift_width-1:0]shift_amount;
reg shift_direction;
reg [1:0]shift_type;
wire [data_width-1:0]out_data;

barrel_shifter #(data_width,shift_width)uut(
in_data,
shift_amount,
shift_direction,
shift_type,
out_data
);
initial
begin
in_data=8'b11101001;
shift_amount=3'b101;
shift_direction=1'b1;
shift_type=2'b00;
$display("in_data\t\tshift_type\tshift_amount\tout_data");
$monitor("%b\t%b\t        %b\t            %b",in_data,shift_type,shift_amount,out_data);

#10;
in_data=8'b00101011;
shift_amount=3'b010;
shift_direction=1'b0;
shift_type=2'b00;

#10;
in_data=8'b10101011;
shift_amount=3'b011;
shift_direction=1'b0;
shift_type=2'b01;

#10;
in_data=8'b10100110;
shift_amount=3'b100;
shift_direction=1'b1;
shift_type=2'b10;

#10;
in_data=8'b10101101;
shift_amount=3'b001;
shift_direction=1'b0;
shift_type=2'b11;
#10;
$finish;
end
endmodule
