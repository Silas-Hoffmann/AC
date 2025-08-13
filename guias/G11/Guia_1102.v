module Guia_1102 ( y, x, clk, reset );
output reg y;
input x;
input clk;
input reset;

parameter
  start = 3'b000,
  id1   = 3'b001,
  id10  = 3'b010,
  id101 = 3'b011,
  found = 3'b100;

reg [2:0] state, next_state;
reg done;

always @( x or state ) begin
  y = 0;
  case (state)
    start:  if (x) next_state = id1; else next_state = start;
    id1:    if (x) next_state = id1; else next_state = id10;
    id10:   if (x) next_state = id101; else next_state = start;
    id101:  if (x) next_state = id1;
            else begin
              next_state = found;
              y = 1;
            end
    found:  next_state = found;
    default: next_state = start;
  endcase
end

always @( posedge clk or negedge reset ) begin
  if (!reset) begin
    state <= start;
    done <= 0;
  end else if (!done) begin
    state <= next_state;
    if (state == id101 && !x) done <= 1;
  end
end

endmodule
