// Guia_0807.v

// Módulo para Comparador de Igualdade
module EqualComparator(
    input [4:0] A,       // Operando A de 5 bits
    input [4:0] B,       // Operando B de 5 bits
    output Equal         // Resultado da igualdade (1 se A == B, 0 caso contrário)
);
    assign Equal = (A == B); // A igual a B
endmodule

// Módulo para Comparador de Desigualdade
module NotEqualComparator(
    input [4:0] A,       // Operando A de 5 bits
    input [4:0] B,       // Operando B de 5 bits
    output NotEqual      // Resultado da desigualdade (1 se A != B, 0 caso contrário)
);
    assign NotEqual = (A != B); // A diferente de B
endmodule

// Módulo para Unidade Lógica (LU) com seleção de resultado
module LU_Comparator(
    input [4:0] A,           // Operando A de 5 bits
    input [4:0] B,           // Operando B de 5 bits
    input chave,             // Se chave = 0, mostra igualdade, se chave = 1, mostra desigualdade
    output Result            // Resultado da comparação (0 para igualdade, 1 para desigualdade)
);
    wire Equal, NotEqual;
    
    // Instancia o módulo de comparador de igualdade
    EqualComparator EC_inst (
        .A(A),
        .B(B),
        .Equal(Equal)
    );
    
    // Instancia o módulo de comparador de desigualdade
    NotEqualComparator NEC_inst (
        .A(A),
        .B(B),
        .NotEqual(NotEqual)
    );
    
    // Se chave = 0, mostra igualdade (Equal), se chave = 1, mostra desigualdade (NotEqual)
    assign Result = (chave == 0) ? Equal : NotEqual;
endmodule

// Módulo de Teste
module Test_LU_Comparator;
    reg [4:0] A, B;
    reg chave;
    wire Result;
    
    // Instancia o módulo LU_Comparator
    LU_Comparator UUT (
        .A(A),
        .B(B),
        .chave(chave),
        .Result(Result)
    );
    
    initial begin
        // Teste de igualdade (chave = 0)
        A = 5'b01010; B = 5'b01010; chave = 0;
        #10;
        $display("Teste Igualdade - A = %b, B = %b, Result = %b", A, B, Result);
        
        // Teste de desigualdade (chave = 1)
        A = 5'b01010; B = 5'b00101; chave = 1;
        #10;
        $display("Teste Desigualdade - A = %b, B = %b, Result = %b", A, B, Result);
        
        // Teste de igualdade (chave = 0)
        A = 5'b11011; B = 5'b11011; chave = 0;
        #10;
        $display("Teste Igualdade - A = %b, B = %b, Result = %b", A, B, Result);
        
        // Teste de desigualdade (chave = 1)
        A = 5'b11011; B = 5'b11010; chave = 1;
        #10;
        $display("Teste Desigualdade - A = %b, B = %b, Result = %b", A, B, Result);
        
        $finish;
    end
endmodule
