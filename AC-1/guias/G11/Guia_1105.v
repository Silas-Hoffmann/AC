module Guia_1105 ( y, x, clk, reset );
output reg y;
input x;
input clk;
input reset;

parameter
  start  = 3'b000,
  s1_0   = 3'b001,
  s1_1   = 3'b010,
  s2_01  = 3'b011,
  s2_10  = 3'b100,
  found  = 3'b101;

reg [2:0] state, next_state;

always @( x or state ) begin
  case (state)
    start:  next_state = x ? s1_1 : s1_0;
    s1_0:   next_state = x ? s2_01 : start;
    s1_1:   next_state = x ? start : s2_10;
    s2_01:  next_state = x ? found : start;
    s2_10:  next_state = x ? found : start;
    found:  next_state = found;
    default: next_state = start;
  endcase
end

always @( posedge clk or negedge reset ) begin
  if (!reset)
    state <= start;
  else
    state <= next_state;
end

always @( state ) begin
  if (state == found)
    y = 1;
  else
    y = 0;
end

endmodule
