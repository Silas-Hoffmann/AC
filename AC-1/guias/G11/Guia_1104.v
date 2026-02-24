module Guia_1104 ( y, x, clk, reset );
output reg y;
input x;
input clk;
input reset;

parameter
  start = 3'b000,
  one   = 3'b001,
  two   = 3'b010,
  three = 3'b011;

reg [2:0] state, next_state;

always @( x or state ) begin
  case (state)
    start:  next_state = x ? one : start;
    one:    next_state = x ? two : start;
    two:    next_state = x ? three : start;
    three:  next_state = x ? three : start;
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
  if (state == three)
    y = 1;
  else
    y = 0;
end

endmodule
