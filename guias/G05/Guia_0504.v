// -------------------------
// Guia_0504.v - NAND GATES
// Nome: Silas Hoffmann Reis Viana
// Matricula: 843283
// -------------------------

module f5_nand (output s, input a, input b);
    // Definir fios auxiliares
    wire not_b, and_ab;
    
    // Inversão de b usando NAND
    nand NAND1 (not_b, b, b);  // not_b = ~b (usando NAND)
    
    // Operação AND entre a e ~b usando NAND
    nand NAND2 (and_ab, a, not_b); // and_ab = a & ~b
    
    // Inversão da operação AND usando NAND
    nand NAND3 (s, and_ab, and_ab);  // s = ~(a & ~b)
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
    $display("Guia_0504 - Silas Hoffmann Reis Viana - 843283");
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
