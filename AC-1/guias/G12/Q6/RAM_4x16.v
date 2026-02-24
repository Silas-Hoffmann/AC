module RAM_4x16 (output [15:0] data_out, input [15:0] data_in, input clk, clr, rw, input [1:0] addr);
RAM_4x8 ram_low (data_out[7:0], data_in[7:0], clk, clr, rw, addr);
RAM_4x8 ram_high (data_out[15:8], data_in[15:8], clk, clr, rw, addr);
endmodule
