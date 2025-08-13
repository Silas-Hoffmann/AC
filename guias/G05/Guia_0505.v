// -------------------------
// Guia_0505.v - NOR GATES (XOR)
// Nome: Silas Hoffmann Reis Viana
// Matricula: 843283
// -------------------------

module f5_nor_xor (output s, input a, input b);
    // Definir fios auxiliares
    wire not_a, not_b, and1, and2;
    
    // Inversão de a usando NOR
    nor NOR1 (not_a, a, a);  // not_a = ~a (usando NOR)
    
    // Inversão de b usando NOR
    nor NOR2 (not_b, b, b);  // not_b = ~b (usando NOR)
    
    // Operação AND entre a e ~b usando NOR
    nor NOR3 (and1, a, not_b);  // and1 = a & ~b
    
    // Operação AND entre ~a e b usando NOR
    nor NOR4 (and2, not_a, b);  // and2 = ~a & b
    
    // Operação OR entre and1 e and2 usando NOR
    nor NOR5 (s, and1, and2);  // s = (a & ~b) | (~a & b)
endmodule

// -------------------------
// Teste do módulo
// -------------------------
module test_f5;
// ------------------------- Definir dados
reg x;
reg y;
wire s;
f5_nor_xor moduloXor (s, x, y);

// ------------------------- Parte principal
initial
begin : main
    $display("Guia_0505 - Silas Hoffmann Reis Viana - 843283");
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
