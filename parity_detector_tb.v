`timescale 1ns / 1ps

module parity_detector_tb;
  reg  in, clk, areset;
  wire parity_bit;

  parity_detector u1 (.in(in), .clk(clk), .areset(areset), .parity_bit(parity_bit));

  // clock
  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    in = 0; areset = 0;

    // reset
    #2  areset = 1;      // t=2
    #10 areset = 0;      // t=12

    // send 1101 (one bit per clock, changed midway between posedges)
    #8  in = 1;          // t=20, bit 1
    #10 in = 1;          // t=30, bit 2
    #10 in = 0;          // t=40, bit 3
    #10 in = 1;          // t=50, bit 4
    #10 in = 0;          // t=60, idle bit so the last 1 is sampled only once

    #20 $finish;         // t=80
  end

  initial $monitor("t=%0t areset=%b in=%b parity_bit=%b", $time, areset, in, parity_bit);
endmodule
