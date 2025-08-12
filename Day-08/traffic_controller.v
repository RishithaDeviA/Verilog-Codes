`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.08.2025 15:27:49
// Design Name: 
// Module Name: traffic_controller
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


module traffic_controller #(
 parameter red_time=30_000_000,
 parameter yellow_time=5_000_000,
 parameter green_time=25_000_000)(
 input wire clk,reset,
 output reg red_light,yellow_light,green_light);
 
 localparam red = 2'b00, green = 2'b01, yellow = 2'b10;
 
 reg [1:0] current_state;
 wire[1:0] next_state;
 reg[31:0]timer_count;
 
 always@(posedge clk,posedge reset)begin
 
  if (reset==1'b1)begin
      timer_count<=0;
      current_state<=red;
     end 
  else if (timer_count>=(current_state==yellow?yellow_time:current_state==green?green_time:red_time))begin
        timer_count<=0;
        current_state<=next_state;
       end
  else begin
   timer_count <= timer_count + 1;
  end  
 end

assign next_state=(current_state==red)?yellow:
                  (current_state==yellow)?green:red;
//                  (current_state==green)?red:red;
   
 always@* begin
   red_light<=(current_state==red);
   yellow_light<=(current_state==yellow);
   green_light<=(current_state==green);
 end
 
endmodule
