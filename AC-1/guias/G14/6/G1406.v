module G1406(input clk, input rst, input ld, input [5:0] data, output reg [5:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 6'b000000;
    else if (ld)
      q <= data;
    else
      q <= {q[4:0], q[5]}; // circular para a esquerda
  end
endmodule
