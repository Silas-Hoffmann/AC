module RAM_4x8 (output [7:0] data_out, input [7:0] data_in, input clk, clr, rw, input [1:0] addr);
wire sel0 = (addr[1:0] == 2'b00) | (addr[1:0] == 2'b01);
wire sel1 = (addr[1:0] == 2'b10) | (addr[1:0] == 2'b11);
wire [7:0] dout0, dout1;

RAM_2x8 ram0 (dout0, data_in, clk, clr, rw, addr[0]);
RAM_2x8 ram1 (dout1, data_in, clk, clr, rw, addr[0]);

assign data_out = addr[1] ? dout1 : dout0;
endmodule
