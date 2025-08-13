// -------------------------
// Guia_0502.v - NAND GATES
// Nome: Silas Hoffmann Reis Viana
// Matricula: 843283
// -------------------------

module f5_nand (output s, input a, input b);
    // Definir fios auxiliares
    wire not_a;
    
    // Implementação usando NAND
    nand NAND1 (not_a, a, a);  // not_a = ~a (usando NAND)
    nand NAND2 (s, not_a, b);  // s = not_a | b = (~a | b)
endmodule

// -------------------------
// Teste do módulo
// -------------------------
module test_f5;
// ------------------------- Definir dados
reg x;
reg y;
wire s;
f5_nand moduloNand (s, x, y);

// ------------------------- Parte principal
initial
begin : main
    $display("Guia_0502 - Silas Hoffmann Reis Viana - 843283");
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
a	b	nand(a)	nand(b)	nand(nand(a) nand(b)) nand(a nand(b)) (~a|b)
0	0	1	1	0			1		1
0	1	1	0	1			1		1
1	0	0	1	1			0		0
1	1	0	0	1			1		1

not(a) = not(a and a) = nand(a)
(a|b) = nand(nand(a) nand(b))
(~a|b) = nand(a nand(b))

*/