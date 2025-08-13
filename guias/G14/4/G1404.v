module G1404(input clk, input ld, input rst, output reg [4:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 5'b00000;
    else if (ld)
      q <= 5'b10000; // carga no MSB (bit mais à esquerda)
    else
      q <= {~q[0], q[4:1]}; // twisted shift à esquerda
  end
endmodule
