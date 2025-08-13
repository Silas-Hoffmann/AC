// Guia_0804.v
module InequalityComparator(
    input [5:0] A,    // Operando A de 6 bits
    input [5:0] B,    // Operando B de 6 bits
    output NotEqual   // Resultado da comparação (desigualdade)
);
    assign NotEqual = (A != B);  // Verifica se A é diferente de B
endmodule

module LU_6bits_inequality(
    input [5:0] A,    // Operando A de 6 bits
    input [5:0] B,    // Operando B de 6 bits
    output NotEqual   // Resultado da comparação
);
    // Instancia o comparador de desigualdade
    InequalityComparator IC (
        .A(A),
        .B(B),
        .NotEqual(NotEqual)
    );
endmodule

// Módulo de Teste
module Test_LU_6bits_inequality;
    reg [5:0] A, B;
    wire NotEqual;
    
    // Instancia o módulo LU_6bits_inequality
    LU_6bits_inequality UUT (
        .A(A),
        .B(B),
        .NotEqual(NotEqual)
    );
    
    initial begin
        // Testes de comparação de desigualdade
        A = 6'b101010; B = 6'b101010;
        #10;
        $display("A = %b, B = %b, NotEqual = %b", A, B, NotEqual);
        
        A = 6'b111000; B = 6'b000111;
        #10;
        $display("A = %b, B = %b, NotEqual = %b", A, B, NotEqual);
        
        A = 6'b100000; B = 6'b100000;
        #10;
        $display("A = %b, B = %b, NotEqual = %b", A, B, NotEqual);
        
        A = 6'b011110; B = 6'b011111;
        #10;
        $display("A = %b, B = %b, NotEqual = %b", A, B, NotEqual);
        
        $finish;
    end
endmodule
