/*
Guia_0304.v
999999 - Xxx Yyy Zzz
*/
module Guia_0304;
// define data

reg signed [7:0] a = 8'b0001_1101 ; // binary
reg signed [7:0] b = 8'b0000_1101 ; // binary
reg signed [7:0] c = 8'b0101_1001 ; // binary
reg signed [7:0] d = 8'b0010_0100 ; // binary
reg signed [7:0] e = 8'b0011_1001 ; // binary
reg signed [7:0] f = 8'b0010_0111 ; // binary
reg signed [7:0] g = 8'b1110_1100 ; // binary
reg signed [7:0] h = 8'b1011_0101 ; // binary
reg signed [11:0] i = 12'b0110_1010_0010 ; // binary
reg signed [11:0] j = 12'b1100_0001_0100 ; // binary

reg signed [7:0] k = 0 ; // binary
reg signed [7:0] l = 0 ; // binary
reg signed [7:0] m = 0 ; // binary
reg signed [7:0] n = 0 ; // binary
reg signed [7:0] o = 0 ; // binary

// actions
initial
begin : main
$display ( "Guia_0304 - Tests" );

$display ( "a = %8b = %d", a, a );
$display ( "b = %8b = %d", b, b );
k = a-b;
$display ( "d = a-b = %8b-%8b = %8b = %d", a, b, k, k );

$display ( "c = %8b = %d", c, c );
$display ( "d = %8b = %d", d, d );
l = c-d;
$display ( "d = c-d = %8b-%8b = %8b = %d", c, d, l, l );

$display ( "e = %8b = %d", e, e );
$display ( "f = %8b = %d", f, f );
m = e-f;
$display ( "d = e-f = %8b-%8b = %8b = %d", e, f, m, m );

$display ( "g = %8b = %d", g, g );
$display ( "h = %8b = %d", h, h );
n = g-h;
$display ( "d = g-h = %8b-%8b = %8b = %d", g, h, n, n );

$display ( "i = %12b = %d", i, i ); // 12 bits
$display ( "j = %12b = %d", j, j ); // 12 bits
o = i-j;
$display ( "d = i-j = %12b-%12b = %12b = %d", i, j, o, o ); // 12 bits

end // main
endmodule // Guia_0304
