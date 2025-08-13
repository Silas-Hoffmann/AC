/*
Guia_0303.v
999999 - Xxx Yyy Zzz
*/
module Guia_0303;
// define data
reg signed [4:0] a = 5'b10101 ; // binary
reg signed [5:0] b = 6'b110101 ; // binary
reg signed [5:0] c = 6'b100110 ; // binary
reg signed [6:0] d = 7'b1010111 ; // binary
reg signed [6:0] e = 7'b1110101 ; // binary

reg signed [4:0] f = 0 ; // binary
reg signed [5:0] g = 0 ; // binary
reg signed [5:0] h = 0 ; // binary
reg signed [6:0] i = 0 ; // binary
reg signed [6:0] j = 0 ; // binary
// actions
initial
begin : main
    $display ( "Guia_0303 - Tests" );
    
    f = ~a+1;
    g = ~(a-1);
    $display ( "a = %8b -> C1(a) = %8b -> C2(a) = %8b = %d = %d", a, ~a, f, f, g );

    f = ~b+1;
    g = ~(b-1);
    $display ( "b = %7b -> C1(b) = %7b -> C2(b) = %7b = %d = %d", b, ~b, f, f, g );

    f = ~c+1;
    g = ~(c-1);
    $display ( "c = %6b -> C1(c) = %6b -> C2(c) = %6b = %d = %d", c, ~c, f, f, g );

    h = ~d+1;
    i = ~(d-1);
    $display ( "d = %7b -> C1(d) = %7b -> C2(d) = %7b = %d = %d", d, ~d, h, h, i );

    h = ~e+1;
    i = ~(e-1);
    $display ( "e = %7b -> C1(e) = %7b -> C2(e) = %7b = %d = %d", e, ~e, h, h, i );

end // main
endmodule // Guia_0303