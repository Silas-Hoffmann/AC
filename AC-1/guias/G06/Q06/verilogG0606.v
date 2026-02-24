module logic_sim (
    input x, y, w, z,
    output F
);
    assign F = x & (~y | ~z); // (w | ~w) sempre será 1, então foi removido
endmodule

// Testbench para simulação
`timescale 1ns/1ps
module testbench;
    reg x, y, w, z;
    wire F;
    integer i; // Variável para o loop

    logic_sim uut (.x(x), .y(y), .w(w), .z(z), .F(F));

    initial begin
        $monitor("x=%b, y=%b, w=%b, z=%b -> F=%b", x, y, w, z, F);
        
        // Testando todas as combinações
        for (i = 0; i < 16; i = i + 1) begin
            {x, y, w, z} = i; // Atribui valores binários às variáveis
            #10; // Espera 10 unidades de tempo
        end
        
        $finish;
    end
endmodule
