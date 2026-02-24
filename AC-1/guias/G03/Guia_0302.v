/*
Guia_0302.v
999999 - Xxx Yyy Zzz
*/
module Guia_0302;
// define data
reg [7:0] b = 8'hC4 ; // hexadecimal
reg [6:0] d = 8'o153 ; // octal
reg [7:0] e = 8'h7D ; // hexadecimal

reg [5:0] a = 6'b011011; // 123(4) = 011011(2)
reg [5:0] c = 6'b110010; // 312(4) = 110010(2)

reg [7:0] f = 0 ; // binary
reg [6:0] g = 0 ; // binary
reg [5:0] h = 0 ; // binary
reg [5:0] i = 0 ; // binary
reg [5:0] j = 0 ; // binary
// actions
initial
begin : main
$display ( "Guia_0302 - Tests" );
i = ~a+1;
$display ( "a = %6b -> C1(a) = %6b -> C2(a) = %6b", a, ~a, i );
f = ~b+1;
$display ( "b = %8b -> C1(b) = %8b -> C2(b) = %8b", b, ~b, f );
j = ~c+1;
$display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b", c, ~c, j );
g = ~d+1;
$display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b", d, ~d, g );
h = ~e+1;
$display ( "e = %8b -> C1(e) = %8b -> C2(e) = %8b", e, ~e, h );
end // main
endmodule // Guia_0302
