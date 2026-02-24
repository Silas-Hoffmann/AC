// Guia_0803.v
module EqualityComparator(
    input [5:0] A,    // Operando A de 6 bits
    input [5:0] B,    // Operando B de 6 bits
    output Equal      // Resultado da comparação (igualdade)
);
    assign Equal = (A == B);  // Verifica se A é igual a B
endmodule

module LU_6bits(
    input [5:0] A,    // Operando A de 6 bits
    input [5:0] B,    // Operando B de 6 bits
    output Equal      // Resultado da comparação
);
    // Instancia o comparador de igualdade
    EqualityComparator EC (
        .A(A),
        .B(B),
        .Equal(Equal)
    );
endmodule

// Módulo de Teste
module Test_LU_6bits;
    reg [5:0] A, B;
    wire Equal;
    
    // Instancia o módulo LU_6bits
    LU_6bits UUT (
        .A(A),
        .B(B),
        .Equal(Equal)
    );
    
    initial begin
        // Testes de comparação
        A = 6'b101010; B = 6'b101010;
        #10;
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);
        
        A = 6'b111000; B = 6'b000111;
        #10;
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);
        
        A = 6'b100000; B = 6'b100000;
        #10;
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);
        
        A = 6'b011110; B = 6'b011111;
        #10;
        $display("A = %b, B = %b, Equal = %b", A, B, Equal);
        
        $finish;
    end
endmodule
