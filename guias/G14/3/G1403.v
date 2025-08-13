module G1403(input clk, input ld, input rst, output reg [4:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 5'b00000;
    else if (ld)
      q <= 5'b00001; // carrega 1 no LSB
    else
      q <= {q[0], q[4:1]}; // desloca circularmente para a direita
  end
endmodule
