module JK_FF (output reg Q, input J, K, clk, clr);
always @(posedge clk or posedge clr) begin
  if (clr) Q <= 0;
  else begin
    case ({J,K})
      2'b00: Q <= Q;
      2'b01: Q <= 0;
      2'b10: Q <= 1;
      2'b11: Q <= ~Q;
    endcase
  end
end
endmodule
