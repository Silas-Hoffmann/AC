module G1402(input clk, input ld, input rst, input [4:0] data, output reg [4:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 5'b00000;
    else if (ld)
      q <= data; // carrega todos os estágios
    else
      q <= {q[3:0], 1'b0}; // desloca à esquerda
  end
endmodule
