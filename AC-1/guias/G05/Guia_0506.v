// -------------------------
// Guia_0506.v - NAND GATES (XNOR)
// Nome: Silas Hoffmann Reis Viana
// Matricula: 843283
// -------------------------

module f5_nand_xnor (output s, input a, input b);
    // Definir fios auxiliares
    wire not_a, not_b, and1, and2, or1;
    
    // Inversão de a usando NAND
    nand NAND1 (not_a, a, a);  // not_a = ~a (usando NAND)
    
    // Inversão de b usando NAND
    nand NAND2 (not_b, b, b);  // not_b = ~b (usando NAND)
    
    // Operação AND entre a e ~b usando NAND
    nand NAND3 (and1, a, not_b);  // and1 = a & ~b
    
    // Operação AND entre ~a e b usando NAND
    nand NAND4 (and2, not_a, b);  // and2 = ~a & b
    
    // Operação OR entre and1 e and2 usando NAND
    nand NAND5 (or1, and1, and2);  // or1 = (a & ~b) | (~a & b)
    
    // Inversão do resultado OR para XNOR usando NAND
    nand NAND6 (s, or1, or1);  // s = ~(a ^ b) = a XNOR b
endmodule

// -------------------------
// Teste do módulo
// -------------------------
module test_f5;
// ------------------------- Definir dados
reg x;
reg y;
wire s;
f5_nand_xnor moduloXnor (s, x, y);

// ------------------------- Parte principal
initial
begin : main
    $display("Guia_0506 - Silas Hoffmann Reis Viana - 843283");
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
