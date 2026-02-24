module RAM_1x8 (output [7:0] data_out, input [7:0] data_in, input clk, clr, rw, addr);
RAM_1x4 ram_low (data_out[3:0], data_in[3:0], clk, clr, rw, addr);
RAM_1x4 ram_high (data_out[7:4], data_in[7:4], clk, clr, rw, addr);
endmodule
