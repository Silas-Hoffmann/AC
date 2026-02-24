// -------------------------
// Guia_0503.v - NOR GATES
// Nome: Silas Hoffmann Reis Viana
// Matricula: 843283
// -------------------------

module f5_nor (output s, input a, input b);
    // Definir fios auxiliares
    wire not_b, or_ab;
    
    // Inversão de b usando NOR
    nor NOR1 (not_b, b, b);  // not_b = ~b (usando NOR)
    
    // Operação OR entre a e ~b usando NOR
    nor NOR2 (or_ab, a, not_b); // or_ab = a | ~b
    
    // Inversão da operação OR usando NOR
    nor NOR3 (s, or_ab, or_ab);  // s = ~(a | ~b)
endmodule

// -------------------------
// Teste do módulo
// -------------------------
module test_f5;
// ------------------------- Definir dados
reg x;
reg y;
wire s;
f5_nor moduloNor (s, x, y);

// ------------------------- Parte principal
initial
begin : main
    $display("Guia_0503 - Silas Hoffmann Reis Viana - 843283");
    $display("Test module");
    $display(" x y | s ");
    $monitor("%4b %4b | %4b", x, y, s);
    
    // Testes
    x = 1'b0; y = 1'b0;
    #1 x = 1'b0; y = 1'b1;
    #1 x = 1'b1; y = 1'b0;
    #1 x = 1'b1; y = 1'b1;
end
endmodule

/*
a	b	nor(b)	(a or nor(b))	nor(a nor(b)) ~(a |~b)
0	0	1	1		0		0
0	1	0	0		1		1
1	0	1	1		0		0
1	1	0	1		0		0

nor(b)=not(b)
~(a |~b) = nor(a nor(b))

*/