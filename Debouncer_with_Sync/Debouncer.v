`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.08.2025 20:24:57
// Design Name: 
// Module Name: debouncer
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


module debouncer #(
parameter width=10)(
input wire btn_in,rst_n,clk,
output reg rst_out
    );
reg sync_1,sync_2;
always@(posedge clk or negedge rst_n)
begin
 if(!rst_n)begin 
  sync_1<=0;
  sync_2<=0;
 end 
 else begin
 sync_1<=btn_in;
 sync_2<=sync_1;
 end
end
wire synced_btn=sync_2;
reg [width-1:0]counter;
always@(posedge clk or negedge rst_n)begin
  if (!rst_n) begin
    rst_out <= 0;
    counter <= 0;
  end 
else if (synced_btn == rst_out) begin
 counter<={width{1'b0}};
end
else if (&counter)begin
 rst_out<=synced_btn;
 counter<={width{1'b0}};
end
else counter<=counter+1'b1;

end
endmodule
