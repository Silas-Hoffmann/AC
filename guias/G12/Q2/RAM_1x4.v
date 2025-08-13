module RAM_1x4 (output [3:0] data_out, input [3:0] data_in, input clk, clr, rw, addr);
wire enable = rw & addr;
wire J, K;

assign J = enable & data_in;
assign K = enable & (~data_in);

genvar i;
generate
  for (i=0; i<4; i=i+1) begin: ram_cells
    JK_FF jkff (.Q(data_out[i]), .J(J[i]), .K(K[i]), .clk(clk), .clr(clr));
  end
endgenerate
endmodule
