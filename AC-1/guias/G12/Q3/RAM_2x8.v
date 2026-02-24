module RAM_2x8 (output [7:0] data_out, input [7:0] data_in, input clk, clr, rw, input [0:0] addr);
wire sel0 = ~addr;
wire sel1 = addr;
wire [7:0] dout0, dout1;

RAM_1x8 ram0 (dout0, data_in, clk, clr, rw, sel0);
RAM_1x8 ram1 (dout1, data_in, clk, clr, rw, sel1);

assign data_out = sel0 ? dout0 : dout1;
endmodule
