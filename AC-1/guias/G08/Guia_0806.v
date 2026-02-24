// Guia_0806.v

// Módulo para Complemento de 1 (usado para subtração)
module Complement1(
    input [4:0] A,        // Operando A de 5 bits
    output [4:0] C1       // Complemento de 1
);
    assign C1 = ~A;        // Complemento de 1: Inversão de todos os bits
endmodule

// Módulo para Somador Completo
module FullAdder(
    input A,               // Bit A
    input B,               // Bit B
    input Cin,             // Carry In
    output Sum,            // Resultado da soma
    output Cout            // Carry Out
);
    assign {Cout, Sum} = A + B + Cin;  // Soma com Carry In
endmodule

// Módulo para Somador Algébrico (Soma/Subtração)
module AlgebraicAdder(
    input [4:0] A,         // Operando A de 5 bits
    input [4:0] B,         // Operando B de 5 bits
    input carryIn,         // Controle para soma (carryIn=0) ou subtração (carryIn=1)
    output [4:0] Result,   // Resultado da soma ou subtração
    output Equal,          // Resultado da igualdade
    output NotEqual        // Resultado da desigualdade
);
    wire [4:0] B_inv;      // Complemento de 1 de B
    wire [4:0] Sum;        // Resultado da soma
    wire [4:0] B_temp;     // Temporário para controle do sinal de B
    
    // Caso seja subtração, invertemos B
    Complement1 C1_inst (
        .A(B),
        .C1(B_inv)
    );

    // Se carryIn for 0, realiza a soma, se for 1, realiza a subtração (B_inv é somado)
    assign B_temp = (carryIn == 0) ? B : B_inv;
    
    // Soma de A e B (se soma ou subtração)
    FullAdder FA0 (.A(A[0]), .B(B_temp[0]), .Cin(carryIn), .Sum(Sum[0]), .Cout());
    FullAdder FA1 (.A(A[1]), .B(B_temp[1]), .Cin(0), .Sum(Sum[1]), .Cout());
    FullAdder FA2 (.A(A[2]), .B(B_temp[2]), .Cin(0), .Sum(Sum[2]), .Cout());
    FullAdder FA3 (.A(A[3]), .B(B_temp[3]), .Cin(0), .Sum(Sum[3]), .Cout());
    FullAdder FA4 (.A(A[4]), .B(B_temp[4]), .Cin(0), .Sum(Sum[4]), .Cout());
    
    // Comparações
    assign Equal = (A == B);    // Verifica se os operandos são iguais
    assign NotEqual = (A != B); // Verifica se os operandos são diferentes
    
    assign Result = Sum;       // Resultado da soma ou subtração
endmodule

// Módulo da Unidade Aritmética (AU) para selecionar o resultado
module AU_6bits(
    input [4:0] A,           // Operando A de 5 bits
    input [4:0] B,           // Operando B de 5 bits
    input carryIn,           // Soma (0) ou subtração (1)
    input chave,             // Se chave = 0, mostra igualdade, se chave = 1, mostra desigualdade
    output [4:0] Result,     // Resultado da soma ou subtração
    output Equal,            // Resultado da igualdade
    output NotEqual          // Resultado da desigualdade
);
    // Instancia o módulo AlgebraicAdder
    AlgebraicAdder AA_inst (
        .A(A),
        .B(B),
        .carryIn(carryIn),
        .Result(Result),
        .Equal(Equal),
        .NotEqual(NotEqual)
    );
    
    // Se chave = 0, mostra igualdade, se chave = 1, mostra desigualdade
    assign Result = (chave == 0) ? Equal : NotEqual;
endmodule

// Módulo de Teste
module Test_AU;
    reg [4:0] A, B;
    reg carryIn, chave;
    wire [4:0] Result;
    wire Equal, NotEqual;
    
    // Instancia o módulo AU_6bits
    AU_6bits UUT (
        .A(A),
        .B(B),
        .carryIn(carryIn),
        .chave(chave),
        .Result(Result),
        .Equal(Equal),
        .NotEqual(NotEqual)
    );
    
    initial begin
        // Teste de soma
        A = 5'b01010; B = 5'b00101; carryIn = 0; chave = 0;
        #10;
        $display("Soma - A = %b, B = %b, Result = %b, Equal = %b, NotEqual = %b", A, B, Result, Equal, NotEqual);
        
        // Teste de subtração
        A = 5'b01010; B = 5'b00101; carryIn = 1; chave = 1;
        #10;
        $display("Subtração - A = %b, B = %b, Result = %b, Equal = %b, NotEqual = %b", A, B, Result, Equal, NotEqual);
        
        // Teste de igualdade
        A = 5'b11001; B = 5'b11001; carryIn = 0; chave = 0;
        #10;
        $display("Igualdade - A = %b, B = %b, Result = %b, Equal = %b, NotEqual = %b", A, B, Result, Equal, NotEqual);
        
        // Teste de desigualdade
        A = 5'b11001; B = 5'b11010; carryIn = 0; chave = 1;
        #10;
        $display("Desigualdade - A = %b, B = %b, Result = %b, Equal = %b, NotEqual = %b", A, B, Result, Equal, NotEqual);
        
        $finish;
    end
endmodule

