module contador_anel_torcido(output [5:0] Q, input clk, input rst);
  wire [5:0] D;
  assign D = {~Q[0], Q[5:1]}; // desloca e inverte o bit mais significativo

  jk_ff ff0(Q[0], , D[0], ~D[0], clk, rst);
  jk_ff ff1(Q[1], , D[1], ~D[1], clk, rst);
  jk_ff ff2(Q[2], , D[2], ~D[2], clk, rst);
  jk_ff ff3(Q[3], , D[3], ~D[3], clk, rst);
  jk_ff ff4(Q[4], , D[4], ~D[4], clk, rst);
  jk_ff ff5(Q[5], , D[5], ~D[5], clk, rst);
endmodule
