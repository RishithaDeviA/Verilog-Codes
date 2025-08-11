module gray_code_converter #(
    parameter N = 4  
)(
    input  wire [N-1:0] bin_in,  
    input  wire [N-1:0] gray_in,  
    output  [N-1:0] gray_out,
    output  [N-1:0] bin_out   
);

 
    assign gray_out = bin_in ^ (bin_in >> 1);

    integer i;
    reg [N-1:0] bin_temp;
    always @(*) begin
        bin_temp[N-1] = gray_in[N-1]; 
        for (i = N-2; i >= 0; i = i - 1)
            bin_temp[i] = bin_temp[i+1] ^ gray_in[i];
    end

    assign bin_out = bin_temp;

endmodule
