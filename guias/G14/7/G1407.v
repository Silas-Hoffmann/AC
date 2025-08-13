module G1407(input clk, input rst, input ld, input [5:0] data, output reg [5:0] q);
  always @(posedge clk or posedge rst) begin
    if (rst)
      q <= 6'b000000;
    else if (ld)
      q <= data;
    else
      q <= {q[0], q[5:1] ^ 6'b000001}; // twisted shift à direita
  end
endmodule
