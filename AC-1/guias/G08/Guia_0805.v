// Guia_0805.v

// Módulo para Complemento de 1
module Complement1(
    input [5:0] A,        // Operando A de 6 bits
    output [5:0] C1       // Complemento de 1
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

// Módulo para Complemento de 2 (usando complemento de 1 e somador)
module Complement2(
    input [5:0] A,        // Operando A de 6 bits
    output [5:0] C2       // Complemento de 2
);
    wire [5:0] C1;        // Complemento de 1
    wire Cin = 1'b1;      // Carry In para somar 1
    
    // Instancia o módulo Complemento de 1
    Complement1 C1_inst (
        .A(A),
        .C1(C1)
    );
    
    // Instancia 6 somadores completos para somar 1 ao complemento de 1
    FullAdder FA0 (.A(C1[0]), .B(1'b0), .Cin(Cin), .Sum(C2[0]), .Cout(carry0));
    FullAdder FA1 (.A(C1[1]), .B(1'b0), .Cin(carry0), .Sum(C2[1]), .Cout(carry1));
    FullAdder FA2 (.A(C1[2]), .B(1'b0), .Cin(carry1), .Sum(C2[2]), .Cout(carry2));
    FullAdder FA3 (.A(C1[3]), .B(1'b0), .Cin(carry2), .Sum(C2[3]), .Cout(carry3));
    FullAdder FA4 (.A(C1[4]), .B(1'b0), .Cin(carry3), .Sum(C2[4]), .Cout(carry4));
    FullAdder FA5 (.A(C1[5]), .B(1'b0), .Cin(carry4), .Sum(C2[5]), .Cout());
endmodule

// Módulo LU para complemento de 2
module LU_6bits_Complement2(
    input [5:0] A,        // Operando A de 6 bits
    output [5:0] C2       // Complemento de 2
);
    // Instancia o módulo Complemento de 2
    Complement2 C2_inst (
        .A(A),
        .C2(C2)
    );
endmodule

// Módulo de Teste
module Test_LU_Complement2;
    reg [5:0] A;
    wire [5:0] C2;
    
    // Instancia o módulo LU_6bits_Complement2
    LU_6bits_Complement2 UUT (
        .A(A),
        .C2(C2)
    );
    
    initial begin
        // Testes de cálculo do complemento de 2
        A = 6'b000001;
        #10;
        $display("A = %b, Complemento de 2 = %b", A, C2);
        
        A = 6'b101010;
        #10;
        $display("A = %b, Complemento de 2 = %b", A, C2);
        
        A = 6'b111111;
        #10;
        $display("A = %b, Complemento de 2 = %b", A, C2);
        
        A = 6'b011000;
        #10;
        $display("A = %b, Complemento de 2 = %b", A, C2);
        
        $finish;
    end
endmodule
