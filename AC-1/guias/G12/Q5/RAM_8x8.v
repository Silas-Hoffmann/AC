module RAM_8x8 (output [7:0] data_out, input [7:0] data_in, input clk, clr, rw, input [2:0] addr);
wire sel0 = (addr[2] == 0);
wire sel1 = (addr[2] == 1);
wire [7:0] dout0, dout1;

RAM_4x8 ram0 (dout0, data_in, clk, clr, rw, addr[1:0]);
RAM_4x8 ram1 (dout1, data_in, clk, clr, rw, addr[1:0]);

assign data_out = sel1 ? dout1 : dout0;
endmodule
