module contador_crescente_JK_6bits(output [5:0] Q, input clk, input rst);
  wire [5:0] J, K;
  assign J = 6'b111111;
  assign K = 6'b111111;

  jk_ff ff0(Q[0], , J[0], K[0], clk, rst);
  jk_ff ff1(Q[1], , J[1], K[1], ~Q[0], rst);
  jk_ff ff2(Q[2], , J[2], K[2], ~Q[1], rst);
  jk_ff ff3(Q[3], , J[3], K[3], ~Q[2], rst);
  jk_ff ff4(Q[4], , J[4], K[4], ~Q[3], rst);
  jk_ff ff5(Q[5], , J[5], K[5], ~Q[4], rst);
endmodule
