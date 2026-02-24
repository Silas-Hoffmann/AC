// Guia_0801.v
module HalfAdder(
    input A,    // Primeiro bit do operando
    input B,    // Segundo bit do operando
    output Sum, // Soma
    output Cout // Carry Out (Vai para o próximo bit)
);
    assign Sum = A ^ B;        // Soma (XOR)
    assign Cout = A & B;       // Carry (AND)
endmodule

module FullAdder(
    input A,        // Primeiro bit
    input B,        // Segundo bit
    input Cin,      // Carry In
    output Sum,     // Soma
    output Cout     // Carry Out
);
    wire HA1_Sum, HA1_Cout, HA2_Cout;
    
    // Primeira meia-soma
    HalfAdder HA1 (
        .A(A),
        .B(B),
        .Sum(HA1_Sum),
        .Cout(HA1_Cout)
    );
    
    // Segunda meia-soma com o Carry In
    HalfAdder HA2 (
        .A(HA1_Sum),
        .B(Cin),
        .Sum(Sum),
        .Cout(HA2_Cout)
    );
    
    // Carry Out do somador completo
    assign Cout = HA1_Cout | HA2_Cout;
endmodule

module AU_6bits(
    input [5:0] A,    // Operando A de 6 bits
    input [5:0] B,    // Operando B de 6 bits
    input Cin,        // Carry In para o primeiro bit
    output [5:0] Sum, // Soma de 6 bits
    output Cout       // Carry Out final
);
    wire [5:0] C;   // C array para os carries intermediários
    
    // Somador completo para cada bit
    FullAdder FA0 (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(C[0]));
    FullAdder FA1 (.A(A[1]), .B(B[1]), .Cin(C[0]), .Sum(Sum[1]), .Cout(C[1]));
    FullAdder FA2 (.A(A[2]), .B(B[2]), .Cin(C[1]), .Sum(Sum[2]), .Cout(C[2]));
    FullAdder FA3 (.A(A[3]), .B(B[3]), .Cin(C[2]), .Sum(Sum[3]), .Cout(C[3]));
    FullAdder FA4 (.A(A[4]), .B(B[4]), .Cin(C[3]), .Sum(Sum[4]), .Cout(C[4]));
    FullAdder FA5 (.A(A[5]), .B(B[5]), .Cin(C[4]), .Sum(Sum[5]), .Cout(Cout));
endmodule

// Módulo de Teste
module Test_AU_6bits;
    reg [5:0] A, B;
    reg Cin;
    wire [5:0] Sum;
    wire Cout;
    
    // Instancia o módulo AU_6bits
    AU_6bits UUT (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    
    initial begin
        // Teste com valores arbitrários
        A = 6'b010101; B = 6'b101010; Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
        
        A = 6'b111111; B = 6'b000000; Cin = 1;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
        
        A = 6'b111111; B = 6'b111111; Cin = 0;
        #10;
        $display("A = %b, B = %b, Cin = %b, Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
        
        $finish;
    end
endmodule
