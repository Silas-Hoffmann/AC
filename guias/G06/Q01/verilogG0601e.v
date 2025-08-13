// Módulo principal
module logic_expression(
    input x, y, z,
    output f
);
    assign f = ~z & (~x | ~y) | (z & x & y);
endmodule

// Testbench
module testbench;
    reg x, y, z;
    wire f;
    
    // Instanciando o módulo
    logic_expression uut (.x(x), .y(y), .z(z), .f(f));
    
    initial begin
        $monitor("x=%b, y=%b, z=%b -> F=%b", x, y, z, f);
        
        // Testando todas as combinações de x, y, z
        x = 0; y = 0; z = 0; #10;
        x = 0; y = 0; z = 1; #10;
        x = 0; y = 1; z = 0; #10;
        x = 0; y = 1; z = 1; #10;
        x = 1; y = 0; z = 0; #10;
        x = 1; y = 0; z = 1; #10;
        x = 1; y = 1; z = 0; #10;
        x = 1; y = 1; z = 1; #10;
        
        $finish;
    end
endmodule
