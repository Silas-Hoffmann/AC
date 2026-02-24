module G1401(input clk, input ld, input rst, output reg [4:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 5'b00000;
    else if (ld)
      q <= {q[3:0], 1'b1}; // carrega 1 no primeiro estágio (LSB)
    else
      q <= {q[3:0], 1'b0}; // deslocamento normal à esquerda
  end
endmodule
