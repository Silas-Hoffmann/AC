// ---------------------------
// -- Clock generator
// ---------------------------
module clock ( output clk );
  reg clk;
  initial
    clk = 1'b0;
  always
    #12 clk = ~clk;
endmodule
