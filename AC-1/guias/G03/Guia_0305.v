/*
Guia_0305.v
999999 - Xxx Yyy Zzz
*/
module Guia_0305;
// define data
reg [5:0] a = 6'b110110 ;
reg [3:0] b = 4'b1101 ;
reg [6:0] c = 7'b1011011 ;
reg [5:0] d = 6'b011100 ;  // 3,4(8) = 0011 0100(2)
reg [7:0] e = 8'b11100111 ; // 231(4) = 11100111(2)
reg [7:0] f = 8'b00111010 ; // 3A(16) = 00111010(2)
reg [7:0] g = 8'b11010011 ; // D3(16) = 11010011(2)
reg [6:0] h = 7'b1101111 ;
reg [7:0] i = 8'b01011110 ; // 5E(16) = 01011110(2)
reg [7:0] j = 8'b00111100 ; // 3C(16) = 00111100(2)

// actions
initial
begin : main
$display ( "Guia_0305 - Tests" );

$display("a - b = %6b - %4b = %6b = %d", a, b, (a - b), (a - b));

$display("c - d = %7b - %6b = %7b = %d", c, d, (c - d), (c - d));

$display("e - f = %8b - %8b = %8b = %d", e, f, (e - f), (e - f));

$display("g - h = %8b - %7b = %8b = %d", g, h, (g - h), (g - h));

$display("i - j = %8b - %8b = %8b = %d", i, j, (i - j), (i - j));

end // main
endmodule // Guia_0305
