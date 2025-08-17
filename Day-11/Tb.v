`timescale 1ns/1ps

module tb_debouncer;

  reg clk;
  reg rst_n;
  reg btn_in;
  wire rst_out;

  // Instantiate DUT with smaller debounce window
  debouncer #(.width(8)) dut (
    .btn_in(btn_in),
    .rst_n(rst_n),
    .clk(clk),
    .rst_out(rst_out)
  );

  // 10 MHz clock -> 100 ns period
  always #50 clk = ~clk;

  initial begin
    $dumpfile("tb_debouncer.vcd");
    $dumpvars(0, tb_debouncer);

    // Init
    clk = 0;
    rst_n = 0;
    btn_in = 0;

    // Release reset
    #200 rst_n = 1;

    // Case 1: short press (too short -> ignored)
    #500 btn_in = 1;   
    #2000 btn_in = 0;  

    // Wait
    #5000;

    // Case 2: long press (should register)
    btn_in = 1;        
    #40000 btn_in = 0; // ~40 µs hold

    // Wait
    #50000;

    // Case 3: bouncing input (fast toggles)
    btn_in = 1;
    #2000 btn_in = 0;
    #2000 btn_in = 1;
    #2000 btn_in = 0;
    #2000 btn_in = 1; // final stable press
    #40000 btn_in = 0;

    #100000;
    $finish;
  end

endmodule
