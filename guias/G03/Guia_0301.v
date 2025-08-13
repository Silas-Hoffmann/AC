/*
Guia_0301.v
999999 - Xxx Yyy Zzz
*/
module Guia_0301;
// define data
reg [7:0] a = 8'b000_1011 ; // binary
reg [6:0] b = 8'b000_1100 ; // binary
reg [5:0] c = 8'b010_0011 ; // binary
reg [7:0] d = 8'b010_1001 ; // binary
reg [6:0] e = 8'b011_1010 ; // binary
reg [5:0] f = 0 ; // binary
reg [5:0] g = 0 ; // binary
reg [5:0] h = 0 ; // binary
reg [5:0] i = 0 ; // binary
reg [5:0] j = 0 ; // binary

// actions
initial
begin : main
$display ( "Guia_0301 - Tests" );
f = ~a+1;
$display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b", a, ~a, f );
g = ~b+1;
$display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b", b, ~b, g );
h = ~c+1;
$display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, h );
i = ~d+1;
$display ( "d = %6b -> C1(d) = %6b -> C2(d) = %6b", d, ~d, i );
j = ~e+1;
$display ( "e = %6b -> C1(e) = %6b -> C2(e) = %6b", e, ~e, j );

end // main
endmodule // Guia_0301