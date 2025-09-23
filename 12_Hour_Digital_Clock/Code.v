module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss); 
    
    always@(posedge clk)begin
        if(reset)
            ss<=8'h0;
        else if (ena) begin
    if (ss[3:0] == 4'd9) begin
        ss[3:0] <= 4'd0;
              if (ss[7:4] == 4'd5)
                  ss[7:4] <= 4'd0;
              else
                   ss[7:4] <= ss[7:4] + 4'd1;
    end else 
        ss[3:0] <= ss[3:0] + 4'd1;
        end
        end
    
    always@(posedge clk)begin
        if(reset)
            mm<=8'h0;
        else if(ena & (ss==8'h59))begin
            if (mm[3:0] == 4'd9) begin
            mm[3:0] <= 4'd0;
                if (mm[7:4] == 4'd5)
                  mm[7:4] <= 4'd0;
              else
                  mm[7:4] <= mm[7:4] + 4'd1;
    end else 
        mm[3:0] <= mm[3:0] + 4'd1;
        end
        end
    
    always @(posedge clk ) begin
        if (reset) begin
            hh <= 8'h12; 
            pm <= 1'b0;
        end else if (ena & (ss == 8'h59) & (mm == 8'h59)) begin
            if (hh == 8'h11) begin
                hh <= 8'h12;   
                pm <= ~pm;    
            end else if (hh == 8'h12) begin
                hh <= 8'h01;      
            end else if (hh[3:0] == 4'd9) begin
                hh[3:0] <= 4'd0;
                hh[7:4] <= hh[7:4] + 4'd1;
            end else
                hh[3:0] <= hh[3:0] + 4'd1;
        end
    end
   
endmodule

