// Guia_0802.v
module HalfSubtractor(
    input A,    // Primeiro bit do operando
    input B,    // Segundo bit do operando
    output Diff, // Diferença
    output Borrow // Borrow (Empréstimo)
);
    assign Diff = A ^ B;       // Diferença (XOR)
    assign Borrow = ~A & B;    // Borrow (AND negado)
endmodule

module FullSubtractor(
    input A,        // Primeiro bit
    input B,        // Segundo bit
    input Bin,      // Borrow In
    output Diff,    // Diferença
    output Borrow   // Borrow Out
);
    wire HS1_Diff, HS1_Borrow, HS2_Borrow;
    
    // Primeira meia-diferença
    HalfSubtractor HS1 (
        .A(A),
        .B(B),
        .Diff(HS1_Diff),
        .Borrow(HS1_Borrow)
    );
    
    // Segunda meia-diferença com Borrow In
    HalfSubtractor HS2 (
        .A(HS1_Diff),
        .B(Bin),
        .Diff(Diff),
        .Borrow(HS2_Borrow)
    );
    
    // Borrow final
    assign Borrow = HS1_Borrow | HS2_Borrow;
endmodule

module AU_6bits_Subtractor(
    input [5:0] A,    // Operando A de 6 bits
    input [5:0] B,    // Operando B de 6 bits
    input Bin,        // Borrow In para o primeiro bit
    output [5:0] Diff, // Diferença de 6 bits
    output BorrowOut  // Borrow final
);
    wire [5:0] C;    // C array para os borrows intermediários
    
    // Subtrator completo para cada bit
    FullSubtractor FS0 (.A(A[0]), .B(B[0]), .Bin(Bin), .Diff(Diff[0]), .Borrow(C[0]));
    FullSubtractor FS1 (.A(A[1]), .B(B[1]), .Bin(C[0]), .Diff(Diff[1]), .Borrow(C[1]));
    FullSubtractor FS2 (.A(A[2]), .B(B[2]), .Bin(C[1]), .Diff(Diff[2]), .Borrow(C[2]));
    FullSubtractor FS3 (.A(A[3]), .B(B[3]), .Bin(C[2]), .Diff(Diff[3]), .Borrow(C[3]));
    FullSubtractor FS4 (.A(A[4]), .B(B[4]), .Bin(C[3]), .Diff(Diff[4]), .Borrow(C[4]));
    FullSubtractor FS5 (.A(A[5]), .B(B[5]), .Bin(C[4]), .Diff(Diff[5]), .Borrow(BorrowOut));
endmodule

// Módulo de Teste
module Test_AU_6bits_Subtractor;
    reg [5:0] A, B;
    reg Bin;
    wire [5:0] Diff;
    wire BorrowOut;
    
    // Instancia o módulo AU_6bits_Subtractor
    AU_6bits_Subtractor UUT (
        .A(A),
        .B(B),
        .Bin(Bin),
        .Diff(Diff),
        .BorrowOut(BorrowOut)
    );
    
    initial begin
        // Teste com valores arbitrários
        A = 6'b101010; B = 6'b010101; Bin = 0;
        #10;
        $display("A = %b, B = %b, Bin = %b, Diff = %b, BorrowOut = %b", A, B, Bin, Diff, BorrowOut);
        
        A = 6'b111111; B = 6'b000000; Bin = 1;
        #10;
        $display("A = %b, B = %b, Bin = %b, Diff = %b, BorrowOut = %b", A, B, Bin, Diff, BorrowOut);
        
        A = 6'b100000; B = 6'b000001; Bin = 0;
        #10;
        $display("A = %b, B = %b, Bin = %b, Diff = %b, BorrowOut = %b", A, B, Bin, Diff, BorrowOut);
        
        $finish;
    end
endmodule
