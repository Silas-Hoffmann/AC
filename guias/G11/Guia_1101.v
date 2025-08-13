module Guia_1101 ( y, x, clk, reset );
output reg y;
input x;
input clk;
input reset;

parameter
  start = 3'b000,
  id1   = 3'b001,
  id10  = 3'b010,
  id101 = 3'b011,
  id1010= 3'b100,
  stop  = 3'b101;

reg [2:0] state, next_state;

always @( x or state ) begin
  case (state)
    start:  next_state = x ? id1 : start;
    id1:    next_state = x ? id1 : id10;
    id10:   next_state = x ? id101 : start;
    id101:  next_state = x ? id1 : id1010;
    id1010: next_state = stop;
    stop:   next_state = stop;
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
  if (state == id1010)
    y = 1;
  else
    y = 0;
end

endmodule
