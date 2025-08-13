module G1405(input clk, input ld, input rst, input [4:0] data, output reg dout);
  reg [4:0] shift;
  always @(posedge clk or posedge rst) begin
    if (rst)
      shift <= 5'b00000;
    else if (ld)
      shift <= data; // carrega os 5 bits
    else
      shift <= {1'b0, shift[4:1]}; // desloca à direita
  end
  always @(*) begin
    dout = shift[0]; // saída serial
  end
endmodule
