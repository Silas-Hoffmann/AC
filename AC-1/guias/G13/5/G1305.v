module contador_mod7_T(output [2:0] Q, input clk, input rst);
  wire T0, T1, T2;
  assign T0 = 1;
  assign T1 = Q[0];
  assign T2 = Q[0] & Q[1];

  t_ff ff0(Q[0], T0, clk, rst);
  t_ff ff1(Q[1], T1, clk, rst);
  t_ff ff2(Q[2], T2, clk, rst);
endmodule
