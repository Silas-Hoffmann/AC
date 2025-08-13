// Módulo principal
module logic_expression(
    input w, x, y, z,
    output f
);
    assign f = (y | ~w | ~z) & (x | ~y | ~w) & (~x | y | w | ~z);
endmodule

// Testbench
module testbench;
    reg w, x, y, z;
    wire f;
    
    // Instanciando o módulo
    logic_expression uut (.x(x), .y(y), .w(w), .z(z), .f(f));
    
    initial begin
        $monitor("%b%b  %b%b  %b", x, y, w, z, f);
        
        // Testando todas as combinações de w, x, y, z
        x = 0; y = 0; w = 0; z = 0; #10;
        x = 0; y = 0; w = 0; z = 1; #10;
        x = 0; y = 0; w = 1; z = 0; #10;
        x = 0; y = 0; w = 1; z = 1; #10;
        x = 0; y = 1; w = 0; z = 0; #10;
        x = 0; y = 1; w = 0; z = 1; #10;
        x = 0; y = 1; w = 1; z = 0; #10;
        x = 0; y = 1; w = 1; z = 1; #10;
        x = 1; y = 0; w = 0; z = 0; #10;
        x = 1; y = 0; w = 0; z = 1; #10;
        x = 1; y = 0; w = 1; z = 0; #10;
        x = 1; y = 0; w = 1; z = 1; #10;
        x = 1; y = 1; w = 0; z = 0; #10;
        x = 1; y = 1; w = 0; z = 1; #10;
        x = 1; y = 1; w = 1; z = 0; #10;
        x = 1; y = 1; w = 1; z = 1; #10;
        
        $finish;
    end
endmodule