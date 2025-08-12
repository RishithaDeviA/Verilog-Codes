module clock_divider(
    input wire clk_in,
    input wire rst_n,
    input wire [15:0] total_cycles,
    input wire [15:0] high_cycles,
    output reg clk_out
);
 reg [15:0] counter;
 reg [15:0] active_total, active_high;
 reg [15:0] pending_total, pending_high;
 
 always @(posedge clk_in or negedge rst_n) begin
    if (!rst_n) begin
        pending_total <= 16'b0;
        pending_high <= 16'b0;
        active_total <= 16'b0;  // Or set to a default non-zero value if desired
        active_high <= 16'b0;
        counter <= 16'b0;
        clk_out <= 1'b0;
    end else begin
        pending_total <= total_cycles;
        pending_high <= high_cycles;
        
        if (active_total == 0 || counter == active_total - 1) begin  
            active_total <= (pending_total == 0) ? 1 : pending_total;  
            active_high <= (pending_high > pending_total) ? pending_total : pending_high;  
            counter <= 16'b0;
        end else begin
            counter <= counter + 1'b1;
        end
        
        clk_out <= (counter < active_high);
    end
end

        
//        if (counter == active_total - 1) begin
//            active_total <= pending_total;
//            active_high <= pending_high;
//            counter <= 16'b0;
//        end else begin
//            counter <= counter + 1'b1;
//        end
        
//        clk_out <= (counter < active_high);
//    end
//end
endmodule
