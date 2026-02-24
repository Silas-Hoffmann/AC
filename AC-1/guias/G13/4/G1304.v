module contador_decadico_decrescente(output [4:0] Q, input clk, input rst);
  wire [4:0] J = 5'b11111, K = 5'b11111;
  wire reset = (Q == 5'd0); // reseta no 0

  jk_ff ff0(Q[0], , J[0], K[0], clk, rst | reset);
  jk_ff ff1(Q[1], , J[1], K[1], Q[0], rst | reset);
  jk_ff ff2(Q[2], , J[2], K[2], Q[1], rst | reset);
  jk_ff ff3(Q[3], , J[3], K[3], Q[2], rst | reset);
  jk_ff ff4(Q[4], , J[4], K[4], Q[3], rst | reset);
endmodule
