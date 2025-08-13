module contador_anel(output [5:0] Q, input clk, input rst);
  wire [5:0] J = 6'b000001, K = 6'b000001;
  wire [5:0] clk_ff;

  assign clk_ff[0] = clk;
  genvar i;
  generate
    for (i = 1; i < 6; i = i + 1)
      assign clk_ff[i] = Q[i - 1];
  endgenerate

  jk_ff ff0(Q[0], , J[0], K[0], clk_ff[0], rst);
  jk_ff ff1(Q[1], , J[0], K[0], clk_ff[1], rst);
  jk_ff ff2(Q[2], , J[0], K[0], clk_ff[2], rst);
  jk_ff ff3(Q[3], , J[0], K[0], clk_ff[3], rst);
  jk_ff ff4(Q[4], , J[0], K[0], clk_ff[4], rst);
  jk_ff ff5(Q[5], , J[0], K[0], clk_ff[5], rst);
endmodule
